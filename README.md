# vim-color-convert

Vim plugin for converting between common color formats.

Note: **alpha!** I'm still working out a good API for this plugin, so for the
time being, it's fairly raw, just exposing a handful of low level functions
for manually converting text values. Down the road, I picture some out-of-the-box
mappings, as well as more conversion offerings, to make the experience more
pleasant. Until then, expect to set up your own mappings for these functions.

## Installation

### Via [Pathogen](https://github.com/tpope/vim-pathogen)

    cd ~/.vim/bundle
    git clone git://github.com/jimf/vim-color-convert

## Usage

__color_convert.vim__ exposes the following functions for converting one color
value to another:

- `color_convert#hex2rgb(hex_string)`
- `color_convert#rgb2hex(rgb_string)`

## Example Mappings

### Visual mode

- `vnoremap <leader>r c<C-R>=color_convert#hex2rgb('<C-R>"')<CR><ESC>`
- `vnoremap <leader>h c<C-R>=color_convert#rgb2hex('<C-R>"')<CR><ESC>`

## License

MIT
