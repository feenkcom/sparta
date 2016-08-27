I am an abstract sparta lint rule. I only check classes and methods from sparta related packages.

I check a provided entity (method, class, package) and answer if provided entity does not pass my constraints.

I automatically get integrated in quality assistant and in Nautilus.

Public API and Key Messages

- packagesToCheck an array of package names that I work with.
- checkEntity: return true if entity does not pass my rule
- shouldCheck: return true if a rule needs to check provided entity

   I am an abstract class, see my leaf subclasses for concrete examples
 
Internal Representation and Key Implementation Points.

	My subclasses must implement checkEntity: and shouldCheck: