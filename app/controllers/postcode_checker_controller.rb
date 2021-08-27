class PostcodeCheckerController < ApplicationController
  def index; end


  def update
    binding.pry
    postcode_params
  end

  def postcode_params
    params.require(:postcode)
  end

  def postcode_checker_api(postcode)
    postcode_checker_api = 'https://api.postcodes.io/postcodes/'.freeze
    postcode_result_json = HTTParty.get(postcode_checker_api + post)
    binding.pry
  end
end
