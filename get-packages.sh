#!/bin/sh
nix-store --query --requisites /run/current-system | cut -d- -f2- | sort -u