text - measurement
drawVerticalLineAt: offsetX named: aName color: aColor on: aCanvas
	| textPainter metricsProvider |
	aCanvas stroke
		paint: aColor;
		path: (aCanvas shape lineFrom: offsetX @ self canvasOffset y negated to: offsetX @ (aCanvas height - self canvasOffset y) );
		draw.

	textPainter := aCanvas text
		verticalSidewaysLeft;
		string: aName;
		paint: aColor;
		font: (aCanvas font
			size: 16;
			weightThin;
			build).
	metricsProvider := textPainter measure.	
	textPainter
		baseline: (offsetX - 3) @ (aCanvas height -  self canvasOffset y - 5);
		draw