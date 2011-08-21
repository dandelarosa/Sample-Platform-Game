FLEXDIR = ~/Applications/flex_sdk/
DEBUG = Debug
DEBUGFLAGS = -static-link-runtime-shared-libraries -use-network=false
RELEASE = Release
RELEASEFLAGS = -static-link-runtime-shared-libraries -use-network=true

debug:
	$(FLEXDIR)/bin/mxmlc $(DEBUG).as $(DEBUGFLAGS)

release:
	$(FLEXDIR)/bin/mxmlc $(RELEASE).as $(RELEASEFLAGS)

clean:
	rm $(DEBUG).swf
	rm $(RELEASE).swf

all:
	debug
