baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		package: 'Sparta-Installer';
		group: 'default'
			with: #('Sparta-Installer');
		group: 'development'
			with: #(default);
		postLoadDoIt: #postLoadActions: ].