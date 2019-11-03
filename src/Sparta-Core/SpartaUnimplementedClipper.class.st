Class {
	#name : #SpartaUnimplementedClipper,
	#superclass : #SpartaClipper,
	#category : #'Sparta-Core-Builders - Unimplemented'
}

{ #category : #testing }
SpartaUnimplementedClipper >> containsGlobal: aRectangle [
	^ true
]

{ #category : #testing }
SpartaUnimplementedClipper >> containsLocal: aRectangle [
	^ true
]

{ #category : #geometry }
SpartaUnimplementedClipper >> globalBounds [
	<return: #SpartaRectangle>
	
	^ canvas bounds
]

{ #category : #geometry }
SpartaUnimplementedClipper >> localBounds [
	<return: #Rectangle>

	^ canvas transform inverted transformRectangle: (SpartaRectangle fromRectangle: canvas bounds)
]

{ #category : #'private - clipping' }
SpartaUnimplementedClipper >> pop [
	"I pop the previously pushed clip area.
	I am a part of the internal API and should not be used directly"
]

{ #category : #'private - clipping' }
SpartaUnimplementedClipper >> pushPath: aSpartaPath [
]

{ #category : #'private - clipping' }
SpartaUnimplementedClipper >> pushRectangle: aRectangle [
	
]
