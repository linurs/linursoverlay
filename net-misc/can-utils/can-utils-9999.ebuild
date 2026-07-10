EAPI=8

inherit cmake git-r3

DESCRIPTION="Linux CAN bus utilities"
HOMEPAGE="https://github.com/linux-can/can-utils"
EGIT_REPO_URI="https://github.com/linux-can/can-utils.git"

LICENSE="GPL-2+"
SLOT="0"

DEPEND="sys-kernel/linux-headers"
RDEPEND="${DEPEND}"
