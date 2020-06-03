FROM fedora:32
RUN dnf -y update
RUN dnf -y group install 'Administration Tools'
RUN dnf -y group install 'Development Tools'
RUN dnf -y group install 'C Development Tools and Libraries'
RUN dnf -y group install 'System Tools'
RUN dnf -y group install 'Text-based Internet'
RUN dnf -y group install 'GNOME Software Development'
RUN dnf -y copr enable lantw44/aarch64-linux-gnu-toolchain
RUN dnf -y install vim emacs tmux cmake openssh-server keychain procps sudo passwd wget curl hostname python ruby mercurial git glibc-langpack-en autoconf213 nodejs npm alsa-lib-devel dbus-glib-devel glibc-static gtk2-devel libstdc++-static libXt-devel nasm pulseaudio-libs-devel wireless-tools-devel yasm gcc-c++ qemu-user-static aarch64-linux-gnu-* ripgrep boost-devel htop python3-devel
RUN /usr/libexec/openssh/sshd-keygen ed25519 && /usr/libexec/openssh/sshd-keygen rsa && adduser -G wheel -u 1000 cfallin && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EXPOSE 22
CMD /usr/sbin/sshd -f /etc/ssh/sshd_config -D -e
