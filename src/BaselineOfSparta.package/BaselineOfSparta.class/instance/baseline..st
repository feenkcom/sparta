baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		postLoadDoIt: #postLoadSparta:;
		package: 'Sparta-Core';
		package: 'Sparta-Moz2D'
			with: [ spec requires: #('Sparta-Core') ];
		package: 'Sparta-Moz2D-Installer'
			with: [ spec requires: #('Sparta-Moz2D') ];
		package: 'Sparta-Moz2D-Tests'
			with: [ spec requires: #('Sparta-Moz2D') ];
		package: 'Sparta-Cairo'
			with: [ spec requires: #('Sparta-Core') ];

		"additional development packages"
		package: 'Sparta-Critiques';

		"groups with only sources"
		group: 'core' with: #(
			'Sparta-Core'
			'Sparta-Cairo');
			
		group: 'development' with: #(
			'core'
			'Sparta-Critiques'
			'Sparta-Moz2D'
			'Sparta-Moz2D-Installer'
			'Sparta-Moz2D-Tests');

		"Allow better integration of Sparta in Bloc"
		group: 'stub' with: #();
		
		"#default should not be used"
		group: 'default' with: #(core) ].