I add transparent support of C++ smart pointers (RefPtr)

Smart pointers can not be just deleted, instead users need to release a reference decreasing references count by one. As soon as ref.count becomes zero, an object will be deleted automatically.

Since all C++ classes that support smart pointers are subclasses of RefPtr<T> we can provide a single unified method of accessing and releaseing RefPtr itself without cairing about template class.

! I must be used together with TMozDebug and TMozLibrary traits.
Classes that use me must implement #resourceData that returns a handle (ExternalData or ExternalAddress)