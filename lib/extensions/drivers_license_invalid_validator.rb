class DriversLicenseInvalidValidator < ActiveModel::Validator
  def validate(record)
    if !record.attributes.has_key?('drivers_license_number') or record.drivers_license_number.nil?
      record.errors.add(:base, 'Missing or nil attribute drivers_license_number')
    elsif !record.attributes.has_key?('drivers_license_state') or record.drivers_license_state.nil?
      record.errors.add(:base, 'Missing or nil attribute drivers_license_state')
    else
      invalid = DlValidator.invalid?(record.drivers_license_number, record.drivers_license_state)
      record.errors.add(:base, 'Drivers license is invalid.') if invalid
    end
  end
end

