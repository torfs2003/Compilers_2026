import os
import sys
import shutil
import subprocess
import tempfile

class Compiler:

    #SPIM/MARS DO NOT UNDERSTAND!
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
        #find the tools we'll be using!
        self.clang = shutil.which("clang")
        self.llc = shutil.which("llc")
        self.cc = shutil.which("cc") or shutil.which("gcc")

        if not self.llc:
            print(
                "[Warning] 'llc' not found.\n"
                "sudo apt install llvm"
            )
        if not self.clang:
            print(
                "[Warning] 'clang' not found. Falling back to llc + cc for binaries.\n"
                "sudo apt install clang"
            )

    def compile_to_binary(self, ll_path: str, output_path: str) -> None:

        #maak de output folder
        self._mkdir(output_path)


        if self.clang:
            self._run(
                #full path, .ll file, waar te schrijven!, links math library! in deze volgorde
                [self.clang, ll_path, "-o", output_path, "-lm"], #de terminal command
                label="clang (native binary)",
            )
        #als llc not installed -> cc of gcc!
        elif self.llc and self.cc:
            obj = self._tmp(".o") #maak object file -> STAP 1
            self._run(
                [self.llc, "-filetype=obj", ll_path, "-o", obj], #de terminal command voor llc
                label="llc -filetype=obj",
            )
            self._run(
                [self.cc, obj, "-o", output_path, "-lm"],  #de terminal command voor cc
                label="cc (link)",
            )
            os.remove(obj) #verwijder .o file

        else:
            sys.exit(
                "[Error] Cannot produce binary: 'clang' and 'llc+cc' both unavailable.\n"
                "Install clang:  sudo apt install clang"
            )

        print(f"Native binary  →  {output_path}")

    def compile_to_mips(self, ll_path: str, output_path: str) -> None:

        if not self.llc:
            sys.exit(
                "[Error] 'llc' is required for MIPS output.\n"
                "sudo apt install llvm"
            )

        self._mkdir(output_path) #maak output folder

        self._run(
            #gebruik mips, mips32! static-> alle adressen at compile time!,optimisation (-01), .ll file (input)
            #output file -> allemaal in deze volgorde zonder self.llc
            [
                self.llc,
                "-march=mips",
                "-mcpu=mips32r2",
                "-relocation-model=static",
                "-O1",
                ll_path,
                "-o", output_path,
            ],
            label="llc (MIPS)",
        )

        self._strip_spim_directives(output_path)

        #user vertellen waar file!
        print(f"MIPS assembly  →  {output_path}")
        print(f"  Run in SPIM : spim -f {output_path}")
        print(f"  Run in MARS : java -jar Mars.jar {output_path}")

    #runt een terminal command!
    def _run(self, cmd: list, label: str) -> None:
        result = subprocess.run(cmd, capture_output=True, text=True)

        #als niet success -> print de fout!
        if result.returncode != 0:
            print(f"[Error] {label} failed (exit code {result.returncode}):")
            print(result.stdout)
            print(result.stderr)
            sys.exit(1)

    # verwijder lines die MIPS niet aankan
    def _strip_spim_directives(self, path: str) -> None:
        with open(path) as fh:
            lines = fh.readlines()

        #out is de lines dat we nodig hebben!
        out = []
        for line in lines:
            s = line.strip()

            #als SPIM_UNSUPPORTED SKIP HET!
            if any(s.startswith(d) for d in self._SPIM_UNSUPPORTED):
                continue

            #verwijder uncessery words die SPIM niet begrijpt -> behoud alleen de belangrijke dingen!
            if s.startswith(".section"):
                if "text" in s:
                    out.append("\t.text\n")
                elif "data" in s:
                    out.append("\t.data\n")
                continue
            out.append(line)

        #overwrite met de betere versie (out)!
        with open(path, "w") as fh:
            fh.writelines(out)

    #maak een output folder
    @staticmethod
    def _mkdir(path: str) -> None:
        #maak folder -> d = foldernaam
        d = os.path.dirname(path)
        if d:
            os.makedirs(d, exist_ok=True)

    #maak temporary folder
    @staticmethod
    def _tmp(suffix: str) -> str:
        fd, p = tempfile.mkstemp(suffix=suffix)
        #alleen llc heeft fd nodig dus close dit -> pyhton heeft het niet nodig!
        os.close(fd)
        #return de path als een string
        return p