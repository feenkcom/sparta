Extension { #name : #Color }

{ #category : #'*Sparta-Core' }
Color >> asSpartaPaintOn: aSpartaCanvas [
	^ aSpartaCanvas paint color: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaFillCircle: aSpartaCircle with: aFillPainter [
	aFillPainter fillCircle: aSpartaCircle withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaFillPath: aPath with: aFillPainter [
	aFillPainter fillPath: aPath withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaFillRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRectangle: aRectangle withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaFillRoundedRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRoundedRectangle: aRectangle withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaFillString: aString with: aTextPainter [
	aTextPainter fillString: aString withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaFillTextRun: aTextRun with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaMaskOn: aSpartaCanvas with: aMaskPainter [

	aMaskPainter maskPaint: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokeCircle: aSpartaCircle with: aStrokePainter [
	aStrokePainter strokeCircle: aSpartaCircle withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokeLine: aLine with: aStrokePainter [
	aStrokePainter strokeLine: aLine withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokePath: aPath with: aStrokePainter [
	aStrokePainter strokePath: aPath withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokeRectangle: aRectangle with: aStrokePainter [
	aStrokePainter strokeRectangle: aRectangle withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokeRoundedRectangle: aRoundedRectangle with: aStrokePainter [
	aStrokePainter strokeRoundedRectangle: aRoundedRectangle withSolidColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokeString: aString fillColor: aFillColor with: aTextPainter [
	aTextPainter fillString: aString withColor: aFillColor strokeColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokeString: aString fillPaint: aFillPaint with: aTextPainter [
	aTextPainter fillString: aString withPaint: aFillPaint strokeColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokeTextRun: aTextRun fillColor: aFillColor with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withColor: aFillColor strokeColor: self
]

{ #category : #'*Sparta-Core' }
Color >> spartaStrokeTextRun: aTextRun fillPaint: aFillPaint with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withPaint: aFillPaint strokeColor: self
]
