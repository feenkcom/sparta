"
I represent a text background attribute.
I am used together with SpRope and SpText to style text.

Public API and Key Messages

- paint: set background paint

Example:

	SpTextBackgroundAttribute paint: Color yellow
 
Internal Representation and Key Implementation Points.

    Instance Variables
	paint:		<Object> can be a Color, Pattern, Gradient. Basically anything that implements TSpartaPaint or polymorphic with it
"
Class {
	#name : #SpTextBackgroundAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'paint'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpTextBackgroundAttribute class >> paint: aPaint [
	^ self new
		paint: aPaint;
		yourself
]

{ #category : #drawing }
SpTextBackgroundAttribute >> drawBelowOn: aCanvas with: aSpan [
	"I render background under text span"

	aCanvas fill
		paint: paint;
		path: (aSpan origin extent: aSpan extent);
		draw
]

{ #category : #accessing }
SpTextBackgroundAttribute >> paint: aPaint [
	self
		assert: [ paint isNil ]
		description: [ 'I am immutable and can not be modified' ].

	paint := aPaint
]
