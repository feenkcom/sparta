comparing
hash
	^ (self alpha hash bitXor: self antialiasMode hash) bitXor: self compositionOperator hash