require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class DlValidatorTest < Test::Unit::TestCase
  context DlValidator do
    context '#invalid?' do

      Helper::VALID_DRIVERS_LICENSES.each do |key, licenses_array|
        licenses_array.each_with_index do |license, index|
          should "be a valid drivers license #{license} - #{key} index: #{index}" do
            assert !DlValidator.invalid?(license, key), key.inspect + ' ' + license.inspect
          end
        end
      end

      Helper::VALID_DRIVERS_LICENSES.each do |key, licenses_array|
        licenses_array.each_with_index do |license, index|
          should "not be a valid drivers license #{license} - #{key} index: #{index}" do
            assert DlValidator.invalid?(license + '123ABC', key), key.inspect + ' ' + license + '123ABC'
          end
        end
      end

      should 'return true for an undefined state abbreviation' do
        invalid = DlValidator.invalid?('123', 'QQ')
        assert invalid
      end

      should 'return true for an undefined full state name' do
        invalid = DlValidator.invalid?('123', 'BadState')
        assert invalid
      end

      should 'handle a state abbreviation with non-word characters' do
        state = '12}3 F (** __)L @ 5674``' # FL
        assert !DlValidator.invalid?(Helper::VALID_DRIVERS_LICENSES['FL'].first, state)
      end

      should 'handle a full state name with non-word characters' do
        state = '12_3 F (** )L o # R ^ I !!!! DA @   907' # FLORIDA
        assert !DlValidator.invalid?(Helper::VALID_DRIVERS_LICENSES['FL'].first, state)
      end

      should 'handle a state license with non-word characters' do
        license = 'F / @!!()_-=123  45%$#67  898?.,;76' # F123456789876
        assert !DlValidator.invalid?(license, 'FL')
      end

      should 'return true for a nil drivers_license_number' do
        assert DlValidator.invalid?(drivers_license_number=nil, 'FL')
      end

      should 'return true for a nil drivers_license_state' do
        assert DlValidator.invalid?('123456', drivers_license_state=nil)
      end
    end

    context '#get_abbreviation_key' do
      DlValidator::Config::STATES.each do |state_abbreviation, state_name|
        should "return the correct state abbreviation #{state_abbreviation}" do
          assert_equal state_abbreviation, DlValidator.get_abbreviation_key(state_name)
        end
      end
    end
  end
end