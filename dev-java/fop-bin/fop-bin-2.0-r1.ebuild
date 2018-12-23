# Copyright 2018 linurs.org
# Freeware
# $Header: $

EAPI=5

DESCRIPTION="Apache Fop binary"
HOMEPAGE="https://xmlgraphics.apache.org/fop/"
SRC_URI="http://mirror.easyname.ch/apache/xmlgraphics/fop/binaries/fop-2.0-bin.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
offo_pkg_name="offo-hyphenation-bin-2.2"

fop_pkg_name="fop-${PV}"
offo_ebuild_name="dev-java/${offo_pkg_name}"

RDEPEND=">=${offo_ebuild_name}"
DEPEND="${RDEPEND}"

src_unpack(){
 if [ "${A}" != "" ]; then
      unpack ${A}
 fi
 mv ${WORKDIR}/${fop_pkg_name} ${WORKDIR}/${P}
}

src_install() {
 dodir /opt/${P}
 mv ${S} ${D}opt || die	
 ln -s /opt/${offo_pkg_name}/fop-hyph.jar ${D}opt/${P}/lib/
 dosym /opt/${P}/fop /usr/bin/fop-bin
}
