accessing
instances
	^ instances ifNil: [ instances := WeakValueDictionary new ]