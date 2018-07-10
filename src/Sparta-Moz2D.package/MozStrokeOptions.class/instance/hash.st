comparing
hash
	^ ((((self width hash bitXor: self lineCap hash)
			bitXor: self lineJoin hash)
				bitXor: self miterLimit hash)
					bitXor: self dashOffset hash)
						bitXor: self dashPattern hash