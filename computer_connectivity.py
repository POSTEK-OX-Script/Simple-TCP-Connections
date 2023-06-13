import socket
# Change to the IP address or hostname of your server
# You can also use gethostname to find the ip like shown in printer file
host = '192.168.12.241' 
port = 12346        # Change to the port number your server is listening on

# Create a TCP socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the server
client_socket.connect((host, port))

# Send data to the server
data = "Printed from computer"
client_socket.sendall(data.encode())

# Receive a response from the server
response = client_socket.recv(1024)
print("Received response: {}".format(response.decode()))

# Close the connection
client_socket.close()
