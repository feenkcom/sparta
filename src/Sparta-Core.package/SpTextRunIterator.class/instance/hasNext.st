testing
hasNext
	"Return true if there is a word/character after current index"
	<return: #Boolean>

	^ index <= length	and: [ length > 0 ]