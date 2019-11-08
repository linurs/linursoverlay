# Copyright 2019 linurs.org
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils fdo-mime gnome2-utils
DESCRIPTION="G-code generator for 3D printers"
HOMEPAGE="http://slic3r.org/"
SRC_URI="${SRC_URI}
         amd64?   ( https://dl.slic3r.org/linux/slic3r-1.3.0-linux-x64.tar.bz2 )
         "

LICENSE="|| ( GPL-3 )"
slic3r_pkg_name="Slic3r"
SLOT="0"
KEYWORDS="amd64 ~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack(){
 if [ "${A}" != "" ]; then
      unpack ${A}
 fi

 mv ${WORKDIR}/${slic3r_pkg_name} ${WORKDIR}/${P}

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
 # Install slic3r in /opt
 dodir /opt/${P}
 cp -r ${S} ${D}opt || die	

 # adds an picture to the icons
 doicon ${D}opt/${P}/var/Slic3r.png

 # create desktop file and add to menu  
 domenu ${FILESDIR}/Slic3r.desktop
 sed -i 's/xxx/1.3.0/g' ${D}/usr/share/applications/Slic3r.desktop

 # add the shell command
 einfo "cp ${FILESDIR}/slic3r.sh ${D}opt/${P}"  
 cp ${FILESDIR}/slic3r.sh ${D}opt/${P}

}

# update the menu after emerge and unmerge
pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
