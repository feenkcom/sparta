filters
grayscale: aSurfaceOrFilter

	^ canvas colorMatrixFilter
		source: aSurfaceOrFilter;
		matrix: #(
			0.25 0.75 0.00 0.00 0.00
			0.25 0.75 0.00 0.00 0.00
			0.25 0.75 0.00 0.00 0.00
			0.00 0.00 0.00 1.00 0.00)