Trait {
	#name : #TSpartaConicalGradientPaint,
	#category : #'Sparta-Core-Paints'
}

{ #category : #accessing }
TSpartaConicalGradientPaint >> innerCenter: aPoint [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConicalGradientPaint >> innerRadius: aNumber [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConicalGradientPaint >> outerCenter: aPoint [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConicalGradientPaint >> outerRadius: aNumber [
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaConicalGradientPaint >> spartaFillPath: aPath with: aFillPainter [
	aFillPainter fillPath: aPath withConicalGradient: self
]

{ #category : #dispatch }
TSpartaConicalGradientPaint >> spartaFillRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRectangle: aRectangle withConicalGradient: self
]

{ #category : #dispatch }
TSpartaConicalGradientPaint >> spartaFillRoundedRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRoundedRectangle: aRectangle withConicalGradient: self
]

{ #category : #dispatch }
TSpartaConicalGradientPaint >> spartaStrokeLine: aLine with: aStrokePainter [
	aStrokePainter strokeLine: aLine withConicalGradient: self
]

{ #category : #dispatch }
TSpartaConicalGradientPaint >> spartaStrokePath: aPath with: aStrokePainter [
	aStrokePainter strokePath: aPath withConicalGradient: self
]

{ #category : #dispatch }
TSpartaConicalGradientPaint >> spartaStrokeRectangle: aPath with: aStrokePainter [
	aStrokePainter strokeRectangle: aPath withConicalGradient: self
]
