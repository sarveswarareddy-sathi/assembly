# assembly

GitHub - https://github.com/drmilhous/templateMake​

Pre-req libraries - sudo apt install nasm gcc-multilib vim​

Creating Own Templates​

genMake.sh MyProject​

Creating a program​

Create a project - ​

$ genMake Hello​

Cd projects/Hello​

Add a string at the top -  ​

hi db "hi",10,0 (note​

Add a call to print string ​

mov eax, hi​

Call print_string​

Compile, run, repeat​

Make​

./Hello​


sudo apt update
sudo apt install nasm


sudo apt update
sudo apt install gcc-multilib g++-multilib



