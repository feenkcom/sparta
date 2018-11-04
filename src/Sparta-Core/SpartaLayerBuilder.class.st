Class {
	#name : #SpartaLayerBuilder,
	#superclass : #SpartaAbstractBuilder,
	#traits : 'TSpartaTransformable',
	#classTraits : 'TSpartaTransformable classTrait',
	#instVars : [
		'alpha',
		'transformation',
		'area',
		'mask',
		'shouldCopy',
		'isOpaque'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #accessing }
SpartaLayerBuilder >> alpha: aNumber [
	"Opacity of the layer. Default is 1.0"

	alpha := aNumber
]

{ #category : #accessing }
SpartaLayerBuilder >> area: aRectangle [
	"Optional bounds in device space to which the layer is limited in size"

	area := aRectangle
]

{ #category : #accessing }
SpartaLayerBuilder >> copy: aBoolean [
	"Whether to copy the background into the layer, this is only supported when opaque: is true.
	Default is false."

	shouldCopy := aBoolean
]

{ #category : #layer }
SpartaLayerBuilder >> during: aBlock [

	self push.
	aBlock ensure: [ self pop ]
]

{ #category : #accessing }
SpartaLayerBuilder >> mask: aMaskSurface [
	"Mask applied to the layer"
	
	mask := aMaskSurface surface
]

{ #category : #accessing }
SpartaLayerBuilder >> opaque: aBoolean [
	"Whether the layer will be opaque.
	Default is false"

	isOpaque := aBoolean
]

{ #category : #layer }
SpartaLayerBuilder >> pop [
	^ self subclassResponsibility
]

{ #category : #layer }
SpartaLayerBuilder >> push [
	^ self subclassResponsibility
]

{ #category : #'initialize-release' }
SpartaLayerBuilder >> reset [
	super reset.
	
	alpha := 1.0.
	transformation := SpartaMatrix new.
	area := nil.
	mask := nil.
	shouldCopy := false.
	isOpaque := false
]

{ #category : #accessing }
SpartaLayerBuilder >> transformation [
	"Transform applied to the layer mask"

	^ transformation
]

{ #category : #layer }
SpartaLayerBuilder >> when: aWhenBlock during: aBlock [
	"Create a new virtual layout only if when block evaluates to true"

	aWhenBlock value
		ifTrue: [ self during: aBlock ]
		ifFalse: [ aBlock value ]
]
