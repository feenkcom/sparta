Class {
	#name : #SkiaBinaryStream,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : 'Sparta-Skia-Binary'
}

{ #category : #'api - objects' }
SkiaBinaryStream >> color: aColor [
	| aRed aGreen aBlue anAlpha |

	aRed := (aColor red * 255) asInteger.
	aGreen := (aColor green * 255) asInteger.
	aBlue := (aColor blue * 255) asInteger.
	anAlpha := (aColor alpha * 255) asInteger.
	
	self
		u8: aRed;
		u8: aGreen;
		u8: aBlue;
		u8: anAlpha
]

{ #category : #accessing }
SkiaBinaryStream >> content [
	^ stream originalContents
]

{ #category : #accessing }
SkiaBinaryStream >> contents [
	^ stream originalContents
]

{ #category : #'api - stream' }
SkiaBinaryStream >> f32: aFloat [
	stream nextPutAll: ((ByteArray new: FFIFloat32 externalTypeSize)
		floatAt: 1 put: aFloat;
		yourself)
]

{ #category : #'api - commands' }
SkiaBinaryStream >> fillRectangle: aRectangle [
	self
		type: SkiaBinaryCommandType FillRectangle;
		rectangle: aRectangle
]

{ #category : #initialization }
SkiaBinaryStream >> initialize [
	super initialize.
	
	stream := WriteStream on: (ByteArray streamSpecies new: 1024)
]

{ #category : #'api - commands' }
SkiaBinaryStream >> newPaint [
	self type: SkiaBinaryCommandType NewPaint
]

{ #category : #'api - commands' }
SkiaBinaryStream >> paintSetColor: aColor [
	self
		type: SkiaBinaryCommandType PaintSetRgba;
		color: aColor
]

{ #category : #'api - commands' }
SkiaBinaryStream >> popPaint [
	self type: SkiaBinaryCommandType PopPaint
]

{ #category : #'api - objects' }
SkiaBinaryStream >> rectangle: aRectangle [
	self
		f32: aRectangle left asFloat;
		f32: aRectangle top asFloat;
		f32: aRectangle right asFloat;
		f32: aRectangle bottom asFloat
]

{ #category : #'api - stream' }
SkiaBinaryStream >> resetToStart [
	stream resetToStart
]

{ #category : #accessing }
SkiaBinaryStream >> shrinkedContents [
	^ stream contents
]

{ #category : #accessing }
SkiaBinaryStream >> size [
	^ stream position
]

{ #category : #'api - objects' }
SkiaBinaryStream >> type: aSkiaBinaryCommandType [
	self u8: aSkiaBinaryCommandType value
]

{ #category : #'api - stream' }
SkiaBinaryStream >> u16: anInteger [
	stream uint16: anInteger
]

{ #category : #'api - stream' }
SkiaBinaryStream >> u8: anInteger [
	stream nextPut: anInteger
]

{ #category : #'api - stream' }
SkiaBinaryStream >> uint16: anInteger [
	stream uint16: anInteger
]
