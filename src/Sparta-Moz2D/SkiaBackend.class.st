"
Possible 3D APIs that may be used by Skia
"
Class {
	#name : #SkiaBackend,
	#superclass : #MozEnum,
	#classVars : [
		'kOpenGL_GrBackend',
		'kVulkan_GrBackend'
	],
	#category : 'Sparta-Moz2D-Skia'
}

{ #category : #'enum declaration' }
SkiaBackend class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		kOpenGL_GrBackend 0
    	kVulkan_GrBackend 1
	)
]

{ #category : #accessing }
SkiaBackend class >> externalEnum [
	^ #GrBackend
]

{ #category : #accessing }
SkiaBackend class >> externalType [
	^ FFIUInt32 new
]

{ #category : #initialization }
SkiaBackend class >> initialize [
	super initialize
]

{ #category : #'accessing enum' }
SkiaBackend class >> kOpenGL_GrBackend [
	"This method was automatically generated"
	^ kOpenGL_GrBackend
]

{ #category : #'accessing enum' }
SkiaBackend class >> kVulkan_GrBackend [
	"This method was automatically generated"
	^ kVulkan_GrBackend
]
