#!/bin/bash

sudo chown munge:munge /etc/munge/munge.key
sudo chown munge:munge /etc/munge
sudo service munge start
sudo slurmd -N $(hostname)
sudo service ssh start



tail -f /dev/null