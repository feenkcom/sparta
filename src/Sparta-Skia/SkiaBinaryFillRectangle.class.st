Class {
	#name : #SkiaBinaryFillRectangle,
	#superclass : #SkiaBinaryCommand,
	#instVars : [
		'rectangle'
	],
	#category : #'Sparta-Skia-Binary'
}

{ #category : #accessing }
SkiaBinaryFillRectangle >> rectangle [
	^ rectangle
]

{ #category : #accessing }
SkiaBinaryFillRectangle >> rectangle: anObject [
	rectangle := anObject
]

{ #category : #running }
SkiaBinaryFillRectangle >> streamOn: aBinaryStream [
	super streamOn: aBinaryStream.
	
	aBinaryStream rectangle: rectangle
]

{ #category : #generated }
SkiaBinaryFillRectangle >> type [
	^ SkiaBinaryCommandType FillRectangle
]
