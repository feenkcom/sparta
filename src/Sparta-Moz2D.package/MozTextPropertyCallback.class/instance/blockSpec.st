accessing
blockSpec
	^ [ :anIdentityHash :aPropertyCollector |
			(MozTextPropertyProvider fromIdentityHash: anIdentityHash)
				ifNotNil: [ :aPropertyProvider |
					self collectFrom: aPropertyProvider in: aPropertyCollector	] ]