#!/bin/sh
# Rebuild system
sudo nixos-rebuild switch --flake ~/.dotfiles#system;
