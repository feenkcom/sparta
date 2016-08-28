# Sparta
Sparta is an almost stateless vector graphics API for Pharo that provides bindings to the Moz2D rendering backend. Moz2D is the extracted graphical engine from Mozilla Firefox compiled as standalone shared library together with the extern C bindings required to call the engine from Pharo.



```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta/src';
  load
```