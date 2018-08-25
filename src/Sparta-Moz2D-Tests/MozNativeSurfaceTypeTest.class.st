Class {
	#name : #MozNativeSurfaceTypeTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozNativeSurfaceTypeTest >> enum [
	"This method was automatically generated"
	^ MozNativeSurfaceType
]

{ #category : #tests }
MozNativeSurfaceTypeTest >> testCAIRO_CONTEXT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CAIRO_CONTEXT item asString) value
		equals: self enum CAIRO_CONTEXT value
]

{ #category : #tests }
MozNativeSurfaceTypeTest >> testCGCONTEXT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CGCONTEXT item asString) value
		equals: self enum CGCONTEXT value
]

{ #category : #tests }
MozNativeSurfaceTypeTest >> testCGCONTEXT_ACCELERATED [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CGCONTEXT_ACCELERATED item asString) value
		equals: self enum CGCONTEXT_ACCELERATED value
]

{ #category : #tests }
MozNativeSurfaceTypeTest >> testD3D10_TEXTURE [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum D3D10_TEXTURE item asString) value
		equals: self enum D3D10_TEXTURE value
]

{ #category : #tests }
MozNativeSurfaceTypeTest >> testOPENGL_TEXTURE [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OPENGL_TEXTURE item asString) value
		equals: self enum OPENGL_TEXTURE value
]

{ #category : #'private - ffi' }
MozNativeSurfaceTypeTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_NativeSurfaceType(String aName, int* anAddress))
]
