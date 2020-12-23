# Copyright 2015 linurs.org
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils 
DESCRIPTION="bitscope meter"
HOMEPAGE="http://www.bitscope.com/"
SRC_URI="${SRC_URI}
         x86?   ( http://bitscope.com/download/files/bitscope-meter_2.0.FK22G_i386.deb )
         amd64? ( http://bitscope.com/download/files/bitscope-meter_2.0.FK22G_amd64.deb )"
LICENSE=""

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RDEPEND=""
DEPEND=""

src_unpack(){ 
  unpack ${A}

#  einfo "P=${P}" 
#  einfo "PN=${PN}" 
#  einfo "PV=${PV}" 
#  einfo "PR=${PR}" 
#  einfo "A=${A}" 
#  einfo "D=${D}" 
#  einfo "S=${S}" 
#  einfo "WORKDIR=${WORKDIR}"
#  einfo "FILESDIR=${FILESDIR}"

  mkdir ${WORKDIR}/${P}
  mv ${WORKDIR}/data.tar.gz ${WORKDIR}/${P}
  cd ${WORKDIR}/${P}/
  tar -xzf ${WORKDIR}/${P}/data.tar.gz
  rm -f ${WORKDIR}/${P}/data.tar.gz
  #rm -fr ${WORKDIR}/${P}/etc
}

src_install() {
 # Install in /opt
 dodir /opt/${P}
 mv ${S} ${D}opt || die	

 # adds an picture to the icons
 doicon ${D}opt/${P}/usr/share/pixmaps/bitscope-meter.png
 
 # fix the path inside the desktop file since it will be installed in opt
 sed -i 's/\/usr\/bin\/bitscope-meter/\/opt\/bitscope-meter-bin-2.0\/usr\/bin\/bitscope-meter/g' ${D}opt/${P}/usr/share/applications/bitscope-meter.desktop
 domenu ${D}opt/${P}/usr/share/applications/bitscope-meter.desktop

}



