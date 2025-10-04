# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 cmake

DESCRIPTION="mbpoll a modbus command line utility"
HOMEPAGE="https://github.com/epsilonrt/mbpoll"
EGIT_REPO_URI="https://github.com/epsilonrt/mbpoll.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
RESTRICT="mirror"   # do not try to fetch from gentoo mirrors
# mirror: do not try to fetch from gentoo mirrors

# Build-time dependencies for host tools
BDEPEND="
	virtual/pkgconfig
"

# Dependencies required for both build and runtime (linked libraries)
DEPEND="
	>=dev-libs/libmodbus-3.1.4
"
