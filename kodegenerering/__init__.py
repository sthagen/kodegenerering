# [[[fill git_describe()]]]
__version__ = '2023.10.22+parent.c09a0094'
# [[[end]]] (checksum: 051ba19f776c8a716b930eef483277eb)
__version_info__ = tuple(
    e if '-' not in e else e.split('-')[0] for part in __version__.split('+') for e in part.split('.') if e != 'parent'
)
