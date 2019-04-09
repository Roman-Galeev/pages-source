.PHONY=sanity publish update

BINDEP=hugo curl jq

update: publish
	git add content
	git commit -a -m "Update content"

sanity:
	@for bindep in $(BINDEP); do type $$bindep >/dev/null 2>&1 || (echo "Please install $$bindep" ; exit 1) done

publish:
	hugo
	cd public && git add . && git commit -a -m "update generated" && git push origin HEAD

