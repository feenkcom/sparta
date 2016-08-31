baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		package: 'Sparta-Installer';
		"package: 'ConfigurationOfSparta';"
		"package: 'Sparta-Core';"
		"package: 'Sparta-Critiques';"
		"package: 'Sparta-Moz2D'
			with: [ spec requires: 'Sparta-Core' ];"
		group: 'default'
			with: #('Sparta-Installer' "'ConfigurationOfSparta'" " 'Sparta-Core' 'Sparta-Moz2D'");
		group: 'development'
			with: #(default "'Sparta-Critiques'");
		preLoadDoIt: #preLoadActions:;
		postLoadDoIt: #postLoadActions ].