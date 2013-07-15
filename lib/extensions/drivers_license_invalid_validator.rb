class DriversLicenseInvalidValidator < ActiveModel::Validator
  def validate(record)
    if !@options[:attributes].include?(:drivers_license_number)
      record.errors.add(:base, 'Missing required supplied attribute drivers_license_number')
    elsif !@options[:attributes].include?(:drivers_license_state)
      record.errors.add(:base, 'Missing required supplied attribute drivers_license_state')
    elsif record.drivers_license_number.nil?
      record.errors.add(:drivers_license_number, 'Attribute drivers_license_number cannot be blank.')
    elsif record.drivers_license_state.nil?
      record.errors.add(:drivers_license_state, 'Attribute drivers_license_state cannot be blank.')
    else
      invalid = DlValidator.invalid?(record.drivers_license_number, record.drivers_license_state)
      record.errors.add(:base, 'Drivers license is invalid.') if invalid
    end
  end
end

