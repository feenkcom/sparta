Class {
	#name : #SkiaParagraph,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaParagraph class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paragraph_drop(void** aHandle))
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charCount [
	<return: #Number>
	
	^ self primGetCharCount
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charOffsetAbove: anOffset ifFound: aBlock ifNone: aNoneBlock [
	"Find a character above a character with a given offset and evaluate a block if such character found"
	| aCurrentLineIndex aLineHeightAbove|

	aCurrentLineIndex := self lineIndexForCharacter: anOffset.

	"this is the first line of the paragraph, there is no char above"
	aCurrentLineIndex == 1
		ifTrue: [ ^ aNoneBlock value ].

	aLineHeightAbove := self lineHeightAt: aCurrentLineIndex - 1.

	^ aBlock value: (self charOffsetAt: ((self cursorRectangleForCharacter: anOffset) origin - (0 @ (aLineHeightAbove / 2.0))))
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charOffsetAt: aPoint [
	"Find a character close to a given coordinate point within the paragraph and return character's offset from the start of the paragraph"
	<return: #Number>

	^ self primGetCharPositionAtX: aPoint x y: aPoint y
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charOffsetBelow: anOffset ifFound: aBlock ifNone: aNoneBlock [
	"Find a character below a character with a given offset and evaluate a block if such character found"
	| aCurrentLineIndex aLineHeightBelow aCursorRectangle |

	aCurrentLineIndex := self lineIndexForCharacter: anOffset.

	"this is the last line of the paragraph, there is no char below"
	aCurrentLineIndex = self lineCount
		ifTrue: [ ^ aNoneBlock value ].
	
	aLineHeightBelow := self lineHeightAt: aCurrentLineIndex + 1.
	aCursorRectangle := self cursorRectangleForCharacter: anOffset.

	^ aBlock value: (self charOffsetAt: (aCursorRectangle corner + (0 @ (aLineHeightBelow / 2.0))))
]

{ #category : #'api - paragraph' }
SkiaParagraph >> cursorGlyphsForCharacter: anOffset [
	^ self glyphsForChars: (self cursorIntervalForCharacter: anOffset)
]

{ #category : #'api - paragraph' }
SkiaParagraph >> cursorIntervalForCharacter: anOffset [
	| aCharFrom aCharTo |

	aCharFrom := anOffset = self charCount
		ifTrue: [ (anOffset - 1) max: 0 ]
		ifFalse: [ anOffset ].
	aCharTo := (anOffset + 1) min: self charCount.

	^ aCharFrom to: aCharTo
]

{ #category : #'api - paragraph' }
SkiaParagraph >> cursorRectangleForCharacter: anOffset [
	| theRectangles |

	theRectangles := self
		rectanglesForChars: (self cursorIntervalForCharacter: anOffset)
		width: SkiaParagraphRectWidthStyle Tight
		height: SkiaParagraphRectHeightStyle Max.

	^ theRectangles
		ifNotEmpty: [
			| thePosition theHeight |
			
			thePosition := anOffset = self charCount
				ifTrue: [ theRectangles last topRight ]
				ifFalse: [ theRectangles last topLeft ].
			
			theHeight := theRectangles last height.
			(thePosition extent: 0 @ theHeight) ]
		ifEmpty: [ 0@0 extent: (0 @ (self lineHeightForCharacter: anOffset)) ]
]

{ #category : #'api - paragraph' }
SkiaParagraph >> glyphsForChars: anInterval [
	"An interval should be given in cursor coordinates"

	anInterval
		ifEmpty: [ ^ #() ].

	^ GtBoxerRangeUSize
		fromNativeHandle: (self primGetGlyphRangeForCharFrom: anInterval first to: anInterval last)
		during: [ :aRange | aRange asInterval ]
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
SkiaParagraph >> lineCount [
	"Return the amount of lines in the paragraph"
	<return: #Number>

	^ self primGetLineNumber max: 1
]

{ #category : #'api - paragraph' }
SkiaParagraph >> lineHeightAt: anIndex [
	"Return the line height for a given line index"
	<return: #Number>
	
	self
		assert: [ anIndex >= 0 ]
		description: [ 'Must be positive' ].

	^ self primGetLineHeight: (((anIndex - 1) min: (self lineCount - 1)) max: 0)
]

{ #category : #'api - paragraph' }
SkiaParagraph >> lineHeightForCharacter: anOffset [
	"Return the line height for a given character offset"
	<return: #Number>
	
	^ self lineHeightAt: (self lineIndexForCharacter: anOffset)
]

{ #category : #'api - paragraph' }
SkiaParagraph >> lineIndexForCharacter: anOffset [
	"Return the line index for a character offset"
	<return: #Number>
	
	^ ((self primGetLineIndexForChar: anOffset) + 1) min: self lineCount
]

{ #category : #'api - paragraph' }
SkiaParagraph >> longestLine [
	^ self primGetLongestLine
]

{ #category : #'api - paragraph' }
SkiaParagraph >> maxWidth [
	^ self primGetMaxWidth
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
SkiaParagraph >> primGetCharCount [
	^ self ffiCall: #(size_t skia_paragraph_get_char_count(self))
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
SkiaParagraph >> primGetGlyphRangeForCharFrom: aStart to: anEnd [
	^ self ffiCall: #(void* skia_paragraph_get_glyph_range_for_char_range(self, size_t aStart, size_t anEnd))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetHeight [
	^ self ffiCall: #(scalar skia_paragraph_get_height(self))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetLineHeight: anIndex [
	^ self ffiCall: #(scalar skia_paragraph_get_line_height(self, size_t anIndex))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetLineIndexForChar: anIndex [
	^ self ffiCall: #(size_t skia_paragraph_get_line_index_for_char(self, size_t anIndex))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetLineNumber [
	^ self ffiCall: #(size_t skia_paragraph_get_line_number(self))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetLongestLine [
	^ self ffiCall: #(scalar skia_paragraph_get_longest_line(self))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetMaxWidth [
	^ self ffiCall: #(scalar skia_paragraph_get_max_width(self))
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

	anInterval
		ifEmpty: [ ^ #() ].

	self
		assert: [ anInterval first <= anInterval last ]
		description: [ 'Interval must be positive' ].

	^ GtBoxerArrayPointF32
		fromNativeHandle: (self primGetRectsForCharRangeFrom: anInterval first to: anInterval last heightStyle: aHeightStyle widthStyle: aWidthStyle)
		during: [ :theBoxerArray |
			theBoxerArray asPoints
				pairsCollect: [ :origin :corner | Rectangle origin: origin corner: corner ] ]
]
