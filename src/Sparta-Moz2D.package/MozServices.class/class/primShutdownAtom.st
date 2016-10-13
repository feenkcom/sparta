private - ffi
primShutdownAtom

	^ self ffiCall: #(void moz2d_services_shutdown_atom_table())