Class {
	#name : #SkiaFilterPainter,
	#superclass : #SpartaFilterPainter,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #accessing }
SkiaFilterPainter >> destinationTopLeft [
	<return: #Point>

	^ destinationPoint ifNil: [
		sourceRectangle
			ifNil: [ 0@0 ]
			ifNotNil: [ :aRectangle | aRectangle origin ] ]
]

{ #category : #accessing }
SkiaFilterPainter >> sourceToDestinationOffset [
	<return: #Point>

	^ self destinationTopLeft - (sourceRectangle
		ifNil: [ 0@0 ]
		ifNotNil: [ :aRectangle | aRectangle origin ])
]

{ #category : #drawing }
SkiaFilterPainter >> draw [
	filter drawOn: self
]
