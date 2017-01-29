settings
preferencesOn: aBuilder
	<systemsettings>
	
	(aBuilder group: self preferencesGroup asSymbol)
		label: self preferencesGroup;
		description: 'All Moz2D settings';
		parent: self parentPreferencesGroup;
		with: [
			self subclassesDo: [ :aSubclass |
				self
					assert: [ self preferencesGroup ~= aSubclass preferencesGroup ]
					description: [ 'Sub-setting must have a different group!' ].
				aSubclass preferencesOn: aBuilder ].
			self groupPreferencesOn: aBuilder ]