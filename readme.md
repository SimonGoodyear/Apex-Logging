## Apex Logging

This project is aimed to provide a consistent way to log information from within Apex code on the Force.com platform. 

### How does this class help me?

The idea is to provide a centralised logging system that provides more functionality to developers than just system.debug. This could include things such as controlling when logging occurs and allowing logs to be generated from within managed packages to name two initial benefits.

There is also the start of a [Loggly](http://loggly.com) client for Apex in this project. It currently only sends log information to Loggly via their simple ReST interface but it could easily be extended to provide a much richer client that interacts through the complete Loggly [API](http://wiki.loggly.com/apidocumention)

### What's still missing?

Lots of things - at the minute this is very much a starting point.

Some of the things I believe are currently missing (by no means is this a complete list):

+ Test Coverage - currently there's none at all mainly because I haven't really thought through what assertions make sense.
+ Being the kind of guy I am I'd like to be able to inject different Logging clients into the main logging class, hence giving us the choice of where to log whilst maintaining a consistent approach to what is logged and how that logging is invoked.
+ Development of the Loggly client.
+ Inclusion of other logging clients

### Who's contributed to this?

So far only I have worked on this project, please join in and help shape the future of logging!

### How's it licensed?

The project is licensed under the [BSD 2 clause license](http://www.opensource.org/licenses/bsd-license.php).