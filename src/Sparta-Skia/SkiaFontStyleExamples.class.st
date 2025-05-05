Class {
	#name : #SkiaFontStyleExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaFontStyleExamples >> custom [
	<gtExample>
	<return: #SkiaFontStyle>
	| aFontStyle |
	aFontStyle := SkiaFontStyle
			weight: 800
			width: SkiaFontStyleWidth UltraExpanded
			slant: SkiaFontStyleSlant Italic.

	self assert: aFontStyle slant equals: SkiaFontStyleSlant Italic.
	self assert: aFontStyle weight equals: 800.
	self assert: aFontStyle width equals: SkiaFontStyleWidth UltraExpanded.

	^ aFontStyle
]

{ #category : #accessing }
SkiaFontStyleExamples >> default [
	<gtExample>
	<return: #SkiaFontStyle>
	| aFontStyle |
	aFontStyle := SkiaFontStyle new.
	self assert: aFontStyle slant equals: SkiaFontStyleSlant Upright.
	self assert: aFontStyle weight equals: 400.
	self assert: aFontStyle width equals: SkiaFontStyleWidth Normal.

	^ aFontStyle
]
