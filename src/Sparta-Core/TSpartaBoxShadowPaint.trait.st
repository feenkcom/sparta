Trait {
	#name : #TSpartaBoxShadowPaint,
	#category : #'Sparta-Core-Paints'
}

{ #category : #accessing }
TSpartaBoxShadowPaint >> color: aColor [
	self explicitRequirement
]

{ #category : #accessing }
TSpartaBoxShadowPaint >> offset: aPoint [
	self explicitRequirement
]

{ #category : #accessing }
TSpartaBoxShadowPaint >> radius: aNumber [
	self explicitRequirement
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaFillCircle: aSpartaCircle with: aFillPainter [
	"we can not fill something with box shadow"
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaFillPath: aPath with: aFillPainter [
	"we can not fill something with box shadow"
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaFillRectangle: aRectangle with: aFillPainter [
	"we can not fill something with box shadow"
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaFillRoundedRectangle: aRoundedRectangle with: aFillPainter [
	"we can not fill something with box shadow"
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaStrokeCircle: aSpartaCircle with: aStrokePainter [
	aStrokePainter strokeCircle: aSpartaCircle withBoxShadow: self
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaStrokeLine: aLine with: aStrokePainter [
	aStrokePainter strokeLine: aLine withBoxShadow: self
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaStrokePath: aPath with: aStrokePainter [
	aStrokePainter strokePath: aPath withBoxShadow: self
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaStrokeRectangle: aPath with: aStrokePainter [
	aStrokePainter strokeRectangle: aPath withBoxShadow: self
]

{ #category : #dispatch }
TSpartaBoxShadowPaint >> spartaStrokeRoundedRectangle: aRoundedRectangle with: aStrokePainter [
	aStrokePainter strokeRoundedRectangle: aRoundedRectangle withBoxShadow: self
]
