# == Schema Information
#
# Table name: support_messages
#
#  id          :integer          not null, primary key
#  message     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_id    :integer          not null
#  receiver_id :integer
#  sender_id   :integer
#
# Indexes
#
#  index_support_messages_on_order_id     (order_id)
#  index_support_messages_on_receiver_id  (receiver_id)
#  index_support_messages_on_sender_id    (sender_id)
#
# Foreign Keys
#
#  order_id     (order_id => orders.id)
#  receiver_id  (receiver_id => users.id)
#  sender_id    (sender_id => users.id)
#
class SupportMessage < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  belongs_to :order

  scope :for_user, ->(user_id) { where(receiver_id: user_id).or(where(sender_id: user_id)) }
end
