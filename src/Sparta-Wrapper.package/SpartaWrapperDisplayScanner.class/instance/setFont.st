initialization
setFont
	super setFont.

	font ifNil: [ font := StandardFonts defaultFont ].
	
	foregroundColor ifNil: [ foregroundColor := Smalltalk ui theme textColor ].
	
	previousFont = font
		ifTrue: [ ^ self ].
	
	spartaFont := self canvas font
		logical: font;
		build.
	previousFont := font.