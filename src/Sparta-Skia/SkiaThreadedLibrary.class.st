Class {
	#name : #SkiaThreadedLibrary,
	#superclass : #SkiaLibrary,
	#category : #'Sparta-Skia-Library'
}

{ #category : #'private - ffi' }
SkiaThreadedLibrary >> calloutAPIClass [
	^ ThreadedFFIMigration threadedFFIAvailable
		ifTrue: [ TFCalloutAPI ]
		ifFalse: [ super calloutAPIClass ]
]

{ #category : #'private - ffi' }
SkiaThreadedLibrary >> runner [
	^ ThreadedFFIMigration threadedFFIAvailable
		ifTrue: [ TFSameThreadRunner uniqueInstance ]
		ifFalse: [ super runner ]
]
