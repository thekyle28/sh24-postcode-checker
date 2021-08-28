module PostcodeCheckerHelper
  def clean_postcode(postcode)
    postcode.gsub(/\s+/, "")
  end
end
