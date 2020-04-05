Class {
	#name : #SkiaBinaryPaintSetColor,
	#superclass : #SkiaBinaryCommand,
	#instVars : [
		'color'
	],
	#category : #'Sparta-Skia-Binary'
}

{ #category : #accessing }
SkiaBinaryPaintSetColor >> color [
	^ color
]

{ #category : #accessing }
SkiaBinaryPaintSetColor >> color: anObject [
	color := anObject
]

{ #category : #running }
SkiaBinaryPaintSetColor >> streamOn: aBinaryStream [
	super streamOn: aBinaryStream.

	aBinaryStream color: color
]

{ #category : #generated }
SkiaBinaryPaintSetColor >> type [
	^ SkiaBinaryCommandType PaintSetRgba
]
