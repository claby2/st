# st - simple terminal \[fork]

st is a simple terminal emulator for X which sucks less.

# Fork features

*   MacOS support\*
*   zoom increment

# Fork patches

Patches can be found in `patches/`.

*   boxdraw
*   dracula
*   font2
*   scrollback
*   scrollback-mouse
*   scrollback-mouse-altscreen
*   scrollback-mouse-increment
*   xresources

# Requirements

In order to build st you need the Xlib header files.

Recommended requirements for MacOS:

*   XQuartz
*   fontconfig

# Installation

Edit config.mk to match your local setup (st is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install st (if
necessary as root):

    make clean install

# Running st

If you did not install st with make clean install, you must compile
the st terminfo entry with the following command:

    tic -sx st.info

See the man page for additional details.
