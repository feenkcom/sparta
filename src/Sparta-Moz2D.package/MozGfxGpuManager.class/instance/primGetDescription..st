private - ffi
primGetDescription: anIndex

	^ self ffiCall: #(String moz_gpu_manager_gpu_description(self, size_t anIndex))