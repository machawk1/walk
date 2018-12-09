GOFILES = $(shell find . -name '*.go' -not -path './vendor/*')

define GOPACKAGES 
github.com/datatogether/ffi \
github.com/multiformats/go-multihash \
github.com/PuerkitoBio/fetchbot \
github.com/PuerkitoBio/goquery \
github.com/PuerkitoBio/purell \
github.com/sirupsen/logrus \
github.com/spf13/cobra \
github.com/ugorji/go/codec \
github.com/datatogether/api/apiutil \
github.com/datatogether/cdxj \
github.com/dgraph-io/badger
endef

default: build

require-gopath:
	ifndef GOPATH
		$(error $$GOPATH must be set. plz check: https://github.com/golang/go/wiki/SettingGOPATH)
	endif

install-deps:
	go get -v -u $(GOPACKAGES)

list-deps:
	go list -f '{{ join .Imports "\n" }}' ./...

build:
	go build
