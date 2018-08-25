Class {
	#name : #MozInstallerUnhandledError,
	#superclass : #MozInstallerError,
	#instVars : [
		'error'
	],
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerUnhandledError >> defaultHelp [
	| email github |

	email := 'YWxleC5zeXJlbEBnbWFpbC5jb20=' base64Decoded asText allBold.
	github := 'https://github.com/syrel/Sparta/issues' asText allBold.

	^ '
Unknown error... Please copy the whole text
 - and send it to ' asText, email,'
 - or open a bug report ', github
]

{ #category : #initialization }
MozInstallerUnhandledError >> defaultMessage [
	^ ''
]

{ #category : #accessing }
MozInstallerUnhandledError >> error: anError [
	error := anError.

	self messageText: anError description
]

{ #category : #accessing }
MozInstallerUnhandledError >> stack [
	^ error signalerContext stack
]
