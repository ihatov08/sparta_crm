# == Schema Information
#
# Table name: customers
#
#  id          :integer          not null, primary key
#  family_name :string           not null
#  given_name  :string           not null
#  email       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#
# Indexes
#
#  index_customers_on_company_id  (company_id)
#  index_customers_on_email       (email) UNIQUE
#

class Customer < ActiveRecord::Base
  belongs_to :company

  scope :company_order, -> {order(:company_id)}

  validates :company, presence: true

  validates :family_name, presence: true, length: {maximum: 20 }
  validates :given_name, presence: true, length: {maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true, format: { with: VALID_EMAIL_REGEX }

  def full_name
    full_name = family_name + given_name
    return full_name
    # returnは省略できる
  end
end
