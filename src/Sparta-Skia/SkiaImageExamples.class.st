Class {
	#name : 'SkiaImageExamples',
	#superclass : 'SkiaExternalObjectExamples',
	#category : 'Sparta-Skia-Examples'
}

{ #category : 'instance creation' }
SkiaImageExamples >> fromEmptyForm [
	<gtExample>
	| aForm aSkiaImage |
	
	aForm := Form extent: 0@0 depth: 32.
	aForm fillColor: Color red.
	
	aSkiaImage := SkiaImage fromForm: aForm.
	
	self assert: aSkiaImage extent equals: 0@0.
	self assert: aSkiaImage isAlphaOnly not.
	self assert: aSkiaImage isOpaque not.
	self assert: aSkiaImage isTextureBackend not.
	self assert: aSkiaImage asForm bits asByteArray equals: #[].
	
	^ aSkiaImage
]

{ #category : 'instance creation' }
SkiaImageExamples >> fromForm_1x1 [
	<gtExample>
	| aForm aSkiaImage |
	
	aForm := Form extent: 1@1 depth: 32.
	aForm fillColor: Color red.
	
	aSkiaImage := SkiaImage fromForm: aForm.
	
	self assert: aSkiaImage extent equals: 1@1.
	self assert: aSkiaImage asForm bits asByteArray equals: aForm bits asByteArray.
	
	^ aSkiaImage
]

{ #category : 'instance creation' }
SkiaImageExamples >> fromForm_2x2 [
	<gtExample>
	| aForm aSkiaImage |
	
	aForm := Form extent: 2@2 depth: 32.
	aForm fillColor: Color red.
	
	aSkiaImage := SkiaImage fromForm: aForm.
	
	self assert: aSkiaImage extent equals: 2@2.
	self assert: aSkiaImage asForm bits asByteArray equals: aForm bits asByteArray.
	
	^ aSkiaImage
]

{ #category : 'instance creation' }
SkiaImageExamples >> fromForm_50x50 [
	<gtExample>
	| aForm aSkiaImage |
	
	aForm := Form extent: 50@50 depth: 32.
	aForm fillColor: Color red.
	
	aSkiaImage := SkiaImage fromForm: aForm.
	
	self assert: aSkiaImage extent equals: 50@50.
	self assert: aSkiaImage asForm bits asByteArray equals: aForm bits asByteArray.
	
	^ aSkiaImage
]

{ #category : 'examples - null ptr' }
SkiaImageExamples >> release [
	<gtExample>
	| aSkiaImage |
	
	aSkiaImage := self fromForm_1x1.
	aSkiaImage release.
	
	self assert: aSkiaImage extent equals: 0@0.
	self assert: aSkiaImage isAlphaOnly not.
	self assert: aSkiaImage isOpaque not.
	self assert: aSkiaImage isTextureBackend not.
	self assert: aSkiaImage asForm bits asByteArray equals: #[].
	
	^ aSkiaImage
]
