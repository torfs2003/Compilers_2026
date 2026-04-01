import os
import sys
import shutil
import subprocess
import tempfile



class Compiler:

    _SPIM_UNSUPPORTED = (
        ".file",
        ".ident",
        ".addrsig",
        ".addrsig_sym",
        ".attribute",
        ".build_version",
        ".module",
        ".nan",
        ".option",
    )

    def __init__(self):
        self.clang = shutil.which("clang")
        self.llc = shutil.which("llc")
        self.cc = shutil.which("cc") or shutil.which("gcc")