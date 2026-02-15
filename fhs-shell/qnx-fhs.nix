{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "qnx-fhs";

  targetPkgs = pkgs: (with pkgs; [
    bash
    coreutils
    glibc
    gcc
    zlib

    # GTK + UI deps
    gtk3
    glib
    gdk-pixbuf
    cairo
    pango
    atk

    # X11
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXinerama

    # Other runtime deps
    libuuid
    libGL
    dbus
    nss
    alsa-lib
    cups
    expat
  ]);

  runScript = "bash";

  profile = ''
    source $HOME/qnx800/qnxsdp-env.sh

    echo
    echo "--------------------------------------------"
    echo " QNX Development Environment (FHS)"
    echo "--------------------------------------------"
    echo " QNX_HOST   = $QNX_HOST"
    echo " QNX_TARGET = $QNX_TARGET"
    echo
    echo " Available commands:"
    echo "   qnxide   - Launch Momentics IDE"
    echo "   qnxsc    - Launch Software Center"
    echo
  '';
  
}).env
