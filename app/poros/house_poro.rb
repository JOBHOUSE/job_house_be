class HousePoro
  attr_reader :list_price,
              :address,
              :contact,
              :api_house_id,
              :bedrooms,
              :half_baths,
              :full_baths,
              :view,
              :year_built,
              :photos,
              :id,
              :city,
              :state

  def initialize(house_data)
    @list_price = house_data[:listPrice]
    @address = house_data[:address][:full]
    @contact = house_data[:agent][:contact][:email]
    @api_house_id = house_data[:mlsId]
    @bedrooms = house_data[:property][:bedrooms]
    @half_baths = house_data[:property][:bathsHalf]
    @full_baths = house_data[:property][:bathsFull]
    @view = house_data[:property][:view]
    @year_built = house_data[:property][:yearBuilt]
    @photos = house_data[:photos]
    @id = house_data[:mlsId]
    @state = house_data[:address][:state]
    @city = house_data[:address][:city]
  end

  def salary_calculator
      salary  = (((@list_price * (0.005 * 6.022575)) * 12) / 0.3).to_i
  end

end
