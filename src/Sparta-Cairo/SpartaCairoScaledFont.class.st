Class {
	#name : #SpartaCairoScaledFont,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoRefPtr + TSpartaCairoDebug',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoRefPtr classTrait + TSpartaCairoDebug classTrait',
	#instVars : [
		'cairoFontFace',
		'fontMatrix',
		'userToDeviceMatrix',
		'options'
	],
	#category : 'Sparta-Cairo-Text'
}

{ #category : #'instance creation' }
SpartaCairoScaledFont class >> create: aCairoFontFace fontMatrix: aFontMatrix userToDeviceMatrix: aUserToDeviceMatrix options: theFontOptions [
	| aFontCairoMatrix aUserToDeviceCairoMatrix aScaledFont |

	aFontCairoMatrix := SpartaCairoMatrix fromSpartaMatrix: aFontMatrix.
	aUserToDeviceCairoMatrix := SpartaCairoMatrix fromSpartaMatrix: aUserToDeviceMatrix.

	aScaledFont := (self primCreate: aCairoFontFace fontMatrix: aFontCairoMatrix userToDeviceMatrix: aUserToDeviceCairoMatrix options: theFontOptions)
		autoRelease;
		cairoFontFace: aCairoFontFace;
		fontMatrix: aFontMatrix;
		userToDeviceMatrix: aUserToDeviceMatrix;
		options: theFontOptions;
		yourself.

	^ aScaledFont
]

{ #category : #'private - ffi' }
SpartaCairoScaledFont class >> primAddRef: aHandle [

	^ self ffiCall: #(void* cairo_scaled_font_reference ( void* aHandle ) )
]

{ #category : #'private - ffi' }
SpartaCairoScaledFont class >> primCreate: aCairoFontFace fontMatrix: aFontMatrix userToDeviceMatrix: aCTM options: theFontOptions [

	^ self ffiCall: #( SpartaCairoScaledFont cairo_scaled_font_create (
		SpartaCairoFontFace aCairoFontFace,
		SpartaCairoMatrix * aFontMatrix,
		SpartaCairoMatrix * aCTM,
		SpartaCairoFontOptions theFontOptions ) )
]

{ #category : #'private - ffi' }
SpartaCairoScaledFont class >> primRefCount: aHandle [

	^ self ffiCall: #(uint cairo_scaled_font_get_reference_count ( void* aHandle ) )
]

{ #category : #'private - ffi' }
SpartaCairoScaledFont class >> primRelease: aHandle [

	^ self ffiCall: #(void cairo_scaled_font_destroy ( void* aHandle ) )
]

{ #category : #accessing }
SpartaCairoScaledFont >> cairoFontFace [
	^ cairoFontFace
]

{ #category : #accessing }
SpartaCairoScaledFont >> cairoFontFace: anObject [
	cairoFontFace := anObject
]

{ #category : #accessing }
SpartaCairoScaledFont >> fontMatrix [
	^ fontMatrix
]

{ #category : #accessing }
SpartaCairoScaledFont >> fontMatrix: anObject [
	fontMatrix := anObject
]

{ #category : #'instance creation' }
SpartaCairoScaledFont >> makeTextRunNoRelease: aString [

	^ aString isWideString
		ifTrue: [ self makeTextRunNoReleaseWide: aString ]
		ifFalse: [ self makeTextRunNoReleaseAscii: aString ]
]

{ #category : #'instance creation' }
SpartaCairoScaledFont >> makeTextRunNoReleaseAscii: aString [
	| aGlyphsArrayPtr aGlyphsNumPtr aStatus aGlyphsArray aGlyphsNum  aTextRun |

	aGlyphsArrayPtr := ExternalAddress new.
	aGlyphsNumPtr := ByteArray new: FFIInt32 externalTypeSize.

	aStatus := self primTextToGlyphs: aString length: aString size glyphs: aGlyphsArrayPtr num: aGlyphsNumPtr x: 0.0 y: 0.0.
	aStatus isSuccess
		ifFalse: [ SpartaCairoError signal: aStatus ].
	
	aGlyphsNum := aGlyphsNumPtr unsignedLongAt: 1.
	aGlyphsArray := aGlyphsNum isZero
		ifTrue: [ FFIExternalArray externalNewType: SpartaCairoGlyph size: 0 ]
		ifFalse: [ FFIExternalArray fromHandle: aGlyphsArrayPtr type: SpartaCairoGlyph size: aGlyphsNum.
 ].
			
	aTextRun := SpartaCairoTextRun new
		bits: 8;
		buffer: aString;
		length: aGlyphsNum;
		glyphs: aGlyphsArray;
		scaledFont: self.

	^ aTextRun
]

{ #category : #'instance creation' }
SpartaCairoScaledFont >> makeTextRunNoReleaseWide: aString [
	| aBuffer aGlyphsArrayPtr aGlyphsNumPtr aStatus aGlyphsArray aGlyphsNum  aTextRun |

	aGlyphsArrayPtr := ExternalAddress new.
	aGlyphsNumPtr := ByteArray new: FFIInt32 externalTypeSize.

	aBuffer := UTF8TextConverter default convertToSystemString: aString.

	aStatus := self primTextToGlyphs: aBuffer length: aBuffer size glyphs: aGlyphsArrayPtr num: aGlyphsNumPtr x: 0.0 y: 0.0.
	aStatus isSuccess
		ifFalse: [ SpartaCairoError signal: aStatus ].
	
	aGlyphsNum := aGlyphsNumPtr unsignedLongAt: 1.
	aGlyphsArray := FFIExternalArray fromHandle: aGlyphsArrayPtr type: SpartaCairoGlyph size: aGlyphsNum.

	aTextRun := SpartaCairoTextRun new
		bits: 32;
		buffer: aBuffer;
		length: aGlyphsNum;
		glyphs: aGlyphsArray;
		scaledFont: self.

	^ aTextRun
]

{ #category : #accessing }
SpartaCairoScaledFont >> options [
	^ options
]

{ #category : #accessing }
SpartaCairoScaledFont >> options: anObject [
	options := anObject
]

{ #category : #'private - ffi' }
SpartaCairoScaledFont >> primStatus [
	^ self ffiCall: #(SpartaCairoStatus cairo_scaled_font_status ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoScaledFont >> primTextToGlyphs: aBuffer length: aLength glyphs: theGlyphs num: aGlyphsCount x: aX y: aY [

	^ self ffiCall: #(SpartaCairoStatus cairo_scaled_font_text_to_glyphs ( 
		self,
		double aX,
		double aY,
		void * aBuffer,
		int aLength,
		void** theGlyphs,
		int * aGlyphsCount,
		nil,
		nil,
		nil))
]

{ #category : #accessing }
SpartaCairoScaledFont >> status [

	^ self primStatus
]

{ #category : #accessing }
SpartaCairoScaledFont >> userToDeviceMatrix [
	^ userToDeviceMatrix
]

{ #category : #accessing }
SpartaCairoScaledFont >> userToDeviceMatrix: anObject [
	userToDeviceMatrix := anObject
]
