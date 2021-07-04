Class {
	#name : #SkiaThreadedLibrary,
	#superclass : #SkiaLibrary,
	#category : #'Sparta-Skia-Library'
}

{ #category : #'private - ffi' }
SkiaThreadedLibrary >> calloutAPIClass [
	^ self class environment
		at: #ThreadedFFIMigration
		ifPresent: [ :aThreadedFFIMigration |
			aThreadedFFIMigration threadedFFIAvailable
				ifTrue: [ self class environment at: #TFCalloutAPI ]
				ifFalse: [ super calloutAPIClass ] ]
		ifAbsent: [ super calloutAPIClass ]
]

{ #category : #'private - ffi' }
SkiaThreadedLibrary >> runner [ 
	^ self class environment
		at: #ThreadedFFIMigration
		ifPresent: [ :aThreadedFFIMigration |
			aThreadedFFIMigration threadedFFIAvailable
				ifTrue: [ (self class environment at: #TFSameThreadRunner) uniqueInstance ]
				ifFalse: [ super runner ] ]
		ifAbsent: [ super runner ]
]
