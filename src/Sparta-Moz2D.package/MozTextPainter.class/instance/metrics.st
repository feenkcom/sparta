instance creation
metrics
	| aMetrics |

	aMetrics := SpMetrics new.
	aMetrics boxType: MozTextBoundingBoxType TIGHT_INK_EXTENTS.
	aMetrics breakPriority: breakPriority.
	aMetrics canvas: canvas.
	aMetrics length: end - start + 1.
	aMetrics lineBreakBefore: false.
	aMetrics measureFont: true.
	aMetrics measureText: true.
	aMetrics orientation: orientation.
	aMetrics spacing: spacing.
	aMetrics start: start.
	aMetrics suppressBreaks: MozTextSuppressBreak eSuppressInitialBreak.
	aMetrics width: maxWidth.

	^ aMetrics