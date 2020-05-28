FROM fedora:32
RUN dnf -y update
RUN dnf -y group install 'Administration Tools'
RUN dnf -y group install 'Development Tools'
RUN dnf -y group install 'C Development Tools and Libraries'
RUN dnf -y group install 'System Tools'
RUN dnf -y group install 'Text-based Internet'
RUN dnf -y install vim emacs tmux cmake
RUN dnf -y install openssh-server keychain
RUN /usr/libexec/openssh/sshd-keygen ed25519
RUN /usr/libexec/openssh/sshd-keygen rsa
RUN adduser -G wheel -u 1000 cfallin
RUN dnf -y install procps sudo passwd wget curl hostname
RUN dnf -y install python ruby
RUN dnf -y install mercurial git
RUN dnf -y install glibc-langpack-en
RUN dnf -y install autoconf213 nodejs npm
RUN dnf -y group install 'GNOME Software Development'
RUN dnf -y install alsa-lib-devel dbus-glib-devel glibc-static gtk2-devel libstdc++-static libXt-devel nasm pulseaudio-libs-devel wireless-tools-devel yasm gcc-c++
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

EXPOSE 22
CMD /usr/sbin/sshd -f /etc/ssh/sshd_config -D -e
