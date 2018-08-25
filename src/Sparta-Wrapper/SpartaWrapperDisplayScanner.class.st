"
A SpartaWrapperDisplayScanner displays the text paragraphs on a SpartaCanvas
"
Class {
	#name : #SpartaWrapperDisplayScanner,
	#superclass : #DisplayScanner,
	#instVars : [
		'canvas',
		'paragraph',
		'spartaFont',
		'previousFont'
	],
	#category : 'Sparta-Wrapper'
}

{ #category : #'instance creation' }
SpartaWrapperDisplayScanner class >> for: aParagraph on: aSpartaCanvas [
	^ self new initWithParagraph: aParagraph andCanvas: aSpartaCanvas; yourself
]

{ #category : #accessing }
SpartaWrapperDisplayScanner >> canvas [
	^ canvas
]

{ #category : #displaying }
SpartaWrapperDisplayScanner >> displayEmbeddedForm: aForm [
]

{ #category : #displaying }
SpartaWrapperDisplayScanner >> displayString: string from: startIndex to: stopIndex at: aPoint [

	self canvas text
		paint: foregroundColor;
		font: spartaFont;
		text: string asString;
		start: startIndex;
		end: stopIndex;
		baseline: aPoint + (0@font ascent);
		draw
		
]

{ #category : #displaying }
SpartaWrapperDisplayScanner >> fillTextBackground [
	backgroundColor ifNil: [ ^ self ].
	
	self canvas fill
		paint: backgroundColor;
		path: (line left @ lineY extent: line width @ line lineHeight);
		draw
]

{ #category : #initialization }
SpartaWrapperDisplayScanner >> initWithParagraph: aParagraph andCanvas: aSpartaCanvas [
	self text: aParagraph text textStyle: aParagraph textStyle.

	paragraph := aParagraph.
	canvas := aSpartaCanvas
]

{ #category : #initialization }
SpartaWrapperDisplayScanner >> setFont [
	super setFont.

	font ifNil: [ font := StandardFonts defaultFont ].
	
	foregroundColor ifNil: [ foregroundColor := Smalltalk ui theme textColor ].
	
	previousFont = font
		ifTrue: [ ^ self ].
	
	spartaFont := self canvas font
		logical: font;
		build.
	previousFont := font.
]
