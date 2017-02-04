instance creation
metrics
	| aMetrics |

	aMetrics := SpMetrics new.
	aMetrics canvas: canvas.
	aMetrics length: end - start + 1.
	aMetrics lineBreakBefore: false.
	aMetrics measureFont: true.
	aMetrics measureText: true.
	aMetrics spacing: spacing.
	aMetrics start: start.
	aMetrics width: maxWidth.

	^ aMetrics