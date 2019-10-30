# $Header: $
# 
EAPI=5
#inherit eutils fdo-mime gnome2-utils
DESCRIPTION="Atmel avr8 toolchain"
HOMEPAGE="https://www.microchip.com/mplab/avr-support/avr-and-arm-toolchains-c-compilers"

SRC_URI="avr8-gnu-toolchain-3.6.2.1759-linux.any.x86_64.tar.gz"

RESTRICT="fetch"
LICENSE="Atmel"
# variable of the sub directory created after unpacking and having the files to be installed
directory_name="avr8-gnu-toolchain-linux_x86_64"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

pkg_nofetch() {
	einfo "Fetch restriction turned on, downloading needs to be done manually"
	einfo "Download it from ${HOMEPAGE}"
        einfo "Then copy ${SRC_URI} to /usr/portage/distfiles and restart emerge"

  einfo "P=${P}" 
  einfo "PN=${PN}" 
  einfo "PV=${PV}" 
  einfo "PR=${PR}" 
  einfo "A=${A}" 
  einfo "D=${D}" 
  einfo "S=${S}" 
  einfo "WORKDIR=${WORKDIR}"
  einfo "FILESDIR=${FILESDIR}"
}

src_unpack(){
 unpack ${A}
 mv ${WORKDIR}/${directory_name} ${WORKDIR}/${P}
}

src_install() {
 # Install in /opt
 dodir /opt
 mv ${WORKDIR}/${P} ${D}opt || die	
}
