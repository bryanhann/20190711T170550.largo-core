function usage() {
        echo "usage:"
	echo "    largo mount --install NAME"
	echo "    largo mount --uninstall NAME"
        echo
	echo $1
	exit
}

source ~/.config/largo-core/source

export NAME=$2
#export SRC=$LARGO_REPOS/largo-${NAME}.repo
export SRC=$LARGO_REPOS/${NAME}.bare
export DST=$LARGO_MOUNT/$NAME

[ "$NAME" == "" ] && usage "argument missing"

case .$1 in 
        .--uninstall)
                rm -rf $DST
                ;;

        .--install)
                rm -rf $DST
		git clone --bare https://github.com/bryanhann/largo-$NAME.git $LARGO_REPOS/$NAME.bare
                [ ! -d $SRC ] && echo repo [$NAME] not found && exit
                git clone $SRC $DST
                ;;

        *)
       	        usage "nothing gone"
                ;;
esac
