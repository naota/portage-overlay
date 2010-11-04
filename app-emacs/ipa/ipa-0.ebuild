# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp elisp-common

DESCRIPTION="In-place annotations"
HOMEPAGE="http://www.emacswiki.org/emacs/ipa.el"
SRC_URI="http://www.emacswiki.org/emacs/download/ipa.el"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	cp "${DISTDIR}"/ipa.el .
}
