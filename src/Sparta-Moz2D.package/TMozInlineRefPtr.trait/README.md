I provide support of C++ classes that have inlined reference counting mechanism.

Smart pointers can not be just deleted, instead users need to release a reference decreasing references count by one. As soon as ref.count becomes zero, an object will be deleted automatically.

! I must be used together with TMozDebug and TMozLibrary traits.
Classes that use me must implement #resourceData that returns a handle (ExternalData or ExternalAddress)