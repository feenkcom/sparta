"load latest version"
EpMonitor current disable.
Metacello new
  baseline: 'Sparta';
  repository: 'github://feenkcom/sparta/src';
  load.
EpMonitor current enable.
Smalltalk snapshot: true andQuit: false.
