module DlValidator
  class DlConfig
    # Constant frozen hash of states and abbreviations
    STATES = {
        'AL' =>	'ALABAMA',
        'AK' =>	'ALASKA',
        'AZ' =>	'ARIZONA',
        'AR' =>	'ARKANSAS',
        'CA' =>	'CALIFORNIA',
        'CO' =>	'COLORADO',
        'CT' =>	'CONNECTICUT',
        'DE' =>	'DELAWARE',
        'DC' =>	'DISTRICT OF COLUMBIA',
        'FL' =>	'FLORIDA',
        'GA' =>	'GEORGIA',
        'HI' =>	'HAWAII',
        'ID' =>	'IDAHO',
        'IL' =>	'ILLINOIS',
        'IN' =>	'INDIANA',
        'IA' =>	'IOWA',
        'KS' =>	'KANSAS',
        'KY' =>	'KENTUCKY',
        'LA' =>	'LOUISIANA',
        'ME' =>	'MAINE',
        'MD' =>	'MARYLAND',
        'MA' =>	'MASSACHUSETTS',
        'MI' =>	'MICHIGAN',
        'MN' =>	'MINNESOTA',
        'MS' =>	'MISSISSIPPI',
        'MO' =>	'MISSOURI',
        'MT' =>	'MONTANA',
        'NE' =>	'NEBRASKA',
        'NV' =>	'NEVADA',
        'NH' =>	'NEW HAMPSHIRE',
        'NJ' =>	'NEW JERSEY',
        'NY' =>	'NEW YORK',
        'NM' =>	'NEW MEXICO',
        'NC' =>	'NORTH CAROLINA',
        'ND' =>	'NORTH DAKOTA',
        'OH' =>	'OHIO',
        'OK' =>	'OKLAHOMA',
        'OR' =>	'OREGON',
        'PA' =>	'PENNSYLVANIA',
        'RI' =>	'RHODE ISLAND',
        'SC' =>	'SOUTH CAROLINA',
        'SD' =>	'SOUTH DAKOTA',
        'TN' =>	'TENNESSEE',
        'TX' =>	'TEXAS',
        'UT' =>	'UTAH',
        'VT' =>	'VERMONT',
        'VA' =>	'VIRGINIA',
        'WA' =>	'WASHINGTON',
        'WV' =>	'WEST VIRGINIA',
        'WI' =>	'WISCONSIN',
        'WY' =>	'WYOMING' }.freeze



    # Constant frozen hash of regular expressions to validate a drivers license by state
    STATES_REGEX = {
        'AL' =>	/^[0-9]{1,8}$/,                                                                                             # Format: 1-8Numeric
        'AK' => /^[0-9]{1,7}$/,                                                                                             # Format: 1-7Numeric
        'AZ' => /^([A-Z]{1}[0-9]{8}|[0-9]{9})$/,                                                                            # Format: 1 Alpha + 8 Numeric OR 9 Numeric
        'AR' => /^[0-9]{4,9}$/,                                                                                             # Format: 4-9Numeric
        'CA' => /^[A-Z]{1}[0-9]{7}$/,                                                                                       # Format: 1Alpha+7Numeric
        'CO' => /(^[0-9]{9}$)|(^[A-Z]{1}[0-9]{3,6}$)|(^[A-Z]{2}[0-9]{2,5}$)/,                                               # Format: 9Numeric or 1Alpha+3-6Numeric or 2Alpha+2-5Numeric
        'CT' => /^[0-9]{9}$/,                                                                                               # Format: 9Numeric;
        'DE' => /^[0-9]{1,7}$/,                                                                                             # Format: 1-7Numeric
        'DC' => /(^[0-9]{7}$)|(^[0-9]{9}$)/,                                                                                # Format: 7Numeric or 9Numeric
        'FL' => /^[A-Z]{1}[0-9]{12}$/,                                                                                      # Format: 1Alpha+12Numeric
        'GA' => /^[0-9]{7,9}$/,                                                                                             # Format: 7-9Numeric
        'HI' => /(^[A-Z]{1}[0-9]{8}$)|(^[0-9]{9}$)/,                                                                        # Format: 1Alpha+8Numeric or 9Numeric
        'ID' => /(^[A-Z]{2}[0-9]{6}[A-Z]{1}$)|(^[0-9]{9}$)/,                                                                # Format: 2Alpha+6Numeric+1Alpha or 9Numeric
        'IL' => /^[A-Z]{1}[0-9]{11,12}$/,                                                                                   # Format: 1Alpha+11Numeric or 1Alpha+12Numeric
        'IN' => /(^[A-Z]{1}[0-9]{9}$)|(^[0-9]{9,10}$)/,                                                                     # Format: 1Alpha+9Numeric or 9Numeric or 10Numeric
        'IA' => /(^[0-9]{9}$)|(^[0-9]{3}[A-Z]{2}[0-9]{4})$/,                                                                    # Format: 9Numeric or 3Numeric+2Alpha+4Numeric
        'KS' => /(^([A-Z]{1}[0-9]{1}){2}[A-Z]{1}$)|(^[A-Z]{1}[0-9]{8}$)|(^[0-9]{9}$)/,                                      # Format: 1Alpha+1Numeric+1Alpha+1Numeric+1Alpha or 1Alpha+8Numeric or 9Numeric
        'KY' => /(^[A-Z]{1}[0-9]{8,9}$)|(^[0-9]{9}$)/,                                                                      # Format: 1Alpha+8Numeric or 1Alpha+9Numeric or 9Numeric
        'LA' => /^[0-9]{1,9}$/,                                                                                             # Format: 1-9Numeric
        'ME' => /(^[0-9]{7,8}$)|(^[0-9]{7}[A-Z]{1}$)/,                                                                      # Format: 7Numeric or 7Numeric+1Alpha or 8Numeric
        'MD' => /^[A-Z]{1}[0-9]{12}$/,                                                                                      # Format: 1Alpha+12Numeric
        'MA' => /(^[A-Z]{1}[0-9]{8}$)|(^[0-9]{9}$)/,                                                                        # Format: 1Alpha+8Numeric or 9Numeric
        'MI' => /(^[A-Z]{1}[0-9]{10}$)|(^[A-Z]{1}[0-9]{12}$)/,                                                              # Format: 1Alpha+10Numeric or 1Alpha+12Numeric
        'MN' => /^[A-Z]{1}[0-9]{12}$/,                                                                                      # Format: 1Alpha+12Numeric
        'MS' => /^[0-9]{9}$/,                                                                                               # Format: 9Numeric
        'MO' => /(^[A-Z]{1}[0-9]{5,9}$)|(^[A-Z]{1}[0-9]{6}[R]{1}$)|(^[0-9]{8}[A-Z]{2}$)|(^[0-9]{9}[A-Z]{1}$)|(^[0-9]{9}$)/, # Format: 1Alpha+5-9Numeric or 1Alpha+6Numeric+R or 8Numeric+2Alpha or 9Numeric+1Alpha or 9Numeric
        'MT' => /(^[A-Z]{1}[0-9]{8}$)|(^[0-9]{13}$)|(^[0-9]{9}$)|(^[0-9]{14}$)/,                                            # Format: 1Alpha+8Numeric or 13Numeric or 9Numeric or 14Numeric
        'NE' => /^[A-Z]{1}[0-9]{6,8}$/,                                                                                             # Format: 1Alpha+6-8Numeric
        'NV' => /(^[0-9]{9,10}$)|(^[0-9]{12}$)|(^[X]{1}[0-9]{8}$)/,                                                         # Format: 9Numeric or 10Numeric or 12Numeric or X+8Numeric
        'NH' => /^[0-9]{2}[A-Z]{3}[0-9]{5}$/,                                                                               # Format: 2Numeric+3Alpha+5Numeric
        'NJ' => /^[A-Z]{1}[0-9]{14}$/,                                                                                      # Format: 1Alpha+14Numeric
        'NM' => /^[0-9]{8,9}$/,                                                                                             # Format: 8Numeric or 9Numeric
        'NY' => /(^[A-Z]{1}[0-9]{7}$)|(^[A-Z]{1}[0-9]{18}$)|(^[0-9]{8}$)|(^[0-9]{9}$)|(^[0-9]{16}$)|(^[A-Z]{8}$)/,          # Format: 1Alpha+7Numeric or 1Alpha+18Numeric or 8Numeric or 9Numeric or 16 Numeric or 8Alpha
        'NC' => /^[0-9]{1,12}$/,                                                                                            # Format: 1-12Numeric
        'ND' => /(^[A-Z]{3}[0-9]{6}$)|(^[0-9]{9}$)/,                                                                        # Format: 3Alpha+6Numeric or 9Numeric
        'OH' => /(^[A-Z]{1}[0-9]{4,8}$)|(^[A-Z]{2}[0-9]{3,7}$)|(^[0-9]{8}$)/,                                               # Format: 1Alpha+4-8Numeric or 2Alpha+3-7Numeric or 8Numeric
        'OK' => /(^[A-Z]{1}[0-9]{9}$)|(^[0-9]{9}$)/,                                                                        # Format: 1Alpha+9Numeric or 9Numeric
        'OR' => /^[0-9]{1,9}$/,                                                                                             # Format: 1-9Numeric
        'PA' => /^[0-9]{8}$/,                                                                                               # Format: 8Numeric
        'RI' => /^([0-9]{7}$)|(^[A-Z]{1}[0-9]{6}$)/,                                                                        # Format: 7Numeric or 1Alpha+6Numeric
        'SC' => /^[0-9]{5,11}$/,                                                                                            # Format: 5-11Numeric
        'SD' => /(^[0-9]{6,10}$)|(^[0-9]{12}$)/,                                                                            # Format: 6-10Numeric or 12Numeric
        'TN' => /^[0-9]{7,9}$/,                                                                                             # Format: 7-9Numeric
        'TX' => /^[0-9]{7,8}$/,                                                                                             # Format: 7-8Numeric
        'UT' => /^[0-9]{4,10}$/,                                                                                            # Format: 4-10Numeric
        'VT' => /(^[0-9]{8}$)|(^[0-9]{7}[A]$)/,                                                                             # Format: 8Numeric or 7Numeric+A
        'VA' => /(^[A-Z]{1}[0-9]{8,11}$)|(^[0-9]{9}$)/,                                                                     # Format: 1Alpha+8-to-11Numeric or 9Numeric
        'WA' => /^(?=.{12}$)[A-Z]{1,7}[A-Z0-9\*]{4,11}$/,                                                                   # Format: 1-7Alpha+any combination of Alpha, Numeric, or * for a total of 12 characters
        'WV' => /(^[0-9]{7}$)|(^[A-Z]{1,2}[0-9]{5,6}$)/,                                                                    # Format: 7Numeric or 1-2Alpha+5-6Numeric
        'WI' => /^[A-Z]{1}[0-9]{13}$/,                                                                                      # Format: 1Alpha+13Numeric
        'WY' => /^[0-9]{9,10}$/ }.freeze                                                                                    # Format: 9-10Numeric
  end
end
