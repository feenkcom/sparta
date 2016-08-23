baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		package: 'Sparta-Core';
		package: 'Sparta-Moz2D'
			with: [ spec requires: #(Sparta-Core) ]
	]