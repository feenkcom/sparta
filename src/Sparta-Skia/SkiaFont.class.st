Class {
	#name : #SkiaFont,
	#superclass : #SkiaExternalObject,
	#instVars : [
		'metrics'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaFont class >> default [
	^ self new
]

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

{ #category : #accessing }
SkiaFont >> edging: aSkiaFontEdging [
	self primSetEdging: aSkiaFontEdging
]

{ #category : #accessing }
SkiaFont >> familyName [
	<return: #String>

	^ self typeface familyName
]

{ #category : #'gt-extension' }
SkiaFont >> gtFontMetricsFor: aView [
	<gtView>

	^ (self metrics gtInfoFor: aView)
			title: 'Metrics';
			priority: 2
]

{ #category : #'gt-extension' }
SkiaFont >> gtFontStyleFor: aView [
	<gtView>

	^ (self typeface fontStyle gtInfoFor: aView)
			title: 'Style';
			priority: 5
]

{ #category : #'gt-extension' }
SkiaFont >> gtInfoFor: aView [
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
			priority: 3
]

{ #category : #'gt-extension' }
SkiaFont >> gtPreviewFor: aView [
	<gtView>

	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [
			| aSkiaCanvas aString aFont theMeasuredLines aMaxWidth aMaxHeight aBaseline |
			
			aSkiaCanvas := SkiaCanvas extent: 1@1.
			
			aFont := self.

			aString := 'ABCDEFGHIJKLM
NOPQRSTUVWXYZ
abcdefghijklm
nopqrstuvwxyz
1234567890'.

			theMeasuredLines := aString lines collect: [ :eachLine |
				eachLine -> (aSkiaCanvas text
					font: aFont;
					string: eachLine;
					measure) ].
			
			aMaxWidth := theMeasuredLines max: [ :eachMeasuredLine | eachMeasuredLine value textMetrics width ].
			aMaxHeight := theMeasuredLines sum: [ :eachMeasuredLine | eachMeasuredLine value fontMetrics lineSpacing ].
			aSkiaCanvas release.
				
			aSkiaCanvas := SkiaCanvas extent: (aMaxWidth @ aMaxHeight) + 40.
			
			aBaseline := theMeasuredLines first value fontMetrics ascent negated + 20.
			theMeasuredLines do: [ :eachMeasuredLine |
				
				aSkiaCanvas text
					font: aFont;
					string: eachMeasuredLine key;
					baseline: ((aSkiaCanvas width - eachMeasuredLine value textMetrics width) / 2.0) @ aBaseline;
					paint: Color black;
					draw.
				
				aBaseline := aBaseline +  eachMeasuredLine value fontMetrics lineSpacing ].
			aSkiaCanvas asForm asElement ]
]

{ #category : #'gt-extension' }
SkiaFont >> gtTypefaceFor: aView [
	<gtView>

	^ (self typeface gtInfoFor: aView)
			title: 'Typeface';
			priority: 4
]

{ #category : #accessing }
SkiaFont >> hinting [
	<return: #SkiaFontHinting>

	^ self primGetHinting
]

{ #category : #accessing }
SkiaFont >> hinting: aSkiaFontHinting [
	self primSetHinting: aSkiaFontHinting
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
	"Return the recommended spacing between lines: the sum of metrics descent, ascent, and leading.
	Genrally, line spacing is the space between each line in a paragraph. Typical word processors allows you to customize the line spacing to be single spaced (one line high), double spaced (two lines high), or any other amount you want"

	^ self primGetLineSpacing
]

{ #category : #text }
SkiaFont >> measureString: aString paint: aSkiaPaint [
	^ self measureText: (GtBoxerString fromString: aString) paint: aSkiaPaint
]

{ #category : #text }
SkiaFont >> measureText: aGtBoxerString paint: aSkiaPaint [
	<return: #SkiaTextMetrics>
	| aWidth aBounds |
	
	SkiaRectangleF32 newDuring: [ :aSkiaRectangle |
		aWidth := self
			primMeasureText: aGtBoxerString
			encoding: SkiaTextEncoding UTF8
			paint: aSkiaPaint
			bounds: aSkiaRectangle.

		aBounds := aSkiaRectangle asRectangle ].

	^ SkiaTextMetrics new
		advance: aWidth;
		bounds: aBounds
]

{ #category : #accessing }
SkiaFont >> metrics [
	"Return sparta font metrics for this font. The metrics are cached to not measure the font each time
	metrics are requested"
	<return: #SpartaFontMetrics>
	
	^ metrics ifNil: [
		SkiaFontMetrics
			fromNativeHandle: self primGetMetrics
			during: [ :aSkiaFontMetrics | metrics := (aSkiaFontMetrics emHeight: self size) asSpartaMetrics ].
		metrics ]
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
SkiaFont >> primSetEdging: aSkiaFontEdging [
	^ self ffiCall: #(void skia_font_set_edging(self, SkiaFontEdging aSkiaFontEdging))
]

{ #category : #'private - ffi' }
SkiaFont >> primSetHinting: aSkiaFontHinting [
	^ self ffiCall: #(void skia_font_set_hinting(self, SkiaFontHinting aSkiaFontHinting))
]

{ #category : #'private - ffi' }
SkiaFont >> primSetSubpixel: aBoolean [
	^ self ffiCall: #(void skia_font_set_subpixel(self, bool aBoolean))
]

{ #category : #'private - ffi' }
SkiaFont >> primText: aGtBoxerString toGlyphs: aGtBoxerArrayU16 encoding: aSkiaTextEncoding paint: aSkiaPaint bounds: aSkiaRectangleF32 [
	^ self ffiCall: #(scalar skia_font_text_to_glyphs(self,
		GtBoxerString aGtBoxerString,
		SkiaTextEncoding aSkiaTextEncoding,
		GtBoxerArrayU16 aGtBoxerArrayU16,
		SkiaPaint aSkiaPaint,
		SkiaRectangleF32 aSkiaRectangleF32))
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
	<return: #ByteArray>

	^ GtBoxerArrayU16 newDuring: [ :theGlyphs |
		GtBoxerString
			fromString: aString
			during: [ :aBoxerString |
				self
					primText: aBoxerString
					toGlyphs: theGlyphs
					encoding: SkiaTextEncoding UTF8
					paint: SkiaPaint null
					bounds: SkiaRectangleF32 null.
				theGlyphs asByteArray ] ]
]

{ #category : #text }
SkiaFont >> stringToTextRun: aString paint: aSkiaPaint [
	<return: #SkiaTextRun>

	^ GtBoxerArrayU16 newDuring: [ :aBoxerArrayU16 |
		SkiaRectangleF32 newDuring: [ :aSkiaRectangle |
			| theGlyphs aWidth aBounds |

			GtBoxerString
				fromString: aString
				during: [ :aBoxerString |
					SkiaStringToTextRunComputeGlyphsSignal timeDuring: [
						aWidth := self
							primText: aBoxerString
							toGlyphs: aBoxerArrayU16
							encoding: SkiaTextEncoding UTF8
							paint: aSkiaPaint
							bounds: aSkiaRectangle ] ].
				
			SkiaStringToTextRunBoundsAsRectangleSignal timeDuring: [
				aBounds := aSkiaRectangle asRectangle ].
			
			SkiaStringToTextRunGlyphsAsByteArraySignal timeDuring: [
				theGlyphs := aBoxerArrayU16 asByteArray ].			

			SkiaTextRun new
				font: self;
				glyphs: theGlyphs;
				advance: aWidth;
				bounds: aBounds ] ]
]

{ #category : #accessing }
SkiaFont >> subpixel: aBoolean [
	self primSetSubpixel: aBoolean
]

{ #category : #accessing }
SkiaFont >> typeface [
	^ SkiaTypeface fromNativeHandle: self primGetTypeface
]
