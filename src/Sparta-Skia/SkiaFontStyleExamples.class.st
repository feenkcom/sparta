Class {
	#name : #SkiaFontStyleExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaFontStyleExamples >> default [
	<gtExample>
	| aFontStyle |
	
	aFontStyle := SkiaFontStyle new.
	self assert: aFontStyle slant equals: SkiaFontStyleSlant Upright.
	self assert: aFontStyle weight equals: 400.
	self assert: aFontStyle width equals: SkiaFontStyleWidth Normal.
	
	^ aFontStyle
]
