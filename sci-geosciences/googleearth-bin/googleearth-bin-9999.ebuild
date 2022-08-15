# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils
DESCRIPTION="googleearth"
HOMEPAGE="https://www.google.com/earth"
RESTRICT="fetch"
SRC_URI="https://www.google.com/earth/google-earth-pro-stable_current_amd64.deb"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64" 
IUSE=""
RDEPEND=""
DEPEND=""


pkg_nofetch() {
	einfo "Download debin 64 bit package from https://www.google.com/earth"
	einfo "Move it to /usr/portage/distfiles and proceed"
}

src_unpack() {
	unpack ${A}
	einfo "P=${P}"
	einfo "PN=${PN}"
	einfo "PV=${PV}"
	einfo "PR=${PR}"
	einfo "A=${A}"
	einfo "D=${D}"
	einfo "S=${S}"
	einfo "WORKDIR=${WORKDIR}"
	einfo "FILESDIR=${FILESDIR}"

	mkdir ${WORKDIR}/${P}
	mv ${WORKDIR}/data.tar.xz ${WORKDIR}/${P}
	cd ${WORKDIR}/${P}/
	tar -xvf ${WORKDIR}/${P}/data.tar.xz
 	rm -f ${WORKDIR}/${P}/data.tar.xz
}

src_install() {
        einfo "S=${S}"
        einfo "P=${P}"
        einfo "D=${D}"

	mv ${S}/* ${D} || die
}	


