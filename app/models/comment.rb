# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :text
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :string
#
# Indexes
#
#  index_comments_on_customer_id  (customer_id)
#

class Comment < ActiveRecord::Base
  belongs_to :customer
  validates :body,         presence: true
  validates :customer_id,  presence: true
  validates :user_id,      presence: true
end
