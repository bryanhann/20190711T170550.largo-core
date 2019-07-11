[ ! "$0" == "./install.sh" ] && echo try './install.sh' && exit

mkdir -p                                  $HOME/.config/largo-core
echo LARGO_CORE=$PWD                   >  $HOME/.config/largo-core/source
echo source \$LARGO_CORE/.config/source >> $HOME/.config/largo-core/source

mkdir -p                                  $HOME/.local/bin
echo $PWD/main.sh \$*                  >  $HOME/.local/bin/largo
chmod +x                                  $HOME/.local/bin/largo
