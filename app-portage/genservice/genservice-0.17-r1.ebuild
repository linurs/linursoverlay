# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple tool for everyday emerge commands."
SRC_URI="http://www.linurs.org/download/${P}.tar.gz"
HOMEPAGE="http://www.linurs.org"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""
DISTUTILS_USE_SETUPTOOLS=no

DEPEND="
>=app-portage/gentoolkit-0.2.4.5
>=dev-python/pylinurs-0.2-r4
"

RDEPEND=""

src_unpack(){
        einfo "P=${P}"
	einfo "PN=${PN}"
	einfo "PV=${PV}"
	einfo "PR=${PR}"
	einfo "A=${A}"
	einfo "D=${D}"
	einfo "S=${S}"
	einfo "WORKDIR=${WORKDIR}"
	einfo "FILESDIR=${FILESDIR}"
	
	mkdir "${WORKDIR}"/"${P}"
	cd "${WORKDIR}"/"${P}"/
        unpack ${A}
}

src_install() {
	exeinto /usr/bin
	doexe genservice.py
	dosym genservice.py /usr/bin/genservice

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
