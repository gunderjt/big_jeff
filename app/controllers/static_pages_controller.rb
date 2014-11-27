class StaticPagesController < ApplicationController
  include ActionView::Helpers::TextHelper
  def home
    
  end

  def calculate
    #convert to feet
    value = params[:value].to_f rescue 0
    units = "foot" if params[:units] == "feet"
    feet = convert_to_feet(params[:units], value)
    #divide by 
    render plain: "#{pluralize(prettify(value),params[:units])} converts to #{prettify((feet/6.0).round(3))} Jeff units"
  end

  private
  def convert_to_feet(units = 'foot', value = 0)
    case units
    when 'inch'
      value.to_f / 12.0
    when 'meter'
      value * 3.28084
    when 'mile'
      value * 5820
    else
      value
    end
  end
  def prettify(num)
    num.to_i == num ? num.to_i : num
  end
  # def convert_to_feet(units = 'feet', value = 0)
  #   {'inches': 1.0/12.0, 
  #   'meters': 3.28084, 
  #   'miles': 5820,
  #   'foot': 1}.each do {|k, v| return v * value if k == units}
  # end
end