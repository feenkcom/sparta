Class {
	#name : #SkiaFontFaceBuilder,
	#superclass : #SpartaFontFaceBuilder,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #building }
SkiaFontFaceBuilder >> build [
	SpartaUserFonts default addUserFontFace: (SpartaUserFontFace new
		familyName: familyName;
		weight: weight;
		style: style;
		stretch: stretch;
		source: source)
]
