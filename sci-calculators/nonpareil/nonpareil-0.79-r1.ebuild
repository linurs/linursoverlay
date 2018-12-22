# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $
inherit eutils

DESCRIPTION="Nonpareil is a simulator for old HP calculator models"
SRC_URI="http://nonpareil.brouhaha.com/download/${P}.tar.gz"
HOMEPAGE="http://nonpareil.brouhaha.com"

SLOT="0"
LICENSE=""
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-devel/flex
        sys-devel/bison
        dev-util/scons
        media-libs/netpbm"

RDEPEND="x11-libs/gtk+
         dev-libs/glib
         dev-libs/libxml2
         media-libs/libsdl"


src_unpack() {
   unpack ${A}
   cd "${S}"

   einfo "Apply patch in ${FILESDIR}"; 
   epatch "${FILESDIR}/nonpareil-0.79-r1.patch"
}


src_compile() {	

   scons || die "scons compiled failed" 
}

src_install() {
   scons destdir="${D}" install || die "scons install failed"
}