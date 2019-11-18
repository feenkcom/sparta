Class {
	#name : #MozPath,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaPath + TMozLibrary + TSpartaInspectorPreview + TMozRefPtr + TMozDebug',
	#classTraits : 'TSpartaPath classTrait + TMozLibrary classTrait + TSpartaInspectorPreview classTrait + TMozRefPtr classTrait + TMozDebug classTrait',
	#instVars : [
		'boundsCache'
	],
	#pools : [
		'MozSharedPool'
	],
	#category : #'Sparta-Moz2D-Path'
}

{ #category : #comparing }
MozPath >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject getHandle asInteger = self getHandle asInteger
]

{ #category : #converting }
MozPath >> asForm [
	|canvas options bounds margin |
	margin := 10.
	options := MozStrokeOptions new.
	options width: 2.
	bounds := self strokedBounds: options.

	canvas := MozCanvas extent: (bounds extent + margin) asIntegerPoint.
	canvas transform
		translateBy: (bounds origin negated + (margin / 2.0));
		push.
	canvas stroke
		paint: Color black;
		path: self;
		strokeOptions: options;
	draw.

	^ canvas asForm
]

{ #category : #'api - sparta path' }
MozPath >> containsPoint: aPoint on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be filled"
	<return: #Boolean>

	^ self primContainsPointX: aPoint x Y: aPoint y
]

{ #category : #comparing }
MozPath >> hash [
	^ self class hash bitXor: self getHandle asInteger hash
]

{ #category : #initialization }
MozPath >> initialize [
	"we don't call super because it will reset external address"
	
	boundsCache := SpartaStrokedBoundsCache new
]

{ #category : #'private - ffi' }
MozPath >> primContainsPointX: aX Y: aY [

	^ self ffiCall: #(bool moz2d_path_contains_point(self, float aX, float aY))
]

{ #category : #'private - ffi' }
MozPath >> primStrokeBounds: aStrokeOptions rect: aRect [

	^ self ffiCall: #(void moz2d_path_get_stroked_bounds(self, MozStrokeOptions aStrokeOptions, MozNativeRect aRect))
]

{ #category : #'private - ffi' }
MozPath >> primStrokeContainsPointX: aX Y: aY options: aStrokeOptions [

	^ self ffiCall: #(bool moz2d_path_stroke_contains_point(self, float aX, float aY, MozStrokeOptions aStrokeOptions))
]

{ #category : #'api - sparta path' }
MozPath >> strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>

	^ self primStrokeContainsPointX: aPoint x Y: aPoint y options: aStrokeOptions
]

{ #category : #'geometry - accessing' }
MozPath >> strokedBounds: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>
	| extRect |

	extRect := MozNativeRect new.
	self primStrokeBounds: aStrokeOptions rect: extRect.
	^ extRect asRectangle
]

{ #category : #'api - sparta path' }
MozPath >> strokedBoundsOn: aSpartaCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>

	^ boundsCache
		strokedBounds: aStrokeOptions
		ifAbsentPut: [ self strokedBounds: aStrokeOptions ]
]
