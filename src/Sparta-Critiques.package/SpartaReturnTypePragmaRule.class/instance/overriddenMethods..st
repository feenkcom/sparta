private
overriddenMethods: aMethod
	| overridenMethods |
	
	overridenMethods := OrderedCollection new.

	aMethod methodClass allSuperclasses
		do: [ :class |
			class compiledMethodAt: aMethod selector
				ifPresent: [ :method | overridenMethods add: method ]
				ifAbsent: [ ] ].
			
	^ overridenMethods 