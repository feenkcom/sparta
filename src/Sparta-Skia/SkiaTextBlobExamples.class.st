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
