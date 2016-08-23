converting
pixels
	|data pixels extent stride p|
	extent := self extent.
	stride := self stride.
	
	data := self data.
	pixels := Array new: extent x * extent y.
	p := 0.
	1 to: extent y do: [ :y |
		1 to: extent x do: [ :x |
			| index color r g b a i|
			i := ((y - 1) * (stride / 4) + (x - 1)).
			index := i * 4 + 1.
			r := (data at: index + 2).
			g := (data at: index + 1).
			b := (data at: index + 0).
			a := (data at: index + 3).
			color := (Color r: r g: g b: b range: 255) alpha: a.
			p := p + 1.
			pixels at: p put: ((color bitPatternForDepth: 32) at: 1)
		]
	].
	^ pixels