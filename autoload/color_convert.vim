let s:hexpattern = '#\(\x\{3}\|\x\{6}\)\>'
let s:hexlong = '#\(\x\{2}\)\(\x\{2}\)\(\x\{2}\)'
let s:rgbpattern = 'rgb(\(\d\{1,3}\), \?\(\d\{1,3}\), \?\(\d\{1,3}\))'

function! s:clamp(val,minval,maxval)
    return min([max([a:val, a:minval]), a:maxval])
endfunction

function! s:rgb2hex(rgb)
    return printf('#%02x%02x%02x', s:clamp(a:rgb[0], 0, 255), s:clamp(a:rgb[1], 0, 255), s:clamp(a:rgb[2], 0, 255))
endfunction

function! s:xyz2rgb(xyz)
    return 'rgb(' . join(a:xyz, ', ') . ')'
endfunction

function! s:parse_hex(raw)
    if strlen(a:raw) == 7
        let parts = matchlist(a:raw, s:hexlong)[1:3]
    else
        let parts = map(split(a:raw[1:3], '\zs'), 'v:val . v:val')
    endif
    return map(parts, 'str2nr(v:val, 16)')
endfunction

function! s:parse_rgb(raw)
    return map(matchlist(a:raw, s:rgbpattern)[1:3], 'str2nr(v:val, 10)')
endfunction

function! color_convert#rgb2hex(raw)
    if a:raw =~ s:rgbpattern
        return s:rgb2hex(s:parse_rgb(a:raw))
    else
        echoerr 'Unable to parse color. Expected value in "rgb(x, y, z)" format.'
        return a:raw
    endif
endfunction

function! color_convert#hex2rgb(raw)
    if a:raw =~ s:hexpattern
        return s:xyz2rgb(s:parse_hex(a:raw))
    else
        echoerr 'Unable to parse color. Expected value in "#XXXXXX" format.'
        return a:raw
    endif
endfunction
