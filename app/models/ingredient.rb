class Ingredient < ApplicationRecord
  before_destroy :prevent_destroy
  validates :name, uniqueness: true, presence: true
  has_many :doses
  has_many :cocktails, through: :doses

  private

  def prevent_destroy
    Dose.find_by(ingredient: self).nil? ? true : false
  end
end
