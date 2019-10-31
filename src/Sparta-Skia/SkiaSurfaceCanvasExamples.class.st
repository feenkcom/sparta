Class {
	#name : #SkiaSurfaceCanvasExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorBlack [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color black.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(0 0 0 255).
	
	^ thePixels
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorBlue [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color blue.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(0 0 255 255).
	
	^ thePixels
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorGreen [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color green.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(0 255 0 255).
	
	^ thePixels
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorRed [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color red.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(255 0 0 255).
	
	^ thePixels
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorTransparent [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color transparent.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(0 0 0 0).
	
	^ thePixels
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorWhite [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color white.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(255 255 255 255).
	
	^ thePixels
]
