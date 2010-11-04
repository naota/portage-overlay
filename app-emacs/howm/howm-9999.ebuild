# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/howm/howm-1.3.8.ebuild,v 1.4 2010/10/14 16:46:20 ranger Exp $

EAPI=3

inherit elisp

DESCRIPTION="Note-taking tool on Emacs"
HOMEPAGE="http://howm.sourceforge.jp/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	wget http://howm.sourceforge.jp/a/howm-test.tar.gz
	tar zxf howm-test.tar.gz
	rm howm-test.tar.gz
	S="${WORKDIR}"/`ls -d howm-test*`
}

src_configure() {
	econf --with-docdir="${EPREFIX}/usr/share/doc/${PF}"
}

src_compile() {
	emake -j1 </dev/null || die "emake failed"
}

src_install() {
	emake -j1 \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		LISPDIR="${EPREFIX}${SITELISP}/${PN}" \
		install </dev/null \
		|| die "emake install failed"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
	dodoc ChangeLog || die "dodoc failed"
	prepalldocs
}

pkg_postinst() {
	elisp-site-regen
	elog "site-gentoo.el does no longer define global keybindings for howm."
	elog "Add the following line to ~/.emacs for the previous behaviour:"
	elog "  (require 'howm)"
}