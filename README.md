# Simple-TCP-Connections

This code is designed to print labels on a printer based on data received from a tcp server running directly on the printer

## Demo video

A demonstration of what this script can do can be found here

coming soon

## Installation

To run this code, you will need to have Python 3.8+ installed on your printer(which comes standard on all POSTEK Printers that support OX Script after May 2023). You will be able to execute this code directly on your computer but the behavior is probably going to be different from behaviors on the printer as it is intended to be executed on the printer
  
You will also need the free POSTEK Companion app which can be downloaded here:

https://www.postekus.com/service-support/download/software/

## Usage

Multiple files are provided in this repository. The connectivity.py file is intended to be executed directly on the printer and establishes a tcp server. computer_connectivity.py is a demo file that is intended to be run on the computer to serve as a TCP client for connecting to the printer. PCP. Client written in fluttter and swift is also provided as a simple demonstration that it is relatively easy to establish connections with the printer using a computer, a phone, a tablet, or even a smart watch. With that being said, this demo is still the most barebone, simplest demonstration of one of the many methods to connect to the printer. Network discovery and cloud printing tutorials will be shown in the future.

To execute this demo, simply load the .py file and the command6-en.txt file(file containing the label design)onto the printer, then on your local machine, run the computer_connectivity.py or compile the flutter project to run on IOS or Android. A swift project is also provided to be able to print directly from an apple watch. The IP address is static in all the examples provided in this repository. You can use static ip info or get the ip address through gethostname like shown in the connectivity.py file. More information on Network Discovery will follow

- Initiating the program from printer touch screen
    - On your printer's touch screen, go to settings>Ox Script>[your file name].py. Press it and select run from the bottom right of the pop-up window
 
- Initiating the program from the POSTEK App
    - Inside the App, select Ox Script from the left hand side. Connect to the printer that you just moved the files to and select the file from the left hand side drop down, click run on the top right hand corner

## License

This code is released under the MIT License. Please see the LICENSE file for more information.

## Disclaimer

This software is provided "as is" and the author of the software is not liable for any damages or losses that may arise from the use of the software. Use at your own risk.
