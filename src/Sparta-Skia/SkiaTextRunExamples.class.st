Class {
	#name : #SkiaTextRunExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'instance creation' }
SkiaTextRunExamples >> fromStringHello [
	<gtExample>
	| aTextRun |
	
	aTextRun := SkiaTextRun fromString: 'Hello'.
	self assert: aTextRun glyphs equals: #[43 0 72 0 79 0 79 0 82 0].
	self assert: aTextRun advance > 0.
	self assert: aTextRun bounds hasPositiveExtent.
	self assert: aTextRun font isNull.
	
	^ aTextRun
]
