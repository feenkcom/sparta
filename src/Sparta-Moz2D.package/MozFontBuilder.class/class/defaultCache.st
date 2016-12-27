accessing
defaultCache
	^ TTLCache new
		maximumWeight: 100 "how many different font we cache";
		timeToLive: 30 * 60 "objects live for half an hour"