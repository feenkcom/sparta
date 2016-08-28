private
nonSelfReturns: aMethod
	^ (aMethod ast allChildren select: [ :each | each isReturn ]) select: [ :node | node value isSelf not ]