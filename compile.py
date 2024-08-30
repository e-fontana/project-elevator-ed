import os, sys
os.system(f"iverilog -o output {sys.argv[1]} && vvp output > output.txt && rm output")