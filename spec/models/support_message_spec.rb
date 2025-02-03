require 'rails_helper'

RSpec.describe SupportMessage do
  it { is_expected.to belong_to(:sender).class_name('User').with_foreign_key(:sender_id) }
  it { is_expected.to belong_to(:receiver).class_name('User').with_foreign_key(:receiver_id) }
  it { is_expected.to belong_to(:order) }

  describe '.for_user' do
    let!(:support_user) {
      User.create(
        email: 'support@example.com',
        is_support: true,
        password: 'Password1!',
        password_confirmation: 'Password1!',
      )
    }
    let!(:user) {
      User.create(
        email: 'user@example.com',
        password: 'Password1!',
        password_confirmation: 'Password1!',
      )
    }
    let!(:doctor) {
      User.create(
        email: 'doctor@example.com',
        password: 'Password1!',
        password_confirmation: 'Password1!',
      )
    }
    let!(:order_items) {
      [{
        name: 'Rugiet ED Strong',
        dosage: '1 troche',
        quantity: 3,
        instructions: 'Take 1 troche 30 minutes before sex',
        price: 150.00
      }]
    }
    let!(:order) { Order.create(user:, doctor:, order_items: order_items, total: 450.00) }

    before do
      SupportMessage.create(order:, sender: user, receiver: support_user, message: 'Hi')
      SupportMessage.create(order:, sender: support_user, receiver: user, message: 'Hi. How can I help?')
      SupportMessage.create(order:, sender: doctor, receiver: support_user, message: 'Hi. I need some help with my order.')
    end

    it 'returns support messages where the user is either a sender or a receiver' do
      expect(SupportMessage.for_user(user.id).pluck(:message)).to eql ['Hi. How can I help?', 'Hi']
    end
  end
end
