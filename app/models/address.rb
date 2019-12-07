class Address < ApplicationRecord
  belongs_to :city
  belongs_to :user, optional: :true

  has_many :colleges, dependent: :destroy
  has_many :orders, dependent: :nullify

  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :number, allow_nil: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1 }

  # rubocop:disable Metrics/LineLength
  def to_string
    "#{street}, bairro #{neighborhood}, nº #{number}, #{complement}, #{city.name} - #{city.state.abbreviation}"
  end
  # rubocop:enable Metrics/LineLength
end
