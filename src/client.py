import socket
import threading
import time

class colors:
    CYAN = '\033[96m'
    WHITE = '\033[0m'
    YELLOW = '\033[33m'

def get_message():
    while True:
        recv = s.recv(1024)
        print(recv.decode())

host = input("Please enter the IP address of the server: \n")
s = socket.socket()
# host = '127.0.0.1'
s.connect((host,5050))

user = print("Enter your username: ")
user = input(">> \n")


# starts the thread for the client that utilizes get_message to 
# listen for messages recieved
thread_of_client = threading.Thread(target=get_message)
# makes the thread a daemon thread so that the thread dies when the 
# program is closed 
thread_of_client.daemon = True 
# start the thread
thread_of_client.start()

print("Enter your message\n>>\n")

while True:
    send = input()
    if send == '#quit' or send == "#leavechat":
        break;
    else:
        user_send = "" + colors.CYAN + user + ": "
        formatted_send = (user_send + colors.YELLOW + send + colors.WHITE)
    s.send(formatted_send.encode())
    time.sleep(2)

s.close()