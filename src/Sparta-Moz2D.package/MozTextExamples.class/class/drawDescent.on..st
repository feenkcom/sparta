text - measurement
drawDescent: aMetricsProvider on: aCanvas
	
	self
		drawLineAt: aMetricsProvider textMetrics descent
		named: 'Descent'
		color: Color blue
		on: aCanvas