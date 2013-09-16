require 'test/unit'
require 'dl_validator'
require 'shoulda'

class Helper

  VALID_DRIVERS_LICENSES = {
      'AL' =>	['1234567', '12345678'],                                             # Format: 7 numeric or 8 numeric
      'AK' => ['1234567', '12345'],                                                # Format: Up to 7 numeric
      'AZ' => ['A12345678'],                                                       # Format: 1 Alpha 8 numeric
      'AR' => ['12345678', '123456789'],                                           # Format: 8 or 9 Numeric
      'CA' => ['c1234567'],                                                        # Format: 1 Alpha 7 Numeric
      'CO' => ['123456789'],                                                       # Format: 9 Numeric
      'CT' => ['201234567', '241234567'],                                          # Format: 9 Numeric; The first 2 digits can not be less than 01 or greater than 24.
      'DE' => ['1234567', '12345'],                                                # Format: Up to 7 Numeric
      'DC' => ['1234567'],                                                         # Format: 7 Numeric
      'FL' => ['F123456789876'],                                                   # Format: 1 Alpha 12 Numeric
      'GA' => ['1234567', '1234567', '123456789'],                                 # Format: Up to 9 Numeric
      'HI' => ['h12345678'],                                                       # Format: H followed by 8 numeric
      'ID' => ['LS123456C'],                                                       # Format: 2 Alpha 6 Numeric 1 Alpha (example LS123456C)
      'IL' => ['J12345678901'],                                                    # Format: 1 alpha 11 numeric
      'IN' => ['1234567890'],                                                      # Format: 10 Numeric
      'IA' => ['123SL4567'],                                                       # Format: 3 Numeric 2 Alpha 4 Numeric (example 123SL4567)
      'KS' => ['K12345678'],                                                       # Format: 1 Alpha 8 Numeric
      'KY' => ['Y12345678'],                                                       # Format: 1 Alpha 8 Numeric
      'LA' => ['001234567', '012345678'],                                          # Format: 9 Numeric (First two numbers are 00 or 01)
      'ME' => ['1234567'],                                                         # Format: 7 Numeric
      'MD' => ['M123456789012'],                                                   # Format: 1 Alpha 12 Numeric
      'MA' => ['S12345678'],                                                       # Format: 1 Alpha 8 Numeric Alpha is S
      'MI' => ['h123456789012'],                                                   # Format: 1 Alpha 12 Numeric
      'MN' => ['L1234G6J89012'],                                                   # Format: 13 Alphanumeric
      'MS' => ['123456789'],                                                       # Format: 9 Numeric
      'MO' => ['M12345678', 'M123456' , 'M12345679'],                              # Format: 1 Alpha 6-9 Numeric
      'MT' => ['J9G4n6E8a', '1234567890123'],                                      # Format: 9 Alpha And Numeric Combination or 13 numeric
      'NE' => ['A123', 'A1234', 'A12345', 'A123456', 'A1234567', 'A12345678'],     # Format: 1 Alpha 3-8 Numeric
      'NV' => ['1234567890'],                                                      # Format: 10 Numeric
      'NH' => ['12ADF12345'],                                                      # Format: 2 Numeric 3 Alpha 5 Numeric
      'NJ' => ['F12345678901234'],                                                 # Format: 1 Alpha 14 Numeric
      'NY' => ['123456789'],                                                       # Format: 9 Numeric
      'NM' => ['123456789'],                                                       # Format: 9 Numeric
      'NC' => ['123456', '1234567', '12345678', '123456789', '123456789012'],      # Format: Up to 12 numeric
      'ND' => ['123456789', 'KLK123TYP'],                                                       # Format: 9 Numeric
      'OH' => ['LK123456'],                                                        # Format: 2 Alpha 6 Numeric
      'OK' => ['O123456789'],                                                      # Format: 1 Alpha 9 Numeric
      'OR' => ['12345', '123456', '1234567'],                                      # Format: Up to 7 numeric
      'PA' => ['12345678'],                                                        # Format: 8 Numeric
      'RI' => ['1234567'],                                                         # Format: 7 Numeric
      'SC' => ['123456789'],                                                       # Format: 9 Numeric
      'SD' => ['12345678'],                                                        # Format: 8 Numeric
      'TN' => ['12345678', '123456789'],                                           # Format: 8 or 9 Numeric
      'TX' => ['12345678'],                                                        # Format: 8 Numeric
      'UT' => ['123456', '1234567', '12345678', '123456789', '1234'],              # Format: 4-9 Numeric
      'VT' => ['12345678', '1234567A'],                                            # Format: 8 Numeric; or 7 Numeric 1 Alpha is A
      'VA' => ['K12345678'],                                                       # Format: 1 Alpha 8 Numeric
      'WA' => ['123ghk456QWE'],                                                    # Format: 12 Characters
      'WV' => ['1234567', 'E123456'],                                              # Format: 7 Numeric; or 1 Alpha 6 Numeric
      'WI' => ['W1234567890123'],                                                  # Format: 1 Alpha 13 Numeric
      'WY' => ['123456789'] }                                                      # Format: 9 Numeric
end
