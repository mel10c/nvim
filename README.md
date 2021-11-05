↖️ (View table to contents with the GitHub native button!)

# Nordim

A fast, clean, and figure full nvim configuration with nord colorscheme, written in lua

![showcase]()

<details>
<summary>More showcase pictures</summary>
pictures in htlm format
</details>

## Folder structure

Instead of the usual `init.vim`, for this configuration, it uses the `init.lua`, which is located at the exact same position (under `~/.config`).
Lua is a more structured and slimmer language compared to he Vim Script. More detailed lua tutorial and explanation can be find here: [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide).

The folder structure for this configuration:

```text
📂 ~/.config/nvim
├── 📁 after
│  └── 📂 syntax
│     └── ...                       # syntax settings
├── 📂 lua
│  ├── 🌑 mappings.lua
│  ├── 🌑 settings.lua
│  ├── 🌑 util.lua
│  └── 📂 plugins
│     └── ...                       # plugin configs
├── 📁 plugin
│     ├── 🌑 init.lua
│     └── 🌑 packer_compiled.lua
├── 📁 plugin_change                # not very relavent (a backup folder)
│     └── ...                       # change to the actual plugin codes
├── 📁 UltiSnips
│     └── ...                       # snipets
└── 🌑 init.lua
```

See help with [`:help 'runtimepath'`](https://neovim.io/doc/user/options.html#'runtimepath')


## Basic Editor settings

The [`init.lua`](https://github.com/mel10c/dotfiles/blob/master/contents/.config/nvim/init.lua) file is very very simple with only 2 lines of code, which is sourcing the `settings.lua` and the `mappings.lua`

These 2 files are responsible for the basic editor settings of this configuration. (The part without plugins involved)

### Settings

The first file that the `init.lua` requires is this file: [`settings.lua`](https://github.com/mel10c/dotfiles/blob/master/contents/.config/nvim/lua/settings.lua)

This files contains all the `set` options normally found in Vim Script. There are 4 mains parts of the file:
1. **Colorscheme**: 
    - `Nordfox` theme under the nightfox plugin, explained [later](https://github.com/mel10c/dotfiles/blob/master/NVIM.md#Nightfox)
2. **Interface settings**
    - Contains all the `syntax`, `mouse`, `number` ... settings (view code for detail)
3. **Editor settings**
    - Contains all the `tabstop`, `smartcase`, `incsearch`, `spell`... settings (view code for detail)
4. **File range settings**
    - Contains all the `autochdir`, `hidden`, `timeoutlen` ... settings (view code for detail)

See help with lua syntax [here](https://github.com/nanotee/nvim-lua-guide#managing-vim-options)

### Mappings

The second file that `init.lua` requires is the "basic" mapping file: [`mappings.lua`](https://github.com/mel10c/dotfiles/blob/master/contents/.config/nvim/lua/mappings.lua)

Since this config also use the `whichkey` plugin, this mapping file only contains some of the "correction" mapping that helps to improve the vim experience. Please not that these "correction" is very personal, they are just the ones that fit with me.

Again, this file is separated to a couple of sections

- The first section is a **function** that helps to write the mappings in lua. I copied the function from this [blog](https://oroques.dev/notes/neovim-init/), pretty handy:
- The next section is about **navigation** fixes, since there are no comment in the code, below are mapping documentations

    | keys        | fix                | function                                                        |
    |-------------|--------------------|-----------------------------------------------------------------|
    | `<c-j>`     | `:m .+1<cr>==`     | move line down without messing up register                      |
    | `<c-k>`     | `:m .-2<cr>==`     | move line up without messing up register                        |
    | `J`         | `:m '>+1<cr>gv=gv` | move selection down without messing up register  in visual mode |
    | `K`         | `:m '>-2<cr>gv=gv` | move selection up without messing up register  in visual mode   |
    | `<c-u>`     | `<c-w>`            | delete a word in insert mode (more handly on keyboard)          |
    | `n`         | `nzz`              | move to next item and center                                    |
    | `N`         | `nzz`              | move to prev item and center                                    |
    | `<c-o>`     | `<c-o>zz`          | more to previous edit and center                                |
    | `<leader>o` | `<c-^>zz`          | move to previous buffer and center                              |

    * I also like to have `H` and `L` to move to the beginning or the end of the current line
    * However, `H`, `L` along with `j`, `k` were remapped to function with wrapped text
        + `j`, `k` to `gj`, `gk` if in wrapped line
        + `H`, `L` to `g^`, `g$` if in wrapped line
        + Conditional mapping is a little complex, check the code for details
- Then, the next section is about the window navigation for nvim
    * Used `Sl` and `Sj` to split left and down
    * `<leader>` + `hjkl` to navigate between splits
    * Finally, the 4 arrow keys to resize the windows
- The next section is about enhancing editing

    | keys        | fix                                  | function                                                     |
    |-------------|--------------------------------------|--------------------------------------------------------------|
    | `y`         | y`]                                  | yank and go to end of selection in visual mode               |
    | `Y`         | `y$`                                 | yank till end of line in normal mode                         |
    | `Y`         | `"+y`                                | yank to system clip baord in visual mode                     |
    | `p`         | `"_dP`                               | replace in visual mode without messing up register           |
    | `,p`        | `"_diwP`                             | repalce the word under cursor with last yank in normal mode  |
    | `<leader>p` | `"0p`                                | paste down last yank (`d` and `c` does not affect) in normal |
    | `<leader>d` | `"_d`                                | delete without messing up register                           |
    | `,f`        | `<Esc>/<++><CR>:nohlsearch<CR>"_c4l` | find next placeholder(`<++>`) and go there in insert mode    |
    | `;;`        | `%`                                  | find match (more handy on keyboard) in normal mode           |
    | `,`         | `,<c-g>u`                            | save secion, so don't undo too much in insert mode           |
    | `<leader>q` | `:q<cr>`                             | quit vim in normal mode                                      |
    | `<leader>w` | `:w<cr>`                             | write in normal mode                                         |
    | `<c-l>`     | <c-g>u<Esc>[s1z=`]a<c-g>u            | auto correct speeling (REALLY HANDY)                         |

- The next section is about mapping Emacs-style basic navigation in insert mode
    * Come handy with MacOs's system wide emacs support
    * Use the control key (`<c->`) with `f, b, n, p` to navigate left, right, down, up
    * Use `<c-a>` and `<c-e>` to go to beginning and end of line
    * Use `<c-d>` to delete back
- Lastly, it some basic and short plugin mappings that does not need *Whichkey* reminders

## Plugins

Finally, to the plugins!

Before getting started, there are 2 helper functions that is very useful to get plugins started, they are stored in the [`util.lua`](https://github.com/mel10c/dotfiles/blob/master/contents/.config/nvim/lua/util.lua). Both were taken from the [nvchad's](https://github.com/NvChad/NvChad) config.
1. lazy load
2. Disabling some unused plugins

---

The most important file that is responsible for all the plugins is the [`init.lua`](https://github.com/mel10c/dotfiles/blob/master/contents/.config/nvim/plugin/init.lua) file under the `plugin` folder. Note that this file is auto loaded.
- At the beginning of the file, it requires the `disable()` function from the `util` file

Another important place, the plugin folder is located at [`nvim/lua/plugins`](https://github.com/mel10c/dotfiles/tree/master/contents/.config/nvim/lua/plugins). This folder contains individual configs for each plugin

### Packer

![packer]()

This configuration uses [`Packer`](https://github.com/wbthomason/packer.nvim) as the plugin manager. It is a clean and easy one, with lots of community support.

- At the beginning of the `plugin/init.lua` file, it contains a auto install script for packer
- It also requires the configurations for packer, with the function `packer` in the file [`plugins.misc`](https://github.com/mel10c/dotfiles/blob/master/contents/.config/nvim/lua/plugins/misc.lua) file
    * This function checks configs packer to use floating window and compile with sync, very useful
- After that, it startup with the function that takes in the `use` all of the other plugins in this configuration

### Basic system plugs

There are 4 plugins that are essential at startup to this configuration. These basic functional plugins does not have any additional configuration. All started in startup time except for `treesitter`.
1. [`nvim-lua/plenary.nvim`](https://github.com/nvim-lua/plenary.nvim) -- plugin to enhance lua abilities
2. [`wbthomason/packer.nvim`](https://github.com/wbthomason/packer.nvim) -- packer's plugin to manage itself
3. [`lewis6991/impatient.nvim`](https://github.com/lewis6991/impatient.nvim) -- plugin to improve nvim startup time
4. [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) -- plugin to enhance highlights (can do more)
    - This plugin is lazy loaded with during the `BufRead` event

### Appearance related plugins

#### [Which-key](https://github.com/folke/which-key.nvim)

![whichkey]()

- **Purpose**: A plugin that helps with remembering the mappings in nvim
- **Usage**: Helps with `Telescope`, `Lsp` mappings mostly, also have register and mark support
- **Config**: 

#### Nightfox

![nightfox]()

- Its `nordfox` is the BEST NORD THEME I found with nvim.
- Also provides couple of other options, all come with treesitter support
- LOVE that it provides enough contrast and syntax differences while maintain the nord color palate



# TODO

- Improve lspconfig
- Change to lua snip
