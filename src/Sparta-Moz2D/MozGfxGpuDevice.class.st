Class {
	#name : #MozGfxGpuDevice,
	#superclass : #Object,
	#instVars : [
		'description',
		'deviceId',
		'vendorId'
	],
	#category : 'Sparta-Moz2D-GFX'
}

{ #category : #accessing }
MozGfxGpuDevice >> description [
	^ description
]

{ #category : #accessing }
MozGfxGpuDevice >> description: anObject [
	description := anObject
]

{ #category : #accessing }
MozGfxGpuDevice >> deviceId [
	^ deviceId
]

{ #category : #accessing }
MozGfxGpuDevice >> deviceId: anObject [
	deviceId := anObject
]

{ #category : #printing }
MozGfxGpuDevice >> printOn: aStream [
	aStream
		nextPutAll: self description;
		yourself
]

{ #category : #accessing }
MozGfxGpuDevice >> vendorId [
	^ vendorId
]

{ #category : #accessing }
MozGfxGpuDevice >> vendorId: anObject [
	vendorId := anObject
]
