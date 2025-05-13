DIR=$HOME/project/$1
TEMPLATE=$HOME/template/
if [ ! -d "$DIR" ]; then
	mkdir $DIR
	cp $TEMPLATE/first.asm $DIR/$1.asm
	cp $TEMPLATE/lib.asm $DIR/
	cat $TEMPLATE/Makefile | sed "s/XX/$1/g" > $DIR/Makefile
	echo -e "Successfully created $1!"
else
	echo -e "Directory Exists!\n"
fi
