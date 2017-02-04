text - measurement
drawDescent: aMetricsProvider on: aCanvas
	
	self
		drawLineAt: aMetricsProvider fontMetrics maxDescent
		named: 'Descent'
		color: Color blue
		on: aCanvas