"
I am a page to display an error with detailed transcript
"
Class {
	#name : #SpartaInstallerErrorBrick,
	#superclass : #GLMBandBrick,
	#instVars : [
		'helpBrick'
	],
	#category : 'Sparta-Installer-UI'
}

{ #category : #'error handling' }
SpartaInstallerErrorBrick >> error: anError [
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
]

{ #category : #initialization }
SpartaInstallerErrorBrick >> initialize [
	super initialize.
	
	self color: Color white.
	
	self hSpaceFill.
	self vSpaceFill.
	
	self initializeBrick
]

{ #category : #initialization }
SpartaInstallerErrorBrick >> initializeBrick [
	| oopsBrick titleBrick |
	
	oopsBrick := GLMStringBrick new.
	oopsBrick text: 'Oops...'.
	oopsBrick textColor: Color gray.
	oopsBrick fontSize: 30.
	oopsBrick hAlign: #center.
	oopsBrick hShrinkWrap.
	
	titleBrick := GLMStringBrick new.
	titleBrick marginBottom: 10.
	titleBrick text: 'there is a problem with installation of Moz2D'.
	titleBrick textColor: Color gray.
	titleBrick fontSize: 10.
	titleBrick hAlign: #center.
	titleBrick hShrinkWrap.
	
	helpBrick := SpartaGLMRubPluggableTextBrick new.
	helpBrick withoutBorder.
	helpBrick withoutBackground.
	helpBrick hSpaceFill.
	helpBrick vSpaceFill.

	self addBrickBack: oopsBrick.
	self addBrickBack: titleBrick.
	self addBrickBack: helpBrick.
]
