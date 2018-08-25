Class {
	#name : #SpartaCairoError,
	#superclass : #Error,
	#instVars : [
		'status'
	],
	#category : 'Sparta-Cairo-Library'
}

{ #category : #signalling }
SpartaCairoError class >> signal: aCairoStatus [

	^ self new
		status: aCairoStatus;
		messageText: aCairoStatus item asString;
		signal
]

{ #category : #accessing }
SpartaCairoError >> status [
	^ status
]

{ #category : #accessing }
SpartaCairoError >> status: anObject [
	status := anObject
]
