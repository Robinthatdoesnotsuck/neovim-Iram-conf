# neovim-Iram-conf

To clone directly in configuration (assuming you've already installed neovim in your distro).
```bash
git clone https://github.com/Robinthatdoesnotsuck/neovim-Iram-conf.git ~/.config/nvim
```
Then we go to the packer.lua configuration file in the path:
```
./lua/plugins/packer.lua
```
And execute on the nvim command mode
```
PackerInstall
PackerCompile
```

This will install all the plugins and its configurations that are on the init.lua file.
Then we compile just in case cause like I broke something and idk why this fixit the first time install.

Still need to fix the LSPServer configurations that I f'ed up in the last configuration run

