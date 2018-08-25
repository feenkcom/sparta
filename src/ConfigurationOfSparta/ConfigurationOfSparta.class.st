"
I am a Configuration of Sparta.
"
Class {
	#name : #ConfigurationOfSparta,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfSparta'
}

{ #category : #'development support' }
ConfigurationOfSparta class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>
]

{ #category : #private }
ConfigurationOfSparta class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #'ConfigurationOf'
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #'ConfigurationOf' ifAbsent: aBlock ].
]

{ #category : #private }
ConfigurationOfSparta class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfSparta class >> ensureMetacelloBaseConfiguration [
  Smalltalk
    at: #'ConfigurationOf'
    ifAbsent: [ 
      | repository version |
      repository := MCHttpRepository
        location: 'http://smalltalkhub.com/mc/dkh/metacello/main'
        user: ''
        password: ''.
      repository
        versionReaderForFileNamed: 'Metacello-Base-dkh.107'
        do: [ :reader | 
          version := reader version.
          version load.
          version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfSparta class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfSparta class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfSparta class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfSparta class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfSparta class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfSparta class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfSparta >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/AliakseiSyrel/Sparta/main/'.
		spec 
			package: 'BaselineOfSparta';
			package: 'Sparta-Core';
			package: 'Sparta-Moz2D'. ].

]

{ #category : #accessing }
ConfigurationOfSparta >> customProjectAttributes [
    "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes "

    ^ #()
]

{ #category : #'symbolic versions' }
ConfigurationOfSparta >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.1-baseline'.

]

{ #category : #accessing }
ConfigurationOfSparta >> project [
    ^ project
        ifNil: [ 
            "Bootstrap Metacello if it is not already loaded"
            self class ensureMetacello.
            project := MetacelloMCProject new projectAttributes: self customProjectAttributes.	"Create the Metacello project"
            (Smalltalk at: #'MetacelloVersionConstructor') on: self project: project.	"Construct the project"
            project loadType: #'linear'.	"change to #atomic if desired"
            project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfSparta >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.1'.

]

{ #category : #versions }
ConfigurationOfSparta >> version10: spec [
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'AliakseiSyrel'.
		spec timestamp: '8/13/2016 10:25'.
		spec 
			package: 'Sparta-Core' with: 'a MCLazyVersionInfo(Sparta-Core-AliakseiSyrel.15)';
			package: 'Sparta-Moz2D' with: 'a MCLazyVersionInfo(Sparta-Moz2D-AliakseiSyrel.21)'. ].

]

{ #category : #versions }
ConfigurationOfSparta >> version11: spec [
	<version: '1.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.1'.
		spec author: 'AliakseiSyrel'.
		spec timestamp: '8/22/2016 14:08'.
		spec 
			package: 'Sparta-Core' with: 'Sparta-Core-AliakseiSyrel.38';
			package: 'Sparta-Moz2D' with: 'Sparta-Moz2D-AliakseiSyrel.52'. ].

]
