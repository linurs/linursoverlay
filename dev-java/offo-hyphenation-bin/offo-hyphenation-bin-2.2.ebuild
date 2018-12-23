# Copyright 2018 linurs.org
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Offo Hyphenation binary"
HOMEPAGE="http://offo.sourceforge.net"
SRC_URI="https://vorboss.dl.sourceforge.net/project/offo/offo-hyphenation/2.2/offo-hyphenation-compiled.zip"
LICENSE="GPL-2 Apache-2.0 LPPL-1.3b TeX"
offo_pkg_name="offo-hyphenation-compiled"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack(){
 if [ "${A}" != "" ]; then
      unpack ${A}
 fi
 mv ${WORKDIR}/${offo_pkg_name} ${WORKDIR}/${P}
 
}

src_install() {
 # Install in /opt
 dodir /opt/offo-hyphenation-bin-2.2
 mv ${S} ${D}opt || die	
}
