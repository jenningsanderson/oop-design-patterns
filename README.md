Design Patterns
=================


1. Singleton
---------

"**Intent** Ensure a class only has one instance, and provide a global point of access to it" [1].

####Design
The only way to access the class is through the one instance.  The best way to do this is probably to protect or make private the constructors [1].

Implementations of this pattern include loggers and database connections [2].




2. Chain of Responsibility
-----------------------

"**Intent** Avoid coupling by giving more than one object a chance to handle a request.  Pass request along the chain until an object handles it" [1]

####Design
Requires a very specific structure to be useful, typically UI

- Useful for UI design: Help menus
- Useful for Loggers






3. Command
-------

"**Intent** Encapsulate a request as an object, thereby letting you parameterize clients with different requests, que or log requests, and support undoable operations" [1].

####Design
An abstract command class which declares an interface for executing operations.

Using commands such as “execute” or “unexecute” allows the following:
	
	commands.each{ |command| command.execute}





4. Bridge
--------

Decouple an instance from its implementation by abstracting the implementation as well [4].



5. Strategy
--------

Encapsulate each algorithm in a group, making them interchangeable.  This allows algorithms to vary independently from clients that use them [4].



6. Template
--------

Abstract Class has methods that act as placeholders, concrete implementations override each of these [4].



##References
1. Gamma, Helm, Johnson, Vlissides.  Design Patterns: Elements of Reusable Object-Oriented Software (Gang of Four)
2. Nasevic, Dalibor  http://dalibornasevic.com/posts/9-ruby-singleton-pattern
3. Slocum, Nick		https://github.com/nslocum/design-patterns-in-ruby
4. Freeman, Eric, et al. Head First design patterns. Sebastopol, CA: O'Reilly, 2004. Print.

