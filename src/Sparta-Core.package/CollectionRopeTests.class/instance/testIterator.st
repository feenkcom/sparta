tests
testIterator
	|collection|
	collection := self collection.

	1 to: collection size do: [ :from |
		from to: collection size do: [ :to |
			|iterator|
			iterator := rope iterator: from to: to.
			1 to: to - from + 1 do: [ :index |
				self assert: iterator hasNext equals: true.
				self assert: iterator position equals: from + index - 1.
				self assert: iterator next equals: (collection at: from + index - 1) ] ] ]