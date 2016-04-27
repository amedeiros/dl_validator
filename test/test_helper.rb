require 'test/unit'
require 'dl_validator'
require 'shoulda'

class Helper

  VALID_DRIVERS_LICENSES = {
      'AL' =>	['1234567'],                                                                                   # Format: 1-7Numeric
      'AK' => ['1234567'],                                                                                   # Format: 1-7Numeric
      'AZ' => ['A12345678', 'AA12345', '123456789'],                                                         # Format: 1Alpha+1-8Numeric or 2Alpha+2-5Numeric or 9Numeric
      'AR' => ['1234', '123456789'],                                                                         # Format: 4-9Numeric
      'CA' => ['c1234567'],                                                                                  # Format: 1Alpha+7Numeric
      'CO' => ['123456789', 'A123', 'A123456', 'AA12', 'AA12345'],                                           # Format: 9Numeric or 1Alpha+3-6Numeric or 2Alpha+2-5Numeric
      'CT' => ['123456789'],                                                                                 # Format: 9Numeric
      'DE' => ['1234567', '12345'],                                                                          # Format: 1-7Numeric
      'DC' => ['1234567', '123456789'],                                                                      # Format: 7Numeric or 9Numeric
      'FL' => ['F123456789876'],                                                                             # Format: 1Alpha+12Numeric
      'GA' => ['1234567', '12345678', '123456789'],                                                          # Format: 7-9Numeric
      'HI' => ['h12345678', '123456789'],                                                                    # Format: 1Alpha+8Numeric or 9Numeric
      'ID' => ['LS123456C', '123456789'],                                                                    # Format: 2Alpha+6Numeric+1Alpha or 9Numeric
      'IL' => ['J12345678901', 'A123456789012'],                                                             # Format: 1Alpha+11Numeric or 1Alpha+12Numeric
      'IN' => ['A123456789', '123456789', '1234567890'],                                                     # Format: 1Alpha+9Numeric or 9Numeric or 10Numeric
      'IA' => ['123456789', '123AB1234'],                                                                    # Format: 9Numeric or 3Numeric+2Alpha+4Numeric
      'KS' => ['A1B2C','K12345678', '123456789'],                                                            # Format: 1Alpha+1Numeric+1Alpha+1Numeric+1Alpha or 1Alpha+8Numeric or 9Numeric
      'KY' => ['A12345678', 'A123456789', '123456789'],                                                      # Format: 1Alpha+8Numeric or 1Alpha+9Numeric or 9Numeric
      'LA' => ['123456789'],                                                                                 # Format: 1-9Numeric
      'ME' => ['1234567', '1234567A', '12345678'],                                                           # Format: 7Numeric or 7Numeric+1Alpha or 8Numeric
      'MD' => ['M123456789012'],                                                                             # Format: 1Alpha+12Numeric
      'MA' => ['S12345678', '123456789'],                                                                    # Format: 1Alpha+8Numeric or 9Numeric
      'MI' => ['A1234567890','h123456789012'],                                                               # Format: 1Alpha+10Numeric or 1Alpha+12Numeric
      'MN' => ['L123456789012'],                                                                             # Format: 1Alpha+12Numeric
      'MS' => ['123456789'],                                                                                 # Format: 9Numeric
      'MO' => ['M12345', 'A123456789', 'M123456R' , '12345678AB', '123456789A', '123456789'],                # Format: 1Alpha+5-9Numeric or 1Alpha+6Numeric+R or 8Numeric+2Alpha or 9Numeric+1Alpha or 9Numeric
      'MT' => ['J12345678', '1234567890123', '123456789', '12345678901234'],                                 # Format: 1Alpha+8Numeric or 13Numeric or 9Numeric or 14Numeric
      'NE' => ['1234567'],                                                                                   # Format: 1-7Numeric
      'NV' => ['123456789', '1234567890', '123456789012', 'X12345678'],                                      # Format: 9Numeric or 10Numeric or 12Numeric or X+8Numeric
      'NH' => ['12ADF12345'],                                                                                # Format: 2Numeric+3Alpha+5Numeric
      'NJ' => ['F12345678901234'],                                                                           # Format: 1Alpha+14Numeric
      'NY' => ['A1234567', 'A123456789012345678', '12345678', '123456789', '1234567890123456', 'ABCDEFGH'],  # Format: 1Alpha+7Numeric or 1Alpha+18Numeric or 8Numeric or 9Numeric or 16 Numeric or 8Alpha
      'NM' => ['12345678', '123456789'],                                                                     # Format: 8Numeric or 9Numeric
      'NC' => ['123456', '1234567', '12345678', '123456789', '123456789012'],                                # Format: 1-12Numeric
      'ND' => ['123456789', 'KLK123456'],                                                                    # Format: 3Alpha+6Numeric or 9Numeric
      'OH' => ['L1234', 'A12345678', 'AB123', 'AB1234567', '12345678'],                                      # Format: 1Alpha+4-8Numeric or 2Alpha+3-7Numeric or 8Numeric
      'OK' => ['A123456789', '123456789'],                                                                   # Format: 1Alpha+9Numeric or 9Numeric
      'OR' => ['1', '123456789'],                                                                            # Format: 1-9Numeric
      'PA' => ['12345678'],                                                                                  # Format: 8Numeric
      'RI' => ['1234567', 'A123456'],                                                                        # Format: 7Numeric or 1Alpha+6Numeric
      'SC' => ['12345', '12345678901'],                                                                      # Format: 5-11Numeric
      'SD' => ['123456', '1234567890', '123456789012'],                                                      # Format: 6-10Numeric or 12Numeric
      'TN' => ['1234567', '123456789'],                                                                      # Format: 7-9Numeric
      'TX' => ['1234567', '12345678'],                                                                       # Format: 7-8Numeric
      'UT' => ['1234', '1234567890'],                                                                        # Format: 4-10Numeric
      'VT' => ['12345678', '1234567A'],                                                                      # Format: 8Numeric or 7Numeric+A
      'VA' => ['K123456789', 'A1234567890', 'A12345678901', '123456789'],                                    # Format: 1Alpha+9Numeric or 1Alpha+10Numeric or 1Alpha+11Numeric or 9Numeric
      'WA' => ['A12345678901', 'ABCDEFG12345'],                                                              # Format: 1-7Alpha+any combination of Alpha, Numeric, or * for a total of 12 characters
      'WV' => ['1234567', 'E123456', 'AB123456'],                                                            # Format: 7Numeric or 1-2Alpha+5-6Numeric
      'WI' => ['W1234567890123'],                                                                            # Format: 1Alpha+13Numeric
      'WY' => ['123456789', '1234567890'] }                                                                  # Format: 9-10Numeric
end
