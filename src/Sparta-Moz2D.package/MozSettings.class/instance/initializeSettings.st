initialization
initializeSettings

	table := (self class defaultPreferences pairsCollect: [ :key :value |
		key asSymbol -> (value asMozPreference key: key; yourself) ]) asDictionary.