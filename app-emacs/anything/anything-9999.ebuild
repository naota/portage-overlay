# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp elisp-common git

DESCRIPTION="Open anything - QuickSilver-like candidate-selection framework"
HOMEPAGE="http://www.emacswiki.org/emacs/Anything"
EGIT_REPO_URI="git://repo.or.cz/anything-config.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-util/global[emacs]
	app-emacs/ipa"

src_compile() {
	:
}

src_install() {
	elisp-install ${PN} *.el
	elisp-install ${PN}/extensions extensions/*.el || die
}
