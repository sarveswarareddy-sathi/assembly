TEMPLATE=/workspaces/assembly/templateMake
DIR=/workspaces/assembly/$1
if [ ! -d "$DIR" ]; then
	mkdir $DIR
	echo -e "Created $DIR !\n"
	cp $TEMPLATE/template.asm $DIR/$1.asm
	cp $TEMPLATE/asm_io.inc $DIR/
	cp $TEMPLATE/asm_io.asm $DIR/
	cp $TEMPLATE/driver.c $DIR/
	cat $TEMPLATE/Makefile | sed "s/XX/$1/g" > $DIR/Makefile
else
	echo -e "Directory Exists! Not Created.\n"
fi