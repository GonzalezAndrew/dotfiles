import readline
import rlcompleter
import os

try:
    # install rich for repl
    from rich import pretty
    pretty.install()
except ImportError:
    pass

# Tab Completion
readline.parse_and_bind("tab: complete")
del readline, rlcompleter


# Change exit() to exit
type(exit).__repr__ = lambda self: self()

