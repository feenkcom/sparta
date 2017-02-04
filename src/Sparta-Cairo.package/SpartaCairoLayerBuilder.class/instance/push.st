layer
push
	| aContent aLayer |

	aContent := isOpaque
		ifTrue: [ SpartaCairoContent CAIRO_CONTENT_COLOR ]
		ifFalse: [ SpartaCairoContent CAIRO_CONTENT_COLOR_ALPHA ].

	shouldCopy
		ifTrue: [
			| aSource aDestination anOrignalCanvas |
			"cairo owns a target. temporary variable, no need to increase reference count"
			aSource := self primGroupTarget.
			self primPushGroupWithContent: aContent.
			aDestination := self primGroupTarget.
			
			anOrignalCanvas := canvas.
			[	canvas := self primCreate: aDestination.
				self primSetSourceSurface: aSource x: 0.0 y: 0.0.
				self primSetOperator: SpartaCairoCompositionOp CAIRO_OPERATOR_SOURCE.
				self primPaint.
				self primDestroy: canvas ]
			ensure: [ canvas := anOrignalCanvas ] ]
		ifFalse: [ 
			self primPushGroupWithContent: aContent ].
		
	aLayer := SpartaCairoLayer new
		alpha: alpha.
	
	mask ifNotNil: [ 
		| aMaskPattern |
		aMaskPattern := SpartaCairoSurfacePattern surface: mask.
		aMaskPattern matrix: transformation inverted.
		aLayer mask: aMaskPattern ].
	
	canvas pushLayer: aLayer