class User < ApplicationRecord
  has_many :portfolios, dependent: :delete_all
  has_many :stocks, -> { distinct }, through: :portfolios
  has_many :sold_portfolios, -> { sold }, class_name: Portfolio.name
  has_many :sold_stocks, through: :sold_portfolios, source: :stock
  has_many :in_account_portfolios, -> { in_account }, class_name: Portfolio.name
  has_many :in_account_stocks, through: :in_account_portfolios, source: :stock
  has_many :today_purchases,  -> { today }, class_name: Portfolio.name
  has_many :today_purchased_stocks, through: :today_purchases, source: :stock
end
