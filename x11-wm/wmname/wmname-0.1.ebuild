EAPI="2"

DESCRIPTION="wmname prints/sets the window manager name property of the root
window similar to how hostname(1) behaves."
HOMEPAGE="http://tools.suckless.org/wmname"
SRC_URI="http://dl.suckless.org/tools/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_install() {
	dodoc README
	exeinto /usr/bin
	doexe "${PN}"
}
