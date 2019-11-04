Class {
	#name : #SkiaTextPainter,
	#superclass : #SpartaTextPainter,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #'accessing - breaks' }
SkiaTextPainter >> breakNone [
	"The line has no break opportunities"
]

{ #category : #'accessing - breaks' }
SkiaTextPainter >> breakNormal [
	"The line has a break opportunity determined by the standard line-breaking algorithm."
]

{ #category : #'accessing - breaks' }
SkiaTextPainter >> breakWordWrap [
	"The line has a break opportunity only within a word.
	With break-word-wrap we will break at this point only if
	there are no other break opportunities in the line."
]

{ #category : #drawing }
SkiaTextPainter >> fillString: aString withColor: aFillColor strokeColor: aStrokeColor [

	self halt.
]

{ #category : #drawing }
SkiaTextPainter >> fillString: aString withColor: aFillColor strokePaint: aStrokePaint [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> horizontal [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> verticalMixed [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> verticalSidewaysLeft [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> verticalSidewaysRight [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> verticalUpright [
]
