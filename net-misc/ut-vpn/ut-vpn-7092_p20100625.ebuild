inherit toolchain-funcs

MY_P="${P/_p/-}"
DESCRIPTION="UT-VPN"
HOMEPAGE=""
SRC_URI="http://utvpn.tsukuba.ac.jp/files/beta/utvpn-src-unix-v100-7092-beta-2010.06.25.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd ~x86-dfbsd"
IUSE="elibc_FreeBSD elibc_DragonFlyBSD utf8"

DEPEND="dev-libs/openssl
	sys-libs/readline
	sys-libs/zlib
	sys-libs/ncurses
	elibc_FreeBSD? ( sys-libs/freebsd-lib dev-libs/libiconv )
	elibc_DragonFlyBSD? ( sys-libs/dfbsd-lib dev-libs/libiconv )"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/utvpn-unix-v100-7092-beta

src_unpack() {
	unpack ${A}
	cd "${S}"

	local makefile=""
	if use x86 ;then
		makefile="linux_32bit_ja.mak"
	elif use amd64 ;then
		makefile="linux_64bit_ja.mak"
	elif use x86-fbsd || use x86-dfbsd ;then
		makefile="freebsd_32bit_ja.mak"
	fi
	cp makefiles/${makefile} Makefile || die

	sed -i \
		-e "s/-O2/${CFLAGS} ${myflag}/g" \
		-e "/^CC=/s:gcc:$(tc-getCC):" \
		-e "/^INSTALL_/s:=/:=${D}/:" Makefile || die
}

src_compile() {
	emake || die
}

src_install() {
	dodir /usr/bin
	emake install || die

	for x in utvpnserver utvpnclient utvpncmd; do
		sed -i -e "s:${D}:${EROOT}:" "${D}"/usr/bin/$x || die
	done
}
