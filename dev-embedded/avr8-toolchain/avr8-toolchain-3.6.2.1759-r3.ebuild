# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Atmel avr8 toolchain"
HOMEPAGE="https://www.microchip.com/mplab/avr-support/avr-and-arm-toolchains-c-compilers"
SRC_URI="avr8-gnu-toolchain-3.6.2.1759-linux.any.x86_64.tar.gz"
LICENSE="Atmel"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="fetch"
# variable of the sub directory created after unpacking and having the files to be installed
directory_name="avr8-gnu-toolchain-linux_x86_64"

pkg_nofetch() {
	einfo "Fetch restriction turned on, downloading needs to be done manually"
	einfo "Download it from ${HOMEPAGE}"
	einfo "Then copy ${SRC_URI} to /usr/portage/distfiles and restart emerge"
}

src_unpack(){
	unpack ${A}
	mv "${WORKDIR}"/"${directory_name}" "${WORKDIR}/${P}"
}

src_install() {
	dodir /opt
	mv "${WORKDIR}"/"${P}" "${D}"opt || die
}
