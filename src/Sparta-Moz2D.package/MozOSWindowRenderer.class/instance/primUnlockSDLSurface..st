private - ffi
primUnlockSDLSurface: aSurface

	^ self ffiCall: #( int SDL_UnlockSurface( SDL_Surface* aSurface ) )