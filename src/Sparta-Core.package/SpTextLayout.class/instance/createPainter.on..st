instance creation
createPainter: aSpRope on: aCanvas
	"I create and return a text painter for given span (SpRope) and sparta canvas.
	Additionally I also initialize a corresponding font group according to span's attributes.
	Note: I assume that a given rope is homogeneous of type character; every item has the same attributes and type"
	<return: #SpartaTextPainter>
	| aFontBuilder aTextPainter theAttributes |

	theAttributes := aSpRope attributes.

	aTextPainter := aCanvas text.
	aFontBuilder := aCanvas font.

	theAttributes do: [ :anAttribute |
		anAttribute applyOnFont: aFontBuilder with: aSpRope.
		anAttribute applyOnText: aTextPainter with: aSpRope ].

	aTextPainter font: aFontBuilder build.
	aTextPainter string: (String streamContents: [ :aStream | aStream nextPutAll: aSpRope ]).

	^ aTextPainter