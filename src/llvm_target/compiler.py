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
        ".cfi_",
        ".type",
        ".size",
    )

    def __init__(self):
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

        self._mkdir(output_path)


        if self.clang:
            self._run(
                [self.clang, ll_path, "-o", output_path, "-lm"],
                label="clang (native binary)",
            )
        elif self.llc and self.cc:
            obj = self._tmp(".o")
            self._run(
                [self.llc, "-filetype=obj", ll_path, "-o", obj],
                label="llc -filetype=obj",
            )
            self._run(
                [self.cc, obj, "-o", output_path, "-lm"],
                label="cc (link)",
            )
            os.remove(obj)

        else:
            sys.exit(
                "[Error] Cannot produce binary: 'clang' and 'llc+cc' both unavailable.\n"
                "Install clang:  sudo apt install clang"
            )

        print(f"Native binary -> {output_path}")

    def compile_to_mips(self, ll_path: str, output_path: str) -> None:

        if not self.llc:
            sys.exit(
                "[Error] 'llc' is required for MIPS output.\n"
                "sudo apt install llvm"
            )

        self._mkdir(output_path)

        self._run(
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

        print(f"MIPS assembly -> {output_path}")
        print(f"  Run in SPIM : spim -f {output_path}")
        print(f"  Run in MARS : java -jar Mars.jar {output_path}")

    def _run(self, cmd: list, label: str) -> None:
        result = subprocess.run(cmd, capture_output=True, text=True)

        if result.returncode != 0:
            print(f"[Error] {label} failed (exit code {result.returncode}):")
            print(result.stdout)
            print(result.stderr)
            sys.exit(1)

    def _strip_spim_directives(self, path: str) -> None:
        with open(path) as fh:
            lines = fh.readlines()

        out = []
        for line in lines:
            s = line.strip()

            if any(s.startswith(d) for d in self._SPIM_UNSUPPORTED):
                continue

            if s.startswith(".section"):
                if "text" in s:
                    out.append("\t.text\n")
                elif "data" in s:
                    out.append("\t.data\n")
                continue
            out.append(line)

        with open(path, "w") as fh:
            fh.writelines(out)

    @staticmethod
    def _mkdir(path: str) -> None:
        d = os.path.dirname(path)
        if d:
            os.makedirs(d, exist_ok=True)

    @staticmethod
    def _tmp(suffix: str) -> str:
        fd, p = tempfile.mkstemp(suffix=suffix)
        os.close(fd)
        return p