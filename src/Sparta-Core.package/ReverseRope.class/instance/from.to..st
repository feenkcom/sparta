accessing
from: aStart to: anEnd
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].

	^ (rope from: self size - anEnd + 1 to: self size - aStart + 1) reversed