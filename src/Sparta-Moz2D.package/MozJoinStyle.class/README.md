I represent a line join style.

	BEVEL - Fills an additional triangular area between the common endpoint of connected segments, and the separate outside rectangular corners of each segment.
	MITER - Connected segments are joined by extending their outside edges to connect at a single point, with the effect of filling an additional lozenge-shaped area. This setting is effected by the miterLimit property.
	MITER_OR_BEVEL - Use Miter if supported by backend, otherwise fallback to bevel
	ROUND - Rounds off the corners of a shape by filling an additional sector of disc centered at the common endpoint of connected segments. The radius for these rounded corners is equal to the line width.
	
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin