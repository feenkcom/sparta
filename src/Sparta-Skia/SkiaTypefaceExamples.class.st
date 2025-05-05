Class {
	#name : #SkiaTypefaceExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaTypefaceExamples >> default [
	<gtExample>
	<return: #SkiaTypeface>
	| aTypeface |
	aTypeface := SkiaTypeface new.
	self assert: aTypeface isBold not.
	self assert: aTypeface isFixedPitch not.
	self assert: aTypeface isItalic not.

	^ aTypeface
]

{ #category : #accessing }
SkiaTypefaceExamples >> fromFamilyNameAndFontStyle [
	<gtExample>
	<return: #SkiaTypeface>
	| aDefaultTypeface aCustomTypeface |
	aDefaultTypeface := self default.

	aCustomTypeface := SkiaTypeface
			familyName: aDefaultTypeface familyName
			fontStyle: aDefaultTypeface fontStyle.

	self assert: aCustomTypeface familyName equals: aDefaultTypeface familyName.
	self assert: aCustomTypeface isBold equals: aDefaultTypeface isBold.
	self assert: aCustomTypeface isFixedPitch equals: aDefaultTypeface isFixedPitch.
	self assert: aCustomTypeface isItalic equals: aDefaultTypeface isItalic.

	^ aCustomTypeface
]
