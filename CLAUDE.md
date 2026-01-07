# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Environment

Enter the dev shell with all tools available:
```bash
nix develop -c $SHELL
```

Tools included: nmap, metasploit, vagrant

## Adding New Tools

Edit `flake.nix` and add packages to the `packages` list. The flake has `allowUnfree = true` enabled for tools with non-free licenses.

## Test VMs

`test_vms/` contains Vagrant configurations for practice targets. To use:
```bash
cd test_vms/metasploitable3-workspace
vagrant up
```
