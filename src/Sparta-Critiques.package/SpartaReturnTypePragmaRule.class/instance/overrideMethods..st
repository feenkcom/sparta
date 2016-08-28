private
overrideMethods: aMethod
	| overrideMethods |
	
	overrideMethods := OrderedCollection new.

	aMethod methodClass allSubclasses
		do: [ :class |
			class compiledMethodAt: aMethod selector
				ifPresent: [ :method | overrideMethods add: method ]
				ifAbsent: [ ] ].
			
	^ overrideMethods 