debug
warning: aMessageBlock
	"|message|

	message := '[', self name asString ,'] ', aMessageBlock value.

	Transcript show: message; cr.
	self primStderr: message."