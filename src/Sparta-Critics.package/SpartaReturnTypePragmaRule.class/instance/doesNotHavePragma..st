testing
doesNotHavePragma: aMethod
	^ aMethod pragmas noneSatisfy: [ :pragma | pragma keyword beginsWith: #return: ]