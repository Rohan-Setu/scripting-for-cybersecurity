#!/bin/bash
read -p "Please enter a username : " NAME
read -s -p "Please enter a password for $NAME : " PASSWORD
echo ""
echo "Credentials captured for $NAME (password length: ${#PASSWORD})"
