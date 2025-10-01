# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop
DESCRIPTION="Raspberry Pi Imager binary image "
HOMEPAGE="https://www.raspberrypi.com/software"
SRC_URI="${SRC_URI}
	amd64?	( https://downloads.raspberrypi.com/imager/imager_latest_amd64.deb )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror strip"
# mirror: do not try to fetch from gentoo mirrors
# strip:  prevents stripping the binary, rpi-imager will not run when stripped

desktop_file="${WORKDIR}"/"${P}"/usr/share/applications/org.raspberrypi.rpi-imager.desktop

src_unpack(){
	unpack ${A}

	mkdir "${WORKDIR}"/"${P}"
	mv "${WORKDIR}"/data.tar.zst "${WORKDIR}"/"${P}"
	cd "${WORKDIR}"/"${P}"/
	tar -xf "${WORKDIR}"/"${P}"/data.tar.zst
	rm -f "${WORKDIR}"/"${P}"/data.tar.zst
}

src_prepare(){
	default
	# fix the path inside the desktop file since it will be installed in opt
	einfo "Prepare the desktop_file ${desktop_file}"
	sed -i 's/\/usr\/bin\/rpi-imager/\/opt\/rpi-imager-bin-9999\/usr\/bin\/rpi-imager/g' "${desktop_file}"
}

src_install() {
	cp -a "${WORKDIR}/." "${D}/opt/" || die

	# adds now the desktop file outside /opt
	domenu "${desktop_file}"

	# adds an picture to the icons
	icon_file="${D}"/opt/"${P}"/usr/share/icons/hicolor/128x128/apps/rpi-imager.png
	doicon "${icon_file}"

	# removes not necessary stuff
	rm "${D}/opt/control.tar.zst"
	rm "${D}/opt/debian-binary"
	# remove icon and desktop file under opt
	rm -r "${D}"/opt/"${P}/usr/share/applications"
	rm -r "${D}"/opt/"${P}/usr/share/icons"

}
