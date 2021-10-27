class Shelter < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true, numericality: true
  validates :city, presence: true

  has_many :pets, dependent: :destroy

  def self.order_by_recently_created
    order(created_at: :desc)
  end

  def self.order_by_number_of_pets
    select("shelters.*, count(pets.id) AS pets_count")
      .joins("LEFT OUTER JOIN pets ON pets.shelter_id = shelters.id")
      .group("shelters.id")
      .order("pets_count DESC")
  end

  def self.pending_applications
    find(Application.where(status: 'Pending').joins(:pets).pluck(:shelter_id))
  end

  def pet_count
    pets.count
  end

  def adoptable_pets_count
    adoptable_pets.count
  end

  def adopted_pets_count
    pets.find_all { |pet| pet.approved_for_adoption? == true }.count
  end

  def adoptable_pets
    pets.where(adoptable: true)
  end

  def alphabetical_pets
    adoptable_pets.order(name: :asc)
  end

  def shelter_pets_filtered_by_age(age_filter)
    adoptable_pets.where('age >= ?', age_filter)
  end

  def average_age_of_adoptable_pets
    adoptable_pets.average(:age).round(1) if adoptable_pets != []
  end
end
