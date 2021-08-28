require 'httparty'
class PostcodeCheckerController < ApplicationController
  def index; end

  def update
    postcode = helpers.clean_postcode(postcode_params.dig('postcode'))
    response = postcode_checker_api(postcode)
    
    @result = 'Postcode is in an accepted LSOA'
    
    error = response.dig('error')
    if error.present?
      if error == 'Invalid postcode'
        @result = 'Invalid postcode, please give a postcode in the correct UK format'
      elsif error == 'No postcode query submitted. Remember to include query parameter'
        @result = 'Please input a postcode'
      elsif error == 'Postcode not found'
        @result = 'Postcode in accepted LSOA'
      else
        @result = 'An error has occured'
      end
      render :index
      return
    end

    @lsoa = response.dig('result', 'lsoa')
    
    Postcode::ALLOWED_LSOAS.each do |allowed_lsoa|
      if lsoa.include? allowed_lsoa
        render :index
        return
      end
    end
    
    @result = 'Postcode is not in an accepted LSOA'
    render :index
  end

  private 

  def postcode_params
    params.permit(:postcode)
  end

  def postcode_checker_api(postcode)
    postcode_checker_api = 'https://api.postcodes.io/postcodes/'
    HTTParty.get(postcode_checker_api + postcode)
    
  end
end
