# Copyright 2020 linurs.org
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils fdo-mime gnome2-utils
DESCRIPTION="FreeFileSync binary"
HOMEPAGE="https://freefilesync.org"
SRC_URI="https://freefilesync.org/download/FreeFileSync_10.23_Linux.tar.gz"
LICENSE="GPL-3"

pkg_name="FreeFileSync"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack(){
  if [ "${A}" != "" ]; then
      unpack ${A}
  fi
  mv ${WORKDIR}/${pkg_name} ${WORKDIR}/${P}
}

src_install() {
 # Install in /opt
 dodir /opt/FreeFileSync-bin-10.23
 cp -r ${S} ${D}opt || die	
  
 einfo "Do the desktop file" 
 domenu ${S}/FreeFileSync.desktop
 # fix the links in the desktop file
 sed -i 's/home\/zenju\/Desktop\/FFS\/Build/opt\/FreeFileSync\-bin\-10.23/g' ${D}usr/share/applications/FreeFileSync.desktop
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
