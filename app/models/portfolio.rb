class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  before_validation :populate_transaction_details
  validates :user, :stock, :purchase_price, presence: true

  scope :sold, -> { where.not(sale_price: nil) }
  scope :in_account, -> { where(sale_price: nil) }
  scope :today, -> { where(arel_table[:created_at].gt Time.zone.now.midnight)}

  private

  def populate_transaction_details
    return unless stock.present?
    
    self.purchase_price = stock.price
  end
end
