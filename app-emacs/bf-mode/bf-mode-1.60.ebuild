# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit elisp elisp-common

DESCRIPTION="emacs-w3m is an interface program of w3m on Emacs"
HOMEPAGE="http://emacs-w3m.namazu.org"
SRC_URI="http://www.bookshelf.jp/pukiwiki/pukiwiki.php?plugin=attach&pcmd=open&file=bf-mode.el&refer=MeadowMemo%2Fdired%A4%C7%A5%D5%A5%A1%A5%A4%A5%EB%A4%CE%C6%E2%CD%C6%A4%F2%C9%BD%BC%A8%A1%BDbf-mode"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_unpack() {
	cp "${DISTDIR}/${A}" bf-mode.el
}

