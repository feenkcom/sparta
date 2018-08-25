"
I test fill drawing operation, both builder and actual drawing to make sure that plugin works as expected
"
Class {
	#name : #MozCanvasFillTests,
	#superclass : #MozCanvasTestCase,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #initialization }
MozCanvasFillTests >> defaultExtent [
	^ 50@50
]

{ #category : #tests }
MozCanvasFillTests >> testFillCanvasBlue [

	canvas fill
		paint: Color blue;
		path: canvas bounds;
		draw.
		
	self assertPixels: canvas bounds color: Color blue
	
]

{ #category : #tests }
MozCanvasFillTests >> testFillCanvasGreen [

	canvas fill
		paint: Color green;
		path: canvas bounds;
		draw.
		
	self assertPixels: canvas bounds color: Color green
	
]

{ #category : #tests }
MozCanvasFillTests >> testFillCanvasRed [

	canvas fill
		paint: Color red;
		path: canvas bounds;
		draw.
		
	self assertPixels: canvas bounds color: Color red
	
]

{ #category : #tests }
MozCanvasFillTests >> testFillCanvasTransparent [

	canvas fill
		paint: Color transparent;
		path: canvas bounds;
		draw.
		
	self assertPixels: canvas bounds color: Color transparent
]

{ #category : #tests }
MozCanvasFillTests >> testFillCanvasWhite [

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	self assertPixels: canvas bounds color: Color white
	
]
