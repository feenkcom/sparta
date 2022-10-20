Class {
	#name : #SkiaFontMetrics,
	#superclass : #SkiaExternalObject,
	#instVars : [
		'emHeight'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaFontMetrics class >> primCreate [
	^ self ffiCall: #(void* skia_font_metrics_default())
]

{ #category : #'private - ffi' }
SkiaFontMetrics class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_font_metrics_drop(void* aHandle))
]

{ #category : #converting }
SkiaFontMetrics >> asSpartaMetrics [
	^ SpartaFontMetrics new skiaInitializeFrom: self
]

{ #category : #accessing }
SkiaFontMetrics >> ascent [
	<return: #Number>

	^ self primGetAscent
]

{ #category : #accessing }
SkiaFontMetrics >> averageCharWidth [
	<return: #Number>

	^ self primGetAverageCharWidth
]

{ #category : #accessing }
SkiaFontMetrics >> bottom [
	<return: #Number>

	^ self primGetBottom
]

{ #category : #accessing }
SkiaFontMetrics >> capHeight [
	<return: #Number>

	^ self primGetCapHeight
]

{ #category : #accessing }
SkiaFontMetrics >> descent [
	<return: #Number>

	^ self primGetDescent
]

{ #category : #accessing }
SkiaFontMetrics >> emHeight [
	<return: #Number>

	^ emHeight
]

{ #category : #accessing }
SkiaFontMetrics >> emHeight: aNumber [
	emHeight := aNumber
]

{ #category : #'gt-extension' }
SkiaFontMetrics >> gtInfoFor: aView [
	<gtView>

	^ ({
		#ascent -> self ascent.
		#averageCharWidth -> self averageCharWidth.
		#bottom -> self bottom.
		#capHeight -> self capHeight.
		#descent  -> self descent.
		#emHeight  -> self emHeight.
		#leading -> self leading.
		#maxCharWidth -> self maxCharWidth.
		#strikeoutPosition -> self strikeoutPosition.
		#strikeoutThickness -> self strikeoutThickness.
		#top -> self top.
		#underlinePosition -> self underlinePosition.
		#underlineThickness -> self underlineThickness.
		#xHeight -> self xHeight.
		#xMax -> self xMax.
		#xMin -> self xMin.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #initialization }
SkiaFontMetrics >> initialize [
	super initialize.
	
	emHeight := 0.0
]

{ #category : #accessing }
SkiaFontMetrics >> leading [
	<return: #Number>

	^ self primGetLeading
]

{ #category : #accessing }
SkiaFontMetrics >> maxCharWidth [
	<return: #Number>

	^ self primGetMaxCharWidth
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetAscent [
	^ self ffiCall: #(scalar skia_font_metrics_get_ascent(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetAverageCharWidth [
	^ self ffiCall: #(scalar skia_font_metrics_get_avg_char_width(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetBottom [
	^ self ffiCall: #(scalar skia_font_metrics_get_bottom(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetCapHeight [
	^ self ffiCall: #(scalar skia_font_metrics_get_cap_height(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetDescent [
	^ self ffiCall: #(scalar skia_font_metrics_get_descent(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetLeading [
	^ self ffiCall: #(scalar skia_font_metrics_get_leading(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetMaxCharWidth [
	^ self ffiCall: #(scalar skia_font_metrics_get_max_char_width(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetStrikeoutPosition [
	^ self ffiCall: #(scalar skia_font_metrics_get_strikeout_position(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetStrikeoutThickness [
	^ self ffiCall: #(scalar skia_font_metrics_get_strikeout_thickness(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetTop [
	^ self ffiCall: #(scalar skia_font_metrics_get_top(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetUnderlinePosition [
	^ self ffiCall: #(scalar skia_font_metrics_get_underline_position(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetUnderlineThickness [
	^ self ffiCall: #(scalar skia_font_metrics_get_underline_thickness(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetXHeight [
	^ self ffiCall: #(scalar skia_font_metrics_get_x_height(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetXMax [
	^ self ffiCall: #(scalar skia_font_metrics_get_x_max(self))
]

{ #category : #'private - ffi' }
SkiaFontMetrics >> primGetXMin [
	^ self ffiCall: #(scalar skia_font_metrics_get_x_min(self))
]

{ #category : #accessing }
SkiaFontMetrics >> strikeoutPosition [
	<return: #Number>

	^ self primGetStrikeoutPosition
]

{ #category : #accessing }
SkiaFontMetrics >> strikeoutThickness [
	<return: #Number>

	^ self primGetStrikeoutThickness
]

{ #category : #accessing }
SkiaFontMetrics >> top [
	<return: #Number>

	^ self primGetTop
]

{ #category : #accessing }
SkiaFontMetrics >> underlinePosition [
	<return: #Number>

	^ self primGetUnderlinePosition
]

{ #category : #accessing }
SkiaFontMetrics >> underlineThickness [
	<return: #Number>

	^ self primGetUnderlineThickness
]

{ #category : #accessing }
SkiaFontMetrics >> xHeight [
	<return: #Number>

	^ self primGetXHeight
]

{ #category : #accessing }
SkiaFontMetrics >> xMax [
	<return: #Number>

	^ self primGetXMax
]

{ #category : #accessing }
SkiaFontMetrics >> xMin [
	<return: #Number>

	^ self primGetXMin
]
