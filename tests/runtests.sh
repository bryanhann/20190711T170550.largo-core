export errors=0
for ii in `ls ./suite` ;  do
    echo -n testing $ii
    ./suite/$ii
    export errlev=$?
    echo [$errlev]
    if [ ! "$errlev" == "0" ]; then
	    errors=1
    fi    
done
echo errors: [$errors]
