*Sparta-Core
spCharAt: anIndex
	| d r index |
	index := (anIndex - 1 ) * 4 + 1.
	d := (index + 3) // 4.
	r := (index - 1) \\ 4 + 1.
	Transcript show: (d -> r) asString, ' '.
	^ (self wordAt: d) logCr; yourself 