accessing
string
	^ String streamContents: [ :aStream | rope putOn: aStream from: start to: end ]