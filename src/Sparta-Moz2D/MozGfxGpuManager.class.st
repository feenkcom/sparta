Class {
	#name : #MozGfxGpuManager,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozRefPtr + TMozDebug',
	#classTraits : 'TMozLibrary classTrait + TMozRefPtr classTrait + TMozDebug classTrait',
	#instVars : [
		'devices'
	],
	#category : 'Sparta-Moz2D-GFX'
}

{ #category : #'instance creation' }
MozGfxGpuManager class >> new [
	^ self primCreate
		initialize;
		yourself
]

{ #category : #'private - ffi' }
MozGfxGpuManager class >> primCreate [

	^ self ffiCall: #(MozGfxGpuManager moz_gpu_manager_create())
]

{ #category : #accessing }
MozGfxGpuManager >> devices [
	^ devices
]

{ #category : #'gt-inspector-extension' }
MozGfxGpuManager >> gtInspectorDevicesIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite table
		title: 'Devices';
		display: [ self devices ];
		when: [ self size isZero not ];
		column: 'Name' evaluated: [ :each | each description ];
		column: 'Device Id' evaluated: [ :each | each deviceId printString ];
		column: 'Vendor Id' evaluated: [ :each | each vendorId printString ]
]

{ #category : #initialization }
MozGfxGpuManager >> initialize [
	"Do not send super initialize, otherwise handle is reset to 0"
	
	self autoRelease.
	self initializeDevices
]

{ #category : #initialization }
MozGfxGpuManager >> initializeDevices [
	| aCount |
	aCount := self primGetCount.
	
	devices := (1 to: aCount) collect: [ :anIndex |
		MozGfxGpuDevice new
			description: (self primGetDescription: anIndex - 1);
			deviceId: (self primGetDeviceId: anIndex - 1);
			vendorId: (self primGetVendorId: anIndex - 1) ]
]

{ #category : #'private - ffi' }
MozGfxGpuManager >> primGetCount [

	^ self ffiCall: #(	size_t moz_gpu_manager_gpu_count ( self ) )
]

{ #category : #'private - ffi' }
MozGfxGpuManager >> primGetDescription: anIndex [

	^ self ffiCall: #(String moz_gpu_manager_gpu_description(self, size_t anIndex))
]

{ #category : #'private - ffi' }
MozGfxGpuManager >> primGetDeviceId: anIndex [

	^ self ffiCall: #(int moz_gpu_manager_gpu_device_id(self, size_t anIndex))
]

{ #category : #'private - ffi' }
MozGfxGpuManager >> primGetVendorId: anIndex [

	^ self ffiCall: #(int moz_gpu_manager_gpu_vendor_id(self, size_t anIndex))
]

{ #category : #accessing }
MozGfxGpuManager >> size [
	^ devices size
]
