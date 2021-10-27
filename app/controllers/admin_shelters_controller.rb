class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT * FROM shelters ORDER BY name desc")
  end

  def show
    @shelter = Shelter.find_by_sql ["SELECT name, city FROM shelters WHERE id = #{params[:id]}"]
  end
end
