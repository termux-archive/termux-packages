TERMUX_PKG_HOMEPAGE=https://lxqt.github.io
TERMUX_PKG_DESCRIPTION="The LXQt desktop panel"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="Simeon Huang <symeon@librehat.com>"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL="https://github.com/lxqt/lxqt-panel/releases/download/${TERMUX_PKG_VERSION}/lxqt-panel-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=ea63939c557fa639d2ab3fae48341c1a59ae8baae1a79d11f15e4bc0e38468d5
TERMUX_PKG_DEPENDS="qt5-qtbase, qt5-qtx11extras, kwindowsystem, liblxqt, libsysstat, lxqt-globalkeys, libdbusmenu-qt, libxcb, pulseaudio, lxmenu-data"
TERMUX_PKG_BUILD_DEPENDS="lxqt-build-tools, qt5-qtbase-cross-tools, qt5-qttools-cross-tools"
# TODO
# CPULOAD and NETWORKMONITOR require libstatgrab
# MOUNT plugin requires KF5Solid
# SENSORS plugin requires lm_sensors
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCPULOAD_PLUGIN=OFF
-DNETWORKMONITOR_PLUGIN=OFF
-DMOUNT_PLUGIN=OFF
-DSENSORS_PLUGIN=OFF
-DVOLUME_USE_ALSA=OFF
"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
    # Add RUNPATH to the private libraries used by lxqt-panel's plugins
    LDFLAGS+=" -Wl,-rpath=${TERMUX_PREFIX}/lib/lxqt-panel"
    export LDFLAGS
}
