"
Possible 3D APIs that may be used by Skia
"
Class {
	#name : #MozSkiaBackend,
	#superclass : #MozEnum,
	#classVars : [
		'kOpenGL_GrBackend',
		'kVulkan_GrBackend'
	],
	#category : #'Sparta-Moz2D-Skia'
}

{ #category : #'enum declaration' }
MozSkiaBackend class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		kOpenGL_GrBackend 0
    	kVulkan_GrBackend 1
	)
]

{ #category : #accessing }
MozSkiaBackend class >> externalEnum [
	^ #GrBackend
]

{ #category : #accessing }
MozSkiaBackend class >> externalType [
	^ FFIUInt32 new
]

{ #category : #initialization }
MozSkiaBackend class >> initialize [
	super initialize
]

{ #category : #'accessing enum' }
MozSkiaBackend class >> kOpenGL_GrBackend [
	"This method was automatically generated"
	^ kOpenGL_GrBackend
]

{ #category : #'accessing enum' }
MozSkiaBackend class >> kVulkan_GrBackend [
	"This method was automatically generated"
	^ kVulkan_GrBackend
]
