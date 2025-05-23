Class {
	#name : #SkiaTextBlobExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaTextBlobExamples >> default [
	<gtExample>
	<return: #SkiaTextBlob>
	| aTextBlob |
	aTextBlob := SkiaTextBlob new.
	^ aTextBlob
]

{ #category : #accessing }
SkiaTextBlobExamples >> fromEmptyString [
	<gtExample>
	<return: #SkiaTextBlob>
	| aTextBlob aFont |
	aFont := SkiaFont new.
	aTextBlob := SkiaTextBlob string: '' font: aFont.	"can not create a text blob from empty string"
	self assert: aTextBlob isNull.

	^ aTextBlob
]

{ #category : #accessing }
SkiaTextBlobExamples >> fromGlyphsAndFont [
	<gtExample>
	<return: #SkiaTextBlob>
	| aTextBlob theGlyphs aFont |
	aFont := SkiaFont new.
	theGlyphs := aFont stringToGlyphs: 'Hello'.

	aTextBlob := SkiaTextBlob glyphs: theGlyphs font: aFont.
	self assert: aTextBlob isNull not.

	^ aTextBlob
]

{ #category : #accessing }
SkiaTextBlobExamples >> fromStringAndFont [
	<gtExample>
	<return: #SkiaTextBlob>
	| aTextBlob aFont |
	aFont := SkiaFont new.
	aTextBlob := SkiaTextBlob string: 'Hello' font: aFont.
	self assert: aTextBlob isNull not.

	^ aTextBlob
]
