instance creation
names: aListOfStrings

	^ self empty
		in: [ :list | aListOfStrings do: [ :each | list add: each ] ];
		yourself