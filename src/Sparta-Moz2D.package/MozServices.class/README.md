I provide a basic control over Moz2D backend services.

I am responsible for starting and stopping backend services (for example nsAtomService and gfxPlatform).

Services must start on image open and stop on image close.

Public API and Key Messages

- start - start services
- stop - stop services

   MozServices start.
   MozServices stop
 
Internal Representation and Key Implementation Points.

	It is very important to launch services, otherwise text rendering (font fallback detection) will not work.
	I user SessionManager to register myself as user class at 0 priority to make sure that FFI is still works when I shutdown services.