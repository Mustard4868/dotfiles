#!/bin/bash

UPGRADES=$(checkupdates| wc -l)

echo $UPGRADES
