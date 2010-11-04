# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp elisp-common

DESCRIPTION="Emacs's window(frame) and session manager"
HOMEPAGE="http://www.gentei.org/~yuuji/software/"

LICENSE="freedist"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	wget http://www.gentei.org/~yuuji/software/windows.el http://www.gentei.org/~yuuji/software/revive.el
}
