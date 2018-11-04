Class {
	#name : #SpTextSpan,
	#superclass : #SpTextSegment,
	#instVars : [
		'start',
		'end',
		'attributes',
		'spanRope',
		'textRun',
		'transformation',
		'strikethroughOffset',
		'strikethroughSize',
		'transformationInverted'
	],
	#category : #'Sparta-Core-Text-Rendering'
}

{ #category : #'instance creation' }
SpTextSpan class >> rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics textRun: aTextRun attributes: theAttributes [
	^ self new
		rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics textRun: aTextRun attributes: theAttributes;
		yourself
]

{ #category : #'instance creation' }
SpTextSpan class >> rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics transform: aSpartaMatrix transformInverted: anInvertedSpartaMatrix textRun: aTextRun attributes: theAttributes [
	^ self new
		rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics transform: aSpartaMatrix transformInverted: anInvertedSpartaMatrix textRun: aTextRun attributes: theAttributes;
		yourself
]

{ #category : #accessing }
SpTextSpan >> attributes [
	^ attributes
]

{ #category : #accessing }
SpTextSpan >> attributes: anAttributes [
	attributes := anAttributes
]

{ #category : #accessing }
SpTextSpan >> end [
	^ end
]

{ #category : #finalization }
SpTextSpan >> finalize [

	textRun ifNotNil: [ :aTextRun | aTextRun release ].
	textRun := nil
]

{ #category : #testing }
SpTextSpan >> isSplitted [

	^ end < spanRope size
]

{ #category : #printing }
SpTextSpan >> printOn: aStream [
	spanRope putOn: aStream from: start to: end
]

{ #category : #initialization }
SpTextSpan >> rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics textRun: aTextRun attributes: theAttributes [
	rope := aRope.
	spanRope := aSpanRope.
	start := aStart.
	end := anEnd.
	from := aTextFrom.
	to := aTextTo.
	length := anEnd - aStart + 1.
	box := aMetrics textMetrics bounds.
	"actual ascent consists not only from font ascent but also from fallback fonts ascent (box top abs)"
	ascent := box top abs max: aMetrics fontMetrics emAscent.
	descent := box bottom abs max: aMetrics fontMetrics emDescent.
	width := aMetrics textMetrics advance.
	strikethroughOffset := aMetrics fontMetrics strikeoutOffset.
	strikethroughSize := aMetrics fontMetrics strikeoutSize.
	height := ascent + descent.
	textRun := aTextRun.
	attributes := theAttributes
]

{ #category : #initialization }
SpTextSpan >> rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics transform: aSpartaMatrix transformInverted: anInvertedSpartaMatrix textRun: aTextRun attributes: theAttributes [
	rope := aRope.
	spanRope := aSpanRope.
	start := aStart.
	end := anEnd.
	from := aTextFrom.
	to := aTextTo.
	length := anEnd - aStart + 1.
	box := aMetrics textMetrics bounds.
	"actual ascent consists not only from font ascent but also from fallback fonts ascent (box top abs)"
	ascent := box top abs max: (aSpartaMatrix transformY: aMetrics fontMetrics emAscent).
	descent := box bottom abs max: (aSpartaMatrix transformY: aMetrics fontMetrics emDescent).
	width := (aSpartaMatrix transformX: aMetrics textMetrics advance) + aSpartaMatrix translation x.
	strikethroughOffset := aSpartaMatrix transformY: aMetrics fontMetrics strikeoutOffset.
	strikethroughSize := aSpartaMatrix transformY: aMetrics fontMetrics strikeoutSize.
	height := ascent + descent.
	transformation := aSpartaMatrix.
	transformationInverted := anInvertedSpartaMatrix.
	textRun := aTextRun.
	attributes := theAttributes
]

{ #category : #accessing }
SpTextSpan >> start [
	^ start
]

{ #category : #accessing }
SpTextSpan >> strikethroughOffset [
	^ strikethroughOffset
]

{ #category : #accessing }
SpTextSpan >> strikethroughSize [
	^ strikethroughSize
]

{ #category : #accessing }
SpTextSpan >> string [
	^ String streamContents: [ :aStream | spanRope putOn: aStream from: start to: end ]
]

{ #category : #accessing }
SpTextSpan >> textRun [
	self
		assert: [ textRun isNull not ]
		description: [ 'Text run must not be nullptr' ].
	^ textRun
]

{ #category : #accessing }
SpTextSpan >> transformation [
	^ transformation
]

{ #category : #accessing }
SpTextSpan >> transformationInverted [
	^ transformationInverted
]
