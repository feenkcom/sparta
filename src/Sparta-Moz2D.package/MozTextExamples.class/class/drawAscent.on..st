text - measurement
drawAscent: aMetricsProvider on: aCanvas
	
	self
		drawLineAt: aMetricsProvider textMetrics ascent negated
		named: 'Ascent'
		color: Color blue
		on: aCanvas