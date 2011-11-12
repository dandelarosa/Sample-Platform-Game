FLEXDIR = ~/Applications/flex_sdk
ALLFLAGS = -source-path FlashPunk
DEBUG = Debug
DEBUGFLAGS = $(ALLFLAGS) -static-link-runtime-shared-libraries -use-network=false
RELEASE = Release
RELEASEFLAGS = $(ALLFLAGS) -static-link-runtime-shared-libraries -use-network=true

debug:
	$(FLEXDIR)/bin/mxmlc $(DEBUG).as $(DEBUGFLAGS)

release:
	$(FLEXDIR)/bin/mxmlc $(RELEASE).as $(RELEASEFLAGS)

clean:
	rm $(DEBUG).swf
	rm $(RELEASE).swf

all:
	debug
