require 'rails_helper'

RSpec.describe 'Customer Care Chat' do
  before do
    SupportMessage.create(order:, sender: user, receiver: support_user, message: 'Hi')
    SupportMessage.create(order:, sender: support_user, receiver: user, message: 'How can I help?')
    SupportMessage.create(order:, sender: doctor, receiver: support_user, message: 'I need some help with my patient.')
  end

  context 'when user is logged in' do
    it 'displays conversation between the support user and the logged in user only' do
      sign_in(user)
      expect(page).not_to have_text 'I need some help with my patient.'
      expect(page).to have_text 'Chat with Customer Care'
      within '.support_chat' do
        expect(page).to have_text 'How can I help?'
        fill_in id: 'support_message_message', with: 'I need to change my order.'
        expect { click_on 'Send' }.to change(SupportMessage, :count).by(1)
        expect(page).to have_text 'I need to change my order.'
        expect(SupportMessage.first).to have_attributes(
          sender_id: user.id,
          receiver_id: support_user.id,
          message: 'I need to change my order.',
        )
      end
    end
  end

  context 'when doctor is logged in' do
    it 'displays conversation between the support user and the logged in doctor only' do
      sign_in(doctor)
      expect(page).not_to have_text 'Hi'
      expect(page).not_to have_text 'How can I help?'
      expect(page).to have_text 'Chat with Customer Care'
      within '.support_chat' do
        expect(page).to have_text 'I need some help with my patient.'
        fill_in id: 'support_message_message', with: 'Are you there?'
        expect { click_on 'Send' }.to change(SupportMessage, :count).by(1)
        expect(page).to have_text 'Are you there?'
        expect(SupportMessage.first).to have_attributes(
          sender_id: doctor.id,
          receiver_id: support_user.id,
          message: 'Are you there?',
        )
      end
    end
  end

  context 'when customer care user is logged in' do
    before do
      Message.create(order:, user:, message: 'I need to know the dosage.')
      Message.create(order:, doctor:, message: 'Yes.')
      sign_in(support_user)
    end

    it 'displays conversation between the doctor and the user but cannot send message in it' do
      expect(page).to have_text 'I need to know the dosage.'
      expect(page).to have_text 'Yes.'
      within '.user_doctor_chat' do
        expect(page).not_to have_field 'support_message_message'
      end
    end

    it 'displays conversation between the user and the logged in support user' do
      expect(page).to have_text 'Chat with User'
      within '.user_chat' do
        expect(page).to have_text 'Hi'
        expect(page).to have_text 'How can I help?'
        fill_in id: 'support_message_message', with: 'You can connect with the doctor directly for any medicine related queries.'
        expect { click_on 'Send' }.to change(SupportMessage, :count).by(1)
        expect(page).to have_text 'You can connect with the doctor directly for any medicine related queries.'
        expect(SupportMessage.first).to have_attributes(
          sender_id: support_user.id,
          receiver_id: user.id,
          message: 'You can connect with the doctor directly for any medicine related queries.',
        )
      end
    end

    it 'displays conversation between the doctor and the logged in support user' do
      expect(page).to have_text 'Chat with Doctor'
      within '.doctor_chat' do
        expect(page).to have_text 'I need some help with my patient.'
        fill_in id: 'support_message_message', with: 'Tell me.'
        expect { click_on 'Send' }.to change(SupportMessage, :count).by(1)
        expect(page).to have_text 'Tell me.'
        expect(SupportMessage.first).to have_attributes(sender_id: support_user.id, receiver_id: doctor.id, message: 'Tell me.')
      end
    end
  end
end
