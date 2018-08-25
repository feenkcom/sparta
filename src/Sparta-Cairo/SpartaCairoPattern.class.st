Class {
	#name : #SpartaCairoPattern,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoRefPtr + TSpartaCairoDebug + TSpartaInspectorPreview',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoRefPtr classTrait + TSpartaCairoDebug classTrait + TSpartaInspectorPreview classTrait',
	#category : 'Sparta-Cairo-External'
}

{ #category : #'private - ffi' }
SpartaCairoPattern class >> primAddRef: aHandle [

	^ self ffiCall: #(void* cairo_pattern_reference (void* aHandle) )
]

{ #category : #'private - ffi' }
SpartaCairoPattern class >> primRefCount: aHandle [

	^ self ffiCall: #(uint cairo_pattern_get_reference_count (void* aHandle) )
]

{ #category : #'private - ffi' }
SpartaCairoPattern class >> primRelease: aHandle [

	^ self ffiCall: #(void cairo_pattern_destroy (void* aHandle) )
]

{ #category : #converting }
SpartaCairoPattern >> asForm [
	| aCanvas |

	aCanvas := SpartaCairoCanvas checker: 200@200.
	aCanvas fill
		paint: self;
		path: aCanvas bounds;
		draw.

	^ aCanvas asForm
]

{ #category : #converting }
SpartaCairoPattern >> asSpartaCairoPatternOn: aSpartaCairoCanvas [
	^ self
]

{ #category : #converting }
SpartaCairoPattern >> asSpartaPaintOn: aSpartaCanvas [
	^ self
]

{ #category : #accessing }
SpartaCairoPattern >> extend: anExtendMode [

	self primExtend: anExtendMode
]

{ #category : #accessing }
SpartaCairoPattern >> matrix: aSpartaMatrix [
	| aCairoMatrix |
	
	aCairoMatrix := SpartaCairoMatrix fromSpartaMatrix: aSpartaMatrix.
	self primMatrix: aCairoMatrix
]

{ #category : #'private - ffi' }
SpartaCairoPattern >> primExtend: anExtendMode [

	^ self ffiCall: #(void cairo_pattern_set_extend (
			self,
			SpartaCairoExtendMode anExtendMode ) )
]

{ #category : #'private - ffi' }
SpartaCairoPattern >> primMatrix: aCairoMatrix [

	^ self ffiCall: #(void cairo_pattern_set_matrix (
		self,
		SpartaCairoMatrix * aCairoMatrix ) )
]

{ #category : #dispatch }
SpartaCairoPattern >> spartaFillPath: aPath with: aFillPainter [
	aFillPainter fillPath: aPath withPattern: self
]

{ #category : #dispatch }
SpartaCairoPattern >> spartaFillRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRectangle: aRectangle withPattern: self
]
