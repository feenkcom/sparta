Class {
	#name : #SkiaFontBuilder,
	#superclass : #SpartaFontBuilder,
	#instVars : [
		'familyName'
	],
	#classInstVars : [
		'cache',
		'session'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #accessing }
SkiaFontBuilder class >> cache [

	session == Smalltalk session
		ifFalse: [
			cache := nil.
			session := Smalltalk session ].

	^ cache ifNil: [ cache := self defaultFontCache ]
]

{ #category : #cleanup }
SkiaFontBuilder class >> cleanUp [
	super cleanUp.
	
	cache := nil.
	session := nil
]

{ #category : #'instance creation' }
SkiaFontBuilder class >> defaultFontCache [
	^ SpartaFontCache new
		maximumWeight: 50 "how many different font faces we cache";
		yourself
]

{ #category : #accessing }
SkiaFontBuilder >> build [
	| aSpartaFontFace theFontsDictionary |
	
	aSpartaFontFace := SpartaFontFace new
		familyName: (familyName ifNil: [ 'Helvetica' ]);
		weight: weight;
		stretch: SkiaFontStyleWidth Normal;
		style: SkiaFontStyleSlant Upright.

	theFontsDictionary := self class cache
		at: aSpartaFontFace
		ifAbsentPut: [ Dictionary new ].

	^ theFontsDictionary
		at: size
		ifAbsentPut: [
			| aSkiaTypeface |
			aSkiaTypeface := SpartaUserFonts default
				matchFamilyName: aSpartaFontFace familyName
				weight: aSpartaFontFace weight
				stretch: aSpartaFontFace stretch asSpartaFontStretch
				slant: aSpartaFontFace style asSpartaFontSlant
				ifFound: [ :aSpartaUserFont | SkiaFontManager default newTypeface: aSpartaUserFont source fontContents ]
				ifNone: [
					SkiaFontManager default
						matchFamilyName: aSpartaFontFace familyName
						weight: aSpartaFontFace weight value
						width: aSpartaFontFace stretch
						slant: aSpartaFontFace style
						ifFound: #yourself
						ifNone: [
							SkiaTypeface
								familyName: aSpartaFontFace familyName
								fontStyle: (SkiaFontStyle
									weight: aSpartaFontFace weight value
									width: aSpartaFontFace stretch
									slant: aSpartaFontFace style) ] ].
			
			SkiaFont typeface: aSkiaTypeface size: size ]
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

{ #category : #'instance creation' }
SkiaFontBuilder >> variable [
]
