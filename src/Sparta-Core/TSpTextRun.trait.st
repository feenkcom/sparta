"
I define an API of a Text run - an object that holds an array of glyphs that represent a piece of text.

Note that TextRun is optimised for the case of simple ASCII string (all chars are 8 bit), simple multilanguage string (all chars are 16 bit) and complex scripts (characters have various length of 8-32 bits).

Users should never instantiate TextRun directly, instead ask TextPainter to do the necessary job - it is needed to support backend specific text runs
"
Trait {
	#name : #TSpTextRun,
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
TSpTextRun >> bits [
	"Return how many bits one character takes"
	<return: #Number>
	
	^ self explicitRequirement
]

{ #category : #accessing }
TSpTextRun >> buffer [
	"Return a byte buffer that is represented by this text run"
	<return: #ArrayedCollection>
	
	^ self explicitRequirement
]

{ #category : #testing }
TSpTextRun >> is16Bit [
	"Return true if text run is build only from 16bit characters, false otherwise"
	<return: #Boolean>

	^ self bits = 16
]

{ #category : #testing }
TSpTextRun >> is32Bit [
	"Return true if text run is build only from characters that may be represented
	by 1-4 glyphs (or take 8/16/32 bits in the memory), false otherwise"
	<return: #Boolean>

	^ self bits = 32
]

{ #category : #testing }
TSpTextRun >> is8Bit [
	"Return true if text run is build only from 8bit characters, false otherwise"
	<return: #Boolean>

	^ self bits = 8
]

{ #category : #testing }
TSpTextRun >> isEmpty [
	^ self length isZero
]

{ #category : #testing }
TSpTextRun >> isNotEmpty [
	^ self length > 0
]

{ #category : #enumeration }
TSpTextRun >> iterator [

	^ self is8Bit
		ifTrue: [ SpTextRunIterator8Bit on: self ]
		ifFalse: [ self is16Bit
			ifTrue: [ SpTextRunIterator16Bit on: self ]
			ifFalse: [ self is32Bit
				ifTrue: [ SpTextRunIterator32Bit on: self ]
				ifFalse: [ self error: 'Unknown UTF type: ', self bits asString ] ] ]
]

{ #category : #accessing }
TSpTextRun >> length [
	"Return amount of glyphs that build this text run.
	Note: in UTF encoding a character may be represented by 1-4 glyphs depending on char's code,
	it is recommended to use #iterator for text run enumeration"
	<return: #Number>
	
	^ self explicitRequirement
]

{ #category : #measuring }
TSpTextRun >> measureOn: aSpMetrics [
	"Measure me with the help of current #metricsProvider based on
	parameters specified in aSpMetrics and store measurement results in it"
	
	self metricsProvider measure: self in: aSpMetrics
]

{ #category : #accessing }
TSpTextRun >> metricsProvider [
	"Return a metrics provider that is used to measure this text run"
	<return: #SpartaMetricsProvider>

	^ self explicitRequirement
]

{ #category : #accessing }
TSpTextRun >> metricsProvider: aSpMetricsProvider [
	"Change metrics provider that should be used to measure this text run"

	self explicitRequirement
]

{ #category : #dispatch }
TSpTextRun >> spartaFillOn: aSpartaCanvas with: aTextPainter [
	aTextPainter fillTextRun: self
]
