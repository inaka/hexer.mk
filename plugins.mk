# Copyright (c) 2015, Erlang Solutions Ltd.
# This file is part of erlang.mk and subject to the terms of the ISC License.

.PHONY: hexer distclean-hexer

# Configuration.

HEXER_MK_VERSION := 1.1.0

HEXER_CONFIG ?= $(CURDIR)/hexer.config

HEXER ?= $(CURDIR)/hexer
export HEXER

HEXER_URL ?= https://github.com/inaka/hexer/releases/download/stable/hexer

# Core targets.

help::
	$(verbose) printf "%s\n" "" \
		"hexer.mk targets:" \
		"  hex-register   Register a new user using an valid email" \
		"  hex-auth       Generate a new API key with existing user and password" \
		"  hex-publish    Publish current project in hex.pm" \
		"  hex-docs       Publish current project docs in hexdocs.pm"

distclean:: distclean-hexer

# Plugin-specific targets.

$(HEXER):
	$(gen_verbose) $(call core_http_get,$(HEXER),$(HEXER_URL))
	$(verbose) chmod +x $(HEXER)


hex-register: $(HEXER)
	$(verbose) $(HEXER) user.register

hex-auth: $(HEXER)
	$(verbose) $(HEXER) user.auth

hex-publish: $(HEXER) app
	$(verbose) $(HEXER) publish

hex-docs: $(HEXER) edoc
	$(verbose) $(HEXER) publish.docs

distclean-hexer:
	$(gen_verbose) rm -rf $(HEXER)
