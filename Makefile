GITHUB_PAGES_BRANCH=gh-pages

html:
	hugo --theme=srg

develop:
	hugo server --theme=srg --watch

github: html
	git add -A
	git commit -m "Rebuilt site"
	git push origin master
	git subtree push --prefix=public https://evansuva@github.com/uvasrg/ssoscan.git gh-pages


.PHONY: html clean develop
