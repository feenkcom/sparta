Class {
	#name : #SkiaSingleSourceFilter,
	#superclass : #SkiaFilter,
	#traits : 'TSpartaFilterSource',
	#classTraits : 'TSpartaFilterSource classTrait',
	#instVars : [
		'source'
	],
	#category : #'Sparta-Skia-Filters'
}

{ #category : #drawing }
SkiaSingleSourceFilter >> drawOn: aSkiaFilterPainter [
	source isImage
		ifTrue: [ self drawOn: aSkiaFilterPainter imageSource: source ].
	source isCanvas
		ifTrue: [ self drawOn: aSkiaFilterPainter canvasSource: source ]
]

{ #category : #drawing }
SkiaSingleSourceFilter >> drawOn: aSkiaFilterPainter canvasSource: aSkiaCanvasSource [
	| aSkiaImageFilter aSkiaPaint |

	aSkiaImageFilter := self asSkiaImageFilterOn: aSkiaFilterPainter.
	aSkiaPaint := SkiaPaint new imageFilter: aSkiaImageFilter.

	aSkiaFilterPainter canvas surfaceCanvas
		drawImage: aSkiaCanvasSource canvas snapshot
		at: aSkiaFilterPainter destinationTopLeft
		paint: aSkiaPaint
]

{ #category : #drawing }
SkiaSingleSourceFilter >> drawOn: aSkiaFilterPainter imageSource: aSkiaImageSource [
	| aSkiaImageFilter aSkiaPaint |

	aSkiaImageFilter := self asSkiaImageFilterOn: aSkiaFilterPainter.
	aSkiaPaint := SkiaPaint new imageFilter: aSkiaImageFilter.

	aSkiaFilterPainter canvas surfaceCanvas
		drawImage: aSkiaImageSource image
		at: aSkiaFilterPainter destinationTopLeft
		paint: aSkiaPaint
]

{ #category : #dispatch }
SkiaSingleSourceFilter >> sourceCanvas: aSpartaCanvas [
	source := SkiaFilterSourceCanvas new canvas: aSpartaCanvas
]

{ #category : #dispatch }
SkiaSingleSourceFilter >> sourceFilter: aFilter [
	source := SkiaFilterSourceFilter new filter: aFilter
]

{ #category : #dispatch }
SkiaSingleSourceFilter >> sourceSurface: aSurface [
	source := SkiaFilterSourceImage new image: aSurface
]
