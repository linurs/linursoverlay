# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop

DESCRIPTION="Nonpareil is a simulator for old HP calculator models"
HOMEPAGE="http://nonpareil.brouhaha.com"
SRC_URI="http://nonpareil.brouhaha.com/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-devel/flex
	sys-devel/bison
	dev-build/scons
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
	eapply -p1 "${FILESDIR}/nonpareil-0.79-r10.patch"
	default  # Calls the default implementation, e.g., autoreconf
}

src_compile() {
	einfo "Start to compile";
	builddir="${WORKDIR}/build"
	scons destdir=builddir prefix=/usr || die "scons compile failed"
	einfo "Compilation done";
}

src_install() {
	einfo "Start to install";
	scons destdir="${D}" prefix=/usr install || die "scons install failed"

	einfo "rename modutil into modutil_nonpareil due to file collision with the nss package";
	mv "${D}"/usr/bin/modutil "${D}"/usr/bin/modutil_nonpareil

	# install the desktop file
	einstalldocs
	domenu "${FILESDIR}/nonpareil.desktop"
}
