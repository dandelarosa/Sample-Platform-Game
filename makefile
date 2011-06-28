FLEXDIR = ~/Applications/flex_sdk/
DEBUG = Main
DEBUGFLAGS = -static-link-runtime-shared-libraries -use-network=false
RELEASE = Main
RELEASEFLAGS = -static-link-runtime-shared-libraries -use-network=true

debug:
	$(FLEXDIR)/bin/mxmlc $(DEBUG).as $(DEBUGFLAGS)

release:
	$(FLEXDIR)/bin/mxmlc $(RELEASE).as $(RELEASEFLAGS)

clean:
	rm $(DEBUG).swf

all:
	debug
