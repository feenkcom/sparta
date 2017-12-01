instance creation
newTranscriptIn: anInstaller
	| aTranscript textBrick aFont |
	
	aTranscript := ThreadSafeTranscript new.

	aFont := LogicalFont familyName: StandardFonts defaultFont familyName pointSize: 9. 

	textBrick := SpartaGLMRubPluggableTextBrick new
		getTextSelector: #contents;
		setTextSelector: #clear;
		withoutAdornment;
		margin: 10;
		yourself.

	textBrick rubric on: aTranscript.
	textBrick beForPlainText.
	
	self when: MozInstallerMessageSignal do: [ :anAnnoucement |
		aTranscript nextPutAll: anAnnoucement message.
		aTranscript endEntry.
		aTranscript stepGlobal.
		textBrick beForPlainText.
		textBrick textFont: aFont.
		anInstaller flush ].

	^ textBrick