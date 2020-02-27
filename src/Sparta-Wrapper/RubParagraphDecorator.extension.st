Extension { #name : #RubParagraphDecorator }

{ #category : #'*Sparta-Wrapper' }
RubParagraphDecorator >> drawOnWrapperCanvas: anAthensCanvas [
	"do nothing by default"
]

{ #category : #'*Sparta-Wrapper' }
RubParagraphDecorator >> drawOnWrapperCanvas: aCanvas bounds: aRectangle color: aColor [

   (self canDrawDecoratorsOn: aCanvas) ifFalse: [ ^self ].

	self drawOnWrapperCanvas: aCanvas.
	next drawOnWrapperCanvas: aCanvas bounds: aRectangle color: aColor
]
