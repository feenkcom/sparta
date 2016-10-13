initialization
initializeDevices
	| aCount |
	aCount := self primGetCount.
	
	devices := (1 to: aCount) collect: [ :anIndex |
		MozGfxGpuDevice new
			description: (self primGetDescription: anIndex - 1);
			deviceId: (self primGetDeviceId: anIndex - 1);
			vendorId: (self primGetVendorId: anIndex - 1) ]