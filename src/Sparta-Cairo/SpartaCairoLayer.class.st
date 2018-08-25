Class {
	#name : #SpartaCairoLayer,
	#superclass : #Object,
	#instVars : [
		'alpha',
		'mask',
		'subpixelAA'
	],
	#category : 'Sparta-Cairo-Utilities'
}

{ #category : #accessing }
SpartaCairoLayer >> alpha [
	^ alpha
]

{ #category : #accessing }
SpartaCairoLayer >> alpha: aNumber [
	alpha := aNumber
]

{ #category : #initialization }
SpartaCairoLayer >> initialize [
	super initialize.
	
	subpixelAA := false.
]

{ #category : #accessing }
SpartaCairoLayer >> mask [
	^ mask
]

{ #category : #accessing }
SpartaCairoLayer >> mask: anObject [
	mask := anObject
]

{ #category : #accessing }
SpartaCairoLayer >> subpixelAA [
	^ subpixelAA
]

{ #category : #accessing }
SpartaCairoLayer >> subpixelAA: anObject [
	subpixelAA := anObject
]
