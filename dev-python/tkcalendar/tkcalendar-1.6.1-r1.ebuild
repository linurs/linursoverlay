# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# add dependency to "Babel"

EAPI=7

PYTHON_COMPAT=( python3_{7..11} )
inherit distutils-r1

DESCRIPTION="tk calendar widget for python"
HOMEPAGE="https://pypi.org/project/tkcalendar/"

SRC_URI="https://files.pythonhosted.org/packages/65/3d/3406cf7963661ed890082bff17ed4c5e26b5a564306639303d4fbb2a047f/tkcalendar-1.6.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-python/Babel"
