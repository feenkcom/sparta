benchmark
on: aBlock in: aFileName
	| max accuracy results |
	max := 10.

	accuracy := 6.
	results := OrderedDictionary new.
	
	1 to: max do: [ :n |
		| repeat values |
		
		repeat := 2 raisedTo: n.
		('Benchmark for: ', repeat asString) logCr.
		World doOneCycleNow.
		
		values := OrderedCollection new.
		
		Smalltalk garbageCollect.
		Smalltalk garbageCollect.
		Smalltalk garbageCollect.
		accuracy timesRepeat: [
			Smalltalk garbageCollect.
			values add: [ 
				aBlock value: repeat.
				Smalltalk garbageCollectMost.
			] timeToRun asMilliSeconds ].
		
		"we sort, and ignore the best and the worst results"
		values := values sorted.
		values := values first: values size - 1.
		values := values last: values size - 1.

		results at: repeat asString put: values average asFloat ].

	('Benchmark done!') logCr.
	World doOneCycleNow.
	aFileName asFileReference writeStream nextPutAll: (String streamContents: [ :stream | 
		results associationsDo:  [ :assoc |
			stream nextPutAll: (assoc key asString, ',', assoc value asString, String cr) ]]).
	results inspect.
	^ results