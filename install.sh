wget https://mirrors.tuna.tsinghua.edu.cn/fedora/releases/41/Container/x86_64/images/Fedora-Container-Base-Generic-Minimal-41-1.4.x86_64.oci.tar.xz

tar xf Fedora-Container-Base-Generic-Minimal-41-1.4.x86_64.oci.tar.xz

sudo tar xvpf blobs/sha256/32b07b9a22d03d120489b279e0d0764e2945a00b566e1de536fb232e718c4dc4 -C /mnt/

# echo nameserver 1.1.1.1 > /etc/resolv.conf


sudo arch-chroot /mnt
dnf update

nano /etc/dnf/dnf.conf
install_weak_deps=False
exclude=audit,dhcp-client,man-db,openssh-clients,openssh-server,parted,NetworkManager,dnf5-plugins,dracut-config-rescue,firewalld,plymouth,sssd-common,sssd-kcm,vim-minimal,xorg-x11-server-Xwayland,fwupd,systemd-resolved



dnf install nano  bash-completion glibc-langpack-en


groups kde-desktop-environment, 


dnf --config /builddir/result/image/build/image-root/kiwi_dnf4.conf -y --installroot /builddir/result/image/build/image-root --releasever=40 --setopt=install_weak_deps=False --exclude=*-firmware --exclude=dosfstools --exclude=e2fsprogs --exclude=fuse-libs --exclude=geolite2-city --exclude=geolite2-country --exclude=glibc-langpack-en --exclude=gnupg2-smime --exclude=grubby --exclude=kernel --exclude=langpacks-en --exclude=langpacks-en_GB --exclude=libss --exclude=pinentry --exclude=pinentry --exclude=shared-mime-info --exclude=sssd-client --exclude=trousers --exclude=tzdata --exclude=util-linux --exclude=xkeyboard-config install basesystem bash coreutils fedora-release-container filesystem glibc-minimal-langpack microdnf rpm 

dnf  install @core

. /usr/share/bash-completion/bash_completion



dnf repoquery --requires sway
dnf repoquery --requires --resolve sway
dnf install wl-clipboard grim slurp jq wlsunset wev foot wofi sway 
dnf install systemd-boot i3blocks pipewire mpv 
dnf install kernel

nano /etc/yum.repos.d/fedora-cisco-openh264.repo
enabled=0


# setup cmdline for dracut
 cat /etc/kernel/cmdline 
root=UUID=573f44a2-f1a3-438e-9c49-593a4a225c0c rw quiet
dracut -fv --kver  6.13.5-200.fc41.x86_64
bootctl install
kernel-install add 6.13.5-200.fc41.x86_64 /lib/modules/6.13.5-200.fc41.x86_64/vmlinuz
kernel-install list

sudo dnf group list --hidden --contains-pkgs basesystem

touch /.autorelabel
fixfiles -F onboot
nano /etc/selinux/config
selinux=permissive
# without permissive relabling wont work set it to enforcing after labelking complete

setup fstab
cat /etc/fstab
UUID=28977071-a07d-4fb0-91b1-7523ce145b00 /home ext4 rw,noatime 0 1


passwd k
adduser k

systemctl enable iwd
nano /etc/group
wheel::k > add your user to wheel

# identity
it has default pkg when upgrading from one release to newer one with distro-sync
dnf5 swap fedora-release-identity-container fedora-release-identity-basic
dnf5 swap fedora-release-container fedora-release-workstation



dnf5 install @kde-desktop
dnf5 install @kde-desktop-environment












