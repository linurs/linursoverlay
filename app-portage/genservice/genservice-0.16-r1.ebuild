# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Simple tool for everyday emerge commands."
SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
HOMEPAGE="http://www.linurs.org"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=app-portage/gentoolkit-0.2.4.5"
RDEPEND=""

src_install () {
	exeinto /usr/bin
	doexe genservice.py
	dosym "${EPREFIX}"/usr/bin/genservice.py /usr/bin/genservice

	doexe gentooconfig.py
	doexe gentooprofile.py
	doexe gentoouse.py

	doman genservice.1
	insinto /etc/genservice
	doins genservice_def.py
}

pkg_postinst() {
	echo
	einfo "Please edit /etc/genservice/genservice_def.py"
}
