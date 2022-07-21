# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils
DESCRIPTION="bitscope logic"
HOMEPAGE="http://www.bitscope.com/"
SRC_URI="${SRC_URI}
	x86?   ( http://bitscope.com/download/files/bitscope-logic_1.2.FC20C_i386.deb )
	amd64? ( http://bitscope.com/download/files/bitscope-logic_1.2.FC20C_amd64.deb )"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND=""
DEPEND=""

src_unpack(){
	unpack ${A}

	mkdir "${WORKDIR}"/"${P}"
	mv "${WORKDIR}"/data.tar.gz "${WORKDIR}"/"${P}"
	cd "${WORKDIR}"/"${P}"/
	tar -xzf "${WORKDIR}"/"${P}"/data.tar.gz
	rm -f "${WORKDIR}"/"${P}"/data.tar.gz
}

src_install() {
	# Install in /opt
	dodir /opt/${P}
	mv "${S}" "${D}"opt || die

	# adds an picture to the icons
	doicon "${D}"opt/"${P}"/usr/share/pixmaps/bitscope-logic.png
	# fix the path inside the desktop file since it will be installed in opt
	sed -i 's/\/usr\/bin\/bitscope-logic/\/opt\/bitscope-logic-bin-1.2\/usr\/bin\/bitscope-logic/g' "${D}"opt/"${P}"/usr/share/applications/bitscope-logic.desktop
	# remove the icon file extension
	sed -i 's/.png//g' "${D}"opt/"${P}"/usr/share/applications/bitscope-logic.desktop
	# remove the deprecated value Application
	sed -i 's/;Application//g' "${D}"opt/"${P}"/usr/share/applications/bitscope-logic.desktop
	domenu "${D}"opt/"${P}"/usr/share/applications/bitscope-logic.desktop
}
