# hexer.mk

erlang.mk external plugin for hexer

## Usage

In order to include this plugin in your project you just need to add the
following in your Makefile:

```make
BUILD_DEPS = hexer_mk

dep_hexer_mk = git https://github.com/inaka/hexer.mk.git 1.0.0

DEP_PLUGINS = hexer_mk
```

## Help

Run `make help` in order to check what targets are available for
`hexer.mk`.
