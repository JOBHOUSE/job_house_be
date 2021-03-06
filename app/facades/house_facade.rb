class HouseFacade
  def self.find_houses(where, max_price)
    houses = HouseService.get_house_info(where, max_price)
    houses.map do |house_info|
      HousePoro.new(house_info)
    end
  end

  def self.find_saved_homes(houses)
    saved_homes = houses.map do |house|
      HouseService.get_single_house(house.house_id)
    end

    saved_homes.map do |house_info|
      HousePoro.new(house_info)
    end
  end

  def self.find_houses_first(where, max_price)
    houses = HouseService.search_houses(where, max_price)

    houses.map do |house_info|
      HousePoro.new(house_info)
    end
  end

  def self.get_house_jobs(house_id)
    house = HouseService.get_single_house(house_id)
    house_poro = HousePoro.new(house)
    JobFacade.find_jobs(house_poro.city, nil,house_poro.salary_calculator)
  end
end
