# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils git-r3
DESCRIPTION="raspberry pi imager"
HOMEPAGE="https://www.raspberrypi.com/software/"
SRC_URI="${SRC_URI}
	amd64?	( https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb )
"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 amd64"
IUSE=""
RDEPEND="net-misc/curl[gnutls]"
DEPEND=""
PROPERTIES+=" live"

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

	unpack ${A}
	mkdir "${WORKDIR}"/"${P}"
	cp -r "${WORKDIR}"/data.tar.xz "${WORKDIR}"/"${P}"
	cd "${WORKDIR}"/"${P}"/
	tar -xf "${WORKDIR}"/"${P}"/data.tar.xz
	rm -f "${WORKDIR}"/"${P}"/data.tar.xz
}

src_install() {
	# Install in /opt
	dodir /opt/${P}
	cp -r "${S}" "${D}"opt || die

	# adds an picture to the icons
	doicon "${D}"opt/"${P}"/usr/share/icons/hicolor/128x128/apps/rpi-imager.png

	# fix the path inside the desktop file since it will be installed in opt
        #Exec=rpi-imager
        #Exec=/opt/rpi-imager-bin-9999/usr/bin/rpi-imager
	sed -i 's/Exec=rpi-imager/Exec=\/opt\/rpi-imager-bin-9999\/usr\/bin\/rpi-imager/g' "${D}"opt/"${P}"/usr/share/applications/rpi-imager.desktop
	domenu "${D}"opt/"${P}"/usr/share/applications/rpi-imager.desktop

        # use a link to fix issue with library name 
        dosym /usr/lib64/libcurl.so.4 /usr/lib64/libcurl-gnutls.so.4
}
