mk_cmd = uvx --with mkdocs-material mkdocs

.PHONY: all
all: run

.PHONY: run
run:
	$(mk_cmd) serve

.PHONY: build
build:
	$(mk_cmd) build

.PHONY: clean
clean:
	rm -rf ./site

.PHONY: caddy
caddy:
	caddy run --config Caddyfile.dev --adapter caddyfile

prod:
	rsync -avz --exclude='.git/' --exclude='node_modules/' --exclude='.cache/' --exclude='site/' . appuser@multinear.com:/opt/apps/multinear-42
	ssh -t appuser@multinear.com 'bash -l -c "cd /opt/apps/multinear-42/ && $(mk_cmd) build"'
