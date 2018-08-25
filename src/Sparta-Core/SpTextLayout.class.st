"
I am an abstract text layout. My main role is to measure a rope of text according to given additional properties or constraints and prepare it for rendering.

The most important properties are maximal width and height. Maximal width is used to wrap a line of text in multiple lines while maximal height prevents text from exceeding an element's boundaries.

Once measurement is done users may ask for computed text extent by sending #extent message.
The measured text layout can be rendered on SpartaCanvas by sending #renderOn: with canvas as argument to me.

Public API and Key Messages

- rope:properties: initialize me with text rope and additional properties
- measureOn: measure given rope using provided sparta canvas
- extent - return measured text extent
- width - return measured text width
- height - return measured text height
- renderOn: render text layout on given canvas
 
Internal Representation and Key Implementation Points.

    Instance Variables
	rope:		<SpRope>
	maxHeight:		<Number>
	maxWidth:		<Number>
	height:		<Number>
	width:		<Number>
	end:		<Number>
	autoRelease:		<Boolean>

    Implementation Points
"
Class {
	#name : #SpTextLayout,
	#superclass : #Object,
	#instVars : [
		'rope',
		'maxHeight',
		'maxWidth',
		'height',
		'width',
		'end',
		'autoRelease'
	],
	#classInstVars : [
		'matrix'
	],
	#category : 'Sparta-Core-Text-Rendering'
}

{ #category : #cleanup }
SpTextLayout class >> cleanUp [
	super cleanUp.
	
	matrix := nil
]

{ #category : #accessing }
SpTextLayout class >> matrix [
	"Return a temporary matrix used to collect data in.
	It is a shared singleton to minimize object creation.
	Must only be used on UI thread!"
	<return: #SpartaMatrix>
	
	^ matrix ifNil: [ matrix := SpartaMatrix new ]
]

{ #category : #'instance creation' }
SpTextLayout class >> rope: aRope [
	^ self new
		rope: aRope;
		yourself
]

{ #category : #'instance creation' }
SpTextLayout >> createPainter: aSpRope on: aCanvas [
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
	aTextPainter string: (String new: aSpRope size streamContents: [ :aStream | aStream nextPutAll: aSpRope ]).

	^ aTextPainter
]

{ #category : #accessing }
SpTextLayout >> end [
	^ end
]

{ #category : #geometry }
SpTextLayout >> extent [
	"Return measured extent of text layout"
	<return: #Point>

	^ self width @ self height
]

{ #category : #finalization }
SpTextLayout >> finalize [

	self subclassResponsibility
]

{ #category : #geometry }
SpTextLayout >> height [
	"Return measured height of the layout.
	Note: height may be greater than maxHeight. This may happen
	if maxHeight is smaller than height of a single line or word or character.
	We want to guarantee that at least something is displayed and measured."
	<return: #Number>

	^ height
]

{ #category : #initialization }
SpTextLayout >> initialize [
	super initialize.
	
	autoRelease := true.
	self reset
]

{ #category : #testing }
SpTextLayout >> isWhitespace: aCharacter [
	"Return true if aCharacter is a whitespace and
	therefore needs to be skipped if appears on a new line AFTER line break.
	Before sending me make sure that you don't skip characters from the start of a paragraph"
	<return: #Boolean>

	^ aCharacter = Character space
]

{ #category : #geometry }
SpTextLayout >> maxHeight [
	^ maxHeight
]

{ #category : #geometry }
SpTextLayout >> maxWidth [
	^ maxWidth
]

{ #category : #measuring }
SpTextLayout >> measureOn: aCanvas [
	self subclassResponsibility
]

{ #category : #geometry }
SpTextLayout >> positionAt: anIndex [
	^ self subclassResponsibility
]

{ #category : #rendering }
SpTextLayout >> renderOn: aCanvas [
	(self rendererOn: aCanvas)
		renderOn: aCanvas
]

{ #category : #rendering }
SpTextLayout >> rendererOn: aCanvas [
	^ self subclassResponsibility
]

{ #category : #initialization }
SpTextLayout >> reset [
	self wantsAutoRelease
		ifFalse: [ self finalize ].

	rope := nil.
	maxHeight := Float infinity.
	maxWidth := Float infinity.
	height := 0.
	width := 0.
	end := 0.
	autoRelease := true
]

{ #category : #accessing }
SpTextLayout >> rope [
	"Return a text rope I am assigned to"
	<return: #SpRope>

	self
		assert: [ rope isNotNil ]
		description: [ 'Rope must never be nil' ].

	^ rope
]

{ #category : #initialization }
SpTextLayout >> rope: aRope [

	self
		rope: aRope
		maxWidth: Float infinity
		maxHeight: Float infinity
]

{ #category : #initialization }
SpTextLayout >> rope: aRope maxWidth: aMaxWidth [

	self
		rope: aRope
		maxWidth: aMaxWidth
		maxHeight: Float infinity
]

{ #category : #initialization }
SpTextLayout >> rope: aRope maxWidth: aMaxWidth maxHeight: aMaxHeight [

	self
		rope: aRope
		maxWidth: aMaxWidth
		maxHeight: aMaxHeight
		autoRelease: true "default is true"
]

{ #category : #initialization }
SpTextLayout >> rope: aRope maxWidth: aMaxWidth maxHeight: aMaxHeight autoRelease: shouldAutoRelease [
	"Construct me with an immutable rope and given properties.
	Note, that I can be only initialized once.
	Once done, you need to initialize me (build lines or words) providing
	an instance of SpartaCanvas as context provider.
	For that send me #initializeOn: message with canvas as an argument"

	self
		assert: [ rope isNil ]
		description: [ 'I am immutable! You should create a new instance' ].

	rope := aRope.
	maxWidth := aMaxWidth.
	maxHeight := aMaxHeight.
	autoRelease := shouldAutoRelease
]

{ #category : #testing }
SpTextLayout >> skipWhitespaceIn: aString after: aStart [
	"Return an index of the first non-whitespace character in aString after aStart index"
	<return: #Number>
	| anIndex aChar |

	anIndex := aStart.
	aChar := aString at: anIndex.
	[ anIndex < aString size
		and: [ self isWhitespace: aChar ] ]
			whileTrue: [ 
				anIndex := anIndex + 1.
				aChar := aString at: anIndex ].
	^ anIndex
]

{ #category : #testing }
SpTextLayout >> wantsAutoRelease [
	^ autoRelease
]

{ #category : #geometry }
SpTextLayout >> width [
	"Return measured width of the layout.
	Note: width may be greater than maxWidth. This may happen
	if maxWidth is smaller than width of a single line or word or character.
	We want to guarantee that at least something is displayed and measured."
	<return: #Number>

	^ width
]
