text - measurement
drawUnderlineOffset: aMetricsProvider on: aCanvas
	
	self
		drawLineAt: aMetricsProvider fontMetrics underlineOffset negated
		named: 'Underline offset'
		color: Color blue
		on: aCanvas