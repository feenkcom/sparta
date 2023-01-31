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
SkiaParagraph >> charCount [
	<return: #Number>
	
	^ self primGetCharCount
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charOffsetAbove: anOffset ifFound: aBlock ifNone: aNoneBlock [
	"Find a character above a character with a given offset and evaluate a block if such character found"
	| aCurrentLineIndex aLineAboveIndex aLineHeightAbove aCursorPosition |
	"+1 is added because skia doesn't seem to handle the beginning of the line correctly"
	
	aCurrentLineIndex := self lineIndexForCharacter: anOffset.

	"this is the first line of the paragraph, there is no char above"
	aCurrentLineIndex == 1
		ifTrue: [ ^ aNoneBlock value ].
		
	aLineAboveIndex := aCurrentLineIndex - 1.
	aLineHeightAbove := self lineHeightAt: aLineAboveIndex.

	aCursorPosition := (self cursorRectangleForCharacter: anOffset) origin
		- (0 @ (aLineHeightAbove / 2.0)).
	
	^ aBlock value: (self
		charOffsetForPoint: aCursorPosition
		lineIndex: aLineAboveIndex)
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charOffsetBelow: anOffset ifFound: aBlock ifNone: aNoneBlock [
	"Find a character below a character with a given offset and evaluate a block if such character found"
	| aCurrentLineIndex aLineBelowIndex aLineHeightBelow aCursorRectangle aCursorPosition |
	"+1 is added because skia doesn't seem to handle the beginning of the line correctly"
	
	aCurrentLineIndex := self lineIndexForCharacter: anOffset.

	"this is the last line of the paragraph, there is no char below"
	aCurrentLineIndex = self lineCount
		ifTrue: [ ^ aNoneBlock value ].
	
	aLineBelowIndex := aCurrentLineIndex + 1.
	aLineHeightBelow := self lineHeightAt: aLineBelowIndex.
	
	aCursorRectangle := self cursorRectangleForCharacter: anOffset.
	aCursorPosition := aCursorRectangle corner + (0 @ (aLineHeightBelow / 2.0)).
	
	^ aBlock value: (self
		charOffsetForPoint: aCursorPosition
		lineIndex: aLineBelowIndex)
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charOffsetForPoint: aPoint [
	"Find a character close to a given coordinate point within the paragraph and return character's offset from the start of the paragraph"
	<return: #Number>
	| aLineIndex |
	
	aLineIndex := self lineIndexForPoint: aPoint.
	^ self charOffsetForPoint: aPoint lineIndex: aLineIndex
]

{ #category : #'api - paragraph' }
SkiaParagraph >> charOffsetForPoint: aPoint lineIndex: aLineIndex [
	"Find a character close to a given coordinate point within the paragraph scoping it to the line at the given index
	and return character's offset from the start of the paragraph"
	<return: #Number>
	| aLineWidth |

	aLineWidth := self lineWidthAt: aLineIndex.

	^ aPoint x >= aLineWidth
		ifTrue: [ self lineEndAt: aLineIndex ]
		ifFalse: [ self primGetCharPositionAtX: aPoint x y: aPoint y ]
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
				ifFalse: [ theRectangles first topLeft ].
			
			theHeight := theRectangles first height.
			(thePosition extent: 0 @ theHeight) ]
		ifEmpty: [ 0@0 extent: (0 @ (self lineHeightForCharacter: anOffset)) ]
]

{ #category : #'api - paragraph' }
SkiaParagraph >> glyphOffsetForCharacter: anOffset [
	^ self primGetGlyphOffsetForCharOffset: anOffset
]

{ #category : #'api - paragraph' }
SkiaParagraph >> glyphOffsetForPoint: aPoint [
	<return: #Number>

	^ self primGetGlyphPositionAtX: aPoint x y: aPoint y
]

{ #category : #'gt-extension' }
SkiaParagraph >> gtStaticPreviewFor: aView [
	<gtView>
	
	^ aView sparta
		title: 'Preview';
		priority: 1;
		matchParent;
		rendering: [ :aCanvas :anElement |
			(aCanvas isKindOf: SkiaCanvas)
				ifTrue: [
					self paintOn: aCanvas at: 0@0.
					self placeholderRectangles do: [ :eachRectangle |
						aCanvas fill
							path: eachRectangle;
							paint: (Color gray alpha: 0.2);
							draw ] ] ]
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
SkiaParagraph >> lineEndAt: anIndex [
	"Return the character offset of the end of the line at the given index"
	<return: #Number>
	| aLineIndex |
	
	self
		assert: [ anIndex >= 0 ]
		description: [ 'Must be positive' ].
		
	aLineIndex := (((anIndex - 1) min: (self lineCount - 1)) max: 0).

	^ self primGetLineEnd: aLineIndex
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
SkiaParagraph >> lineIndexForPoint: aPoint [
	"Return the line index for a character offset"
	<return: #Number>
	
	^ ((self primGetLineIndexAtX: aPoint x y: aPoint y) + 1) min: self lineCount
]

{ #category : #'api - paragraph' }
SkiaParagraph >> lineWidthAt: anIndex [
	"Return the line width for a given line index"
	<return: #Number>
	
	self
		assert: [ anIndex >= 0 ]
		description: [ 'Must be positive' ].

	^ self primGetLineWidth: (((anIndex - 1) min: (self lineCount - 1)) max: 0)
]

{ #category : #'api - paragraph' }
SkiaParagraph >> longestLine [
	^ self primGetLongestLine max: 0
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
	
	^ self ffiLibrary
		newArrayF32FromHandle: self primGetRectsForPlaceholders
		during: [ :anArrayF32 | anArrayF32 asRectangles ]
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
SkiaParagraph >> primGetGlyphOffsetForCharOffset: anOffset [
	^ self ffiCall: #(size_t skia_paragraph_get_glyph_offset_for_char_offset(self, size_t anOffset))
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
SkiaParagraph >> primGetLineEnd: anIndex [
	^ self ffiCall: #(size_t skia_paragraph_get_line_end_character_index(self, size_t anIndex))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetLineHeight: anIndex [
	^ self ffiCall: #(scalar skia_paragraph_get_line_height(self, size_t anIndex))
]

{ #category : #'private - ffi' }
SkiaParagraph >> primGetLineIndexAtX: aX y: aY [
	^ self ffiCall: #(size_t skia_paragraph_get_line_index_at_coordinate(self, scalar aY, scalar aY))
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
SkiaParagraph >> primGetLineWidth: anIndex [
	^ self ffiCall: #(scalar skia_paragraph_get_line_width(self, size_t anIndex))
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
SkiaParagraph >> primToPhlowObject [
	^ self ffiCall: #(void* skia_paragraph_with_text_to_phlow(self))
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

	^ self ffiLibrary
		newArrayF32FromHandle: (self
			primGetRectsForCharRangeFrom: anInterval first
			to: anInterval last
			heightStyle: aHeightStyle
			widthStyle: aWidthStyle)
		during: [ :anArrayF32 | anArrayF32 asRectangles ]
]
