# Copyright 2018 linurs.org
# Freeware
# $Header: $

EAPI=5

DESCRIPTION="Apache Fop binary"
HOMEPAGE="https://xmlgraphics.apache.org/fop/"
SRC_URI="http://mirror.easyname.ch/apache/xmlgraphics/fop/binaries/fop-2.2-bin.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=dev-java/offo-hyphenation-bin-2.2"
DEPEND="${RDEPEND}"

fop_pkg_name="fop-2.2"

src_unpack(){
 if [ "${A}" != "" ]; then
      unpack ${A}
 fi
 mv ${WORKDIR}/${fop_pkg_name} ${WORKDIR}/${P}
 
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

src_install() {
 # Install in /opt
 dodir /opt/${P}
 mv ${S} ${D}opt || die	
 ln -s /opt/offo-hyphenation-bin-2.2/fop-hyph.jar ${D}opt/${P}/fop/lib/
 dosym /opt/${P}/fop/fop /usr/bin/fop-bin
}
