FLEXDIR = ~/Downloads/flex_sdk_4.6
ALLFLAGS = -source-path FlashPunk
DEBUG = Debug
DEBUGFLAGS = $(ALLFLAGS) -static-link-runtime-shared-libraries -debug=true -use-network=false
RELEASE = Release
RELEASEFLAGS = $(ALLFLAGS) -static-link-runtime-shared-libraries -debug=false -use-network=true

debug:
	$(FLEXDIR)/bin/mxmlc $(DEBUG).as $(DEBUGFLAGS)

release:
	$(FLEXDIR)/bin/mxmlc $(RELEASE).as $(RELEASEFLAGS)

clean:
	rm $(DEBUG).swf
	rm $(RELEASE).swf

all:
	debug
