require 'httparty'
class PostcodeCheckerController < ApplicationController
  def index; end

  def update
    postcode = helpers.clean_postcode(postcode_params.dig('postcode'))
    response = postcode_checker_api(postcode)
    
    @result = I18n.t('.accepted_postcode_lsoa')
    
    error = response.dig('error')
    if error.present?
      if error == 'Invalid postcode'
        @result = I18n.t('.invalid_postcode')
      elsif error == 'No postcode query submitted. Remember to include query parameter'
        @result = I18n.t('.errors.prescence.postcode')
      elsif error == 'Postcode not found'
        @result = I18n.t('.accepted_postcode_lsoa')
      else
        @result = I18n.t('.errors.other')
      end
      render :index
      return
    end

    @lsoa = response.dig('result', 'lsoa')
    
    Postcode::ALLOWED_LSOAS.each do |allowed_lsoa|
      if @lsoa.include? allowed_lsoa
        render :index
        return
      end
    end
    
    @result = I18n.t('.not_accepted_postcode_lsoa')
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
