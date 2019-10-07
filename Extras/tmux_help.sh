#!/bin/sh
clear
apt-get install tmux -y
echo '#!/bin/sh' > tmux-start.sh
echo "tmux new-session -d -s redis 'tmux set remain-on-exit on && cd redis-stable/src && ./redis-server ../redis.conf'" >> tmux-start.sh
echo "tmux new-session -d -s avatar-server 'tmux set remain-on-exit on && cd avatar-server && ./avatar-server'" >> tmux-start.sh
echo "tmux new-session -d -s lets 'tmux set remain-on-exit on && cd lets && python3.6 lets.py'" >> tmux-start.sh
echo "tmux new-session -d -s bancho 'tmux set remain-on-exit on && cd pep.py && python3.6 pep.py'" >> tmux-start.sh
echo "tmux new-session -d -s rippleapi 'tmux set remain-on-exit on && cd rippleapi && ./rippleapi'" >> tmux-start.sh
echo "tmux new-session -d -s hanayo 'tmux set remain-on-exit on && cd hanayo && ./hanayo'" >> tmux-start.sh
echo "echo TMUX window has been created. If they die restart them by calling ':respawn-window'" >> tmux-start.sh
chmod 777 tmux-start.sh
./tmux-start.sh