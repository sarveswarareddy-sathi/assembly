# assembly
GIT REP :
GitHub - https://github.com/drmilhous/templateMake​

Pre-req libraries - sudo apt install nasm gcc-multilib vim​

CREATE PROJECT :
$ genMake.sh Hello​

$ Make​

$ ./Hello​

INSTALL NASM :
$ sudo apt update
$ sudo apt install nasm

INSTALL GCC :
$ sudo apt update
$ sudo apt install gcc-multilib g++-multilib

INSTALL GEF :
$ sh -c "$(wget http://gef.blah.cat/sh -O -)"

INSTALL GEF :
$ pip3 install --user capstone unicorn keystone-engine ropper
$ wget -O ~/.gdbinit-gef.py https://gef.blah.cat/py
$ echo "source ~/.gdbinit-gef.py" >> ~/.gdbinit


GDB :
$ gdb
$ pi import urllib.request as u, tempfile as t; g=t.NamedTemporaryFile(suffix='-gef.py'); open(g.name, 'wb+').write(u.urlopen('https://tinyurl.com/gef-main').read()); gdb.execute('source %s' % g.name)