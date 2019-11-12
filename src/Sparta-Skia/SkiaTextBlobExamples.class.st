Class {
	#name : #SkiaTextBlobExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaTextBlobExamples >> default [
	<gtExample>
	| aTextBlob |
	
	aTextBlob := SkiaTextBlob new.
	^ aTextBlob
]

{ #category : #accessing }
SkiaTextBlobExamples >> fromEmptyString [
	<gtExample>
	| aTextBlob aFont |
	
	aFont := SkiaFont new.
	aTextBlob := SkiaTextBlob string: '' font: aFont.

	"can not create a text blob from empty string"
	self assert: aTextBlob isNull.
	
	^ aTextBlob
]

{ #category : #accessing }
SkiaTextBlobExamples >> fromStringAndFont [
	<gtExample>
	| aTextBlob aFont |
	
	aFont := SkiaFont new.
	aTextBlob := SkiaTextBlob string: 'Hello' font: aFont.
	self assert: aTextBlob isNull not.

	^ aTextBlob
]
