# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp elisp-common git

DESCRIPTION="Emacs major mode for Twitter."
HOMEPAGE="http://twmode.sourceforge.net/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/hayamiz/twittering-mode.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc"

DEPEND=""
RDEPEND="app-crypt/gnupg"

src_compile() {
	elisp-compile twittering-mode.el || die
	use doc && emake -C doc/manual
}

src_test() {
	emake check || die
}

src_install() {
	use doc && dodoc doc/manual/twmode/twmode.html
	elisp-install ${PN} twittering-mode.el *.elc || die
}
