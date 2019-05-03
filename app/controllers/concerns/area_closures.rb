module AreaClosures
  extend ActiveSupport::Concern

  API_URL='https://ftstewart.isportsman.net/api/area/query'

  def todays_closures
    request_params = {
      date: Date.today,
      area: nil,
      parent_area: nil,
      status: nil,
      category: nil,
      end_date: nil,
      activity: nil
    }
    
    response = RestClient.post(
      API_URL, 
      request_params.to_json, 
      :content_type => 'application/json'
    )

    data = JSON.parse(response.body)

    # response["data"] schema
    # Array of Area Units
    #   Area_Syskey -- meaningless
    #   Name -- name of area (ie. A-01)
    #   Description -- restriction information (ie. FIREARMS)
    #   ParentArea_Syskey -- meaningless
    #   ParentName -- unit's parent area (ie. Alpha)
    #   Open -- whether unit is open (boolean)
    #   Type -- meaningless
    #   Occupancy -- How many people can be checked in
    #   OccupancyUsed -- How many people are checked in
    #   OccupanciesByOccupancyType -- meaningless
    #   Category -- meaningless

    data["data"].map do |unit|
      {
        name: unit["Name"],
        status: unit["Open"] ? "open" : "closed",
        total_occupancy: unit["Occupancy"],
        curr_occupancy: unit["OccupancyUsed"]
      }
    end
  end
end
