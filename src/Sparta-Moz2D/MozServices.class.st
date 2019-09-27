"
I provide a basic control over Moz2D backend services.

I am responsible for starting and stopping backend services (for example nsAtomService and gfxPlatform).

Services must start on image open and stop on image close.

Public API and Key Messages

- start - start services
- stop - stop services

   MozServices start.
   MozServices stop
 
Internal Representation and Key Implementation Points.

	It is very important to launch services, otherwise text rendering (font fallback detection) will not work.
	I user SessionManager to register myself as user class at 0 priority to make sure that FFI is still works when I shutdown services.
"
Class {
	#name : #MozServices,
	#superclass : #Object,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#classInstVars : [
		'isRunning'
	],
	#category : 'Sparta-Moz2D'
}

{ #category : #'class initialization' }
MozServices class >> initialize [
	super initialize.
	
	isRunning := false.
	SessionManager default registerUserClassNamed: self name atPriority: 0
]

{ #category : #testing }
MozServices class >> isRunning [
	^ isRunning ifNil: [ false ]
]

{ #category : #'private - ffi' }
MozServices class >> primShutdownGfxConfig [

	^ self ffiCall: #(void moz2d_services_shutdown_gfx_config())
]

{ #category : #'private - ffi' }
MozServices class >> primShutdownPlatform [

	^ self ffiCall: #(void moz2d_services_shutdown_platform())
]

{ #category : #'private - ffi' }
MozServices class >> primShutdownServices [

	^ self ffiCall: #(void moz2d_services_shutdown_services())
]

{ #category : #'private - ffi' }
MozServices class >> primStartGfxConfig [

	^ self ffiCall: #(void moz2d_services_init_gfx_config())
]

{ #category : #'private - ffi' }
MozServices class >> primStartPlatform [

	^ self ffiCall: #(void moz2d_services_init_platform())
]

{ #category : #'private - ffi' }
MozServices class >> primStartServices [

	^ self ffiCall: #(void moz2d_services_init_services())
]

{ #category : #'system startup' }
MozServices class >> shutDown: isImageQuitting [
	isImageQuitting ifFalse: [ ^ self ].
	"When image is shutting down we need to shutdown backend services"
	self stop
]

{ #category : #services }
MozServices class >> start [

	MozLibrary uniqueInstance hasModule
		"If there is no Moz2D library installed we can not start services"
		ifFalse: [
			isRunning := false.
			^ self ].

	"First of all we need to start services"
	[  self primStartServices.
		self primStartGfxConfig.
		OSPlatform current mozSettings export.
		self primStartPlatform ]
	"Image will crash anyway if something fails in library,
	so we just guard ourselves against image-side issues"
	on: Error do: [ :e | MozCanvas primStderr: e messageText ].
	isRunning := true
]

{ #category : #'system startup' }
MozServices class >> startUp: inANewImageSession [
	inANewImageSession ifFalse: [ ^ self ].
	"We need to make sure that all backend services are initialized"
	self start
]

{ #category : #services }
MozServices class >> stop [
	
	MozLibrary uniqueInstance hasModule
		"If there is no Moz2D library installed we can not stop services"
		ifFalse: [ 
			isRunning := false.
			^ self ].

	self flag: 'Dont stop services for now because it causes a crash on save and quit. Requires further investigation'.
	
	[	"self primShutdownPlatform.
		self primShutdownGfxConfig.
		self primShutdownServices" ]
	ensure: [ isRunning := false ]
]
