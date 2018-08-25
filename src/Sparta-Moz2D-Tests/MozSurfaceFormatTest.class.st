Class {
	#name : #MozSurfaceFormatTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozSurfaceFormatTest >> enum [
	"This method was automatically generated"
	^ MozSurfaceFormat
]

{ #category : #tests }
MozSurfaceFormatTest >> testA8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum A8 item asString) value
		equals: self enum A8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testA8R8G8B8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum A8R8G8B8 item asString) value
		equals: self enum A8R8G8B8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testA8R8G8B8_UINT32 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum A8R8G8B8_UINT32 item asString) value
		equals: self enum A8R8G8B8_UINT32 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testB8G8R8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum B8G8R8 item asString) value
		equals: self enum B8G8R8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testB8G8R8A8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum B8G8R8A8 item asString) value
		equals: self enum B8G8R8A8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testB8G8R8X8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum B8G8R8X8 item asString) value
		equals: self enum B8G8R8X8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testDepth [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum Depth item asString) value
		equals: self enum Depth value
]

{ #category : #tests }
MozSurfaceFormatTest >> testHSV [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum HSV item asString) value
		equals: self enum HSV value
]

{ #category : #tests }
MozSurfaceFormatTest >> testLab [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum Lab item asString) value
		equals: self enum Lab value
]

{ #category : #tests }
MozSurfaceFormatTest >> testNV12 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum NV12 item asString) value
		equals: self enum NV12 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testR5G6B5_UINT16 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum R5G6B5_UINT16 item asString) value
		equals: self enum R5G6B5_UINT16 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testR8G8B8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum R8G8B8 item asString) value
		equals: self enum R8G8B8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testR8G8B8A8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum R8G8B8A8 item asString) value
		equals: self enum R8G8B8A8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testR8G8B8X8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum R8G8B8X8 item asString) value
		equals: self enum R8G8B8X8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testUNKNOWN [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum UNKNOWN item asString) value
		equals: self enum UNKNOWN value
]

{ #category : #tests }
MozSurfaceFormatTest >> testX8R8G8B8 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum X8R8G8B8 item asString) value
		equals: self enum X8R8G8B8 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testX8R8G8B8_UINT32 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum X8R8G8B8_UINT32 item asString) value
		equals: self enum X8R8G8B8_UINT32 value
]

{ #category : #tests }
MozSurfaceFormatTest >> testYUV [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum YUV item asString) value
		equals: self enum YUV value
]

{ #category : #tests }
MozSurfaceFormatTest >> testYUV422 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum YUV422 item asString) value
		equals: self enum YUV422 value
]

{ #category : #'private - ffi' }
MozSurfaceFormatTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_SurfaceFormat(String aName, int* anAddress))
]
