Class {
	#name : #MozNativeTextMetrics,
	#superclass : #FFIExternalStructure,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#classVars : [
		'OFFSET_ADVANCEWIDTH',
		'OFFSET_ASCENT',
		'OFFSET_BOUNDINGBOXHEIGHT',
		'OFFSET_BOUNDINGBOXWIDTH',
		'OFFSET_BOUNDINGBOXX',
		'OFFSET_BOUNDINGBOXY',
		'OFFSET_DESCENT'
	],
	#category : 'Sparta-Moz2D-External'
}

{ #category : #converting }
MozNativeTextMetrics class >> asExternalTypeOn: generator [
	"use handle ivar to hold my instance"
	^ FFIExternalObjectType objectClass: self
]

{ #category : #'library path' }
MozNativeTextMetrics class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #'field definition' }
MozNativeTextMetrics class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		double advanceWidth;
		double ascent;
		double descent;
		double boundingBoxX;
		double boundingBoxY;
		double boundingBoxWidth;
		double boundingBoxHeight;
	)
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> advanceWidth [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_ADVANCEWIDTH
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> advanceWidth: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_ADVANCEWIDTH put: anObject
]

{ #category : #converting }
MozNativeTextMetrics >> asTextMetrics [
	^ SpTextMetrics new mozInitializeFrom: self
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> ascent [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_ASCENT
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> ascent: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_ASCENT put: anObject
]

{ #category : #accessing }
MozNativeTextMetrics >> boundingBox [

	^ (self boundingBoxX @ self boundingBoxY) extent: (self boundingBoxWidth @ self boundingBoxHeight)
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> boundingBoxHeight [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_BOUNDINGBOXHEIGHT
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> boundingBoxHeight: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_BOUNDINGBOXHEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> boundingBoxWidth [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_BOUNDINGBOXWIDTH
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> boundingBoxWidth: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_BOUNDINGBOXWIDTH put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> boundingBoxX [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_BOUNDINGBOXX
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> boundingBoxX: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_BOUNDINGBOXX put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> boundingBoxY [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_BOUNDINGBOXY
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> boundingBoxY: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_BOUNDINGBOXY put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> descent [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_DESCENT
]

{ #category : #'accessing structure variables' }
MozNativeTextMetrics >> descent: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_DESCENT put: anObject
]

{ #category : #'library path' }
MozNativeTextMetrics >> ffiLibraryName [
	^ self class ffiLibraryName
]
