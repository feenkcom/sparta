"
I am an independent test of FFI functionality
"
Class {
	#name : #MozFFITest,
	#superclass : #MozTestCase,
	#category : #'Sparta-Moz2D-Tests'
}

{ #category : #'instance creation' }
MozFFITest >> callbackDouble [
	^ FFICallback 
		signature: #(double (double))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackFloat [
	^ FFICallback 
		signature: #(float (float))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackInt [
	^ FFICallback 
		signature: #(int (int))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackInt16 [
	^ FFICallback 
		signature: #(int16 (int16))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackInt32 [
	^ FFICallback 
		signature: #(int32 (int32))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackInt64 [
	^ FFICallback 
		signature: #(int64 (int64))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackInt8 [
	^ FFICallback 
		signature: #(int8 (int8))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackIntptr [
	^ FFICallback 
		signature: #(long (long))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackLong [
	^ FFICallback 
		signature: #(long (long))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackUInt16 [
	^ FFICallback 
		signature: #(uint16 (uint16))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackUInt32 [
	^ FFICallback 
		signature: #(uint32 (uint32))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackUInt64 [
	^ FFICallback 
		signature: #(uint64 (uint64))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackUInt8 [
	^ FFICallback 
		signature: #(uint8 (uint8))
		block: [ :value | value ]
]

{ #category : #'instance creation' }
MozFFITest >> callbackUIntptr [
	^ FFICallback 
		signature: #(ulong (ulong))
		block: [ :value | value ]
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback double: aNumber [

	^ self ffiCall: #(double moz2d_test_ffi_callback_double(FFICallback aCallback, double aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback float: aNumber [

	^ self ffiCall: #(float moz2d_test_ffi_callback_float(FFICallback aCallback, float aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback int16: aNumber [

	^ self ffiCall: #(int16 moz2d_test_ffi_callback_int16_t(FFICallback aCallback, int16 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback int32: aNumber [

	^ self ffiCall: #(int32 moz2d_test_ffi_callback_int32_t(FFICallback aCallback, int32 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback int64: aNumber [

	^ self ffiCall: #(int64 moz2d_test_ffi_callback_int64_t(FFICallback aCallback, int64 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback int8: aNumber [

	^ self ffiCall: #(int8 moz2d_test_ffi_callback_int8_t(FFICallback aCallback, int8 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback int: aNumber [

	^ self ffiCall: #(int moz2d_test_ffi_callback_int(FFICallback aCallback, int aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback intptr: aNumber [

	^ self ffiCall: #(long moz2d_test_ffi_callback_intptr_t(FFICallback aCallback, long aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback long: aNumber [

	^ self ffiCall: #(long moz2d_test_ffi_callback_long(FFICallback aCallback, long aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback uint16: aNumber [

	^ self ffiCall: #(uint16 moz2d_test_ffi_callback_uint16_t(FFICallback aCallback, uint16 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback uint32: aNumber [

	^ self ffiCall: #(uint32 moz2d_test_ffi_callback_uint32_t(FFICallback aCallback, uint32 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback uint64: aNumber [

	^ self ffiCall: #(uint64 moz2d_test_ffi_callback_uint64_t(FFICallback aCallback, uint64 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback uint8: aNumber [

	^ self ffiCall: #(uint8 moz2d_test_ffi_callback_uint8_t(FFICallback aCallback, uint8 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primCall: aCallback uintptr: aNumber [

	^ self ffiCall: #(ulong moz2d_test_ffi_callback_uintptr_t(FFICallback aCallback, ulong aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primComboFloat: aNumber [

	^ self ffiCall: #(bool moz2d_test_ffi_combo_float(float aNumber, float aNumber, float aNumber, float aNumber, float aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primComboInt: aNumber [

	^ self ffiCall: #(bool moz2d_test_ffi_combo_int(int aNumber, int aNumber, int aNumber, int aNumber, int aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primDouble: aNumber [

	^ self ffiCall: #(double moz2d_test_ffi_double(double aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primDoubleMax [

	^ self ffiCall: #(double moz2d_test_ffi_floating_max_double())
]

{ #category : #'private - ffi' }
MozFFITest >> primDoubleMin [

	^ self ffiCall: #(double moz2d_test_ffi_floating_min_double())
]

{ #category : #'private - ffi' }
MozFFITest >> primFloat: aNumber [

	^ self ffiCall: #(float moz2d_test_ffi_float(float aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primFloatMax [

	^ self ffiCall: #(float moz2d_test_ffi_floating_max_float())
]

{ #category : #'private - ffi' }
MozFFITest >> primFloatMin [

	^ self ffiCall: #(float moz2d_test_ffi_floating_min_float())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt16: aNumber [

	^ self ffiCall: #(int16 moz2d_test_ffi_fixed_int16_t(int16 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primInt16Max [

	^ self ffiCall: #(int16 moz2d_test_ffi_fixed_signed_max_int16_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt16Min [

	^ self ffiCall: #(int16 moz2d_test_ffi_fixed_signed_min_int16_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt32: aNumber [

	^ self ffiCall: #(int32 moz2d_test_ffi_fixed_int32_t(int32 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primInt32Max [

	^ self ffiCall: #(int32 moz2d_test_ffi_fixed_signed_max_int32_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt32Min [

	^ self ffiCall: #(int32 moz2d_test_ffi_fixed_signed_min_int32_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt64: aNumber [

	^ self ffiCall: #(int64 moz2d_test_ffi_fixed_int64_t(int64 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primInt64Max [

	^ self ffiCall: #(int64 moz2d_test_ffi_fixed_signed_max_int64_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt64Min [

	^ self ffiCall: #(int64 moz2d_test_ffi_fixed_signed_min_int64_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt8: aNumber [

	^ self ffiCall: #(int8 moz2d_test_ffi_fixed_int8_t(int8 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primInt8Max [

	^ self ffiCall: #(int8 moz2d_test_ffi_fixed_signed_max_int8_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt8Min [

	^ self ffiCall: #(int8 moz2d_test_ffi_fixed_signed_min_int8_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primInt: aNumber [

	^ self ffiCall: #(int moz2d_test_ffi_int(int aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primIntMax [

	^ self ffiCall: #(int moz2d_test_ffi_signed_max_int())
]

{ #category : #'private - ffi' }
MozFFITest >> primIntMin [

	^ self ffiCall: #(int moz2d_test_ffi_signed_min_int())
]

{ #category : #'private - ffi' }
MozFFITest >> primIntptr: aNumber [

	^ self ffiCall: #(long moz2d_test_ffi_fixed_intptr_t(long aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primIntptrMax [

	^ self ffiCall: #(long moz2d_test_ffi_fixed_signed_max_intptr_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primIntptrMin [

	^ self ffiCall: #(long moz2d_test_ffi_fixed_signed_min_intptr_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primLong: aNumber [

	^ self ffiCall: #(long moz2d_test_ffi_long (long aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primLongMax [

	^ self ffiCall: #(long moz2d_test_ffi_signed_max_long())
]

{ #category : #'private - ffi' }
MozFFITest >> primLongMin [

	^ self ffiCall: #(long moz2d_test_ffi_signed_min_long())
]

{ #category : #'private - ffi' }
MozFFITest >> primUInt16: aNumber [

	^ self ffiCall: #(uint16 moz2d_test_ffi_fixed_uint16_t(uint16 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primUInt16Max [

	^ self ffiCall: #(uint16 moz2d_test_ffi_fixed_unsigned_max_uint16_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primUInt32: aNumber [

	^ self ffiCall: #(uint32 moz2d_test_ffi_fixed_uint32_t(uint32 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primUInt32Max [

	^ self ffiCall: #(uint32 moz2d_test_ffi_fixed_unsigned_max_uint32_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primUInt64: aNumber [

	^ self ffiCall: #(uint64 moz2d_test_ffi_fixed_uint64_t(uint64 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primUInt64Max [

	^ self ffiCall: #(uint64 moz2d_test_ffi_fixed_unsigned_max_uint64_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primUInt8: aNumber [

	^ self ffiCall: #(uint8 moz2d_test_ffi_fixed_uint8_t(uint8 aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primUInt8Max [

	^ self ffiCall: #(uint8 moz2d_test_ffi_fixed_unsigned_max_uint8_t())
]

{ #category : #'private - ffi' }
MozFFITest >> primUIntptr: aNumber [

	^ self ffiCall: #(ulong moz2d_test_ffi_fixed_uintptr_t(ulong aNumber))
]

{ #category : #'private - ffi' }
MozFFITest >> primUIntptrMax [

	^ self ffiCall: #(ulong moz2d_test_ffi_fixed_unsigned_max_uintptr_t())
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackDouble [

	self
		assert: (self primCall: self callbackDouble double: self primDoubleMin)
		equals: self primDoubleMin.
	
	self
		assert: (self primCall: self callbackDouble double: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackDouble double: self primDoubleMax)
		equals: self primDoubleMax
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackFloat [

	self
		assert: (self primCall: self callbackFloat float: self primFloatMin)
		equals: self primFloatMin.
	
	self
		assert: (self primCall: self callbackFloat float: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackFloat float: self primFloatMax)
		equals: self primFloatMax
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackInt16 [

	self
		assert: (self primCall: self callbackInt16 int16: self primInt16Min)
		equals: self primInt16Min.
	
	self
		assert: (self primCall: self callbackInt16 int16: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackInt16 int16: self primInt16Max)
		equals: self primInt16Max
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackInt32 [

	self
		assert: (self primCall: self callbackInt32 int32: self primInt32Min)
		equals: self primInt32Min.
	
	self
		assert: (self primCall: self callbackInt32 int32: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackInt32 int32: self primInt32Max)
		equals: self primInt32Max
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackInt64 [
	
	"testing 64bit data types does not make sense for 32bit platforms"
	Smalltalk vm is32bit
		ifTrue: [ ^ self skip ].

	self
		assert: (self primCall: self callbackInt64 int64: self primInt64Min)
		equals: self primInt64Min.
	
	self
		assert: (self primCall: self callbackInt64 int64: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackInt64 int64: self primInt64Max)
		equals: self primInt64Max
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackInt8 [

	self
		assert: (self primCall: self callbackInt8 int8: self primInt8Min)
		equals: self primInt8Min.
	
	self
		assert: (self primCall: self callbackInt8 int8: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackInt8 int8: self primInt8Max)
		equals: self primInt8Max
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackIntptr [

	self
		assert: (self primCall: self callbackIntptr intptr: self primIntptrMin)
		equals: self primIntptrMin.
	
	self
		assert: (self primCall: self callbackIntptr intptr: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackIntptr intptr: self primIntptrMax)
		equals: self primIntptrMax
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackLong [

	self
		assert: (self primCall: self callbackLong long: self primLongMin)
		equals: self primLongMin.
	
	self
		assert: (self primCall: self callbackLong long: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackLong long: self primLongMax)
		equals: self primLongMax
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackUInt16 [
	
	self
		assert: (self primCall: self callbackUInt16 uint16: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUInt16 uint16: self primUInt16Max)
		equals: self primUInt16Max
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackUInt32 [
	
	self
		assert: (self primCall: self callbackUInt32 uint32: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUInt32 uint32: self primUInt32Max)
		equals: self primUInt32Max
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackUInt64 [


	"testing 64bit data types does not make sense for 32bit platforms"
	Smalltalk vm is32bit
		ifTrue: [ ^ self skip ].
		
	self
		assert: (self primCall: self callbackUInt64 uint64: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUInt64 uint64: self primUInt64Max)
		equals: self primUInt64Max
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackUInt8 [
	
	self
		assert: (self primCall: self callbackUInt8 uint8: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUInt8 uint8: self primUInt8Max)
		equals: self primUInt8Max
]

{ #category : #'tests - callback' }
MozFFITest >> testCallbackUIntptr [
	
	self
		assert: (self primCall: self callbackUIntptr uintptr: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUIntptr uintptr: self primUIntptrMax)
		equals: self primUIntptrMax
]

{ #category : #'tests - type' }
MozFFITest >> testDouble [

	self assert: (self primDouble: self primDoubleMin) equals: self primDoubleMin.
	self assert: (self primDouble: 0) equals: 0.
	self assert: (self primDouble: self primDoubleMax) equals: self primDoubleMax
]

{ #category : #'tests - type' }
MozFFITest >> testFloat [

	self assert: (self primFloat: self primFloatMin) equals: self primFloatMin.
	self assert: (self primFloat: 0) equals: 0.
	self assert: (self primFloat: self primFloatMax) equals: self primFloatMax
]

{ #category : #'tests - type' }
MozFFITest >> testInt [

	self assert: (self primInt: self primIntMin) equals: self primIntMin.
	self assert: (self primInt: 0) equals: 0.
	self assert: (self primInt: self primIntMax) equals: self primIntMax
]

{ #category : #'tests - type' }
MozFFITest >> testInt16 [

	self assert: (self primInt16: self primInt16Min) equals: self primInt16Min.
	self assert: (self primInt16: 0) equals: 0.
	self assert: (self primInt16: self primInt16Max) equals: self primInt16Max
]

{ #category : #'tests - type' }
MozFFITest >> testInt32 [

	self assert: (self primInt32: self primInt32Min) equals: self primInt32Min.
	self assert: (self primInt32: 0) equals: 0.
	self assert: (self primInt32: self primInt32Max) equals: self primInt32Max
]

{ #category : #'tests - type' }
MozFFITest >> testInt64 [

	self assert: (self primInt64: self primInt64Min) equals: self primInt64Min.
	self assert: (self primInt64: 0) equals: 0.
	self assert: (self primInt64: self primInt64Max) equals: self primInt64Max
]

{ #category : #'tests - type' }
MozFFITest >> testInt8 [

	self assert: (self primInt8: self primInt8Min) equals: self primInt8Min.
	self assert: (self primInt8: 0) equals: 0.
	self assert: (self primInt8: self primInt8Max) equals: self primInt8Max
]

{ #category : #'tests - type' }
MozFFITest >> testIntptr [

	self assert: (self primIntptr: self primIntptrMin) equals: self primIntptrMin.
	self assert: (self primIntptr: 0) equals: 0.
	self assert: (self primIntptr: self primIntptrMax) equals: self primIntptrMax
]

{ #category : #'tests - type' }
MozFFITest >> testLong [

	self assert: (self primLong: self primLongMin) equals: self primLongMin.
	self assert: (self primLong: 0) equals: 0.
	self assert: (self primLong: self primLongMax) equals: self primLongMax
]

{ #category : #'tests - type' }
MozFFITest >> testUInt16 [

	self assert: (self primUInt16: 0) equals: 0.
	self assert: (self primUInt16: self primUInt16Max) equals: self primUInt16Max
]

{ #category : #'tests - type' }
MozFFITest >> testUInt32 [

	self assert: (self primUInt32: 0) equals: 0.
	self assert: (self primUInt32: self primUInt32Max) equals: self primUInt32Max
]

{ #category : #'tests - type' }
MozFFITest >> testUInt64 [

	self assert: (self primUInt64: 0) equals: 0.
	self assert: (self primUInt64: self primUInt64Max) equals: self primUInt64Max
]

{ #category : #'tests - type' }
MozFFITest >> testUInt8 [

	self assert: (self primUInt8: 0) equals: 0.
	self assert: (self primUInt8: self primUInt8Max) equals: self primUInt8Max
]

{ #category : #'tests - type' }
MozFFITest >> testUIntptr [

	self assert: (self primUIntptr: 0) equals: 0.
	self assert: (self primUIntptr: self primUIntptrMax) equals: self primUIntptrMax
]
