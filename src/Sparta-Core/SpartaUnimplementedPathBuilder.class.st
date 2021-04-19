Class {
	#name : #SpartaUnimplementedPathBuilder,
	#superclass : #Object,
	#traits : 'TSpartaPathBuilder',
	#classTraits : 'TSpartaPathBuilder classTrait',
	#category : #'Sparta-Core-Builders - Unimplemented'
}

{ #category : #'instance creation' }
SpartaUnimplementedPathBuilder class >> evenOdd: aSpartaCanvas [
	^ self new
]

{ #category : #'instance creation' }
SpartaUnimplementedPathBuilder class >> winding: aSpartaCanvas [
	^ self new
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> absolute [
	
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle [
]

{ #category : #private }
SpartaUnimplementedPathBuilder >> arcTo: aPoint angle: angle cw: aBool [
]

{ #category : #accessing }
SpartaUnimplementedPathBuilder >> canvas: aCanvas [
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> close [
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> currentPoint [
	"Point the current subpath is at - or where the next subpath will start
	if there is no active subpath."
	<return: #Point>

	^ 0@0
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> curveVia: aControlPoint and: anOtherControlPoint to: anEndPoint [
	
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> curveVia: aControlPoint to: anEndPoint [
	
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> finish [
	^ SpartaNullPath new
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> lineTo: aPoint [
	
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> moveTo: aPoint [
	
]

{ #category : #'path commands' }
SpartaUnimplementedPathBuilder >> relative [
	
]

{ #category : #'as yet unclassified' }
SpartaUnimplementedPathBuilder >> reset [
]
