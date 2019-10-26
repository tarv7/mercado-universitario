class Order < ApplicationRecord
  belongs_to :address, optional: true

  has_many :order_products, dependent: :destroy

  enum status: %i[not_seen preparing on_the_way delivered canceled]

  validates :note, length: { maximum: 300 }

  def self.statuses_for_select
    statuses.map do |status, _|
      [I18n.t("order.statuses.#{status}"), status]
    end
  end

  def user
    order_products.first.user
  end
end
