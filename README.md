# Camlgram: an instant messaging system #
Final Project for CS 3110

## What is Camlgram? ##
This is an instant messaging service where users can:
* Create a New Account or Log in to an Existing One
* Chat with your friends
* Send and recieve messages in colorful text
* Change the themes of the app to fit the time of year :)
* Store a list of contacts and chat with them at any time
* Play games
* Check the leaderboard to see how well you do in the games in comparison to others using the app 


## How to Use Camlgram ##
* Download the code as a zip file by selecting Code -> Download
* Unzip this file in a directory of your choice
* Go to that directory in your terminal
* Cd into the src directory and run ocaml server.ml to start up the server script on one device
* Get the IP address of that computer
* On the devices connecting to the server, cd into the directory with Camlgram and run "make start" to access the application
* If you plan to chat with others, choose the #chat option from the menu. For each device connecting to the server, enter the IP address of the computer running the server into the prompt. If the device trying to connect is the same as the device running the server script, enter '127.0.0.1' as the host IP address.
* Happy chatting!

### Dependencies Required ###
* lwt.unix
* ANSITerminal
* OUnit2
* csv
