error handling
error: anError
	| aText aMessageText aHelpText aSystemInfo |
	
	aMessageText := anError messageText asText.
	aMessageText addAttribute: TextEmphasis underlined from: 1 to: aMessageText size.
	
	aHelpText := anError help asText.
	aHelpText addAttribute: (TextColor color: Color veryDarkGray) from: 1 to: aHelpText size.
	
	aSystemInfo := anError systemInfo asText.
	aSystemInfo addAttribute: (TextColor color: Color veryDarkGray) from: 1 to: aSystemInfo size.
	
	aText := aMessageText, String cr, aHelpText, String cr, String cr, aSystemInfo.
	
	helpBrick text: aText.
	
	helpBrick rubricTextFamilyName: StandardFonts defaultFont familyName.
	helpBrick rubricTextFontSize: 10