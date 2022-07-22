# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils
DESCRIPTION="bitscope chart"
HOMEPAGE="http://www.bitscope.com/"
SRC_URI="${SRC_URI}
	x86?	( http://bitscope.com/download/files/bitscope-chart_2.0.FK22M_i386.deb )
	amd64?	( http://bitscope.com/download/files/bitscope-chart_2.0.FK22M_amd64.deb )"
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
	doicon "${D}"opt/"${P}"/usr/share/pixmaps/bitscope-chart.png
	# fix the path inside the desktop file since it will be installed in opt
	sed -i 's/\/usr\/bin\/bitscope-chart/\/opt\/bitscope-chart-bin-2.0\/usr\/bin\/bitscope-chart/g' "${D}"opt/"${P}"/usr/share/applications/bitscope-chart.desktop
	# remove the icon file extension
	sed -i 's/.png//g' "${D}"opt/"${P}"/usr/share/applications/bitscope-chart.desktop
	# remove the deprecated value Application
	sed -i 's/;Application//g' "${D}"opt/"${P}"/usr/share/applications/bitscope-chart.desktop
	domenu "${D}"opt/"${P}"/usr/share/applications/bitscope-chart.desktop
}