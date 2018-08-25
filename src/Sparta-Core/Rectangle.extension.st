Extension { #name : #Rectangle }

{ #category : #'*Sparta-Core' }
Rectangle >> asSpartaPathOn: aSpartaCanvas [
	"I am polymorphic with TSpartaPath and can be used directly"
	^ self
]

{ #category : #'*Sparta-Core' }
Rectangle >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	aSpartaClipper pushRectangle: self
]

{ #category : #'*Sparta-Core' }
Rectangle >> spartaFillOn: aSpartaCanvas with: aSpartaFiller [
	aSpartaFiller fillRectangle: self
]

{ #category : #'*Sparta-Core' }
Rectangle >> spartaStrokeOn: aSpartaCanvas with: aSpartaStrokePainter [
	aSpartaStrokePainter strokeRectangle: self
]
