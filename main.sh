#echo [$0] [$*]
source ~/.config/largo-core/source

mkdir -p $LARGO_IGNORE
mkdir -p $LARGO_MOUNT

function usage () {

	echo "usage:" 
	echo "    largo SUBCOMMAND"
        echo
	echo "examples:"

	for x in `ls $LARGO_CORE/bin` ; do
		echo "    largo   $x"
	done

	for x in `ls $LARGO_MOUNT` ; do
		echo "    largo . $x"
	done

	exit
}

export script=$LARGO_CORE/bin/$1.sh

if [ -f $script ]; then
       	shift
	$script $*
	exit
fi

	
case .$1 in 
        ..)
                export USE=$LARGO_MOUNT/$2
		[ ! -f $USE/main.sh ] && echo "missing submodule [$2]" && exit
		shift
		shift 
		$USE/main.sh $*
		exit
		;;
	.*)
		usage empty
        	;;
esac



