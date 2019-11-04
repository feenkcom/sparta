Class {
	#name : #SkiaFont,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaFont class >> primCreate [
	^ self ffiCall: #(void* skia_font_default())
]

{ #category : #'private - ffi' }
SkiaFont class >> primNewTypeface: aSkiaTypeface size: aSize [
	^ self ffiCall: #(void* skia_font_from_typeface(SkiaTypeface aSkiaTypeface, scalar aSize))
]

{ #category : #'private - ffi' }
SkiaFont class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_font_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaFont class >> size: aSize [
	^ self typeface: SkiaTypeface new size: aSize
]

{ #category : #'instance creation' }
SkiaFont class >> typeface: aSkiaTypeface size: aSize [
	^ self fromNativeHandle: (self primNewTypeface: aSkiaTypeface size: aSize)
]

{ #category : #accessing }
SkiaFont >> edging [
	<return: #SkiaFontEdging>

	^ self primGetEdging
]

{ #category : #'gt-extension' }
SkiaFont >> gtFontStyleFor: aView [
	<gtView>

	^ (self typeface fontStyle gtInforFor: aView)
			title: 'Style';
			priority: 4
]

{ #category : #'gt-extension' }
SkiaFont >> gtInforFor: aView [
	<gtView>

	^ ({
		#edging -> self edging.
		#hinting -> self hinting.
		#lineSpacing -> self lineSpacing.
		#isBaselineSnap -> self isBaselineSnap.
		#isEmbeddedBitmaps -> self isEmbeddedBitmaps.
		#isEmbolden -> self isEmbolden.
		#isForceAutoHinting -> self isForceAutoHinting.
		#isLinearMetrics -> self isLinearMetrics.
		#isSubpixel -> self isSubpixel.
		#scale -> self scale.
		#size -> self size.
		#skew -> self skew.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'gt-extension' }
SkiaFont >> gtTypefaceFor: aView [
	<gtView>

	^ (self typeface gtInforFor: aView)
			title: 'Typeface';
			priority: 3
]

{ #category : #accessing }
SkiaFont >> hinting [
	<return: #SkiaFontHinting>

	^ self primGetHinting
]

{ #category : #testing }
SkiaFont >> isBaselineSnap [
	^ self primIsBaselineSnap
]

{ #category : #testing }
SkiaFont >> isEmbeddedBitmaps [
	^ self primIsEmbeddedBitmaps
]

{ #category : #testing }
SkiaFont >> isEmbolden [
	^ self primIsEmbolden
]

{ #category : #testing }
SkiaFont >> isForceAutoHinting [
	^ self primIsForceAutoHinting
]

{ #category : #testing }
SkiaFont >> isLinearMetrics [
	^ self primIsLinearMetrics
]

{ #category : #testing }
SkiaFont >> isSubpixel [
	^ self primIsSubpixel
]

{ #category : #accessing }
SkiaFont >> lineSpacing [
	^ self primGetLineSpacing
]

{ #category : #text }
SkiaFont >> measureString: aString paint: aSkiaPaint [
	^ self measureText: (GtBoxerString fromString: aString) paint: aSkiaPaint
]

{ #category : #text }
SkiaFont >> measureText: aGtBoxerString paint: aSkiaPaint [
	| aSkiaRectangle aWidth |
	
	aSkiaRectangle := SkiaRectangleF32 new.
	
	aWidth := self
		primMeasureText: aGtBoxerString
		encoding: SkiaTextEncoding UTF8
		paint: aSkiaPaint
		bounds: aSkiaRectangle.

	^ { aWidth . aSkiaRectangle asRectangle }
]

{ #category : #'private - ffi' }
SkiaFont >> primGetEdging [
	^ self ffiCall: #(SkiaFontEdging skia_font_get_edging(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primGetHinting [
	^ self ffiCall: #(SkiaFontHinting skia_font_get_hinting(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primGetLineSpacing [
	^ self ffiCall: #(scalar skia_font_get_spacing(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primGetMetrics [
	^ self ffiCall: #(void* skia_font_get_metrics(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primGetScaleX [
	^ self ffiCall: #(scalar skia_font_get_scale_x(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primGetSize [
	^ self ffiCall: #(scalar skia_font_get_size(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primGetSkewX [
	^ self ffiCall: #(scalar skia_font_get_skew_x(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primGetTypeface [
	^ self ffiCall: #(void* skia_font_get_typeface_or_default(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primIsBaselineSnap [
	^ self ffiCall: #(bool skia_font_is_baseline_snap(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primIsEmbeddedBitmaps [
	^ self ffiCall: #(bool skia_font_is_embedded_bitmaps(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primIsEmbolden [
	^ self ffiCall: #(bool skia_font_is_embolden(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primIsForceAutoHinting [
	^ self ffiCall: #(bool skia_font_is_force_auto_hinting(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primIsLinearMetrics [
	^ self ffiCall: #(bool skia_font_is_linear_metrics(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primIsSubpixel [
	^ self ffiCall: #(bool skia_font_is_subpixel(self))
]

{ #category : #'private - ffi' }
SkiaFont >> primMeasureText: aGtBoxerString encoding: aSkiaTextEncoding paint: aSkiaPaint bounds: aSkiaRectangleF32 [ 
	^ self ffiCall: #(scalar skia_font_measure_text(self,
		GtBoxerString aGtBoxerString,
		SkiaTextEncoding aSkiaTextEncoding,
		SkiaPaint aSkiaPaint,
		SkiaRectangleF32 aSkiaRectangleF32))
]

{ #category : #'private - ffi' }
SkiaFont >> primText: aGtBoxerString toGlyphs: aGtBoxerArrayU16 encoding: aSkiaTextEncoding [
	^ self ffiCall: #(void skia_font_text_to_glyphs(self,
		GtBoxerString aGtBoxerString,
		SkiaTextEncoding aSkiaTextEncoding,
		GtBoxerArrayU16 aGtBoxerArrayU16))
]

{ #category : #accessing }
SkiaFont >> scale [
	^ self primGetScaleX
]

{ #category : #accessing }
SkiaFont >> size [
	^ self primGetSize
]

{ #category : #accessing }
SkiaFont >> skew [
	^ self primGetSkewX
]

{ #category : #text }
SkiaFont >> stringToGlyphs: aString [
	^ self textToGlyphs: (GtBoxerString fromString: aString)
]

{ #category : #text }
SkiaFont >> textToGlyphs: aGtBoxerString [
	| theGlyphs |
	
	theGlyphs := GtBoxerArrayU16 new.
	self primText: aGtBoxerString toGlyphs: theGlyphs encoding: SkiaTextEncoding UTF8.
	^ theGlyphs
]

{ #category : #accessing }
SkiaFont >> typeface [
	^ SkiaTypeface fromNativeHandle: self primGetTypeface
]
