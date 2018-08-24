baselines
baseline: spec
	<baseline>
	spec for: #common do: [spec
		postLoadDoIt: #postLoadSparta:;
		baseline: 'Beacon' with: [ spec 
			repository: 'github://pharo-project/pharo-beacon/repository' ];
		baseline: 'SpartaMoz2D' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];
		baseline: 'SpartaCoreDevelopment' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];

		package: 'Sparta-Moz2D-Installer' with: [ spec 
			requires: #('SpartaMoz2D' 'Beacon' 'SpartaCoreDevelopment') ]
	].