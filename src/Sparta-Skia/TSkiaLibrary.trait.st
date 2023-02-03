Trait {
	#name : #TSkiaLibrary,
	#category : #'Sparta-Skia-Library'
}

{ #category : #accessing }
TSkiaLibrary classSide >> ffiLibrary [
	^ SkiaLibrary uniqueInstance
]
