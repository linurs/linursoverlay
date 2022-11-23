# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

DESCRIPTION="piclone"

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/raspberrypi-ui/piclone.git"
	inherit git-r3

fi

HOMEPAGE="https://github.com/raspberrypi-ui/piclone/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="
	"

src_prepare() {
	einfo "Prepare the build";
	${WORKDIR}/piclone-9999/autogen.sh	
	eapply_user
	einfo "Source prepared";
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}
