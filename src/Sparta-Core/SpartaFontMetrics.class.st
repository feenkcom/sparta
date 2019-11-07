Class {
	#name : #SpartaFontMetrics,
	#superclass : #Object,
	#instVars : [
		'strikeoutOffset',
		'strikeoutSize',
		'underlineOffset',
		'underlineSize',
		'xHeight',
		'capHeight',
		'ascent',
		'descent',
		'averageCharWidth',
		'maxCharacterWidth',
		'fontSize',
		'leading'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaFontMetrics >> ascent [
	"Ascent is the recommended distance above the baseline."
	<return: #Number>

	^ ascent
]

{ #category : #accessing }
SpartaFontMetrics >> averageCharWidth [
	"Return the average character width"
	<return: #Number>

	^ averageCharWidth
]

{ #category : #accessing }
SpartaFontMetrics >> capHeight [
	"The height of a capital letter measured from the baseline.
	In typography, cap height refers to the height of a capital letter above the baseline for a particular typeface. It specifically refers to the height of capital letters that are flat—such as H or I—as opposed to round letters such as O, or pointed letters like A, both of which may display overshoot. The height of the small letters is referred to as x-height.
	https://typedecon.com/blogs/type-glossary/cap-height"
	<return: #Number>

	^ capHeight
]

{ #category : #accessing }
SpartaFontMetrics >> descent [
	"Descent is the recommended distance below the baseline."
	<return: #Number>

	^ descent
]

{ #category : #accessing }
SpartaFontMetrics >> fontSize [
	"Font size or em size (em height) is the height of a imaginary design box around the font that includes space for ascender and descender plus a little padding"
	<return: #Number>

	^ fontSize
]

{ #category : #accessing }
SpartaFontMetrics >> leading [
	"Describes how much extra space the font designer expects the application to leave between rows of the font,
	basically it is another name for the line gap."
	<return: #Number>

	^ leading
]

{ #category : #accessing }
SpartaFontMetrics >> lineSpacing [
	"Return the recommended spacing between lines: the sum of metrics descent, ascent, and leading.
	Genrally, line spacing is the space between each line in a paragraph. Typical word processors allows you to customize the line spacing to be single spaced (one line high), double spaced (two lines high), or any other amount you want"
	<return: #Number>

	^ self ascent abs + self descent abs + self leading
]

{ #category : #accessing }
SpartaFontMetrics >> maxCharacterWidth [
	"Return the max character width which is the maximum distance in the x direction that the origin is advanced for any glyph in the font."
	<return: #Number>

	^ maxCharacterWidth
]

{ #category : #accessing }
SpartaFontMetrics >> strikeoutOffset [
	^ strikeoutOffset
]

{ #category : #accessing }
SpartaFontMetrics >> strikeoutSize [
	^ strikeoutSize
]

{ #category : #accessing }
SpartaFontMetrics >> underlineOffset [
	^ underlineOffset
]

{ #category : #accessing }
SpartaFontMetrics >> underlineSize [
	^ underlineSize
]

{ #category : #accessing }
SpartaFontMetrics >> xHeight [
	"The height of lowercase letters reach based on height of lowercase x; does not include ascenders or descenders. The height of the capital letters is referred to as capHeight
	In typography, x-height is the distance between the baseline of a line of type and tops of the main body of lower case letters (i.e. excluding ascenders or descenders). The x-height is a factor in typeface identification and readability.
	Typefaces with very large x-height relative to the total height of the font have shorter ascenders and descenders and thus less white space between lines of type. Sans Serif typefaces typically have large x-heights. In typefaces with small x-heights, other letter parts such as ascenders and descenders may become more visually noticeable.
	Typefaces with large x-heights may appear darker, heavier, crowded, and more difficult to read at body copy sizes.
	If changing to a typeface with a smaller x-height is not an option, open up the lines of type by adding more leading (line spacing), and not using fully justified alignment."
	<return: #Number>

	^ xHeight
]
