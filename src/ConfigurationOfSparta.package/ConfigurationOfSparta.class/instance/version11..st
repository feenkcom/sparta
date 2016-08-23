versions
version11: spec
	<version: '1.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.1'.
		spec author: 'AliakseiSyrel'.
		spec timestamp: '8/22/2016 14:08'.
		spec 
			package: 'Sparta-Core' with: 'Sparta-Core-AliakseiSyrel.38';
			package: 'Sparta-Moz2D' with: 'Sparta-Moz2D-AliakseiSyrel.52'. ].
