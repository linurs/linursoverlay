# Copyright 2025 Urs Lindegger
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple tool for developing ebuilds."
HOMEPAGE="http://www.linurs.org"
SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
>=dev-python/pylinurs-0.3
"

RDEPEND="${DEPEND}"

src_unpack(){
	mkdir "${WORKDIR}"/"${P}"
	cd "${WORKDIR}"/"${P}"/
	unpack ${A}
}

src_install () {
	exeinto /usr/bin
	doexe ebuildtool.py
	dosym ebuildtool.py /usr/bin/ebuildtool
	insinto /etc/ebuildtool
	doins ebuildtool_def.py
}

pkg_postinst() {
	einfo "Please read and edit /etc/ebuildtool/ebuildtool_def.py"
}
