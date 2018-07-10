I provide the support of stroked bounds cache. The computation of the stroked bounds is expensive and we want to provide a quick consecutive access to it forthe same stroke options.

[[[
	cache := SpartaStrokedBoundsCache new.
	cache
		strokedBounds: strokeOptions
		ifAbsentPut: [ "compute bounds here" ]
]]]