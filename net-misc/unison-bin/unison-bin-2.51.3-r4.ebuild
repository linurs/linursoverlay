# Copyright 2025 linurs.org
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit desktop
DESCRIPTION="unison binary"
HOMEPAGE="https://www.cis.upenn.edu/~bcpierce/unison/"
SRC_URI="https://github.com/bcpierce00/unison/releases/download/v"${PV}"/unison-v"${PV}"+ocaml-4.11.1+x86_64.linux.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

pkg_name="unison"

src_unpack(){
	if [ "${A}" != "" ]; then
		einfo "unpack ${A}"
		unpack "${A}"
		mkdir "${WORKDIR}"/"${P}"
		mv "${WORKDIR}"/bin "${WORKDIR}"/"${P}"/bin
		mv "${WORKDIR}"/LICENSE "${WORKDIR}"/"${P}"/LICENSE
		mv "${WORKDIR}"/README.md "${WORKDIR}"/"${P}"/README.md
	fi

}

src_install() {
	dodir /opt/"${P}"
	cp -r "${S}" "${D}"/opt || die

	einfo "Add an picture to the icons"
	doicon "${FILESDIR}"/"${PN}".png

	einfo "Do the desktop file"
	make_desktop_entry /opt/"${P}"/bin/unison-gtk2 "${PN}" "${PN}" System
}
