# arch-update.timer

`pacman -Syuw` is generally safe to failure, So I was create timer unit.

# usage

**Check** and run `install.zsh`

or manually

```bash

# clone repo
git clone https://github.com/noxhalt/arch-update.timer.git

# and check it!
cd arch-update.timer
cat arch-update.{service,timer}

# If you think it is no problem, put systemd unit files
sudo cp -r arch-update.{service,timer} /etc/systemd/system
sudo systemctl daemon-reload

# enable and start it
sudo systemctl enable arch-update.timer --now

```
