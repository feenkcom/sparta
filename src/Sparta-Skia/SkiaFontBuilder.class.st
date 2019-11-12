Class {
	#name : #SkiaFontBuilder,
	#superclass : #SpartaFontBuilder,
	#instVars : [
		'familyName'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #accessing }
SkiaFontBuilder >> build [
	| aFontStyle aTypeface aFont |

	aFontStyle := SkiaFontStyle
		weight: weight
		width: SkiaFontStyleWidth Normal
		slant: SkiaFontStyleSlant Upright.

	aTypeface := SkiaTypeface familyName: (familyName ifNil: [ SkiaTypeface default familyName  ]) fontStyle: aFontStyle.

	aFont := SkiaFont typeface: aTypeface size: size.
	^ aFont
]

{ #category : #'instance creation' }
SkiaFontBuilder >> cursive [
]

{ #category : #'instance creation' }
SkiaFontBuilder >> fantasy [
]

{ #category : #'instance creation' }
SkiaFontBuilder >> fixed [
]

{ #category : #'instance creation' }
SkiaFontBuilder >> monospace [
]

{ #category : #'instance creation' }
SkiaFontBuilder >> named: aNameString [
	familyName := aNameString
]

{ #category : #'instance creation' }
SkiaFontBuilder >> sansSerif [
]

{ #category : #'instance creation' }
SkiaFontBuilder >> serif [
	
]

{ #category : #'instance creation' }
SkiaFontBuilder >> special [
]

{ #category : #stretch }
SkiaFontBuilder >> stretchReset [
	
]

{ #category : #style }
SkiaFontBuilder >> styleItalic [
]

{ #category : #style }
SkiaFontBuilder >> styleNormal [
]

{ #category : #style }
SkiaFontBuilder >> styleOblique [
]

{ #category : #style }
SkiaFontBuilder >> styleReset [
	
]

{ #category : #'instance creation' }
SkiaFontBuilder >> variable [
]
