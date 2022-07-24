# Copyright 2019 linurs.org
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit eutils
DESCRIPTION="G-code generator for 3D printers"
HOMEPAGE="https://github.com/prusa3d/PrusaSlicer/releases"
SRC_URI="${SRC_URI}
         amd64? ( https://github.com/prusa3d/PrusaSlicer/releases/download/version_2.1.0/PrusaSlicer-2.1.0+linux64-201909160925.tar.bz2 )
         "

LICENSE="|| ( GPL-3 )"
slicer_pkg_name="PrusaSlicer-2.1.0+linux64-201909160925"
SLOT="0"
KEYWORDS="amd64 ~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack(){
 if [ "${A}" != "" ]; then
      unpack ${A}
 fi

 mv ${WORKDIR}/${slicer_pkg_name} ${WORKDIR}/${P}

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
 einfo "dodir /opt/${P}" 
 dodir /opt/${P}
 einfo "cp -r ${S} ${D}opt/ || die"
 cp -r ${S} ${D}opt/ || die	

 # fix permissions
 einfo "chmod ugo+x ${D}opt/${P}/prusa-slicer"
 chmod ugo+x ${D}opt/${P}/prusa-slicer
 einfo "chmod ugo+x ${D}opt/${P}/bin/prusa-slicer"
 chmod ugo+x ${D}opt/${P}/bin/prusa-slicer

 # adds an picture to the icons
 einfo "doicon ${D}opt/${P}/resources/icons/PrusaSlicer.png"
 doicon ${D}opt/${P}/resources/icons/PrusaSlicer.png

 # create desktop file and add to menu  
 einfo "domenu ${FILESDIR}/prusaslicer.desktop"
 domenu ${FILESDIR}/prusaslicer.desktop
 einfo "sed -i 's/xxx/2.1.0/g' ${D}usr/share/applications/prusaslicer.desktop"
 sed -i 's/xxx/2.1.0/g' ${D}usr/share/applications/prusaslicer.desktop

}


