"
I represent a text foreground attribute.
I am used together with SpRope and SpText to style text.

Public API and Key Messages

- paint: set foreground paint

Example:

	SpTextForegroundAttribute paint: Color blue
 
Internal Representation and Key Implementation Points.

    Instance Variables
	paint:		<Object> can be a Color, Pattern, Gradient. Basically anything that implements TSpartaPaint or polymorphic with it
"
Class {
	#name : #SpTextForegroundAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'paint'
	],
	#category : 'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpTextForegroundAttribute class >> paint: aPaint [
	^ self new
		paint: aPaint;
		yourself
]

{ #category : #properties }
SpTextForegroundAttribute >> applyOnText: aTextPainter with: aSpan [
	aTextPainter paint: paint
]

{ #category : #accessing }
SpTextForegroundAttribute >> paint [
	^ paint
]

{ #category : #accessing }
SpTextForegroundAttribute >> paint: aPaint [
	self
		assert: [ paint isNil ]
		description: [ 'I am immutable and can not be modified' ].

	paint := aPaint
]
