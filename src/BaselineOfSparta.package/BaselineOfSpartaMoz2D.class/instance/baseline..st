baselines
baseline: spec
	<baseline>
	spec for: #common do: [spec
		baseline: 'Sparta' with: [ spec repository: 'github://syrel/Sparta/src' ];

		package: 'Sparta-Moz2D'
			with: [ spec requires: #('Sparta') ];
		package: 'Sparta-Moz2D-Tests'
			with: [ spec requires: #('Sparta-Moz2D') ];
	
		group: 'default' with: #('Sparta-Moz2D' 'Sparta-Moz2D-Tests') ].