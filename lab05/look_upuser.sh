#!/bin/bash

read -p "Enter a username and then a department to look up: " TARGET_USER TARGET_DEPT
echo "Searching the account list for: $TARGET_USER"
grep "$TARGET_USER" intel/users.csv
echo "Searching the account list for: $TARGET_DEPT"
grep "$TARGET_DEPT" intel/users.csv
