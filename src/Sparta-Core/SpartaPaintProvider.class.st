"
I am a paint provider.

I am responsible for creation of backen specific  paints, for example linear or radial gradients, surface paint or a color paint out of Color.

Concrete backend specific implementations must override and implement all my methods to return a new paint objects.

Public API and Key Messages

- color: create a color paint from Color. It is recommended to make Color be polymorphic with Paint
- linearGradient - return a new linear gradient object that implements TSpartaLinearGradientPaint
- radialGradient - return a new radial gradient object that implements TSpartaRadialGradientPaint

   canvas paint linearGradient
	stops: { 0 -> Color red. 1 -> Color blue};
	begin: 0@0;
	end: 100@100
 
Internal Representation and Key Implementation Points.


    My subclasses must provide backend specific paints
"
Class {
	#name : #SpartaPaintProvider,
	#superclass : #SpartaAbstractBuilder,
	#category : #'Sparta-Core-Builders'
}

{ #category : #paints }
SpartaPaintProvider >> color: aColor [
	"A Color is already a paint in Sparta"

	^ aColor
]

{ #category : #paints }
SpartaPaintProvider >> form: aForm [
	^ self subclassResponsibility
]

{ #category : #paints }
SpartaPaintProvider >> linearGradient [
	^ self subclassResponsibility
]

{ #category : #paints }
SpartaPaintProvider >> radialGradient [
	^ self subclassResponsibility
]

{ #category : #paints }
SpartaPaintProvider >> surface [
	^ self subclassResponsibility
]
