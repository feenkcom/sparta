Class {
	#name : 'SkiaFontFaceBuilder',
	#superclass : 'SpartaFontFaceBuilder',
	#category : 'Sparta-Skia-Builders'
}

{ #category : 'building' }
SkiaFontFaceBuilder >> build [
	SpartaUserFonts default addUserFontFace: (SpartaUserFontFace new
		familyName: familyName;
		weight: weight;
		style: style;
		stretch: stretch;
		source: source).
	"we should register it as a typeface in a font manager"
	SkiaFontManager default newTypeface: source asSpartaFontSource fontContents
]
