Class {
	#name : #SkiaTextureInfoExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : 'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaTextureInfoExamples >> default [
	<gtExample>
	| aTextureInfo |
	
	aTextureInfo := SkiaTextureInfo new.
	
	self assert: aTextureInfo target equals: 0.
	self assert: aTextureInfo id equals: 0.
	self assert: aTextureInfo format equals: 0.
	
	^ aTextureInfo
]
