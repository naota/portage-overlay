# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit elisp cvs autotools

DESCRIPTION="emacs-w3m is an interface program of w3m on Emacs"
HOMEPAGE="http://emacs-w3m.namazu.org"
ECVS_SERVER="cvs.namazu.org:/storage/cvsroot"
ECVS_MODULE="emacs-w3m"

S="${WORKDIR}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="linguas_ja mime"

DEPEND="virtual/w3m"
RDEPEND="${DEPEND}
	mime? ( virtual/emacs-flim )"

SITEFILE="70${PN}-gentoo.el"

src_configure() {
	eautoconf
	econf || die "econf failed"
}

src_compile() {
	emake all-en $(useq linguas_ja && echo all-ja) || die "emake failed"
}

src_install() {
	emake lispdir="${D}${SITELISP}/${PN}" \
		infodir="${D}/usr/share/info" \
		ICONDIR="${D}${SITEETC}/${PN}" \
		install-en $(useq linguas_ja && echo install-ja) install-icons \
		|| die "emake install failed"

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
	dodoc ChangeLog* README
	use linguas_ja && dodoc README.ja
}

pkg_postinst() {
	elisp-site-regen
	einfo "Please see /usr/share/doc/${PF}/README*"
	einfo
	elog "If you want to use the shimbun library, please emerge app-emacs/apel"
	elog "and app-emacs/flim."
	einfo
}

pkg_postrm() {
	elisp-site-regen
}
