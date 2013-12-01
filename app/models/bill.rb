class Bill < ActiveRecord::Base
  belongs_to :account
  validates :current_due, presence: true
  validates :due_date, presence: true
end
