#!/bin/bash
echo "starting VM...";

eval 'virtualbox --startvm "dev" --vrdp=off &';

echo "waiting until VM is ready..."
sleep 120s;
echo "ok...VM ready.";
echo "Trying to sshfs...";

while !( echo [YOUR_PASSWORD] | sshfs [USER]@[IP]:[PATH] [LOCAL_PATH] -o password_stdin ); do
  echo "Mounting failed! Retrying...";
  sleep 2s;
done

echo "sshfs mounted.";
sleep 1s;
echo "launching IDE...";
eval 'idea';
sleep 10s;
echo "now...WORK!"
