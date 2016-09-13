private - ffi
primMeasureAndBreakMetrics: aTextMetrics start: aStart maxLength: aMaxLength lineBreakBefore: aLineBreakBefore width: aWidth boundingBoxType: aBoundingBoxType canvas: aCanvas propertyProvider: aPropertyProvider canWordWrap: aCanWordWrap breakPriority: aBreakPriorityPointer
		
	^ self ffiCall: #(uint32 moz2d_text_run_break_and_measure (
      self,
		uint32 aStart,
		uint32 aMaxLength,
		bool aLineBreakBefore,
		double aWidth,
		MozTextPropertyProvider aPropertyProvider,
		0,
		nil,
		MozTextMetrics aTextMetrics,
		MozTextBoundingBoxType aBoundingBoxType,
		MozCanvas aCanvas,
		nil,
		nil,
		bool aCanWordWrap,
		int* aBreakPriorityPointer))