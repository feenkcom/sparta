Class {
	#name : #SkiaShaderExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : 'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaShaderExamples >> default [
	<gtExample>
	| aShader |
	
	aShader := SkiaShader new.

	self assert: aShader isOpaque not.
	self assert: aShader isImage not.
	
	^ aShader
]
