publish:
	hugo
	cd public && git add . && git commit -a -m "update generated" && git push origin HEAD
