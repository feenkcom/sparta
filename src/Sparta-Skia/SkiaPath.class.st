Class {
	#name : #SkiaPath,
	#superclass : #SkiaExternalObject,
	#traits : 'TSpartaPath',
	#classTraits : 'TSpartaPath classTrait',
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

{ #category : #'api - path' }
SkiaPath >> arcBy: aRectangle start: aStartAngle sweep: aSweepAngle forceMove: isForceMoveTo [
	self
		primArcToLeft: aRectangle left
		top: aRectangle top
		right: aRectangle right
		bottom: aRectangle bottom
		start: aStartAngle
		sweep: aSweepAngle
		forceMove: isForceMoveTo
		absolute: false
]

{ #category : #'api - path' }
SkiaPath >> arcTo: aRectangle start: aStartAngle sweep: aSweepAngle forceMove: isForceMoveTo [
	self
		primArcToLeft: aRectangle left
		top: aRectangle top
		right: aRectangle right
		bottom: aRectangle bottom
		start: aStartAngle
		sweep: aSweepAngle
		forceMove: isForceMoveTo
		absolute: true
]

{ #category : #'api - path' }
SkiaPath >> arcTo: aRectangle start: aStartAngle sweep: aSweepAngle forceMove: isForceMoveTo absolute: isAbsolute [
	self
		primArcToLeft: aRectangle left
		top: aRectangle top
		right: aRectangle right
		bottom: aRectangle bottom
		start: aStartAngle
		sweep: aSweepAngle
		forceMove: isForceMoveTo
		absolute: isAbsolute
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
SkiaPath >> cibucBy: aPoint via: aViaPoint and: anOtherViaPoint [
	self
		primCubicToX: aPoint x
		Y: aPoint y
		viaX: aViaPoint x
		Y: aViaPoint y
		andX: anOtherViaPoint x
		Y: anOtherViaPoint y
		absolute: false
]

{ #category : #'api - path' }
SkiaPath >> close [
	self primClose
]

{ #category : #'api - sparta path' }
SkiaPath >> containsPoint: aPoint on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be filled"
	<return: #Boolean>

	^ false
]

{ #category : #'api - path' }
SkiaPath >> cubicBy: aPoint via: aViaPoint and: anOtherViaPoint [
	self
		primCubicToX: aPoint x
		Y: aPoint y
		viaX: aViaPoint x
		Y: aViaPoint y
		andX: anOtherViaPoint x
		Y: anOtherViaPoint y
		absolute: false
]

{ #category : #'api - path' }
SkiaPath >> cubicTo: aPoint via: aViaPoint and: anOtherViaPoint [
	self
		primCubicToX: aPoint x
		Y: aPoint y
		viaX: aViaPoint x
		Y: aViaPoint y
		andX: anOtherViaPoint x
		Y: anOtherViaPoint y
		absolute: true
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

{ #category : #testing }
SkiaPath >> hasLastPoint [
	<return: #Boolean>
	| aBoxerPoint |
	
	aBoxerPoint := GtBoxerPointF32 new.
	^ [ self primGetLastPoint: aBoxerPoint ]
		ensure: [ aBoxerPoint release ]
]

{ #category : #accessing }
SkiaPath >> lastPointDo: aBlock [
	"Evaluate a given block with the last point of this path (if there is any) as an argument"
	| aBoxerPoint hasLastPoint aLastPoint |
	
	aBoxerPoint := GtBoxerPointF32 new.
	hasLastPoint := self primGetLastPoint: aBoxerPoint.
	aLastPoint := [ aBoxerPoint asPoint ] ensure: [ aBoxerPoint release ].
	hasLastPoint
		ifTrue: [ aBlock value: aLastPoint ]
]

{ #category : #'api - path' }
SkiaPath >> lineBy: aPoint [
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
SkiaPath >> primArcToLeft: aLeft top: aTop right: aRight bottom: aBottom start: aStartAngle sweep: aSweepAngle forceMove: isForceMoveTo absolute: isAbsolute [
	^ self ffiCall: #(void skia_path_arc_to(self,
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		scalar aStartAngle, scalar aSweepAngle,
		bool isForceMoveTo, bool isAbsolute))
]

{ #category : #'private - ffi' }
SkiaPath >> primClose [
	^ self ffiCall: #(size_t skia_path_close(self))
]

{ #category : #'private - ffi' }
SkiaPath >> primCubicToX: aX Y: aY viaX: aViaX Y: aViaY andX: anOtherViaX Y: anOtherViaY absolute: isAbsolute [
	^ self ffiCall: #(void skia_path_cubic_to(self,
		scalar aViaX, scalar aViaY,
		scalar anOtherViaX, scalar anOtherViaY,
		scalar aX, scalar aY,
		bool isAbsolute))
]

{ #category : #'private - ffi' }
SkiaPath >> primGetFillType [
	^ self ffiCall: #(SkiaPathFillType skia_path_get_fill_type(self))
]

{ #category : #'private - ffi' }
SkiaPath >> primGetLastPoint: aGtBoxerPoint [
	^ self ffiCall: #(bool skia_path_get_last_point(self, GtBoxerPointF32 aGtBoxerPoint))
]

{ #category : #'private - ffi' }
SkiaPath >> primGetPoints: aBoxerArrayPointF32 [
	^ self ffiCall: #(size_t skia_path_get_points(self, GtBoxerArrayPointF32 aBoxerArrayPointF32))
]

{ #category : #'private - ffi' }
SkiaPath >> primLineToX: aX Y: aY absolute: isAbsolute [
	^ self ffiCall: #(void skia_path_line_to(self, scalar aX, scalar aY, bool isAbsolute))
]

{ #category : #'private - ffi' }
SkiaPath >> primMoveToX: aX Y: aY absolute: isAbsolute [
	^ self ffiCall: #(void skia_path_move_to(self, scalar aX, scalar aY, bool isAbsolute))
]

{ #category : #'private - ffi' }
SkiaPath >> primPointsCount [
	^ self ffiCall: #(size_t skia_path_count_points(self))
]

{ #category : #'private - ffi' }
SkiaPath >> primQuadToX: aX Y: aY viaX: aViaX Y: aViaY absolute: isAbsolute [
	^ self ffiCall: #(void skia_path_quad_to(self,
		scalar aViaX, scalar aViaY,
		scalar aX, scalar aY,
		bool isAbsolute))
]

{ #category : #'private - ffi' }
SkiaPath >> primSerialize: aBoxerArrayU8 [
	^ self ffiCall: #(void skia_path_serialize(self, GtBoxerArrayU8 aBoxerArrayU8))
]

{ #category : #'private - ffi' }
SkiaPath >> primSetFillType: aSkiaPathFillType [
	^ self ffiCall: #(void skia_path_set_fill_type(self, SkiaPathFillType aSkiaPathFillType))
]

{ #category : #'api - path' }
SkiaPath >> quadBy: aPoint via: aViaPoint [
	self
		primQuadToX: aPoint x
		Y: aPoint y
		viaX: aViaPoint x
		Y: aViaPoint y
		absolute: false
]

{ #category : #'api - path' }
SkiaPath >> quadTo: aPoint via: aViaPoint [
	self
		primQuadToX: aPoint x
		Y: aPoint y
		viaX: aViaPoint x
		Y: aViaPoint y
		absolute: true
]

{ #category : #'api - sparta path' }
SkiaPath >> strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>

	^ false
]

{ #category : #'api - sparta path' }
SkiaPath >> strokedBoundsOn: aSpartaCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>

	^ (0@0 extent: 0@0)
]
