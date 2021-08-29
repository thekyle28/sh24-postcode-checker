require 'test_helper'

class PostcodeCheckerTest < ApplicationSystemTestCase
  test 'should return the correct error message when no postcode is entered' do
    click_on 'submit'

    assert_text 'Please input a postcode'
  end

  test 'should return the correct error message when an invalid postcode is entered' do
    fill_in 'Postcode', with: INVALID_POSTCODES[0]
    click_on 'submit'

    assert_text 'Invalid postcode, please give a postcode in the correct UK format'
  end

  test 'should return the correct message when postcode is in LSOA' do
    fill_in 'Postcode', with: VALID_POSTCODES[1]
    click_on 'submit'

    assert_text 'Postcode is in an accepted LSOA'  end

  test 'it should return the correct message when postcode is not in LSOA' do
    fill_in 'Postcode', with: VALID_POSTCODES[0]
    click_on 'submit'

    assert_text 'Postcode is not in an accepted LSOA'
  end

  test 'unrecognised postcode' do
    fill_in 'Postcode', with: VALID_POSTCODES[2]
    click_on 'submit'

    assert_text 'Postcode is in an accepted LSOA'
  end
end
