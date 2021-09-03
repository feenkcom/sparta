Class {
	#name : 'SkiaImageInfoExamples',
	#superclass : 'SkiaExternalObjectExamples',
	#category : 'Sparta-Skia-Examples'
}

{ #category : 'accessing' }
SkiaImageInfoExamples >> default [
	<gtExample>
	| anImageInfo |
	
	anImageInfo := SkiaImageInfo new.
	self assert: anImageInfo width equals: 0.
	self assert: anImageInfo height equals: 0.
	self assert: anImageInfo alphaType equals: SkiaAlphaType Unknown.
	self assert: anImageInfo colorType equals: SkiaColorType Unknown.
	self assert: anImageInfo bytesPerPixel equals: 0.
	self assert: anImageInfo shiftPerPixel equals: 0.
	self assert: anImageInfo minRowBytes equals: 0.
	self assert: anImageInfo byteSize equals: 0.
	
	^ anImageInfo
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
SkiaImageInfoExamples >> release [
	<gtExample>
	| anImageInfo |
	
	anImageInfo := self default.
	anImageInfo release.
	
	self assert: anImageInfo width equals: 0.
	self assert: anImageInfo height equals: 0.
	self assert: anImageInfo alphaType equals: SkiaAlphaType Unknown.
	self assert: anImageInfo colorType equals: SkiaColorType Unknown.
	self assert: anImageInfo bytesPerPixel equals: 0.
	self assert: anImageInfo shiftPerPixel equals: 0.
	self assert: anImageInfo minRowBytes equals: 0.
	self assert: anImageInfo byteSize equals: 0.
	
	^ anImageInfo
]
