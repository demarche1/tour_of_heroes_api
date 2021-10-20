class Hero < ApplicationRecord
  validates :name, :token, presence: true
  validates :name, uniqueness: { scope: :token, case_sensitive: false }

  scope :by_token, ->(token) { where(token: token) }
  scope :search, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") if name.present? }
  scope :sorted_by_name, -> { order(:name) }
end
