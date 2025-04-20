# Copyright 2025
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Token2 fido2-manage tool"
HOMEPAGE="https://github.com/Token2/fido2-manage"
EGIT_REPO_URI="https://github.com/Token2/fido2-manage.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CONFLICTS="dev-libs/libfido2"
DEPEND="sys-apps/pcsc-lite !dev-libs/libfido2"
RDEPEND="${DEPEND}"

src_configure() {
	rm -rf build || die
	mkdir build || die
	cd build || die

	cmake .. -DUSE_PCSC=ON || die
}

src_compile() {
	emake -C build
}

src_install() {
	emake -C build install DESTDIR="${D}"

	# Rename and install the gui.py file
	newbin "${WORKDIR}/${P}/gui.py" fido2-manage.py

	# Install the shell script with executable permission
	exeinto /usr/bin
	doexe "${WORKDIR}/${P}/fido2-manage.sh"
}
