Class {
	#name : #MozNativeSurfaceType,
	#superclass : #MozEnum,
	#classVars : [
		'CAIRO_CONTEXT',
		'CGCONTEXT',
		'CGCONTEXT_ACCELERATED',
		'D3D10_TEXTURE',
		'OPENGL_TEXTURE'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozNativeSurfaceType class >> CAIRO_CONTEXT [
	"This method was automatically generated"
	^ CAIRO_CONTEXT
]

{ #category : #'accessing enum' }
MozNativeSurfaceType class >> CGCONTEXT [
	"This method was automatically generated"
	^ CGCONTEXT
]

{ #category : #'accessing enum' }
MozNativeSurfaceType class >> CGCONTEXT_ACCELERATED [
	"This method was automatically generated"
	^ CGCONTEXT_ACCELERATED
]

{ #category : #'accessing enum' }
MozNativeSurfaceType class >> D3D10_TEXTURE [
	"This method was automatically generated"
	^ D3D10_TEXTURE
]

{ #category : #'accessing enum' }
MozNativeSurfaceType class >> OPENGL_TEXTURE [
	"This method was automatically generated"
	^ OPENGL_TEXTURE
]

{ #category : #'enum declaration' }
MozNativeSurfaceType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		D3D10_TEXTURE 0
		CAIRO_CONTEXT 1
		CGCONTEXT 2
		CGCONTEXT_ACCELERATED 3
		OPENGL_TEXTURE 4
	)
]

{ #category : #accessing }
MozNativeSurfaceType class >> externalEnum [
	^ #NativeSurfaceType
]

{ #category : #accessing }
MozNativeSurfaceType class >> externalType [
	^ FFIInt8 new
]

{ #category : #initialization }
MozNativeSurfaceType class >> initialize [
	super initialize
]
