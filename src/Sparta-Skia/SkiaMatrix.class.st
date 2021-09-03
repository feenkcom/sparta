Class {
	#name : 'SkiaMatrix',
	#superclass : 'SkiaExternalObject',
	#category : 'Sparta-Skia-External'
}

{ #category : 'instance creation' }
SkiaMatrix class >> fromSpartaMatrix: aSpartaMatrix [
	^ self new
		setScaleX: aSpartaMatrix sx skewX: aSpartaMatrix shx transX: aSpartaMatrix x
		skewY: aSpartaMatrix shy scaleY: aSpartaMatrix sy transY: aSpartaMatrix y
		persp0: 0 persp1: 0 persp2: 1
]

{ #category : 'instance creation' }
SkiaMatrix class >> fromSpartaMatrix: aSpartaMatrix during: aBlock [
	^ self newDuring: [ :aSkiaMatrix |
		aSkiaMatrix
			setScaleX: aSpartaMatrix sx skewX: aSpartaMatrix shx transX: aSpartaMatrix x
			skewY: aSpartaMatrix shy scaleY: aSpartaMatrix sy transY: aSpartaMatrix y
			persp0: 0 persp1: 0 persp2: 1.
		aBlock value: aSkiaMatrix ]
]

{ #category : 'private - ffi' }
SkiaMatrix class >> primCreate [
	^ self ffiCall: #(void* skia_matrix_new_identity())
]

{ #category : 'private - ffi' }
SkiaMatrix class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_matrix_drop(void** aHandle))
]

{ #category : 'converting' }
SkiaMatrix >> asSpartaMatrix [
	<return: #SpartaMatrix>
	
	^ GtBoxerArrayF32 newDuring: [ :aBuffer |
		self primGetAll: aBuffer.
		aBuffer dataDuring: [ :anArray |
			SpartaMatrix new
				sx: (anArray at: 1);
				shx: (anArray at: 2);
				x: (anArray at: 3);
				shy: (anArray at: 4);
				sy: (anArray at: 5);
				y: (anArray at: 6) ] ]
]

{ #category : 'private - ffi' }
SkiaMatrix >> primGetAll: aBoxerArrayF32 [
	self ffiCall: #(void skia_matrix_get_all(self, GtBoxerArrayF32 aBoxerArrayF32))
]

{ #category : 'private - ffi' }
SkiaMatrix >> primSetScaleX: scaleX skewX: skewX transX: transX skewY: skewY scaleY: scaleY transY: transY perspX: perspX perspY: perspY persp: persp [

	self ffiCall: #(void skia_matrix_set_all (self,
		scalar scaleX, scalar skewX, scalar transX,
		scalar skewY, scalar scaleY, scalar transY,
		scalar perspX, scalar perspY, scalar persp))
]

{ #category : 'initialization' }
SkiaMatrix >> setScaleX: scaleX skewX: skewX transX: transX skewY: skewY scaleY: scaleY transY: transY persp0: persp0 persp1: persp1 persp2: persp2 [
	self
		primSetScaleX: scaleX skewX: skewX transX: transX
		skewY: skewY scaleY: scaleY transY: transY
		perspX: persp0 perspY: persp1 persp: persp2
]
