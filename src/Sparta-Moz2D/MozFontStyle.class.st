"
I represent a font style and hold parameters like size, weight, stretch, language, style (normal, bold, oblique) and others.
See my 'accessing' protocol for available accessors

I can be created from Logical Font as follows:

	MozFontStyle fromLogicalFont: aFont
"
Class {
	#name : #MozFontStyle,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozDebug + TMozPlainPtr',
	#classTraits : 'TMozLibrary classTrait + TMozDebug classTrait + TMozPlainPtr classTrait',
	#category : 'Sparta-Moz2D-Text'
}

{ #category : #'instance creation' }
MozFontStyle class >> default [
	<return: #MozFontStyle>
	^ self primCreateDefault
		autoRelease;
		yourself
]

{ #category : #'instance creation' }
MozFontStyle class >> fromLogicalFont: aLogicalFont [
		
	^ (self
		primCreateStyle: aLogicalFont slantValue
		w: aLogicalFont weightValue
		s: aLogicalFont stretchValue
		s: aLogicalFont pixelSize
		a: -1.0
		l: 'en'
		e: false
		o: ''
		i: true
		i: false
		i: true
		i: true)
			autoRelease;
			yourself
]

{ #category : #'private - ffi' }
MozFontStyle class >> primCreateDefault [

	^ self ffiCall: #(MozFontStyle moz2d_font_style_create_default ())
]

{ #category : #'private - ffi' }
MozFontStyle class >> primCreateStyle: aStyle w: aWeight s: aStretch s: aSize a: aSizeAdjust l: aLanguage e: aExplicitLanguage o: aLanguageOverride i: aSystemFont i: aPrinterFont i: aWeightSynthesis i: aStyleSynthesis [
	"My full name is:
	
	primCreateStyle: aStyle weight: aWeight stretch: aStretch size: aSize sizeAdjust: aSizeAdjust language: aLanguage isExplicitLanguage: aExplicitLanguage languageOverride: aLanguageOverride isSystemFont: aSystemFont isPrinterFont: aPrinterFont isWeightSynthesis: aWeightSynthesis isStyleSynthesis: aStyleSynthesis
	
	The problem is that on windows this method has too long file name (.st file) and can not be handled by filesystem"
	
	^ self ffiCall: #(MozFontStyle moz2d_font_style_create (
		int aStyle,
		int aWeight,
		int aStretch,
		float aSize,
		String aLanguage,
		bool aExplicitLanguage,
		float aSizeAdjust,
		bool aSystemFont,
		bool aPrinterFont,
		bool aWeightSynthesis,
		bool aStyleSynthesis,
		ByteString aLanguageOverride))
]

{ #category : #'private - ffi' }
MozFontStyle class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self ffiCall: #(void moz2d_font_style_delete(void* aHandle))
]

{ #category : #'instance creation' }
MozFontStyle class >> style: aStyle weight: aWeight stretch: aStretch [

	^ self
		style: aStyle
		weight: aWeight
		stretch: aStretch
		size: 14
		language: 'en'
]

{ #category : #'instance creation' }
MozFontStyle class >> style: aStyle weight: aWeight stretch: aStretch size: aSize language: aLanguage [
		
	^ (self
		primCreateStyle: aStyle
		w: aWeight
		s: aStretch
		s: aSize
		a: -1.0
		l: aLanguage
		e: false
		o: ''
		i: true
		i: false
		i: true
		i: true)
			autoRelease;
			yourself
]

{ #category : #accessing }
MozFontStyle >> language [

	^ self primGetLanguage
]

{ #category : #'private - ffi' }
MozFontStyle >> primGetLanguage [

	^ self ffiCall: #(char* moz2d_font_style_get_language(self))
]

{ #category : #'private - ffi' }
MozFontStyle >> primGetSize [

	^ self ffiCall: #(float moz2d_font_style_get_size(self))
]

{ #category : #'private - ffi' }
MozFontStyle >> primGetStretch [

	^ self ffiCall: #(MozTextFontStretch moz2d_font_style_get_stretch(self))
]

{ #category : #'private - ffi' }
MozFontStyle >> primGetStyle [

	^ self ffiCall: #(uint8 moz2d_font_style_get_style(self))
]

{ #category : #'private - ffi' }
MozFontStyle >> primGetWeight [

	^ self ffiCall: #(uint16 moz2d_font_style_get_weight(self))
]

{ #category : #'private - ffi' }
MozFontStyle >> primSetSize: aFloat [

	^ self ffiCall: #(float moz2d_font_style_set_size(self, float aFloat))
]

{ #category : #printing }
MozFontStyle >> printOn: aStream [

	aStream nextPutAll: self class name; nextPutAll: ' ('.
	self isNull
		ifFalse: [
			aStream cr.
			aStream tab; nextPutAll: 'style: '; nextPutAll: self printStyle; cr.
			aStream tab; nextPutAll: 'size: '; nextPutAll: self size asString; cr.
			aStream tab; nextPutAll: 'weight: '; nextPutAll: self weight asString; cr.
			aStream tab; nextPutAll: 'stretch: '; nextPutAll: self stretch item asString asLowercase capitalized; cr.
			aStream tab; nextPutAll: 'language: '; nextPutAll: self language; space. ]
		ifTrue: [ aStream nextPutAll: 'nil' ].
	aStream nextPutAll: ')'; cr.
]

{ #category : #printing }
MozFontStyle >> printStyle [
	|aStyle|
	aStyle := self style.
	
	^ String streamContents: [ :aStream |
		aStyle = 0 ifTrue: [ aStream nextPutAll: 'Normal' ].
		aStyle & 1 > 0 ifTrue: [  aStream nextPutAll: 'Italic' ].
		aStyle & 2 > 0 ifTrue: [  aStream nextPutAll: 'Oblique' ].
		aStream isEmpty ifTrue: [ aStream nextPutAll: 'Unknown (', aStyle, ')' ] ]
]

{ #category : #accessing }
MozFontStyle >> size [

	^ self primGetSize
]

{ #category : #accessing }
MozFontStyle >> stretch [

	^ self primGetStretch
]

{ #category : #accessing }
MozFontStyle >> style [

	^ self primGetStyle
]

{ #category : #accessing }
MozFontStyle >> weight [

	^ self primGetWeight
]
