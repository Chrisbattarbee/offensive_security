# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Environment

Enter the dev shell with all tools available:
```bash
nix develop -c $SHELL
```

Tools included: nmap, metasploit, vagrant, libvirt, qemu, postgresql, tmux

## Using Metasploit

msfconsole runs in a persistent tmux session to avoid slow startup times. Use:

```bash
# Start or attach to msfconsole session
~/.local/bin/msf

# Send a command to the running session (for scripting)
tmux send-keys -t msf "search phpmyadmin" Enter

# Read output from the session
tmux capture-pane -t msf -p
```

The PostgreSQL database auto-starts and msfconsole auto-connects to it for fast module searches.

## Adding New Tools

Edit `flake.nix` and add packages to the `packages` list. The flake has `allowUnfree = true` enabled for tools with non-free licenses.

## Test VMs

`test_vms/` contains Vagrant configurations for practice targets. To use:
```bash
cd test_vms/metasploitable3-workspace
vagrant up
```
