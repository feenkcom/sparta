baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		package: 'ConfigurationOfSparta';
		package: 'Sparta-Core';
		package: 'Sparta-Moz2D'
			with: [ spec requires: 'Sparta-Core' ];
		group: 'default'
			with: #(ConfigurationOfSparta 'Sparta-Core' 'Sparta-Moz2D');
		group: 'development'
			with: #(default 'Sparta-Critics') ]