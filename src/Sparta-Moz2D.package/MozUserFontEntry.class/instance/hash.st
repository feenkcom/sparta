comparing
hash
	^ (self name hash bitXor: self getHandle getHandle hash) bitXor: self source hash