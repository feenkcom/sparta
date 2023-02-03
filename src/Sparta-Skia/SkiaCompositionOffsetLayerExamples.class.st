Class {
	#name : #SkiaCompositionOffsetLayerExamples,
	#superclass : #SkiaCompositorObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'instance creation' }
SkiaCompositionOffsetLayerExamples >> composeOffsets [
	<gtExample>
	| aParentLayer aChildLayer |
	
	aParentLayer := SkiaCompositionOffsetLayer offset: 10@20.
	self assert: aParentLayer layersCount equals: 0.
	self assert: aParentLayer referenceCount equals: 0.
	self assert: (aParentLayer offset closeTo: 10@20).
	
	aChildLayer := SkiaCompositionOffsetLayer offset: 40@50.
	self assert: aChildLayer layersCount equals: 0.
	self assert: aChildLayer referenceCount equals: 0.
	self assert: (aChildLayer offset closeTo: 40@50).
	
	aParentLayer := aParentLayer withLayers: { aChildLayer }.
	
	self assert: aParentLayer layersCount equals: 1.
	self assert: aParentLayer referenceCount equals: 0.
	self assert: (aParentLayer offset closeTo: 10@20).
	self assert: aChildLayer layersCount equals: 0.
	self assert: aChildLayer referenceCount equals: 1.
	self assert: (aChildLayer offset closeTo: 40@50).
	
	^ aParentLayer
]

{ #category : #'instance creation' }
SkiaCompositionOffsetLayerExamples >> default [
	<gtExample>
	| aLayer |
	
	aLayer := SkiaCompositionOffsetLayer new.
	self assert: aLayer layersCount equals: 0.
	self assert: aLayer referenceCount equals: 0.
	self assert: aLayer offset isZero.
	
	^ aLayer
]

{ #category : #'instance creation' }
SkiaCompositionOffsetLayerExamples >> newOffset [
	<gtExample>
	| aLayer |
	
	aLayer := SkiaCompositionOffsetLayer offset: 10@20.
	self assert: aLayer layersCount equals: 0.
	self assert: aLayer referenceCount equals: 0.
	self assert: (aLayer offset closeTo: 10@20).
	
	^ aLayer
]

{ #category : #'instance creation' }
SkiaCompositionOffsetLayerExamples >> withOffset [
	<gtExample>
	| aLayer aNewlayer |
	
	aLayer := self default.
	aNewlayer := aLayer withOffset: 10@20.
	
	self assert: aLayer layersCount equals: 0.
	self assert: aLayer referenceCount equals: 0.
	self assert: aLayer offset isZero.
	
	self assert: aNewlayer layersCount equals: 0.
	self assert: aNewlayer referenceCount equals: 0.
	self assert: (aNewlayer offset closeTo: 10@20).
	
	^ aLayer
]
