Trait {
	#name : #TSpartaCairoContext,
	#category : 'Sparta-Cairo-Builders'
}

{ #category : #'private - ffi' }
TSpartaCairoContext >> primAppendPath: aCairoPath [

	^ self ffiCall: #(void cairo_append_path (
			SpartaCairoCanvas canvas,
         SpartaCairoPath aCairoPath) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primClip [

	^ self ffiCall: #(void cairo_clip ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primClipPreserve [
	^ self ffiCall: #(void cairo_clip_preserve ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primCreate: aCairoSurface [

	^ self ffiCall: #(SpartaCairoCanvas cairo_create ( SpartaCairoSurface aCairoSurface ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primDestroy: aCairoCanvas [

	^ self ffiCall: #(void cairo_destroy ( SpartaCairoCanvas aCairoCanvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primFill [

	^ self ffiCall: #(void cairo_fill ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primGetClipOriginX: anOriginX originY: anOriginY cornerX: aCornerX cornerY: aCornerY [

	^ self ffiCall: #(void cairo_clip_extents (
			SpartaCairoCanvas canvas,
			double *anOriginX,
			double *anOriginY,
			double *aCornerX,
			double *aCornerY ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primGroupTarget [

	^ self ffiCall: #(SpartaCairoSurface cairo_get_group_target ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primLineToX: aX Y: aY [

	^ self ffiCall: #(void cairo_line_to (
			SpartaCairoCanvas canvas,
			double aX,
			double aY ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primMaskPattern: aCairoPattern [

	^ self ffiCall: #(void cairo_mask (
		SpartaCairoCanvas canvas,
		SpartaCairoPattern aCairoPattern ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primMoveToX: aX Y: aY [

	^ self ffiCall: #(void cairo_move_to (
			SpartaCairoCanvas canvas,
			double aX,
			double aY ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primNewPath [

	^ self ffiCall: #(void cairo_new_path ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primPaint [

	^ self ffiCall: #(void cairo_paint ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primPaintAlpha: aNumber [

	^ self ffiCall: #(void cairo_paint_with_alpha (
			SpartaCairoCanvas canvas,
			double aNumber ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primPopGroupToSource [

	^ self ffiCall: #(void cairo_pop_group_to_source ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primPushGroupWithContent: aCairoContent [

	^ self ffiCall: #(void cairo_push_group_with_content (
		SpartaCairoCanvas canvas,
		SpartaCairoContent aCairoContent ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primRectangleX: aX Y: aY width: aWidth height: aHeight [

	^ self ffiCall: #(void cairo_rectangle (
			SpartaCairoCanvas canvas,
			double aX,
			double aY,
			double aWidth,
			double aHeight ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primRestore [

	^ self ffiCall: #(void cairo_restore ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSave [

	^ self ffiCall: #(void cairo_save ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetAntialias: aCairoAntialias [

	^ self ffiCall: #( void cairo_set_antialias (
		SpartaCairoCanvas canvas,
      SpartaCairoAntialias aCairoAntialias ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetDashes: anArrayOfDoubles count: aNumberOfDashes offset: anOffset [

	^ self ffiCall: #( void cairo_set_dash (
		SpartaCairoCanvas canvas,
      double* anArrayOfDoubles,
		int aNumberOfDashes,
		double anOffset ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetFillRule: aCairoFillRule [

	^ self ffiCall: #( void cairo_set_fill_rule (
		SpartaCairoCanvas canvas,
      SpartaCairoFillRule aCairoFillRule ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetLineCap: aCairoCapStyle [

	^ self ffiCall: #( void cairo_set_line_cap (
		SpartaCairoCanvas canvas,
      SpartaCairoCapStyle aCairoCapStyle ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetLineJoin: aCairoJoinStyle [

	^ self ffiCall: #( void cairo_set_line_join (
		SpartaCairoCanvas canvas,
      SpartaCairoJoinStyle aCairoJoinStyle ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetLineWidth: aNumber [

	^ self ffiCall: #( void cairo_set_line_width (
		SpartaCairoCanvas canvas,
      double aNumber ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetMiterLimit: aNumber [

	^ self ffiCall: #( void cairo_set_miter_limit (
		SpartaCairoCanvas canvas,
      double aNumber ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetOperator: aCairoOperator [

	^ self ffiCall: #( void cairo_set_operator (
		SpartaCairoCanvas canvas,
      SpartaCairoCompositionOp aCairoOperator ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetSourcePattern: aCairoPattern [

	^ self ffiCall: #( void cairo_set_source (
			SpartaCairoCanvas canvas,
			SpartaCairoPattern aCairoPattern) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetSourceR: aRed G: aGreen B: aBlue A: anAlpha [
	
	^ self ffiCall: #( void cairo_set_source_rgba (
			SpartaCairoCanvas canvas,
			double aRed,
			double aGreen,
			double aBlue,
			double anAlpha) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primSetSourceSurface: aCairoSurface x: aX y: aY [

	^ self ffiCall: #( void cairo_set_source_surface (
			SpartaCairoCanvas canvas,
			SpartaCairoSurface aCairoSurface,
			double aX,
			double aY) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primStroke [

	^ self ffiCall: #(void cairo_stroke ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
TSpartaCairoContext >> primTranslateX: aX Y: aY [

	^ self ffiCall: #( void cairo_translate (
			SpartaCairoCanvas canvas,
			double aX,
			double aY) )
]
