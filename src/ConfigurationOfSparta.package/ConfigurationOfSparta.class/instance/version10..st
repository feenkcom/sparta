versions
version10: spec
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'AliakseiSyrel'.
		spec timestamp: '8/13/2016 10:25'.
		spec 
			package: 'Sparta-Core' with: 'a MCLazyVersionInfo(Sparta-Core-AliakseiSyrel.15)';
			package: 'Sparta-Moz2D' with: 'a MCLazyVersionInfo(Sparta-Moz2D-AliakseiSyrel.21)'. ].
