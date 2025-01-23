# Flip screen output to temporarily alleviate screen flickering
xrandr --output eDP-1 --mode 1920x1080 --rate 40.02;
sleep 3;
xrandr --output eDP-1 --mode 1920x1080 --rate 59.97;

