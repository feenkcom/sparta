baselines
baseline: spec
	<baseline>
	spec for: #common do: [spec
		baseline: 'Sparta' with: [ spec repository: 'github://syrel/Sparta/src' ];
		
		package: 'Sparta-Cairo'
			with: [ spec requires: #('Sparta') ];

		group: 'default' with: #('Sparta-Cairo') ]