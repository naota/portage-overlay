# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp elisp-common git

DESCRIPTION="Emacs major mode for Twitter."
HOMEPAGE="https://github.com/kiwanami/emacs-skype"
SRC_URI=""
EGIT_REPO_URI="git://github.com/kiwanami/emacs-skype.git"

LICENSE="GPL-2 skype-component"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="net-im/skype"

src_compile() {
	elisp-compile skype.el || die
}

src_install() {
	elisp-install ${PN} *.el *.elc || die
	elisp-install ${PN}/icons icons/* || die
	elisp-install ${PN}/emoticons emoticons/* || die
}
