// AllLobby.exe GameInfoServers daemon

#define WIN32_LEAN_AND_MEAN
#include <winsock2.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <windows.h> //for FILETIME

#include "../FedSrv/statstruct.h"

#define DEFAULT_PORT 2000
#define DEFAULT_PROTO SOCK_DGRAM // TCP


void Usage(char *progname) {
    fprintf(stderr,"Usage\n%s -p [protocol] -e [endpoint] -i [interface]\n",
        progname);
    fprintf(stderr,"Where:\n\tprotocol is one of TCP or UDP\n");
    fprintf(stderr,"\tendpoint is the port to listen on\n");
    fprintf(stderr,"\tinterface is the ipaddr (in dotted decimal notation)");
    fprintf(stderr," to bind to\n");
    fprintf(stderr,"Defaults are UDP,2000 and INADDR_ANY\n");
    WSACleanup();
    exit(1);
}

int main(int argc, char **argv) {

    char Buffer[sizeof(ServerMsg) + (sizeof(ServerInfoMsg) * 1)]; //nasty big udp packet (maximum size)
	ServerInfoMsg* ServerInfo = new ServerInfoMsg;

    char *interface= NULL;
    unsigned short port=DEFAULT_PORT;
    int retval;
    int fromlen;
    int i;
    int socket_type = DEFAULT_PROTO;
    struct sockaddr_in local, from;
    WSADATA wsaData;
    SOCKET listen_socket, msgsock;

    /* Parse arguments */
    if (argc >1) {
        for(i=1;i <argc;i++) {
            if ( (argv[i][0] == '-') || (argv[i][0] == '/') ) {
                switch(tolower(argv[i][1])) {
                    case 'p':
                        if (!stricmp(argv[i+1], "TCP") )
                            socket_type = SOCK_STREAM;
                        else if (!stricmp(argv[i+1], "UDP") )
                            socket_type = SOCK_DGRAM;
                        else
                            Usage(argv[0]);
                        i++;
                        break;

                    case 'i':
                        interface = argv[++i];
                        break;
                    case 'e':
                        port = atoi(argv[++i]);
                        break;
                    default:
                        Usage(argv[0]);
                        break;
                }
            }
            else
                Usage(argv[0]);
        }
    }

    if ((retval = WSAStartup(0x202,&wsaData)) != 0) {
        fprintf(stderr,"WSAStartup failed with error %d\n",retval);
        WSACleanup();
        return -1;
    }

    if (port == 0){
        Usage(argv[0]);
    }

    local.sin_family = AF_INET;
    local.sin_addr.s_addr = (!interface)?INADDR_ANY:inet_addr(interface);
    local.sin_port = htons(port);

    listen_socket = socket(AF_INET, socket_type,0); // TCP socket

    if (listen_socket == INVALID_SOCKET){
        fprintf(stderr,"socket() failed with error %d\n",WSAGetLastError());
        WSACleanup();
        return -1;
    }

    if (bind(listen_socket,(struct sockaddr*)&local,sizeof(local) )
        == SOCKET_ERROR) {
        fprintf(stderr,"bind() failed with error %d\n",WSAGetLastError());
        WSACleanup();
        return -1;
    }

    // We cannot listen() on a UDP socket.

    if (socket_type != SOCK_DGRAM) {
        if (listen(listen_socket,5) == SOCKET_ERROR) {
            fprintf(stderr,"listen() failed with error %d\n",WSAGetLastError());
            WSACleanup();
            return -1;
        }
    }
    printf("%s: 'Listening' on port %d, protocol %s\n",argv[0],port,
        (socket_type == SOCK_STREAM)?"TCP":"UDP");
    while(1) {
        fromlen =sizeof(from);
        //
        // accept() doesn't make sense on UDP, since we do not listen()
        //
        if (socket_type != SOCK_DGRAM) {
            msgsock = accept(listen_socket,(struct sockaddr*)&from, &fromlen);
            if (msgsock == INVALID_SOCKET) {
                fprintf(stderr,"accept() error %d\n",WSAGetLastError());
                WSACleanup();
                return -1;
            }
            printf("accepted connection from %s, port %d\n",
                        inet_ntoa(from.sin_addr),
                        htons(from.sin_port)) ;

        }
        else
            msgsock = listen_socket;

        // the server will do
        // recvfrom() and sendto()  in a loop.

        if (socket_type != SOCK_DGRAM)
            retval = recv(msgsock,Buffer,sizeof (Buffer),0 );
        else {
            retval = recvfrom(msgsock,Buffer,sizeof (Buffer),0,
                (struct sockaddr *)&from,&fromlen);
            printf("Received datagram from %s\n",inet_ntoa(from.sin_addr));
        }

        if (retval == SOCKET_ERROR) {
            fprintf(stderr,"recv() failed: error %d\n",WSAGetLastError());
            closesocket(msgsock);
            continue;
        }
        if (retval == 0) {
            printf("Client closed connection\n");
            closesocket(msgsock);
            continue;
        }
        printf("Received %d bytes, data [%s] from client\n",retval,Buffer);

        if (socket_type != SOCK_DGRAM){
            printf("Terminating connection\n");
            closesocket(msgsock);
        }
        else {
			//start a thread
			for (unsigned short cntr = 0;cntr<((ServerMsg*)Buffer)->numservers;cntr++) {
				memcpy(ServerInfo,&((ServerMsg*)Buffer)->info[cntr], sizeof(ServerInfoMsg));
				printf("Server %i name is: %s\n",cntr,ServerInfo->name);
			}

			printf("UDP server looping back for more requests\n");
			continue;
		}
    }
}