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
