import os
import platform
rm = "del" if platform.system() else "rm"
os.system(f"iverilog -o output testbench.v && vvp output > output.txt && {rm} output")
