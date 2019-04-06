publish:
	hugo
	cd public && git add . && git commit -a -m "update generated" && git push origin HEAD

update: publish
	git add content
	git commit -a -m "Update content"
