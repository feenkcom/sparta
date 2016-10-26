accessing
string
	^ String streamContents: [ :aStream | spanRope putOn: aStream from: start to: end ]