private - ffi
primMeasureMetrics: aTextMetrics boundingBoxType: aBoundingBoxType canvas: aCanvas propertyProvider: aPropertyProvider
		
	^ self ffiCall: #(void moz2d_text_run_measure_text (
      MozCanvas aCanvas,
		self,
      MozTextPropertyProvider aPropertyProvider,
		MozTextMetrics aTextMetrics,
		MozTextBoundingBoxType aBoundingBoxType))

"	^ self ffiCall: #(void moz2d_text_run_measure_text_test (MozCanvas aCanvas))"