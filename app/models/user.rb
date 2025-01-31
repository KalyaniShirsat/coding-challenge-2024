# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  credit_card_number     :string
#  cvv                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  expiry                 :string
#  is_doctor              :boolean          default(FALSE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :messages

  def doctor_orders
    Order.where(doctor_id: self.id)
  end
end
