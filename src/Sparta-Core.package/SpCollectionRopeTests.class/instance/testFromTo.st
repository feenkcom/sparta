tests
testFromTo
	|collection|
	collection := self collection.
	
	1 to: collection size do: [ :from |
		from to: collection size do: [ :to |
			|subrope|
			subrope := rope from: from to: to.
			self assert: subrope size equals: to - from + 1.
			1 to: to - from + 1 do: [ :index |
				self assert: (subrope at: index) equals: (collection at: from + index - 1) ] ] ]