settings
groupPreferences: aCollectionOfPreferences on: aBuilder depth: aDepth
	
	| groupablePreferences levelPreferences potentialGroups groups nonGroups |

	groupablePreferences := aCollectionOfPreferences select: [ :each | each categories size > aDepth ].
	levelPreferences := aCollectionOfPreferences select: [ :each | each categories size <= aDepth ].
	
	potentialGroups := groupablePreferences	groupedBy: [ :each | each categories at: aDepth ].
	groups := potentialGroups select: [ :group | group size > self groupSize ].
	nonGroups := potentialGroups select: [ :group | group size <= self groupSize ].
	
	groups do: [ :aGroup |
		| groupCategory groupId |
		groupId := (aGroup first categories first: aDepth) reduce: [ :a :b | a , '.', b ].
		groupCategory := aGroup first categories at: aDepth.
		(aBuilder group: groupId asSymbol)
			label: groupCategory asLowercase capitalized;
			with: [ self groupPreferences: aGroup on: aBuilder depth: aDepth + 1 ] ].

	(levelPreferences, nonGroups flattened) do: [ :aPreference |
		(aBuilder setting: aPreference key)
			target: self;
			label: aPreference key;
			description: aPreference key;
			default: aPreference ]