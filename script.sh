#!bin/sh

clear
mongod &

sleep 30
cd src
node app.js
