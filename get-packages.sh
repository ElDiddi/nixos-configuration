#!/bin/sh
nix-store --query --requisites /run/current-system ./.nix-profile | cut -d- -f2- | sort -u