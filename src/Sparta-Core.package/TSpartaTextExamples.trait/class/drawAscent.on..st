text - measurement
drawAscent: aMetricsProvider on: aCanvas

	self
		drawLineAt: aMetricsProvider fontMetrics maxAscent negated
		named: 'Ascent'
		color: Color blue
		on: aCanvas