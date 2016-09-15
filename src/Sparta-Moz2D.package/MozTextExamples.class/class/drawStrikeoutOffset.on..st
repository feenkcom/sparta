text - measurement
drawStrikeoutOffset: aMetricsProvider on: aCanvas
	
	self
		drawLineAt: aMetricsProvider fontMetrics strikeoutOffset negated
		named: 'Strikeout offset'
		color: Color blue
		on: aCanvas