# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 cmake

DESCRIPTION="hdcp for intel"
HOMEPAGE="https://github.com/intel/hdcp"
EGIT_REPO_URI="https://github.com/intel/hdcp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	einfo "Source prepare";
	cmake_src_prepare
	einfo "Source prepared";
}

src_configure() {
	einfo "Source configure";
	cmake_src_configure
	einfo "Source configured";
}
