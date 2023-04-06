class Stock < ApplicationRecord
  has_many :portfolios, dependent: :delete_all
  has_many :users, through: :portfolios
  has_many :sold_stocks, -> { sold }, class_name: Portfolio.name
  has_many :sold_by_users, through: :sold_stocks, source: :user
  has_many :in_account_portfolios, -> { in_account }, class_name: Portfolio.name
  has_many :in_account_users, through: :in_account_portfolios, source: :user

end
