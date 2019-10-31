Class {
	#name : #MozGfxFeatureType,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'D3D11_COMPOSITING',
		'D3D11_HW_ANGLE',
		'D3D9_COMPOSITING',
		'DIRECT2D',
		'GPU_PROCESS',
		'HW_COMPOSITING',
		'OPENGL_COMPOSITING'
	],
	#category : 'Sparta-Moz2D-GFX'
}

{ #category : #'accessing enum' }
MozGfxFeatureType class >> D3D11_COMPOSITING [
	"This method was automatically generated"
	^ D3D11_COMPOSITING
]

{ #category : #'accessing enum' }
MozGfxFeatureType class >> D3D11_HW_ANGLE [
	"This method was automatically generated"
	^ D3D11_HW_ANGLE
]

{ #category : #'accessing enum' }
MozGfxFeatureType class >> D3D9_COMPOSITING [
	"This method was automatically generated"
	^ D3D9_COMPOSITING
]

{ #category : #'accessing enum' }
MozGfxFeatureType class >> DIRECT2D [
	"This method was automatically generated"
	^ DIRECT2D
]

{ #category : #'accessing enum' }
MozGfxFeatureType class >> GPU_PROCESS [
	"This method was automatically generated"
	^ GPU_PROCESS
]

{ #category : #'accessing enum' }
MozGfxFeatureType class >> HW_COMPOSITING [
	"This method was automatically generated"
	^ HW_COMPOSITING
]

{ #category : #'accessing enum' }
MozGfxFeatureType class >> OPENGL_COMPOSITING [
	"This method was automatically generated"
	^ OPENGL_COMPOSITING
]

{ #category : #'enum declaration' }
MozGfxFeatureType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		HW_COMPOSITING 0
		D3D11_COMPOSITING 1
		D3D9_COMPOSITING 2
		OPENGL_COMPOSITING 3
		DIRECT2D 4
		D3D11_HW_ANGLE 5
		GPU_PROCESS 6)
]

{ #category : #'class initialization' }
MozGfxFeatureType class >> initialize [
	self initializeEnumeration
]
