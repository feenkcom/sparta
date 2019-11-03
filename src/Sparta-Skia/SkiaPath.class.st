Class {
	#name : #SkiaPath,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaPath class >> primCreate [
	^ self ffiCall: #(void* skia_path_new())
]

{ #category : #'private - ffi' }
SkiaPath class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_path_drop(void* aHandle))
]

{ #category : #accessing }
SkiaPath >> asByteArray [
	"Serialzie this path as a byte array"
	<return: #ByteArray>
	| aBoxerArray |
	
	aBoxerArray := GtBoxerArrayU8 new.
	self primSerialize: aBoxerArray.
	^ aBoxerArray asByteArray
]

{ #category : #'api - path' }
SkiaPath >> close [
	self primClose
]

{ #category : #'api - path' }
SkiaPath >> fillType [
	<return: #SkiaPathFillType>
	
	^ self primGetFillType
]

{ #category : #'api - path' }
SkiaPath >> fillType: aSkiaPathFillType [
	self primSetFillType: aSkiaPathFillType
]

{ #category : #'gt-extension' }
SkiaPath >> gtPointsFor: aView [
	<gtView>

	^ aView list
		title: 'Points';
		priority: 2;
		items: [ self points ]
]

{ #category : #'api - path' }
SkiaPath >> linBy: aPoint [
	self primLineToX: aPoint x Y: aPoint y absolute: false
]

{ #category : #'api - path' }
SkiaPath >> lineTo: aPoint [
	self primLineToX: aPoint x Y: aPoint y absolute: true
]

{ #category : #'api - path' }
SkiaPath >> moveBy: aPoint [
	self primMoveToX: aPoint x Y: aPoint y absolute: false
]

{ #category : #'api - path' }
SkiaPath >> moveTo: aPoint [
	self primMoveToX: aPoint x Y: aPoint y absolute: true
]

{ #category : #accessing }
SkiaPath >> points [
	<return: #Collection of: #Point>
	| aBoxerArray |
	
	aBoxerArray := GtBoxerArrayPointF32 new: self pointsCount withAll: GtBoxerPointF32 new.
	self primGetPoints: aBoxerArray.
	^ aBoxerArray asPoints
]

{ #category : #accessing }
SkiaPath >> pointsCount [
	<return: #Number>
	
	^ self primPointsCount
]

{ #category : #'private - ffi' }
SkiaPath >> primClose [
	^ self ffiCall: #(size_t skia_path_close(self))
]

{ #category : #'private - ffi' }
SkiaPath >> primGetFillType [
	^ self ffiCall: #(SkiaPathFillType skia_path_get_fill_type(self))
]

{ #category : #'private - ffi' }
SkiaPath >> primGetPoints: aBoxerArrayPointF32 [
	^ self ffiCall: #(size_t skia_path_get_points(self, GtBoxerArrayPointF32 aBoxerArrayPointF32))
]

{ #category : #'private - ffi' }
SkiaPath >> primLineToX: aX Y: aY absolute: isAbsolute [
	self ffiCall: #(void skia_path_line_to(self, scalar aX, scalar aY, bool isAbsolute))
]

{ #category : #'private - ffi' }
SkiaPath >> primMoveToX: aX Y: aY absolute: isAbsolute [
	self ffiCall: #(void skia_path_move_to(self, scalar aX, scalar aY, bool isAbsolute))
]

{ #category : #'private - ffi' }
SkiaPath >> primPointsCount [
	^ self ffiCall: #(size_t skia_path_count_points(self))
]

{ #category : #'private - ffi' }
SkiaPath >> primSerialize: aBoxerArrayU8 [
	^ self ffiCall: #(void skia_path_serialize(self, GtBoxerArrayU8 aBoxerArrayU8))
]

{ #category : #'private - ffi' }
SkiaPath >> primSetFillType: aSkiaPathFillType [
	^ self ffiCall: #(void skia_path_set_fill_type(self, SkiaPathFillType aSkiaPathFillType))
]
