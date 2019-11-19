Extension { #name : #Form }

{ #category : #'*Sparta-Core' }
Form >> asSpartaPaintOn: aSpartaCanvas [
	self bits isInteger
		"in order to prevent crashes, note performance loose"
		ifTrue: [ ^ aSpartaCanvas paint form: (self copy: (0@0 extent: self extent)) ].

	^ aSpartaCanvas paint form: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaFillPath: aPath with: aFillPainter [
	aFillPainter fillPath: aPath withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaFillRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRectangle: aRectangle withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaFillRoundedRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRoundedRectangle: aRectangle withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaFillString: aString with: aTextPainter [
	aTextPainter fillString: aString withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaFillTextRun: aTextRun with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaStrokeLine: aLine with: aStrokePainter [
	aStrokePainter strokeLine: aLine withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaStrokePath: aPath with: aStrokePainter [
	aStrokePainter strokePath: aPath withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaStrokeRectangle: aRectangle with: aStrokePainter [
	aStrokePainter strokeRectangle: aRectangle withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaStrokeRoundedRectangle: aRoundedRectangle with: aStrokePainter [
	aStrokePainter strokeRoundedRectangle: aRoundedRectangle withForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaStrokeString: aString fillColor: aFillColor with: aTextPainter [
	aTextPainter fillString: aString withColor: aFillColor strokeForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaStrokeString: aString fillPaint: aFillPaint with: aTextPainter [
	aTextPainter fillString: aString withPaint: aFillPaint strokeForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaStrokeTextRun: aTextRun fillColor: aFillColor with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withColor: aFillColor strokeForm: self
]

{ #category : #'*Sparta-Core' }
Form >> spartaStrokeTextRun: aTextRun fillPaint: aFillPaint with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withPaint: aFillPaint strokeForm: self
]
