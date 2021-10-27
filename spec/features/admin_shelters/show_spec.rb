require 'rails_helper'

RSpec.describe 'the admin show page' do
  before :each do
    @maxfund = Shelter.create(
      name: 'Maxfund',
      city: 'Denver, CO',
      foster_program: false,
      rank: 9
    )
  end

  describe 'shelter info' do
    it 'lists only the name and address(city) of the shelter' do
      visit "/admin/shelters/#{@maxfund.id}"

      expect(page).to have_content @maxfund.name
      expect(page).to have_content @maxfund.city
      expect(page).to_not have_content @maxfund.foster_program
      expect(page).to_not have_content @maxfund.id
      expect(page).to_not have_content @maxfund.rank
      expect(page).to_not have_content @maxfund.created_at
      expect(page).to_not have_content @maxfund.updated_at
    end
  end

  describe 'action required section' do
    # before :each do
    #   @fluffy = @maxfund.pets.create(adoptable: true, age: 8, breed: 'sphynx', name: 'Fluffy')
    #   @buffy = @maxfund.pets.create(adoptable: true, age: 4, breed: 'chihuahua', name: 'Buffy')
    #   @elle = @maxfund.pets.create(adoptable: false, age: 4, breed: 'chihuahua', name: 'Elle')
    #   @application = Application.create(
    #     name:        'CatMan',
    #     address:     '123 Main Street',
    #     city:        'Denver',
    #     state:       'CO',
    #     zip:         '80204',
    #     description: 'I WANT ALL THE CATS!',
    #     status:      'Pending'
    #   )
    #   @application.pets << @fluffy
    #   @application.pets << @buffy
    # end

    # xit 'shows a list of all pets with pending apps that need to be approved/rejected' do
    #   visit "/admin/shelters/#{@maxfund.id}"

    #   within 'div#action-required' do
    #     expect(page).to have_content @fluffy.name
    #     expect(page).to have_content @buffy.name
    #   end
    # end
  end

  describe 'statistics section' do
    before :each do
      @fluffy = @maxfund.pets.create(adoptable: true, age: 8, breed: 'sphynx', name: 'Fluffy')
      @buffy = @maxfund.pets.create(adoptable: true, age: 4, breed: 'chihuahua', name: 'Buffy')
      @elle = @maxfund.pets.create(adoptable: false, age: 4, breed: 'chihuahua', name: 'Elle')
    end

    it 'shows the average age of all adoptable pets for that shelter' do
      visit "/admin/shelters/#{@maxfund.id}"

      within 'div#statistics' do
        expect(page).to have_content 'Average age of adoptable pets at this shelter: 6.0 years'
      end
    end

    it 'shows the number of adoptable pets at the shelter' do
      visit "/admin/shelters/#{@maxfund.id}"

      within 'div#statistics' do
        expect(page).to have_content 'Number of adoptable pets at this shelter: 2'
      end
    end

    it 'shows the number of pets that have been adopted' do
      application = Application.create(
        name:        'CatMan',
        address:     '123 Main Street',
        city:        'Denver',
        state:       'CO',
        zip:         '80204',
        description: 'I WANT ALL THE CATS!',
        status:      'Approved'
      )
      application.pets << @fluffy

      visit "/admin/shelters/#{@maxfund.id}"

      within 'div#statistics' do
        expect(page).to have_content 'Number of pets that have been adopted from this shelter: 1'
      end
    end
  end
end
