Class {
	#name : #SpartaCairoFontFace,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoRefPtr + TSpartaCairoDebug',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoRefPtr classTrait + TSpartaCairoDebug classTrait',
	#category : 'Sparta-Cairo-Text'
}

{ #category : #'private - ffi' }
SpartaCairoFontFace class >> primAddRef: aHandle [

	^ self ffiCall: #( void* cairo_font_face_reference ( void* aHandle) )
]

{ #category : #'private - ffi' }
SpartaCairoFontFace class >> primRefCount: aHandle [

	^ self ffiCall: #( uint cairo_font_face_get_reference_count ( void* aHandle) )
]

{ #category : #'private - ffi' }
SpartaCairoFontFace class >> primRelease: aHandle [

	^ self ffiCall: #( void cairo_font_face_destroy ( void* aHandle) )
]

{ #category : #accessing }
SpartaCairoFontFace >> pointSize [
	<return: #Number>
	^ self subclassResponsibility
]

{ #category : #'private - ffi' }
SpartaCairoFontFace >> primStatus [

	^ self ffiCall: #(SpartaCairoStatus cairo_font_face_status ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoFontFace >> primType [

	^ self ffiCall: #(SpartaCairoFontType cairo_font_face_get_type ( self ) )
]

{ #category : #'instance creation' }
SpartaCairoFontFace >> scaledFontFor: aUserToDeviceMatrix [
	| aFontMatrix theOptions |
	
	aFontMatrix := SpartaMatrix scale: self pointSize.
	theOptions := SpartaCairoFontOptions new
		antialias: SpartaCairoAntialias CAIRO_ANTIALIAS_SUBPIXEL;
		hintMetrics: SpartaCairoHintMetrics CAIRO_HINT_METRICS_ON;
		hintStyle: SpartaCairoHintStyle CAIRO_HINT_STYLE_MEDIUM;
		subpixelOrder: SpartaCairoSubpixelOrder CAIRO_SUBPIXEL_ORDER_RGB.
		
	^ SpartaCairoScaledFont create: self fontMatrix: aFontMatrix userToDeviceMatrix: aUserToDeviceMatrix options: theOptions
]

{ #category : #accessing }
SpartaCairoFontFace >> status [
	<return: #SpartaCairoStatus>

	^ self primStatus
]

{ #category : #accessing }
SpartaCairoFontFace >> type [
	<return: #SpartaCairoFontType>

	^ self primType
]
