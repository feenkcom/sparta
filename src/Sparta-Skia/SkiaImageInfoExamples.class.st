Class {
	#name : #SkiaImageInfoExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaImageInfoExamples >> default [
	<gtExample>
	| anImageInfo |
	
	anImageInfo := SkiaImageInfo new.
	self assert: anImageInfo width equals: 50.
	self assert: anImageInfo height equals: 50.
	self assert: anImageInfo alphaType equals: SkiaAlphaType Unpremul.
	self assert: ({ SkiaColorType RGBA8888. SkiaColorType BGRA8888. } includes: anImageInfo colorType).
	self assert: anImageInfo bytesPerPixel equals: 4.
	self assert: anImageInfo shiftPerPixel equals: 2.
	self assert: anImageInfo minRowBytes equals: 200.
	self assert: anImageInfo byteSize equals: 10000.
	
	^ anImageInfo
]

{ #category : #accessing }
SkiaImageInfoExamples >> fromExtentColorTypeAlphaType [
	<gtExample>
	| anImageInfo |
	
	anImageInfo := SkiaImageInfo
		width: 100 height: 200
		colorType: SkiaColorType RGBA8888
		alphaType: SkiaAlphaType Unpremul.

	self assert: anImageInfo width equals: 100.
	self assert: anImageInfo height equals: 200.
	self assert: anImageInfo alphaType equals: SkiaAlphaType Unpremul.
	self assert: anImageInfo colorType equals: SkiaColorType RGBA8888.
	self assert: anImageInfo bytesPerPixel equals: 4.
	self assert: anImageInfo shiftPerPixel equals: 2.
	self assert: anImageInfo minRowBytes equals: 400.
	self assert: anImageInfo byteSize equals: 80000.
	
	^ anImageInfo
]
