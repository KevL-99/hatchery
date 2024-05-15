system := sui


module-path := $(dir $(lastword $(MAKEFILE_LIST)))
module-cache-path := $(module-path).cache/


include src/generic/build.mk
include src/generic/diablo.mk
include src/generic/prepare.mk
include src/generic/system.mk


.PHONY: stop
stop: clean/$(system)/.cache

.PHONY: clean/$(system)/.cache

define template

  clean/$(system)/.cache:
	$$(call cmd-clean, $(module-cache-path))

endef

$(eval $(call template))

undefine template
