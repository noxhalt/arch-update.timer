#!/usr/bin/env zsh

# setup
cd ${0:A:h}
autoload -Uz colors; colors

function warn() {
  color=$1; shift 2>/dev/null >&2
  echo -n "${fg_bold[$color]}${*}${reset_color}" >&2
}

function confirm() {
  warn "red" ":: Okey? [y/N] "
  read answer
  case $answer in
    [yY]*)
      echo
      ;;
    *)
      exit 1
      ;;
  esac
}

function echo_sudo() {
  warn "yellow" ":: # ${*}\n"
  confirm
  sudo ${*}
}

# caution
warn "yellow" "\n:: [CAUTION] You must check these files!\n"

# process
filename=arch-update
for item in {service,timer}; do
  warn "blue" ":: Showing ${filename}.${item}\n\n"
  cat -n "${filename}.${item}"
  confirm
done

warn "blue" ":: Authentication required to install!\n\n"
echo_sudo cp -r arch-update.{service,timer} /etc/systemd/system
echo_sudo systemctl daemon-reload
echo_sudo systemctl enable arch-update.timer --now 

