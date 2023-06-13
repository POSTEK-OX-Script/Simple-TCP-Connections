from ox_script import *
import socket
import sys

hostname = socket.gethostname()
print(hostname)
host = socket.gethostbyname(hostname)
# host = '0.0.0.0'
port = 12346  # Choose a port number

# Create a TCP socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Bind the socket to a specific host and port
server_socket.bind((host, port))
# Listen for incoming connections
server_socket.listen()
print(f"Listening on port {port}...")


def print_label(data):
    cmd = PTK_UpdateAllFormVariables(
        "command6-en.txt",
        Input1=data,
        Input2=data,
    )
    PTK_SendCmdToPrinter(cmd)


if __name__ == "__main__":
    # The following code is used to initialize the UI on the printer
    controller = PTK_UIInit(
        PTK_UIPage(
            # We can use := to assign a variable to the controller of the UI element which we will use below
            text_on_screen := PTK_UITextBox(
                title=("TCP Connection:\nIP Address: " + str(host)),
                value="Awaiting Connection...",
            ),
        ),
        # Setting require_execute_confirmation to False will allow the script to run without the need to press the execute button on the printer
        require_execute_confirmation=False,
    )
    # Continuously accept incoming connections
    while True:
        # Accept incoming connection
        client_socket, client_address = server_socket.accept()

        # Process the connection
        print(f"Connection from {client_address}")
        data = client_socket.recv(1024)
        print(f"Received data: {data.decode()}")
        # Send a response back to the client
        response = "Printjob Received"
        client_socket.sendall(response.encode())
        print_label(data.decode())
        text_on_screen.update(str(data.decode()))
        # Close the connection
        client_socket.close()