class Application < ApplicationRecord
  validates :name, presence: true

  has_many :pet_applications
  has_many :pets, through: :pet_applications

  after_initialize do |application|
    application.status = 'Pending' if !application.status
  end

end
