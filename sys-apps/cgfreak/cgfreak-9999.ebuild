# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git multilib

DESCRIPTION="control group visualization and manipulation tool"
HOMEPAGE="http://sourceforge.net/projects/cgfreak/"
SRC_URI=""

EGIT_REPO_URI="git://cgfreak.git.sourceforge.net/gitroot/cgfreak/cgfreak"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc"
RESTRICT="test"

DEPEND=""
RDEPEND="dev-libs/libcgroup
	dev-python/pycairo
	dev-python/pygtk:2"

src_install() {
	dodoc README
	use doc && dodoc -r web

	local dir=/usr/libexec/${PN}
	insinto ${dir}
	doins cgroups.py grouping.py ostime.py piechart.py pylibcgroup.py \
		scheduledialog.py task.py
	exeinto ${dir}
	doexe cgfreak.py

	dosym ${dir}/cgfreak.py /usr/bin/cgfreak.py
}
