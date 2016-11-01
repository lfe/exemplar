PROJECT = exemplar
ROOT_DIR = $(shell pwd)
REPO = $(shell git config --get remote.origin.url)
LFE = _build/dev/lib/lfe/bin/lfe
REBAR = `which rebar3 || ./rebar3`

include priv/make/code.mk
include priv/make/docs.mk
