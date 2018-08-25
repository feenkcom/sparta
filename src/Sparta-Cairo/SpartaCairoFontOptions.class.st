Class {
	#name : #SpartaCairoFontOptions,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoPlainPtr + TSpartaCairoDebug',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoPlainPtr classTrait + TSpartaCairoDebug classTrait',
	#category : 'Sparta-Cairo-Text'
}

{ #category : #'instance creation' }
SpartaCairoFontOptions class >> new [
	^ self primCreate autoRelease
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions class >> primCreate [

	^ self ffiCall: #( SpartaCairoFontOptions cairo_font_options_create () )
]

{ #category : #finalization }
SpartaCairoFontOptions class >> primRelease: aHandle [

	"Plain pointers must be deleted using specific destroy*() methods, all users must implement a specific method"
	^ self ffiCall: #(void cairo_font_options_destroy ( void* aHandle) )
]

{ #category : #accessing }
SpartaCairoFontOptions >> antialias [
	<return: #SpartaCairoAntialias>

	^ self primGetAntialias
]

{ #category : #accessing }
SpartaCairoFontOptions >> antialias: aCairoAntialias [

	self primSetAntialias: aCairoAntialias
]

{ #category : #accessing }
SpartaCairoFontOptions >> hintMetrics [
	<return: #SpartaCairoHintMetrics>

	^ self primGetHintMetrics
]

{ #category : #accessing }
SpartaCairoFontOptions >> hintMetrics: aCairoHintMetrics [

	self primSetHintMetrics: aCairoHintMetrics
]

{ #category : #accessing }
SpartaCairoFontOptions >> hintStyle [
	<return: #SpartaCairoHintStyle>

	^ self primGetHintStyle
]

{ #category : #accessing }
SpartaCairoFontOptions >> hintStyle: aCairoHintStyle [

	self primSetHintStyle: aCairoHintStyle
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions >> primGetAntialias [

	^ self ffiCall: #(SpartaCairoAntialias cairo_font_options_get_antialias ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions >> primGetHintMetrics [

	^ self ffiCall: #(SpartaCairoHintMetrics cairo_font_options_get_hint_metrics ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions >> primGetHintStyle [

	^ self ffiCall: #(SpartaCairoHintStyle cairo_font_options_get_hint_style ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions >> primGetSubpixelOrder [

	^ self ffiCall: #(SpartaCairoSubpixelOrder cairo_font_options_get_subpixel_order ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions >> primSetAntialias: anAntialias [

	^ self ffiCall: #(void cairo_font_options_set_antialias ( self, SpartaCairoAntialias anAntialias) )
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions >> primSetHintMetrics: aHintMetrics [

	^ self ffiCall: #(void cairo_font_options_set_hint_metrics ( self, SpartaCairoHintMetrics aHintMetrics) )
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions >> primSetHintStyle: aHintStyle [

	^ self ffiCall: #(void cairo_font_options_set_hint_style ( self, SpartaCairoHintStyle aHintStyle ) )
]

{ #category : #'private - ffi' }
SpartaCairoFontOptions >> primSetSubpixelOrder: aSubpixelOrder [

	^ self ffiCall: #(void cairo_font_options_set_subpixel_order ( self, SpartaCairoSubpixelOrder aSubpixelOrder ) )
]

{ #category : #accessing }
SpartaCairoFontOptions >> subpixelOrder [
	<return: #SpartaCairoSubpixelOrder>

	^ self primGetSubpixelOrder
]

{ #category : #accessing }
SpartaCairoFontOptions >> subpixelOrder: aSubpixelOrder [

	self primSetSubpixelOrder: aSubpixelOrder
]
