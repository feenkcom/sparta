text - measurement
drawLineAt: offsetY named: aName color: aColor on: aCanvas
	| textPainter metricsProvider |
	aCanvas stroke
		paint: aColor;
		path: (aCanvas shape line: self canvasOffset x negated @ offsetY to: (aCanvas width - self canvasOffset x)@ offsetY );
		draw.

	textPainter := aCanvas text
		string: aName;
		paint: aColor;
		font: (aCanvas font
			size: 16;
			weightThin;
			build).
	metricsProvider := textPainter measure.	
	textPainter
		baseline: ((aCanvas width - 5 - self canvasOffset x) @ offsetY) - (metricsProvider textMetrics boundingBox width @ 3);
		draw.