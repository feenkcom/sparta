private - ffi
primGetVendorId: anIndex

	^ self ffiCall: #(int moz_gpu_manager_gpu_vendor_id(self, size_t anIndex))