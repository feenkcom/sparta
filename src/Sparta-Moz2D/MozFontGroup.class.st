Class {
	#name : #MozFontGroup,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozInlineRefPtr + TMozDebug',
	#classTraits : 'TMozLibrary classTrait + TMozInlineRefPtr classTrait + TMozDebug classTrait',
	#instVars : [
		'style',
		'familyList'
	],
	#category : 'Sparta-Moz2D-Text'
}

{ #category : #'instance creation' }
MozFontGroup class >> from: aFontFamilyList style: aFontStyle [

	^ self
		from: aFontFamilyList
		userFontSet: nil
		style: aFontStyle
]

{ #category : #'instance creation' }
MozFontGroup class >> from: aFontFamilyList userFontSet: aUserFontSet style: aFontStyle [

	^ (self
		primCreateFamilyList: aFontFamilyList
		style: aFontStyle
		perfMetrics: nil
		userFontSet: (aUserFontSet ifNil: [ MozUserFontSet empty ])
		devToLocalScale: 1.0)
			autoRelease;
			style: aFontStyle;
			familyList: aFontFamilyList;
			yourself
]

{ #category : #'private - ffi' }
MozFontGroup class >> primCreateFamilyList: aFontFamilyList style: aFontStyle perfMetrics: aTextPerf userFontSet: aUserFontSet devToLocalScale: aDevToLocalScale [

	^ self ffiCall: #(MozFontGroup moz2d_font_group_create (
		MozFontFamilyList aFontFamilyList,
		MozFontStyle aFontStyle,
		void* aTextPerf,
		MozUserFontSet aUserFontSet,
		float aDevToLocalScale))
]

{ #category : #'private - ffi' }
MozFontGroup class >> primRelease: aHandle [

	^ self ffiCall: #(void moz2d_font_group_release(void* aHandle))
]

{ #category : #accessing }
MozFontGroup >> familyList [
	^ familyList
]

{ #category : #accessing }
MozFontGroup >> familyList: aFontFamilyList [
	familyList := aFontFamilyList
]

{ #category : #'private - debug' }
MozFontGroup >> firstValidFont [
	^ self primFirstValidFont
]

{ #category : #'private - debug' }
MozFontGroup >> firstValidFontFamilyName [
	^ self primFirstValidFontFamilyName
]

{ #category : #'private - debug' }
MozFontGroup >> firstValidFontName [
	^ self primFirstValidFontName
]

{ #category : #'private - debug' }
MozFontGroup >> firstValidFontRealFaceName [
	^ self primFirstValidFontRealFaceName
]

{ #category : #'instance creation' }
MozFontGroup >> makeTextRun: aString canvas: canvas flags: aFlags [
	| aTextRun |

	aTextRun := (self makeTextRunNoRelease: aString canvas: canvas flags: aFlags).
	
	aTextRun	autoRelease.
	^ aTextRun
]

{ #category : #'instance creation' }
MozFontGroup >> makeTextRunNoRelease: aString canvas: canvas flags: aFlags [

	^ aString isWideString
		ifTrue: [ self makeTextRunNoReleaseWide: aString canvas: canvas flags: aFlags ]
		ifFalse: [ self makeTextRunNoReleaseAscii: aString canvas: canvas flags: aFlags ]
]

{ #category : #'instance creation' }
MozFontGroup >> makeTextRunNoReleaseAscii: aString canvas: canvas flags: aFlags [
	| aTextRun aBuffer aLength |
	
	aBuffer := aString. "we can use it directly, without convertation"
	aLength := aBuffer size.

	aTextRun := (self
		primMakeTextRunASCII: aBuffer
		drawTarget: canvas
		length: aLength
		initialBreaks: nil "Didn't manage to make them work"
		initialBreaksCount: 0
		appUnitsPerDevUnit: 1
		"we store reference to byte array in TextRun, so it will live during
		lifetime of textrun => mark text as persistent"
		flags: aFlags | MozTextFlags TEXT_IS_PERSISTENT value)
			yourself.

	aTextRun buffer: aBuffer.
	aTextRun length: aString size.
	aTextRun bits: 8.

	^ aTextRun
]

{ #category : #'instance creation' }
MozFontGroup >> makeTextRunNoReleaseWide: aString canvas: canvas flags: aFlags [
	| aTextRun aBuffer aLength aResult aBit |

	aBuffer := ByteArray new: aString size * FFIUInt16 externalTypeSize.
	aResult := MozFontGroup new primChar32: aString toChar16: aBuffer length: aString size.
	aLength := aBuffer size / 2.
	aBit := 16.
	"If result is false we was unable to convert char32 to char16.
	No problem, use built-in encoder. It is a rare case and may happen
	for smiles or other high value UTF symbols"
	aResult ifFalse: [ 
		| aDelta |

		aBuffer := ZnUTF16Encoder new
			beLittleEndian;
			encodeString: aString.
		"How many characters take 4 bits.
		Characters 0-65535 take 2 bits, other 4 bits"
		aDelta := (aBuffer size - (aString size * FFIUInt16 externalTypeSize)) / 2.
		aLength := aString size + aDelta.
		aBit := 32 ].

	aTextRun := (self
		primMakeTextRun: aBuffer
		drawTarget: canvas
		length: aLength
		initialBreaks: nil "Didn't manage to make them work"
		initialBreaksCount: 0
		appUnitsPerDevUnit: 1
		"we store reference to byte array in TextRun, so it will live during
		lifetime of textrun => mark text as persistent"
		flags: aFlags | MozTextFlags TEXT_IS_PERSISTENT value)
			yourself.
	
	aTextRun buffer: aBuffer.
	aTextRun length: aString size.
	aTextRun bits: aBit.

	^ aTextRun
]

{ #category : #accessing }
MozFontGroup >> metrics [
	^ self metrics: false
]

{ #category : #accessing }
MozFontGroup >> metrics: isVertical [
	|metrics |
	metrics := MozNativeFontMetrics externalNew.
	self primGetMetrics: metrics orientation: isVertical.
	metrics autoRelease.
	^ metrics
]

{ #category : #'private - ffi' }
MozFontGroup >> primChar32: aString32 toChar16: aString16 length: aLength [

	^ self ffiCall: #(bool moz2d_text_convert_char32_to_char16(uint32* aString32, uint32 aLength, const uint16* aString16))
]

{ #category : #'private - ffi' }
MozFontGroup >> primFirstValidFont [

	^ self ffiCall: #(void* moz2d_font_group_first_valid_font(self))
]

{ #category : #'private - ffi' }
MozFontGroup >> primFirstValidFontFamilyName [

	^ self ffiCall: #(char* moz2d_font_group_first_valid_font_family_name(self))
]

{ #category : #'private - ffi' }
MozFontGroup >> primFirstValidFontName [

	^ self ffiCall: #(char* moz2d_font_group_first_valid_font_name(self))
]

{ #category : #'private - ffi' }
MozFontGroup >> primFirstValidFontRealFaceName [

	^ self ffiCall: #(char* moz2d_font_group_first_valid_font_real_face_name(self))
]

{ #category : #'private - ffi' }
MozFontGroup >> primGetMetrics: aMetrics orientation: isVertical [

	^ self ffiCall: #(void moz2d_font_group_metrics (
		self,
		#MozNativeFontMetrics aMetrics,
		bool isVertical ) )
]

{ #category : #'private - ffi' }
MozFontGroup >> primMakeTextRun: aString drawTarget: aDrawTarget length: aLength initialBreaks: initialBreaks initialBreaksCount: initialBreaksCount appUnitsPerDevUnit: aAppUnitsPerDevUnit flags: aTextRunFactoryFlags [

	^ self ffiCall: #(MozTextRun moz2d_font_group_make_text_run_utf16 (
		MozCanvas aDrawTarget,
		self,
		short* aString,
		int32 aLength,
		uint32* initialBreaks,
		uint32 initialBreaksCount,
		int32 aAppUnitsPerDevUnit,
		uint32 aTextRunFactoryFlags))
]

{ #category : #'private - ffi' }
MozFontGroup >> primMakeTextRunASCII: aString drawTarget: aDrawTarget length: aLength initialBreaks: initialBreaks initialBreaksCount: initialBreaksCount appUnitsPerDevUnit: aAppUnitsPerDevUnit flags: aTextRunFactoryFlags [

	^ self ffiCall: #(MozTextRun moz2d_font_group_make_text_run_ascii (
		MozCanvas aDrawTarget,
		self,
		String aString,
		int32 aLength,
		uint32* initialBreaks,
		uint32 initialBreaksCount,
		int32 aAppUnitsPerDevUnit,
		uint32 aTextRunFactoryFlags))
]

{ #category : #'private - ffi' }
MozFontGroup >> primUpdateUserFonts [

	^ self ffiCall: #(void moz2d_font_group_update_user_fonts(self))
]

{ #category : #accessing }
MozFontGroup >> style [
	^ style
]

{ #category : #accessing }
MozFontGroup >> style: aFontStyle [
	"We need to hard ref a font style to prevent it from being garbage collected
	and make sure that its lifetime is greater than font group"
	style := aFontStyle
]

{ #category : #'private - debug' }
MozFontGroup >> updateUserFonts [
	self primUpdateUserFonts
]
