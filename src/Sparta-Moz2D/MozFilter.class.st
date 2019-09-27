"
I represent a filter primitive in terms of Filter Effects.

A filter effect consists of a series of graphics operations that are applied to a given source graphic to produce a modified graphical result. The result of the filter effect is rendered to the target device instead of the original source graphic.
"
Class {
	#name : #MozFilter,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaFilter + TMozLibrary + TMozRefPtr + TMozDebug',
	#classTraits : 'TSpartaFilter classTrait + TMozLibrary classTrait + TMozRefPtr classTrait + TMozDebug classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #'instance creation' }
MozFilter class >> createOn: aMozCanvas [
	^ self fromHandle: (self primCreateFilter: self filterType canvas: aMozCanvas)
]

{ #category : #accessing }
MozFilter class >> filterType [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
MozFilter class >> fromHandle: aHandle [
	^ (self basicNew setHandle: aHandle)
		initialize
]

{ #category : #'private - ffi' }
MozFilter class >> primCreateFilter: aFilterType canvas: aMozCanvas [
	^ self ffiCall: #(void* moz2d_filter_node_create(MozCanvas aMozCanvas, MozFilterType aFilterType))
]

{ #category : #initialization }
MozFilter >> initialize [

	self autoRelease
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeA11: a11 a12: a12 a21: a21 a22: a22 a31: a31 a32: a32 index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_matrix (
		self,
		FFIExternalEnumeration anIndex,
		float a11,
		float a12,
		float a21,
		float a22,
		float a31,
		float a32 ) )
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeBool: aBoolean index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_bool(self, FFIExternalEnumeration anIndex, bool aBoolean))
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeEnum: anEnumValue index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_int(self, FFIExternalEnumeration anIndex, FFIExternalEnumeration anEnumValue))
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeFloat: aFloat index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_float(self, FFIExternalEnumeration anIndex, float aFloat))
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeFloatArray: anArray length: aSize index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_float_array (
		self,
		FFIExternalEnumeration anIndex,
		float* anArray,
		int32 aSize))
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeInt: anInteger index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_int(self, FFIExternalEnumeration anIndex, uint32 anInteger))
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeIntRectX: aX y: aY width: aWidth height: aHeight index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_int_rect (
		self,
		FFIExternalEnumeration anIndex,
		int32 aX,
		int32 aY,
		int32 aWidth,
		int32 aHeight ) )
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeIntSizeWidth: aWidth height: aHeight index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_int_size (
		self,
		FFIExternalEnumeration anIndex,
		int32 aWidth,
		int32 aHeight))
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeMatrix5x4: anArray index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_matrix5x4 (
		self,
		FFIExternalEnumeration anIndex,
		float* anArray))
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeR: r g: g b: b a: a index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_color (
		self,
		FFIExternalEnumeration anIndex,
		float r,
		float g,
		float b,
		float a ) )
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeSizeWidth: aWidth height: aHeight index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_size (
		self,
		FFIExternalEnumeration anIndex,
		float aWidth,
		float aHeight))
]

{ #category : #'private - ffi' }
MozFilter >> primSetAttributeX: x y: y z: z index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_point_3d (
		self,
		FFIExternalEnumeration anIndex,
		float x,
		float y,
		float z ) )
]

{ #category : #'private - ffi' }
MozFilter >> primSetInputCanvas: aSpartaCanvas index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_input_draw_target ( self, FFIExternalEnumeration anIndex, MozCanvas aSpartaCanvas ) )
]

{ #category : #'private - ffi' }
MozFilter >> primSetInputCanvas: aSpartaCanvas intIndex: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_input_draw_target ( self, int32 anIndex, MozCanvas aSpartaCanvas ) )
]

{ #category : #'private - ffi' }
MozFilter >> primSetInputFilter: aFilter index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_input_filter(self, FFIExternalEnumeration anIndex, MozFilter aFilter))
]

{ #category : #'private - ffi' }
MozFilter >> primSetInputFilter: aFilter intIndex: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_input_filter(self, int32 anIndex, MozFilter aFilter))
]

{ #category : #'private - ffi' }
MozFilter >> primSetInputSurface: aSurface index: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_input_surface ( self, FFIExternalEnumeration anIndex, MozSurface aSurface ) )
]

{ #category : #'private - ffi' }
MozFilter >> primSetInputSurface: aSurface intIndex: anIndex [

	^ self ffiCall: #(void moz2d_filter_node_set_input_surface ( self, int32 anIndex, MozSurface aSurface ) )
]

{ #category : #private }
MozFilter >> privateSetAttributeFloatArray: anArrayOrFloat index: anIndex [
	| array numbers |
	numbers := anArrayOrFloat isCollection
		ifTrue: [ anArrayOrFloat ]
		ifFalse: [ { anArrayOrFloat } ].

	array := (FFIExternalArray externalNewType: 'float' size: numbers size)
		fillFrom: numbers with: #yourself;
		yourself.

	"Filter copies array in std::vector, so we can free memory right after"
	self
		primSetAttributeFloatArray: array getHandle
		length: numbers size
		index: anIndex.
		
	array free
]

{ #category : #private }
MozFilter >> privateSetAttributeIntSize: aPointOrInteger index: anIndex [
	|point|
	point := aPointOrInteger asPoint asIntegerPoint.
	self
		primSetAttributeIntSizeWidth: point x
		height: point y
		index: anIndex
]

{ #category : #private }
MozFilter >> privateSetAttributeMatrix5x4: anArrayOrFlaot index: anIndex [
	| array numbers |
	
	numbers := anArrayOrFlaot isCollection
		ifTrue: [ anArrayOrFlaot ]
		ifFalse: [ Array new: 20 withAll: anArrayOrFlaot  ].
	
	self
		assert: [ numbers size = 20 ]
		description: [ 'Matrix 5x4 must contain 20 elements' ].

	array := (FFIExternalArray externalNewType: 'float' size: numbers size)
		fillFrom: numbers with: #yourself;
		yourself.

	"Filter copies array in std::vector, so we can free memory right after"
	self
		primSetAttributeMatrix5x4: array getHandle
		index: anIndex.

	array free
]

{ #category : #private }
MozFilter >> privateSetAttributeMatrix: aMatrix index: anIndex [
	self
		primSetAttributeA11: aMatrix sx
		a12: aMatrix shy
		a21: aMatrix shx
		a22: aMatrix sy
		a31: aMatrix x
		a32: aMatrix y
		index: anIndex
]

{ #category : #private }
MozFilter >> privateSetAttributeSize: aPointOrFloat index: anIndex [
	|point|
	point := aPointOrFloat asPoint asPoint.
	self
		primSetAttributeSizeWidth: point x
		height: point y
		index: anIndex
]
