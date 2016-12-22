baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		preLoadDoIt:  #preLoadActions:;
		postLoadDoIt: #postLoadSparta:;
		package: 'Sparta-Core';
		package: 'Sparta-Moz2D'
			with: [ spec requires: #('Sparta-Core') ];
		package: 'Sparta-Moz2D-Tests'
			with: [ spec requires: #('Sparta-Moz2D') ];

		"additional development packages"
		package: 'Sparta-Critiques';

		"groups with only sources"
		group: 'file:core'
			with: #('Sparta-Core' 'Sparta-Moz2D');
		group: 'file:development'
			with: #('file:core' 'Sparta-Critiques' 'Sparta-Moz2D-Tests');

		"groups with sources and plugin installation"
		group: 'core'
			with: #('file:core');
		group: 'development'
			with: #('file:development');

		"groups with sources, plugin installion and git support"
		group: 'git:core'
			with: #(core);
		group: 'git:development'
			with: #(development);
		
		"Allow better integration of Sparta in Bloc"
		group: 'stub' with: #();
		
		"#default should not be used"
		group: 'default' with: #(core) ].