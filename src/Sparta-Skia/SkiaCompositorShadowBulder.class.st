Class {
	#name : #SkiaCompositorShadowBulder,
	#superclass : #Object,
	#instVars : [
		'color',
		'radius',
		'offset'
	],
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #accessing }
SkiaCompositorShadowBulder >> color [

	^ color
]

{ #category : #accessing }
SkiaCompositorShadowBulder >> color: anObject [

	color := anObject
]

{ #category : #accessing }
SkiaCompositorShadowBulder >> offset [

	^ offset
]

{ #category : #accessing }
SkiaCompositorShadowBulder >> offset: anObject [

	offset := anObject
]

{ #category : #'api - builder' }
SkiaCompositorShadowBulder >> pushPath: aSpartaPath [
	self primSetPath: aSpartaPath
]

{ #category : #accessing }
SkiaCompositorShadowBulder >> radius [

	^ radius
]

{ #category : #accessing }
SkiaCompositorShadowBulder >> radius: anObject [

	radius := anObject
]
