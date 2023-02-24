#!/bin/bash
#rshell -p /dev/ttyS3 cp *.py /pyboard/
rshell -p /dev/ttyS3 rsync . /pyboard
rshell -p /dev/ttyS3 "repl ~ import machine ~ machine.soft_reset() ~"
