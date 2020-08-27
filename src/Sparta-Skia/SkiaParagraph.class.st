Class {
	#name : #SkiaParagraph,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaParagraph class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paragraph_drop(void* aHandle))
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charPositionAt: aPoint [
	^ self primGetCharPositionAtX: aPoint x y: aPoint y
]

{ #category : #'api - paragraph' }
SkiaParagraph >> glyphPositionAt: aPoint [
	^ self primGetGlyphPositionAtX: aPoint x y: aPoint y
]

{ #category : #'api - paragraph' }
SkiaParagraph >> height [
	^ self primGetHeight
]

{ #category : #'api - paragraph' }
SkiaParagraph >> layoutWithWidth: aWidth [
	self primLayout: aWidth
]

{ #category : #'api - paragraph' }
SkiaParagraph >> longestLine [
	^ self primGetLongestLine
]

{ #category : #'api - paragraph' }
SkiaParagraph >> paintOn: aSkiaCanvas at: aPoint [
	self
		primPaint: aSkiaCanvas surfaceCanvas
		x: aPoint x
		y: aPoint y
]

{ #category : #'api - paragraph' }
SkiaParagraph >> placeholderRectangles [
	^ GtBoxerArrayPointF32
		fromNativeHandle: self primGetRectsForPlaceholders
		during: [ :theBoxerArray |
			theBoxerArray asPoints
				pairsCollect: [ :origin :corner | Rectangle origin: origin corner: corner ] ]
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetCharPositionAtX: aX y: aY [
	^ self ffiCall: #(size_t skia_paragraph_get_char_position_at_coordinate(self, scalar aX, scalar aY))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetGlyphPositionAtX: aX y: aY [
	^ self ffiCall: #(int32 skia_paragraph_get_glyph_position_at_coordinate(self, scalar aX, scalar aY))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetHeight [
	^ self ffiCall: #(scalar skia_paragraph_get_height(self))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetLongestLine [
	^ self ffiCall: #(scalar skia_paragraph_get_longest_line(self))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetRectsForCharRangeFrom: aStart to: anEnd heightStyle: aSkiaParagraphRectHeightStyle widthStyle: aSkiaParagraphRectWidthStyle [
	^ self ffiCall: #(void* skia_paragraph_get_rects_for_char_range(
		self,
		size_t aStart,
		size_t anEnd,
		SkiaParagraphRectHeightStyle aSkiaParagraphRectHeightStyle,
		SkiaParagraphRectWidthStyle aSkiaParagraphRectWidthStyle))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetRectsForGlyphRangeFrom: aStart to: anEnd heightStyle: aSkiaParagraphRectHeightStyle widthStyle: aSkiaParagraphRectWidthStyle [
	^ self ffiCall: #(void* skia_paragraph_get_rects_for_glyph_range(
		self,
		size_t aStart,
		size_t anEnd,
		SkiaParagraphRectHeightStyle aSkiaParagraphRectHeightStyle,
		SkiaParagraphRectWidthStyle aSkiaParagraphRectWidthStyle))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetRectsForPlaceholders [
	^ self ffiCall: #(void* skia_paragraph_get_rects_for_placeholders(self))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primLayout: aWidth [
	self ffiCall: #(void skia_paragraph_layout(self, scalar aWidth))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primPaint: aCanvas x: aX y: aY [
	self ffiCall: #(void skia_paragraph_paint(self, SkiaSurfaceCanvas aCanvas, scalar aX, scalar aY))
]

{ #category : #'private - ffi' }
SkiaParagraph >> print [
	self ffiCall: #(void skia_paragraph_print(self))
]

{ #category : #'api - paragraph' }
SkiaParagraph >> rectanglesForChars: anInterval width: aWidthStyle height: aHeightStyle [
	"An interval should be given in cursor coordinates"

	^ GtBoxerArrayPointF32
		fromNativeHandle: (self primGetRectsForCharRangeFrom: anInterval first to: anInterval last heightStyle: aHeightStyle widthStyle: aWidthStyle)
		during: [ :theBoxerArray |
			theBoxerArray asPoints
				pairsCollect: [ :origin :corner | Rectangle origin: origin corner: corner ] ]
]

{ #category : #'api - paragraph' }
SkiaParagraph >> rectanglesForGlyphs: anInterval width: aWidthStyle height: aHeightStyle [
	"An interval should be given in cursor coordinates"

	^ GtBoxerArrayPointF32
		fromNativeHandle: (self primGetRectsForGlyphRangeFrom: anInterval first to: anInterval last heightStyle: aHeightStyle widthStyle: aWidthStyle)
		during: [ :theBoxerArray |
			theBoxerArray asPoints
				pairsCollect: [ :origin :corner | Rectangle origin: origin corner: corner ] ]
]
