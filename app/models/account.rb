class Account < ActiveRecord::Base
  validates :name, presence: true
  has_many :bills, dependent: :delete_all
end
