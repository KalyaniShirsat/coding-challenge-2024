# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  order_items :string
#  total       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  doctor_id   :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_orders_on_doctor_id  (doctor_id)
#  index_orders_on_user_id    (user_id)
#
# Foreign Keys
#
#  doctor_id  (doctor_id => users.id)
#  user_id    (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, class_name: 'User', foreign_key: 'doctor_id'
  has_many :messages, dependent: :destroy
end
