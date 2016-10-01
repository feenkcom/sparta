accessing
from: aStart to: anEnd
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].
		
	^ self class subRope rope: rope offset: offset + aStart - 1 length: (anEnd - aStart + 1)