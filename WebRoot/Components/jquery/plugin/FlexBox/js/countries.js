var countries = {};
countries.results = [
	{id:'AF',name:'Afghanistan'},
	{id:'AL',name:'Albania'},
	{id:'DZ',name:'Algeria'},
	{id:'AS',name:'American Samoa'},
	{id:'AD',name:'Andorra'},
	{id:'AO',name:'Angola'},
	{id:'AI',name:'Anguilla'},
	{id:'AG',name:'Antigua & Barbuda'},
	{id:'AR',name:'Argentina'},
	{id:'AM',name:'Armenia'},
	{id:'AW',name:'Aruba'},
	{id:'AU',name:'Australia'},
	{id:'AT',name:'Austria'},
	{id:'AZ',name:'Azerbaijan'},
	{id:'AP',name:'Azores'},
	{id:'BS',name:'Bahamas'},
	{id:'BH',name:'Bahrain'},
	{id:'BD',name:'Bangladesh'},
	{id:'BB',name:'Barbados'},
	{id:'BY',name:'Belarus'},
	{id:'BE',name:'Belgium'},
	{id:'BZ',name:'Belize'},
	{id:'BJ',name:'Benin'},
	{id:'BM',name:'Bermuda'},
	{id:'BT',name:'Bhutan'},
	{id:'BO',name:'Bolivia'},
	{id:'BL',name:'Bonaire'},
	{id:'BA',name:'Bosnia & Herzegovina'},
	{id:'BW',name:'Botswana'},
	{id:'BR',name:'Brazil'},
	{id:'IO',name:'British Indian Ocean Territory'},
	{id:'BN',name:'Brunei'},
	{id:'BG',name:'Bulgaria'},
	{id:'BF',name:'Burkina Faso'},
	{id:'BI',name:'Burundi'},
	{id:'KH',name:'Cambodia'},
	{id:'CM',name:'Cameroon'},
	{id:'CA',name:'Canada'},
	{id:'IC',name:'Canary Islands'},
	{id:'CV',name:'Cape Verde'},
	{id:'KY',name:'Cayman Islands'},
	{id:'CF',name:'Central African Republic'},
	{id:'TD',name:'Chad'},
	{id:'JI',name:'Channel Islands'},
	{id:'CL',name:'Chile'},
	{id:'CN',name:'China'},
	{id:'CX',name:'Christmas Island'},
	{id:'CC',name:'Cocos Island'},
	{id:'CO',name:'Columbia'},
	{id:'KM',name:'Comoros'},
	{id:'CG',name:'Congo'},
	{id:'CD',name:'Congo Democratic Republic'},
	{id:'CK',name:'Cook Islands'},
	{id:'CR',name:'Costa Rica'},
	{id:'CI',name:'Cote D\'Ivoire'},
	{id:'HR',name:'Croatia'},
	{id:'CU',name:'Cuba'},
	{id:'CB',name:'Curacao'},
	{id:'CY',name:'Cyprus'},
	{id:'CZ',name:'Czech Republic'},
	{id:'DK',name:'Denmark'},
	{id:'DJ',name:'Djibouti'},
	{id:'DM',name:'Dominica'},
	{id:'DO',name:'Dominican Republic'},
	{id:'TL',name:'East Timor'},
	{id:'EC',name:'Ecuador'},
	{id:'EG',name:'Egypt'},
	{id:'SV',name:'El Salvador'},
	{id:'GQ',name:'Equatorial Guinea'},
	{id:'ER',name:'Eritrea'},
	{id:'EE',name:'Estonia'},
	{id:'ET',name:'Ethiopia'},
	{id:'FK',name:'Falkland Islands'},
	{id:'FO',name:'Faroe Islands'},
	{id:'FJ',name:'Fiji'},
	{id:'FI',name:'Finland'},
	{id:'FR',name:'France'},
	{id:'GF',name:'French Guiana'},
	{id:'PF',name:'French Polynesia'},
	{id:'TF',name:'French Southern Territory'},
	{id:'GA',name:'Gabon'},
	{id:'GM',name:'Gambia'},
	{id:'GE',name:'Georgia'},
	{id:'DE',name:'Germany'},
	{id:'GH',name:'Ghana'},
	{id:'GI',name:'Gibraltar'},
	{id:'GB',name:'Great Britain'},
	{id:'GR',name:'Greece'},
	{id:'GL',name:'Greenland'},
	{id:'GD',name:'Grenada'},
	{id:'GP',name:'Guadeloupe'},
	{id:'GU',name:'Guam'},
	{id:'GT',name:'Guatemala'},
	{id:'GN',name:'Guinea'},
	{id:'GW',name:'Guinea Bissau'},
	{id:'GY',name:'Guyana'},
	{id:'HT',name:'Haiti'},
	{id:'HW',name:'Hawaii'},
	{id:'HN',name:'Honduras'},
	{id:'HK',name:'Hong Kong'},
	{id:'HU',name:'Hungary'},
	{id:'IS',name:'Iceland'},
	{id:'IN',name:'India'},
	{id:'ID',name:'Indonesia'},
	{id:'IR',name:'Iran'},
	{id:'IQ',name:'Iraq'},
	{id:'IE',name:'Ireland'},
	{id:'IM',name:'Isle of Man'},
	{id:'IL',name:'Israel'},
	{id:'IT',name:'Italy'},
	{id:'JM',name:'Jamaica'},
	{id:'JP',name:'Japan'},
	{id:'JO',name:'Jordan'},
	{id:'KZ',name:'Kazakhstan'},
	{id:'KE',name:'Kenya'},
	{id:'KI',name:'Kiribati'},
	{id:'NK',name:'Korea North'},
	{id:'KS',name:'Korea South'},
	{id:'KW',name:'Kuwait'},
	{id:'KG',name:'Kyrgyzstan'},
	{id:'LA',name:'Laos'},
	{id:'LV',name:'Latvia'},
	{id:'LB',name:'Lebanon'},
	{id:'LS',name:'Lesotho'},
	{id:'LR',name:'Liberia'},
	{id:'LY',name:'Libya'},
	{id:'LI',name:'Liechtenstein'},
	{id:'LT',name:'Lithuania'},
	{id:'LU',name:'Luxembourg'},
	{id:'MO',name:'Macau'},
	{id:'MK',name:'Macedonia'},
	{id:'MG',name:'Madagascar'},
	{id:'MW',name:'Malawi'},
	{id:'MY',name:'Malaysia'},
	{id:'MV',name:'Maldives'},
	{id:'ML',name:'Mali'},
	{id:'MT',name:'Malta'},
	{id:'MH',name:'Marshall Islands'},
	{id:'MQ',name:'Martinique'},
	{id:'MR',name:'Mauritania'},
	{id:'MU',name:'Mauritius'},
	{id:'YT',name:'Mayotte'},
	{id:'MX',name:'Mexico'},
	{id:'FM',name:'Micronesia'},
	{id:'MI',name:'Midway Islands'},
	{id:'MD',name:'Moldova'},
	{id:'MC',name:'Monaco'},
	{id:'MN',name:'Mongolia'},
	{id:'MS',name:'Montserrat'},
	{id:'MA',name:'Morocco'},
	{id:'MZ',name:'Mozambique'},
	{id:'MM',name:'Myanmar'},
	{id:'NA',name:'Nambia'},
	{id:'NR',name:'Nauru'},
	{id:'NP',name:'Nepal'},
	{id:'AN',name:'Netherland Antilles'},
	{id:'NL',name:'Netherlands'},
	{id:'NC',name:'New Caledonia'},
	{id:'NZ',name:'New Zealand'},
	{id:'NI',name:'Nicaragua'},
	{id:'NE',name:'Niger'},
	{id:'NG',name:'Nigeria'},
	{id:'NU',name:'Niue'},
	{id:'NF',name:'Norfolk Island'},
	{id:'NO',name:'Norway'},
	{id:'OM',name:'Oman'},
	{id:'PK',name:'Pakistan'},
	{id:'PW',name:'Palau Island'},
	{id:'PS',name:'Palestine'},
	{id:'PA',name:'Panama'},
	{id:'PG',name:'Papua New Guinea'},
	{id:'PY',name:'Paraguay'},
	{id:'PE',name:'Peru'},
	{id:'PH',name:'Philippines'},
	{id:'PN',name:'Pitcairn Island'},
	{id:'PL',name:'Poland'},
	{id:'PT',name:'Portugal'},
	{id:'PR',name:'Puerto Rico'},
	{id:'QA',name:'Qatar'},
	{id:'RE',name:'Reunion'},
	{id:'RO',name:'Romania'},
	{id:'RU',name:'Russia'},
	{id:'RW',name:'Rwanda'},
	{id:'WS',name:'Samoa'},
	{id:'SM',name:'San Marino'},
	{id:'ST',name:'Sao Tome & Principe'},
	{id:'SA',name:'Saudi Arabia'},
	{id:'SN',name:'Senegal'},
	{id:'CS',name:'Serbia & Montenegro'},
	{id:'SC',name:'Seychelles'},
	{id:'SL',name:'Sierra Leone'},
	{id:'SG',name:'Singapore'},
	{id:'SK',name:'Slovakia'},
	{id:'SI',name:'Slovenia'},
	{id:'SB',name:'Solomon Islands'},
	{id:'SO',name:'Somalia'},
	{id:'ZA',name:'South Africa'},
	{id:'ES',name:'Spain'},
	{id:'LK',name:'Sri Lanka'},
	{id:'SH',name:'St Helena'},
	{id:'KN',name:'St Kitts-Nevis'},
	{id:'LC',name:'St Lucia'},
	{id:'MB',name:'St Maarten'},
	{id:'PM',name:'St Pierre & Miquelon'},
	{id:'VC',name:'St Vincent & Grenadines'},
	{id:'SD',name:'Sudan'},
	{id:'SR',name:'Suriname'},
	{id:'SJ',name:'Svalbard'},
	{id:'SZ',name:'Swaziland'},
	{id:'SE',name:'Sweden'},
	{id:'CH',name:'Switzerland'},
	{id:'SY',name:'Syria'},
	{id:'TA',name:'Tahiti'},
	{id:'TW',name:'Taiwan'},
	{id:'TJ',name:'Tajikistan'},
	{id:'TZ',name:'Tanzania'},
	{id:'TH',name:'Thailand'},
	{id:'TG',name:'Togo'},
	{id:'TK',name:'Tokelau'},
	{id:'TO',name:'Tonga'},
	{id:'TT',name:'Trinidad & Tobago'},
	{id:'TN',name:'Tunisia'},
	{id:'TR',name:'Turkey'},
	{id:'TM',name:'Turkmenistan'},
	{id:'TC',name:'Turks & Caicos Island'},
	{id:'TV',name:'Tuvalu'},
	{id:'UG',name:'Uganda'},
	{id:'UA',name:'Ukraine'},
	{id:'AE',name:'United Arab Emirates'},
	{id:'US',name:'United States of America'},
	{id:'UY',name:'Uruguay'},
	{id:'UZ',name:'Uzbekistan'},
	{id:'VU',name:'Vanuatu'},
	{id:'VS',name:'Vatican City State'},
	{id:'VE',name:'Venezuela'},
	{id:'VN',name:'Vietnam'},
	{id:'VG',name:'Virgin Islands (Britain)'},
	{id:'VI',name:'Virgin Islands (USA)'},
	{id:'WK',name:'Wake Island'},
	{id:'WF',name:'Wallis & Futana Island'},
	{id:'EH',name:'Western Sahara'},
	{id:'YE',name:'Yemen'},
	{id:'ZM',name:'Zambia'},
	{id:'ZW',name:'Zimbabwe'}
];
countries.total = countries.results.length;