private - ffi
primStartAtom

	^ self ffiCall: #(void moz2d_services_init_atom_table())