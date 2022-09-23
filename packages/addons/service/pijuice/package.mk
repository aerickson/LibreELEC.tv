PKG_NAME="pijuice"
PKG_VERSION="1.8"
PKG_ARCH="any"
PKG_SITE="https://github.com/PiSupply/PiJuice"
PKG_URL="https://github.com/PiSupply/PiJuice/archive/V$PKG_VERSION.tar.gz"

PKG_DEPENDS_TARGET="toolchain Python3 i2c-tools systemd"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="PiJuice"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"

PKG_TOOLCHAIN="manual"

makeinstall_target() {
  :
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  install -m 755 ${PKG_BUILD}/Software/Source/src/pijuice_sys.py ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/
  install -m 755 ${PKG_BUILD}/Software/Source/src/pijuice_cli.py ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/
}


# makeinstall_target() {
# 	# what to install:
# 	#
# 	#  * The low level interface (pijuice.py)
# 	#    - Software/Source/pijuice.py
# 	#  * The supporting service (pijuice_sys.py)
# 	#    - Software/Source/src/pijuice_sys.py
# 	#  * and the command line interface (pijuice_cli, pijuice_cli.py).
# 	#    - Software/Source/src/pijuice_cli.py

# 	# dest: /usr/bin/pijuice_sys.py

# 	#  cp ${PKG_BUILD}/id3tag.pc ${SYSROOT_PREFIX}/usr/lib/pkgconfig


# 	# TODO: place sys binary
# 	install -m 755 ${PKG_BUILD}/Software/Source/src/pijuice_sys.py ${SYSROOT_PREFIX}/usr/bin/
# 	# TODO: place CLI
# 	install -m 755 ${PKG_BUILD}/Software/Source/src/pijuice_cli.py ${SYSROOT_PREFIX}/usr/bin/
# }

# make_target() {
#   rm -f Makefile
#   LDFLAGS="${LDFLAGS} -lX11" ${MAKE} unclutter
# }

# makeinstall_target() {
#   mkdir -p ${INSTALL}/usr/bin
#   install -m 755 unclutter ${INSTALL}/usr/bin/
# }

# post_install() {
# 	# TODO: place i2c rules file?

# 	# TODO: add pijuice user and group
# 	# add_group systemd-network 193
# 	# add_user systemd-network x 193 193 "systemd-network" "/" "/bin/sh"

# 	# knows to look in ./system.d/
# 	# does placement also... i think
# 	enable_service pijuice.service
# }

# # disable addon step
# addon() {
#   :
# }
