import threading
import socket

class colors:
    CYAN = '\033[96m'
    WHITE = '\033[0m'

def get_message(client):
    while True:
        try:
            recv = client.recv(1024)
            message = recv.decode()
        except:
            clients.pop(client)
        else:
            for person in clients:
                formatted_send = (colors.CYAN+">> "+message+colors.WHITE)
                person.send(formatted_send.encode())

        


IP = '0.0.0.0'
PORT = 5050
LIMIT = 1024

clients = {}

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind((IP, PORT))
server_socket.listen()


while True:
    socket_of_cc, address_of_cc =  server_socket.accept()
    clients[socket_of_cc] = address_of_cc
#    username = socket_of_cc.recv(LIMIT).decode()
#    print("User " + str(username) + " has connected")
    socket_of_cc.send(("You are connected to the server").encode())
    
    # initialise a thread for the server that will use get_message to get 
    # the messages that the clients may have sent
    thread_of_server = threading.Thread(target=get_message, args=(socket_of_cc,))
    # makes the thread a daemon thread so that the thread dies when the
    # program is closed 
    thread_of_server.daemon = True
    # start the thread
    thread_of_server.start()

for socket_client in clients:
    socket_client.close()

server_socket.close()