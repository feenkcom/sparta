Class {
	#name : #SpartaCairoPath,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaPath + TSpartaCairoLibrary + TSpartaInspectorPreview + TSpartaCairoPlainPtr + TSpartaCairoDebug',
	#classTraits : 'TSpartaPath classTrait + TSpartaCairoLibrary classTrait + TSpartaInspectorPreview classTrait + TSpartaCairoPlainPtr classTrait + TSpartaCairoDebug classTrait',
	#instVars : [
		'fillRule'
	],
	#category : #'Sparta-Cairo-Path'
}

{ #category : #finalization }
SpartaCairoPath class >> primRelease: aHandle [

	"Plain pointers must be deleted using specific destroy*() methods, all users must implement a specific method"
	^ self ffiCall: #(void cairo_path_destroy ( void* aHandle ) )
]

{ #category : #'api - sparta path' }
SpartaCairoPath >> containsPoint: aPoint on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be filled"
	<return: #Boolean>

	^ self primInFillX: aPoint x Y: aPoint y on: aSpartaCanvas
]

{ #category : #accessing }
SpartaCairoPath >> fillRule [
	^ fillRule
]

{ #category : #accessing }
SpartaCairoPath >> fillRule: anObject [
	fillRule := anObject
]

{ #category : #'private - ffi' }
SpartaCairoPath >> primAppendPath: aCairoPath on: aSpartaCairoCanvas [

	^ self ffiCall: #(void cairo_append_path (
			SpartaCairoCanvas aSpartaCairoCanvas,
         SpartaCairoPath aCairoPath) )
]

{ #category : #'private - ffi' }
SpartaCairoPath >> primInFillX: aX Y: aY on: aSpartaCairoCanvas [
	^ self ffiCall: #(bool cairo_in_fill (
		SpartaCairoCanvas aSpartaCairoCanvas,
		double aX,
		double aY))
]

{ #category : #'private - ffi' }
SpartaCairoPath >> primInStrokeX: aX Y: aY on: aSpartaCairoCanvas [
	^ self ffiCall: #(bool cairo_in_stroke (
		SpartaCairoCanvas aSpartaCairoCanvas,
		double aX,
		double aY))
]

{ #category : #'private - ffi' }
SpartaCairoPath >> primNewPathOn: aCanvas [

	^ self ffiCall: #(void cairo_new_path ( SpartaCairoCanvas aCanvas ) )
]

{ #category : #'private - ffi' }
SpartaCairoPath >> primSetFillRule: aCairoFillRule on: aSpartaCairoCanvas [

	^ self ffiCall: #( void cairo_set_fill_rule (
		SpartaCairoCanvas aSpartaCairoCanvas,
      SpartaCairoFillRule aCairoFillRule ) )
]

{ #category : #'private - ffi' }
SpartaCairoPath >> primStrokeExtent: aCanvas originX: originX originY: originY cornerX: aCornerX cornerY: aCornerY [

	self ffiCall: #(void cairo_stroke_extents (
		SpartaCairoCanvas aCanvas,
		double *originX,
		double *originY,
		double *aCornerX,
		double *aCornerY))
]

{ #category : #dispatch }
SpartaCairoPath >> setOnCanvas: aSpartaCairoCanvas [
	self
		primSetFillRule: self fillRule on: aSpartaCairoCanvas;
		primNewPathOn: aSpartaCairoCanvas;
		primAppendPath: self on: aSpartaCairoCanvas.
]

{ #category : #'api - sparta path' }
SpartaCairoPath >> strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCairoCanvas [
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>
	| strokePainter containtsPoint |
	
	strokePainter := aSpartaCairoCanvas stroke.
	strokePainter strokeOptions: aStrokeOptions.
	
	containtsPoint := false.
	
	[

	strokePainter applyStrokeOptions.
	self setOnCanvas: aSpartaCairoCanvas.

	containtsPoint := self
		primInStrokeX: aPoint x
		Y: aPoint y
		on: aSpartaCairoCanvas.
	
	] ensure: [
		strokePainter primNewPath.
		strokePainter restoreStrokeOptions ].
	
	^ containtsPoint
]

{ #category : #geometry }
SpartaCairoPath >> strokedBounds: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>
	| canvas strokePainter bounds |
	
	canvas := SpartaCairoOffscreenCanvas uniqueInstance.
	strokePainter := canvas stroke.
	strokePainter strokeOptions: aStrokeOptions.

	bounds := (0@0 extent: 0@0).
	
	[ | originX originY cornerX cornerY |

	strokePainter applyStrokeOptions.
	originX := FFIExternalArray externalNewType: 'double' size: 1.
	originY := FFIExternalArray externalNewType: 'double' size: 1.
	cornerX := FFIExternalArray externalNewType: 'double' size: 1.
	cornerY := FFIExternalArray externalNewType: 'double' size: 1.
	
	strokePainter
		primNewPath;
		primAppendPath: self.
	
	self
		primStrokeExtent: canvas
		originX: originX getHandle
		originY: originY getHandle
		cornerX: cornerX getHandle
		cornerY: cornerY getHandle.

	bounds := (originX at: 1)@(originY at: 1) corner: (cornerX at: 1)@(cornerY at: 1).
	
	originX free.
	originY free.
	cornerX free.
	cornerY free.
	
	] ensure: [
		strokePainter primNewPath.
		strokePainter restoreStrokeOptions ].
	
	^ bounds
]

{ #category : #'api - sparta path' }
SpartaCairoPath >> strokedBoundsOn: aSpartaCairoCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>
	| strokePainter bounds |
	
	strokePainter := aSpartaCairoCanvas stroke.
	strokePainter strokeOptions: aStrokeOptions.

	bounds := (0@0 extent: 0@0).
	
	[ | originX originY cornerX cornerY |

	strokePainter applyStrokeOptions.
	originX := FFIExternalArray externalNewType: 'double' size: 1.
	originY := FFIExternalArray externalNewType: 'double' size: 1.
	cornerX := FFIExternalArray externalNewType: 'double' size: 1.
	cornerY := FFIExternalArray externalNewType: 'double' size: 1.
	
	self setOnCanvas: aSpartaCairoCanvas.
	
	self
		primStrokeExtent: aSpartaCairoCanvas
		originX: originX getHandle
		originY: originY getHandle
		cornerX: cornerX getHandle
		cornerY: cornerY getHandle.

	bounds := (originX at: 1)@(originY at: 1) corner: (cornerX at: 1)@(cornerY at: 1).
	
	originX free.
	originY free.
	cornerX free.
	cornerY free.
	
	] ensure: [
		strokePainter primNewPath.
		strokePainter restoreStrokeOptions ].
	
	^ bounds
]
