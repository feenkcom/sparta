comparing
hash
	^ self familyName hash
		bitXor: (self source hash
			bitXor: (self stretch value hash
				bitXor: (self style value hash
					bitXor: (self unicodeRange hash
						bitXor: self weight value hash))))