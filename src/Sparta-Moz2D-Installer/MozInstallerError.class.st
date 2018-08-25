Class {
	#name : #MozInstallerError,
	#superclass : #Error,
	#instVars : [
		'help'
	],
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerError >> defaultHelp [
	^ self subclassResponsibility
]

{ #category : #initialization }
MozInstallerError >> defaultMessage [
	^ self subclassResponsibility
]

{ #category : #accessing }
MozInstallerError >> help [
	^ help
]

{ #category : #accessing }
MozInstallerError >> help: aText [
	help := aText
]

{ #category : #initialization }
MozInstallerError >> initialize [
	super initialize.
	
	messageText := self defaultMessage.
	help := self defaultHelp
]

{ #category : #accessing }
MozInstallerError >> stack [
	^ self signalerContext stack
]

{ #category : #accessing }
MozInstallerError >> systemInfo [
	| delimiter image vm stack |

	delimiter := 'System information: ', String cr, '---------------' asText.
	image := 'Pharo ', SystemVersion current dottedMajorMinor,  String cr, SmalltalkImage current lastUpdateString.
	vm := String streamContents: [ :aStream | SystemReporter new reportVM: aStream ].
	stack := 'Stack trace:', String cr, '---------------', String cr, self stack printString.

	^
		delimiter,
		String cr, image,
 		String cr, String cr, vm,
		String cr, String cr, stack
]
