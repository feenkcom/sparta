Class {
	#name : #SkiaMetalCanvas,
	#superclass : #SkiaCanvas,
	#instVars : [
		'metalContext'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #rendering }
SkiaMetalCanvas >> drawDuring: aBlock [
	"Metal canvas is special in a sence that the underlying surface should be created every frame
	from the metal context. Users of this canvas must wrap the drawing calls within the block using this method"
	
	^ metalContext surfaceDuring: [ :aSkiaSurface |
		aSkiaSurface canvasDuring: [ :aSkiaSurfaceCanvas |
			| aResult |
			
			skiaSurface := aSkiaSurface.
			skiaSurfaceCanvas := aSkiaSurfaceCanvas.
			
			aResult := aBlock cull: self.
			
			skiaSurfaceCanvas := nil.
			skiaSurface := nil.
			aResult ] ]
]

{ #category : #testing }
SkiaMetalCanvas >> isValid [
	"Return true if canvas is correctly initialized (not a null pointer)
	and is actually valid that is determined by a backend"
	<return: #Boolean>
	
	session == Smalltalk session
		ifFalse: [ ^ false ].
		
	 metalContext isNull
		ifTrue: [ ^ false ].
	
	^ true
]

{ #category : #accessing }
SkiaMetalCanvas >> metalContext [
	<return: #SkiaMetalContext>

	^ metalContext
]

{ #category : #accessing }
SkiaMetalCanvas >> metalContext: aSkiaMetalContext [

	metalContext := aSkiaMetalContext.
	session := Smalltalk session
]
