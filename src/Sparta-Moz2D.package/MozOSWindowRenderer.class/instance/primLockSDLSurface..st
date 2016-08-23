private - ffi
primLockSDLSurface: aSurface

	^ self ffiCall: #(int SDL_LockSurface( SDL_Surface* aSurface ))