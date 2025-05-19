//Allocating via SOCKET

#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>


int main(int argc, char const *argv[]) {
    struct sockaddr_in * serv_addr = malloc(sizeof(struct sockaddr_in));
}
