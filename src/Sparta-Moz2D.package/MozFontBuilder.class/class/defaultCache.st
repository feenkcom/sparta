accessing
defaultCache
	^ LRUCache new
		maximumWeight: 100 "how many different font we cache";
		yourself