# Installation

Tested on Pharo 6

**32bit plugin does not work on 64bit Linux - gtk2:i386 and gtk3:i386 are required. Installing them on 64bit linux will break your system!**

## HowTo

Sparta provides multiple ways of loading code and dealing with external [Moz2D](https://github.com/syrel/Moz2D) vm plugin:

- Bootstrap all-in-one [Sparta](https://github.com/syrel/Sparta) + [Moz2D](https://github.com/syrel/Moz2D) + [Iceberg](https://github.com/npasserini/iceberg) *(__git__:group)*
- Bootstrap light [Sparta](https://github.com/syrel/Sparta) + [Moz2D](https://github.com/syrel/Moz2D) *(__file__:group)*
- Manual code-only [Sparta](https://github.com/syrel/Sparta) *(group)*
- Manual plugin-only [Moz2D](https://github.com/syrel/Moz2D)

## Bootstrap all-in-one

**Stable v1.1** Core
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta:v1.1/src';
  load: #git:core
```

**Stable v1.1** Core + Tests + Lint rules
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta:v1.1/src';
  load: #git:development
```

**Bleeding edge** Core
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta/src';
  load: #git:core
```

**Bleeding edge** Core + Tests + Lint rules
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta/src';
  load: #git:development
```

## Bootstrap light

**Stable v1.1** Core
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta:v1.1/src';
  load: #file:core
```

**Stable v1.1** Core + Tests + Lint rules
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta:v1.1/src';
  load: #file:development
```

**Bleeding edge** Core
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta/src';
  load: #file:core
```

**Bleeding edge** Core + Tests + Lint rules
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta/src';
  load: #file:development
```

## Manual code-only

**Stable v1.0** Core
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta:v1.0/src';
  load: #core
```

**Stable v1.0** Core + Tests + Lint rules
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta:v1.0/src';
  load: #development
```

**Bleeding edge** Core
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta/src';
  load: #core
```

**Bleeding edge** Core + Tests + Lint rules
```
Metacello new
  baseline: 'Sparta';
  repository: 'github://syrel/sparta/src';
  load: #development
```

## Manual plugin-only

Binaries for 32 and 64 bit platforms are deployed on bintray:

**Stable v1.0**
https://bintray.com/syrel/Moz2D/libMoz2D/1.0

**Bleading edge**
https://bintray.com/syrel/Moz2D/libMoz2D
