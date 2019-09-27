Class {
	#name : #MozPaint,
	#superclass : #Object,
	#traits : 'TSpartaPaint + TSpartaTransformable + TSpartaInspectorPreview',
	#classTraits : 'TSpartaPaint classTrait + TSpartaTransformable classTrait + TSpartaInspectorPreview classTrait',
	#instVars : [
		'matrix',
		'extendMode'
	],
	#category : 'Sparta-Moz2D-Paints'
}

{ #category : #converting }
MozPaint >> asForm [
	| aCanvas |

	aCanvas := MozCanvas checker: self formExtent.
	aCanvas fill
		paint: self;
		path: aCanvas bounds;
		draw.

	^ aCanvas asForm
]

{ #category : #'extend modes' }
MozPaint >> clamp [
	"Do not repeat"
	self extendMode: MozExtendMode CLAMP
]

{ #category : #'extend modes' }
MozPaint >> extendMode [
	^ extendMode
]

{ #category : #'extend modes' }
MozPaint >> extendMode: anExtendMode [
	extendMode := anExtendMode
]

{ #category : #converting }
MozPaint >> formExtent [
	^ self subclassResponsibility
]

{ #category : #initialization }
MozPaint >> initialize [
	super initialize.
	
	matrix := SpartaMatrix new.
	self clamp
]

{ #category : #'extend modes' }
MozPaint >> reflect [
	"Mirror the image"
	self extendMode: MozExtendMode REFLECT
]

{ #category : #'extend modes' }
MozPaint >> repeat [
	"Repeat in both axis"
	self extendMode: MozExtendMode REPEAT
]

{ #category : #'extend modes' }
MozPaint >> repeatX [
	"Only X axis"
	self extendMode: MozExtendMode REPEAT_X
]

{ #category : #'extend modes' }
MozPaint >> repeatY [
	"Only Y axis"
	self extendMode: MozExtendMode REPEAT_Y
]

{ #category : #accessing }
MozPaint >> transformation [
	^ matrix
]

{ #category : #accessing }
MozPaint >> transformation: aMatrix [
	matrix := aMatrix
]
