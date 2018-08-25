Class {
	#name : #MozSurfaceTypeTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozSurfaceTypeTest >> enum [
	"This method was automatically generated"
	^ MozSurfaceType
]

{ #category : #tests }
MozSurfaceTypeTest >> testCAIRO [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CAIRO item asString) value
		equals: self enum CAIRO value
]

{ #category : #tests }
MozSurfaceTypeTest >> testCAIRO_IMAGE [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CAIRO_IMAGE item asString) value
		equals: self enum CAIRO_IMAGE value
]

{ #category : #tests }
MozSurfaceTypeTest >> testCOREGRAPHICS_CGCONTEXT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum COREGRAPHICS_CGCONTEXT item asString) value
		equals: self enum COREGRAPHICS_CGCONTEXT value
]

{ #category : #tests }
MozSurfaceTypeTest >> testCOREGRAPHICS_IMAGE [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum COREGRAPHICS_IMAGE item asString) value
		equals: self enum COREGRAPHICS_IMAGE value
]

{ #category : #tests }
MozSurfaceTypeTest >> testD2D1_1_IMAGE [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum D2D1_1_IMAGE item asString) value
		equals: self enum D2D1_1_IMAGE value
]

{ #category : #tests }
MozSurfaceTypeTest >> testD2D1_BITMAP [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum D2D1_BITMAP item asString) value
		equals: self enum D2D1_BITMAP value
]

{ #category : #tests }
MozSurfaceTypeTest >> testD2D1_DRAWTARGET [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum D2D1_DRAWTARGET item asString) value
		equals: self enum D2D1_DRAWTARGET value
]

{ #category : #tests }
MozSurfaceTypeTest >> testDATA [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum DATA item asString) value
		equals: self enum DATA value
]

{ #category : #tests }
MozSurfaceTypeTest >> testDUAL_DT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum DUAL_DT item asString) value
		equals: self enum DUAL_DT value
]

{ #category : #tests }
MozSurfaceTypeTest >> testRECORDING [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum RECORDING item asString) value
		equals: self enum RECORDING value
]

{ #category : #tests }
MozSurfaceTypeTest >> testSKIA [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SKIA item asString) value
		equals: self enum SKIA value
]

{ #category : #tests }
MozSurfaceTypeTest >> testTILED [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum TILED item asString) value
		equals: self enum TILED value
]

{ #category : #'private - ffi' }
MozSurfaceTypeTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_SurfaceType(String aName, int* anAddress))
]
