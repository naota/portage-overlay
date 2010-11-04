# Copyright 2010 Naohiro Aota
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit git autotools

DESCRIPTION="Emacs T-Code input method."
HOMEPAGE="http://openlab.ring.gr.jp/tcode/index.html"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc"

EGIT_REPO_URI="git://github.com/naota/tc.git"

DEPEND="sys-devel/automake:1.4"

src_prepare() {
	use doc || sed -i -e '/^SUBDIRS =/s/doc//' Makefile.am
	elibtoolize
}

src_configure() {
	econf || die "econf failed"
}

src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	(cd lisp; einstall) || die "einstall failed"
	(cd etc; einstall DESTDIR="${D}") || die "einstall failed"
}
