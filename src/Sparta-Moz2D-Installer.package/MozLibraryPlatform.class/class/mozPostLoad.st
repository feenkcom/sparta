installation
mozPostLoad
	<spartaPostLoad>
	
	"prevent from installing multiple times by metacello"
	(postLoaded isNil or: [ postLoaded not ])
		ifFalse: [ ^ self ].

	postLoaded := true.
	self install