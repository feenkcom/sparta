Class {
	#name : #SkiaFontManagerExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaFontManagerExamples >> default [
	<gtExample>
	<return: #SkiaFontManager>
	| aFontManager |
	aFontManager := SkiaFontManager new.
	self assert: aFontManager countFamilies > 0.

	^ aFontManager
]

{ #category : #accessing }
SkiaFontManagerExamples >> newTypeface [
	<gtExample>
	<noTest>
	| aFontData aFontManager aTypeface |
	
	aFontData := BrGlamorousFonts sourceSansPro400italicRegular.
	aFontManager := self default.
	
	aTypeface := aFontManager newTypeface: aFontData.
	self assert: aTypeface isItalic.
	
	^ aTypeface
]
