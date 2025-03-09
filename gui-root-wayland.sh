sudo dnf install xorg-x11-xauth  xorg-x11-server-Xwayland 
# if no ~/.Xauthority file then
xauth generate $DISPLAY . trusted
xhost si:localuser:root
sudo -E sublime_text
