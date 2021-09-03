Class {
	#name : 'SkiaBinaryCommandType',
	#superclass : 'SkiaExternalEnumeration',
	#classVars : [
		'A',
		'Close',
		'FillRectangle',
		'GetPath',
		'LineTo',
		'MoveTo',
		'NewPaint',
		'NewPath',
		'PaintSetRgba',
		'PopPaint'
	],
	#category : 'Sparta-Skia-Binary'
}

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> Close [
	"This method was automatically generated"
	^ Close
]

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> FillRectangle [
	"This method was automatically generated"
	^ FillRectangle
]

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> GetPath [
	"This method was automatically generated"
	^ GetPath
]

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> LineTo [
	"This method was automatically generated"
	^ LineTo
]

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> MoveTo [
	"This method was automatically generated"
	^ MoveTo
]

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> NewPaint [
	"This method was automatically generated"
	^ NewPaint
]

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> NewPath [
	"This method was automatically generated"
	^ NewPath
]

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> PaintSetRgba [
	"This method was automatically generated"
	^ PaintSetRgba
]

{ #category : 'accessing enum' }
SkiaBinaryCommandType class >> PopPaint [
	"This method was automatically generated"
	^ PopPaint
]

{ #category : 'enum declaration' }
SkiaBinaryCommandType class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
	NewPath,
    GetPath,
    MoveTo,
    LineTo,
    Close,

    NewPaint,
    PopPaint,
    PaintSetRgba,

    FillRectangle,)
]

{ #category : 'accessing' }
SkiaBinaryCommandType class >> externalType [
	^ FFIUInt8
]

{ #category : 'class initialization' }
SkiaBinaryCommandType class >> initialize [
	super initialize.
]
