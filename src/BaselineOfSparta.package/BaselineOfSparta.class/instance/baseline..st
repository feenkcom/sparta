baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		postLoadDoIt: #postLoadActions:;
		package: 'Sparta-Core';
		package: 'Sparta-Moz2D'
			with: [ spec requires: #('Sparta-Core') ];
		package: 'Sparta-Moz2D-Tests'
			with: [ spec requires: #('Sparta-Moz2D') ];

		"additional development packages"
		package: 'Sparta-Installer';
		package: 'Sparta-Critiques';

		"groups without #git: prefix are loaded without git support"
		group: 'core'
			with: #('Sparta-Core' 'Sparta-Moz2D');
		group: 'development'
			with: #('core' 'Sparta-Critiques' 'Sparta-Moz2D-Tests');

		"the following groups are loaded automatically with git support"
		group: 'git:core'
			with: #('Sparta-Installer');
		group: 'git:development'
			with: #('git:core');

		"#default should not be used"
		group: 'default' with: #() ].