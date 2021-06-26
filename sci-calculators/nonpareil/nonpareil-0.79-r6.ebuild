# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils

DESCRIPTION="Nonpareil is a simulator for old HP calculator models"
SRC_URI="http://nonpareil.brouhaha.com/download/${P}.tar.gz"
HOMEPAGE="http://nonpareil.brouhaha.com"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/flex
	sys-devel/bison
	dev-util/scons
	media-libs/netpbm"

RDEPEND="x11-libs/gtk+
	dev-libs/glib
	dev-libs/libxml2
	media-libs/libsdl
	kde-frameworks/oxygen-icons"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_prepare() {
	einfo "Apply patch in ${FILESDIR}";
	epatch "${FILESDIR}/nonpareil-0.79-r6.patch"
}

src_compile() {
	einfo "Start to compile";
	scons destdir="${D}" prefix=/usr || die "scons compiled failed"
	einfo "Compilation done";
}

src_install() {
	einfo "Start to install";
	scons destdir="${D}" prefix=/usr install || die "scons install failed"
	domenu "${FILESDIR}"/nonpareil.desktop
}
