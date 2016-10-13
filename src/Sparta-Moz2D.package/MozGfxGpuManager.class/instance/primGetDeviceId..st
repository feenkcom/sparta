private - ffi
primGetDeviceId: anIndex

	^ self ffiCall: #(int moz_gpu_manager_gpu_device_id(self, size_t anIndex))