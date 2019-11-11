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
	self assert: aTextRun bits equals: 32.
	
	^ aTextRun 
]
