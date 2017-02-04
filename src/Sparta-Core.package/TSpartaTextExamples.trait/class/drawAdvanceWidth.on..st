text - measurement
drawAdvanceWidth: aMetricsProvider on: aCanvas
	
	self
		drawVerticalLineAt: 0
		named: 'Text start'
		color: Color green darker darker
		on: aCanvas.

	self
		drawVerticalLineAt: aMetricsProvider textMetrics advance
		named: 'Advance width'
		color: Color green darker darker
		on: aCanvas