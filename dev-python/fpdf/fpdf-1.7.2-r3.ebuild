# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} python3_13t)
inherit distutils-r1

DESCRIPTION="Simple PDF generation for Python"
HOMEPAGE="https://pypi.org/project/fpdf/"
SRC_URI="https://files.pythonhosted.org/packages/37/c6/608a9e6c172bf9124aa687ec8b9f0e8e5d697d59a5f4fad0e2d5ec2a7556/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
