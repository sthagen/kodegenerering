# [[[fill git_describe()]]]
__version__ = '2022.12.29+parent.e3f9dff2'
# [[[end]]] (checksum: 209379cf9a1621be6558f1162d66808d)
__version_info__ = tuple(
    e if '-' not in e else e.split('-')[0] for part in __version__.split('+') for e in part.split('.') if e != 'parent'
)
