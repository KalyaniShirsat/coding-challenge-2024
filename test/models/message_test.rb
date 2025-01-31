# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :integer
#  order_id   :integer          not null
#  user_id    :integer
#
# Indexes
#
#  index_messages_on_doctor_id  (doctor_id)
#  index_messages_on_order_id   (order_id)
#  index_messages_on_user_id    (user_id)
#
# Foreign Keys
#
#  doctor_id  (doctor_id => users.id)
#  order_id   (order_id => orders.id)
#  user_id    (user_id => users.id)
#
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
