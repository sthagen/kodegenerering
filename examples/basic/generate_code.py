# pylint: disable=no-member
"""Example to minimize magix in the host files."""
import cog  # type:ignore

FENCE = '```'

def cpp_example():
    """Generate some C++ function declarations."""
    names = ['do_something', 'and_another', 'final_words']
    cog.outl(f'{FENCE}cpp')
    for name in names:
        cog.outl(f'void {name}();')
    cog.outl(f'{FENCE}')


def py_example():
    """Why not generate python code for fun?"""
    cog.outl(f'{FENCE}python')
    cog.outl('print(42)')
    cog.outl(f'{FENCE}')
