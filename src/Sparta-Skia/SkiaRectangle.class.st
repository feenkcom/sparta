Class {
	#name : #SkiaRectangle,
	#superclass : #SkiaExternalObject,
	#category : 'Sparta-Skia-External'
}

{ #category : #converting }
SkiaRectangle >> asRectangle [
	^ Rectangle left: self left right: self right top: self top bottom: self bottom
]

{ #category : #accessing }
SkiaRectangle >> bottom [
	^ self primGetBottom
]

{ #category : #accessing }
SkiaRectangle >> left [
	^ self primGetLeft
]

{ #category : #'private - ffi' }
SkiaRectangle >> primGetBottom [
	^ self subclassResponsibility
]

{ #category : #'private - ffi' }
SkiaRectangle >> primGetLeft [
	^ self subclassResponsibility
]

{ #category : #'private - ffi' }
SkiaRectangle >> primGetRight [
	^ self subclassResponsibility
]

{ #category : #'private - ffi' }
SkiaRectangle >> primGetTop [
	^ self subclassResponsibility
]

{ #category : #accessing }
SkiaRectangle >> right [
	^ self primGetRight
]

{ #category : #accessing }
SkiaRectangle >> top [
	^ self primGetTop
]
