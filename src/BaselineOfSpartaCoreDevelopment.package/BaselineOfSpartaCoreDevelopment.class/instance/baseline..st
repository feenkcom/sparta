baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		baseline: 'SpartaCore' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];

		package: 'Sparta-Installer' with: [ spec 
			requires: #( 'SpartaCore' ) ]
	].