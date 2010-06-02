# integrator between neurospaces_build and the documentation system.

SUBDIRS =

dist_bin_SCRIPTS = \
	bin/publications-build \
	bin/publications-check \
	bin/publications-sync \
	bin/publications-version \
	bin/publications-create \
	bin/publications-rename

dist_noinst_SCRIPTS = \
	TODO.txt

#cable-theory-disgression/cable-theory-disgression.tex

RELEASE_MAJOR=`release-extract --major`
RELEASE_MINOR=`release-extract --minor`
RELEASE_MICRO=`release-extract --micro`

show-release-labels:
	echo "Release information (major-minor-micro): $(RELEASE_MAJOR).$(RELEASE_MINOR)-$(RELEASE_MICRO)"

dist-keywords:
	release-expand publications $(RELEASE_MAJOR) $(RELEASE_MINOR) $(RELEASE_MICRO) $(RELEASE_MAJOR).$(RELEASE_MINOR) hugo.cornelis@gmail.com --verbose
#	release-expand neurospacesread des 10 0 des-10 hugo.cornelis@gmail.com --verbose

clean-local: website-clean
	find $(srcdir) -type d -exec chmod -R u+w \{\} \;
	$(RM) -fr `find $(srcdir) -name _Inline`
	$(RM) -rf $(top_srcdir)/*/output/*
	$(RM) -f $(top_srcdir)/*/*.log
	$(RM) -rf $(top_srcdir)/*.deb
	$(RM) -f $(top_srcdir)/*.changes
	$(RM) -f $(top_srcdir)/*.dsc
	$(RM) -f $(top_srcdir)/build_debian.log
	$(RM) -rf $(top_srcdir)/RPM_BUILD
	$(RM) -f $(top_srcdir)/build_rpm.log
	$(RM) -f $(top_srcdir)/exchange-*.tar.gz
#	$(RM) -fr $(srcdir)/hierarchy/output
#	$(RM) -rf $(top_srcdir)/docs/html

TESTS = /usr/local/bin/neurospaces_harness

test: check

html-upload-prepare:
	( cd tests && ./tests_2_html --introduction introduction.html )
	$(srcdir)/install-sh -d html
	$(srcdir)/install-sh -d html/htdocs
	$(srcdir)/install-sh -d html/htdocs/neurospaces_project
	$(srcdir)/install-sh -d html/htdocs/neurospaces_project/publications
	$(srcdir)/install-sh -d html/htdocs/neurospaces_project/publications/html_source
	tar cfh - tests/html | ( cd html/htdocs/neurospaces_project/publications && tar vxf - )

html-upload: html-upload-prepare
	scp -pr html/htdocs/* hcornelis,neurospaces@web.sourceforge.net:/home/groups/n/ne/neurospaces/htdocs/

website-clean:
	$(RM) -fr html/htdocs/neurospaces_project/publications/

website-prepare:
	publications-build --tags published

website-prepare-local:
	publications-build --tags local --tags published

website-upload: website-clean website-prepare html-upload

webcheck:
	rm -rf html/htdocs/neurospaces_project/publications/webcheck
	mkdir html/htdocs/neurospaces_project/publications/webcheck
	webcheck -o html/htdocs/neurospaces_project/publications/webcheck html/htdocs/neurospaces_project/publications --redirects=10

docs-level1:

docs-level2:

docs-level3: html-upload-prepare
	echo "Converted the regression tests to HTML"

docs-level4:

docs-level5:

docs-level6:

docs-level7:

docs: docs-level1 docs-level2 docs-level3 docs-level4 docs-level5 docs-level6 docs-level7

TMP_DIR = tmp

# Create a deb package
pkg-deb: dist
	nspkg-deb $(TMP_DIR) $(PACKAGE) $(VERSION)

# Create an rpm package
pkg-rpm: dist
	nspkg-rpm $(PACKAGE) $(VERSION)
