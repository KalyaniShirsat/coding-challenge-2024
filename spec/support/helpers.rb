module Helpers
  def support_user
    @support_user ||= User.create(
      email: 'support@example.com',
      is_support: true,
      password: 'Password1!',
      password_confirmation: 'Password1!',
    )
  end

  def user
    @user ||= User.create(
      email: 'user@example.com',
      password: 'Password1!',
      password_confirmation: 'Password1!',
    )
  end

  def doctor
    @doctor ||= User.create(
      email: 'doctor@example.com',
      password: 'Password1!',
      password_confirmation: 'Password1!',
      is_doctor: true,
    )
  end

  def order_items
    [{
      name: 'Rugiet ED Strong',
      dosage: '1 troche',
      quantity: 3,
      instructions: 'Take 1 troche 30 minutes before sex',
      price: 150.00
    }]
  end

  def order
    @order ||= Order.create(user:, doctor:, order_items: order_items, total: 450.00)
  end

  def sign_in(user)
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'Password1!'
    click_on 'Log in'
  end
end
