#!/bin/bash
# c.f. https://github.com/y-yagi/jma-receipt-docker
service postgresql restart 
service jma-receipt restart

tail -f /var/log/dmesg