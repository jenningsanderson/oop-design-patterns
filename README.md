Design Patterns
=================


Singleton
---------
"**Intent** Ensure a class only has one instance, and provide a global point of access to it" [1].

###Design
The only way to access the class is through the one instance.  The best way to do this is probably to protect or make private the constructors [1].

Implementations of this pattern include loggers and database connections [2].




Chain of Responsibility
-----------------------
"**Intent** Avoid coupling by giving more than one object a chance to handle a request.  Pass request along the chain until an object handles it" [1]

###Design
The first object in the chain receives the request and either handles it or forwards it to the next candidate on the chain, which does likewise







Command
-------
"**Intent** Encapsulate a request as an object, thereby letting you parameterize clients with different requests, que or log requests, and support undoable operations."

###Design
An abstract command class which declares an interface for executing operations.




##References
[1] Gamma, Helm, Johnson, Vlissides.  Design Patterns: Elements of Reusable Object-Oriented Software (Gang of Four)
[2] Nasevic, Dalibor  http://dalibornasevic.com/posts/9-ruby-singleton-pattern
