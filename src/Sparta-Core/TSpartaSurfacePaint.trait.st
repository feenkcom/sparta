Trait {
	#name : #TSpartaSurfacePaint,
	#category : #'Sparta-Core-Paints'
}

{ #category : #'sampling filters' }
TSpartaSurfacePaint >> samplingArea: aRectangle [
	^ self explicitRequirement
]

{ #category : #'sampling filters' }
TSpartaSurfacePaint >> samplingGood [
	^ self explicitRequirement
]

{ #category : #'sampling filters' }
TSpartaSurfacePaint >> samplingLinear [
	^ self explicitRequirement
]

{ #category : #'sampling filters' }
TSpartaSurfacePaint >> samplingPoint [
	^ self explicitRequirement
]

{ #category : #'sampling filters' }
TSpartaSurfacePaint >> samplingSentinel [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaSurfacePaint >> source: aSurface [
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaFillCircle: aSpartaCircle with: aFillPainter [
	aFillPainter fillCircle: aSpartaCircle withSurface: self
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaFillPath: aPath with: aFillPainter [
	aFillPainter fillPath: aPath withSurface: self
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaFillRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRectangle: aRectangle withSurface: self
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaFillRoundedRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRoundedRectangle: aRectangle withSurface: self
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaStrokeCircle: aSpartaCircle with: aStrokePainter [
	aStrokePainter strokeCircle: aSpartaCircle withSurface: self
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaStrokeLine: aLine with: aStrokePainter [
	aStrokePainter strokeLine: aLine withSurface: self
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaStrokePath: aPath with: aStrokePainter [
	aStrokePainter strokePath: aPath withSurface: self
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaStrokeRectangle: aPath with: aStrokePainter [
	aStrokePainter strokeRectangle: aPath withSurface: self
]

{ #category : #dispatch }
TSpartaSurfacePaint >> spartaStrokeRoundedRectangle: aRoundedRectangle with: aStrokePainter [
	aStrokePainter strokeRoundedRectangle: aRoundedRectangle withSurface: self
]
