module DlValidator
  class Config
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
        'AL' =>	/^([0-9]{7})$/,                                # Format: 7 numeric
        'AK' => /^([0-9]{7})$/,                                # Format: 7 numeric
        'AZ' => /^([A-Z][0-9]{8})$/,                           # Format: 1 Alpha 8 numeric
        'AR' => /^([0-9]{8})$/,                                # Format: 8 Numeric
        'CA' => /^([A-Z][0-9]{7})$/,                           # Format: 1 Alpha 7 Numeric
        'CO' => /^([0-9]{9})$/,                                # Format: 9 Numeric
        'CT' => /^((01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24)[0-9]{7})$/, # Format: 9 Numeric; The first 2 digits can not be less than 01 or greater than 24.
        'DE' => /^([0-9]{7})$/,                                # Format: 7 Numeric
        'DC' => /^([0-9]{7})$/,                                # Format: 7 Numeric
        'FL' => /^([A-Z][0-9]{12})$/,                          # Format: 1 Alpha 12 Numeric
        'GA' => /^([0-9]{7,9})$/,                              # Format: 7-9 Numeric
        'HI' => /^([H][0-9]{8})$/,                             # Format: H followed by 8 numeric
        'ID' => /^([A-Z]{2}[0-9]{6}[A-Z])$/,                   # Format: 2 Alpha 6 Numeric 1 Alpha (example LS123456C)
        'IL' => /^([A-Z][0-9]{11})$/,                          # Format: 1 alpha 11 numeric
        'IN' => /^([0-9]{10})$/,                               # Format: 10 Numeric
        'IA' => /^([0-9]{3}[A-Z]{2}[0-9]{4})$/,                # Format: 3 Numeric 2 Alpha 4 Numeric (example 123SL4567)
        'KS' => /^([A-Z][0-9]{8})$/,                           # Format: 1 Alpha 8 Numeric
        'KY' => /^([A-Z][0-9]{8})$/,                           # Format: 1 Alpha 8 Numeric
        'LA' => /^((00|01)[0-9]{7})$/,                         # Format: 9 Numeric (First two numbers are 00 or 01)
        'ME' => /^([0-9]{7})$/,                                # Format: 7 Numeric
        'MD' => /^([A-Z][0-9]{12})$/,                          # Format: 1 Alpha 12 Numeric
        'MA' => /^([A-Z][0-9]{8})$/,                           # Format: 1 Alpha 8 Numeric
        'MI' => /^([A-Z][0-9]{12})$/,                          # Format: 1 Alpha 12 Numeric
        'MN' => /^([A-Z][0-9]{12})$/,                          # Format: 1 Alpha 12 Numeric
        'MS' => /^([0-9]{9})$/,                                # Format: 9 Numeric
        'MO' => /^([A-Z][0-9]{5,9})$/,                         # Format: 1 Alpha 5-9 Numeric
        'MT' => /^(([A-Z]|[0-9]){9})$/,                        # Format: 9 Alpha And Numeric Combination
        'NE' => /^([A-Z][0-9]{3,8})$/,                         # Format: 1 Alpha 3-8 Numeric
        'NV' => /^([0-9]{10}|[0-9]{12}|[X][0-9]{8})$/,         # Format: 10 Numeric; or 12 Numeric; or X Followed By 8 Numeric
        'NH' => /^([0-9]{2}[A-Z]{3}[0-9]{5})$/,                # Format: 2 Numeric 3 Alpha 5 Numeric
        'NJ' => /^([A-Z][0-9]{14})$/,                          # Format: 1 Alpha 14 Numeric
        'NY' => /^([0-9]{9})$/,                                # Format: 9 Numeric
        'NM' => /^([0-9]{9})$/,                                # Format: 9 Numeric
        'NC' => /^([0-9]{6,9})$/,                              # Format: 6-9 Numeric
        'ND' => /^([0-9]{9})$/,                                # Format: 9 Numeric
        'OH' => /^([A-Z]{2}[0-9]{6})$/,                        # Format: 2 Alpha 6 Numeric
        'OK' => /^([0-9]{9})$/,                                # Format: 9 Numeric
        'OR' => /^([0-9]{5,7})$/,                              # Format: 5-7 Numeric
        'PA' => /^([0-9]{8})$/,                                # Format: 8 Numeric
        'RI' => /^([0-9]{7})$/,                                # Format: 7 Numeric
        'SC' => /^([0-9]{9})$/,                                # Format: 9 Numeric
        'SD' => /^([0-9]{8})$/,                                # Format: 8 Numeric
        'TN' => /^([0-9]{7}|[0-9]{8}|[0-9]{9})$/,              # Format: 7,8 or 9 Numeric
        'TX' => /^([0-9]{8})$/,                                # Format: 8 Numeric
        'UT' => /^([0-9]{6,10})$/,                             # Format: 6-10 Numeric
        'VT' => /^([0-9]{8}|[0-9]{7}[A-Z])$/,                  # Format: 8 Numeric; or 7 Numeric 1 Alpha
        'VA' => /^([A-Z][0-9]{8})$/,                             # Format: 1 Alpha 8 Numeric
        'WA' => /^(([A-Z]|[0-9]){12})$/,                       # Format: 12 Alpha And Numeric Combination
        'WV' => /^([0-9]{7}|[A-Z][0-9]{6})$/,                    # Format: 7 Numeric; or 1 Alpha 6 Numeric
        'WI' => /^([A-Z][0-9]{13})$/,                          # Format: 1 Alpha 13 Numeric
        'WY' => /^([0-9]{9,10})$/ }.freeze                     # Format: 9-10 Numeric
  end
end
