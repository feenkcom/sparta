comparing
hash
	^ size hash
		bitXor: (weight hash
			bitXor: (language hash
				bitXor: (stretch hash
					bitXor: (style hash
						bitXor: fontList hash))))