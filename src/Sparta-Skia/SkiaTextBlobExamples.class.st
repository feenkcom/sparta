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
SkiaTextBlobExamples >> fromStringAndFont [
	<gtExample>
	| aTextBlob aFont |
	
	aFont := SkiaFont new.
	aTextBlob := SkiaTextBlob string: 'Hello' font: aFont.
	^ aTextBlob
]
