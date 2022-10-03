define(`old_include', defn(`include'))
define(`parent', `regexp(`$1', `\(.*\)/[^/]+/?$', `\1')')
pushdef(`include', `old_include(parent(__file__)/$1)')
