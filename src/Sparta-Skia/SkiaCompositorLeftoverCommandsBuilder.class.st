Class {
	#name : #SkiaCompositorLeftoverCommandsBuilder,
	#superclass : #Object,
	#instVars : [
		'offset',
		'commands'
	],
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #api }
SkiaCompositorLeftoverCommandsBuilder class >> build: aBuilderBlock during: theCommandsBlock [
	^ SkiaCompositorLeftoverCommands newDuring: [ :theCommands |
		| aBuider |

		aBuider := self new
			commands: theCommands;
			offset: 0@0;
			yourself.

		aBuilderBlock value: aBuider.
		
		theCommandsBlock value: theCommands ]
]

{ #category : #private }
SkiaCompositorLeftoverCommandsBuilder >> commands: anObject [
	commands := anObject
]

{ #category : #accessing }
SkiaCompositorLeftoverCommandsBuilder >> offset: anObject [

	offset := anObject
]

{ #category : #'private - clipping' }
SkiaCompositorLeftoverCommandsBuilder >> pushCircle: aSpartaCircle [
	SkiaCompositorGeometry
		circle: aSpartaCircle
		during: [ :aGeometry | self pushClip: aGeometry ]
]

{ #category : #'private - clipping' }
SkiaCompositorLeftoverCommandsBuilder >> pushClip: aGeometry [
	SkiaCompositorLeftoverCommand
		clip: aGeometry
		offset: offset
		during: [ :aCommand | commands add: aCommand ]
]

{ #category : #'private - clipping' }
SkiaCompositorLeftoverCommandsBuilder >> pushPath: aSpartaPath [
	SkiaCompositorGeometry
		path: aSpartaPath
		during: [ :aGeometry | self pushClip: aGeometry ]
]

{ #category : #'private - clipping' }
SkiaCompositorLeftoverCommandsBuilder >> pushRectangle: aSpartaRectangle [
	SkiaCompositorGeometry
		rectangle: aSpartaRectangle
		during: [ :aGeometry | self pushClip: aGeometry ]
]

{ #category : #'private - clipping' }
SkiaCompositorLeftoverCommandsBuilder >> pushRoundedRectangle: aSpartaRoundedRectangle [
	SkiaCompositorGeometry
		roundedRectangle: aSpartaRoundedRectangle
		during: [ :aGeometry | self pushClip: aGeometry ]
]

{ #category : #'private - clipping' }
SkiaCompositorLeftoverCommandsBuilder >> pushTransform: aSpartaMatrix [
	SkiaCompositorLeftoverCommand
		transform: aSpartaMatrix
		offset: offset
		during: [ :aCommand | commands add: aCommand ]
]
