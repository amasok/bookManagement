class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates: :comment, length: { maximum: 100 }, allow_blank: true
end
