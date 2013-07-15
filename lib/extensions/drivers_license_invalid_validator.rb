class DriversLicenseInvalidValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.drivers_license_number.nil?
      record.errors.add(:base, 'Missing attribute drivers_license_number')
    elsif record.drivers_license_state.nil?
      record.errors.add(:base, 'Missing attribute drivers_license_state')
    else
      invalid = DlValidator.invalid?(record.drivers_license_number, record.drivers_license_state)
      record.errors.add(:base, 'Drivers license is invalid.') if invalid
    end
  end
end
