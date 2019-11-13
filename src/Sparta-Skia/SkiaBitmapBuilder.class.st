Class {
	#name : #SkiaBitmapBuilder,
	#superclass : #SpartaBitmapBuilder,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #bitmap }
SkiaBitmapBuilder >> fromForm: aForm [
	"Create a bitmap surface from a given Form"
	<return: #TSpartaSurface>
	^ SkiaImage fromForm: aForm
]
