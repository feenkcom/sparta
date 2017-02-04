layer
pop
	| aLayer |
	
	self primSetOperator: SpartaCairoCompositionOp CAIRO_OPERATOR_OVER.
	self primPopGroupToSource.
	
	aLayer := canvas popLayer.
	
	aLayer mask
		ifNil: [ self primPaintAlpha: aLayer alpha ]
		ifNotNil: [ 
			aLayer alpha ~= 1.0 ifTrue: [ 
				self primPushGroupWithContent: SpartaCairoContent CAIRO_CONTENT_COLOR_ALPHA.
				self primPaintAlpha: aLayer alpha.
				self primPopGroupToSource ].
			self primMaskPattern: aLayer mask ]