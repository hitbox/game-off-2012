#!/usr/bin/env python2
import sys
import os
import subprocess

def main():
    target = "Game"
    retval = subprocess.call(["mxmlc", 
        "-debug",
        "-source-path", os.path.join("..", "flixel"),
        "-static-link-runtime-shared-libraries=true", 
        "-output", os.path.join("bin", target + ".swf"), 
        os.path.join("src", target + ".as")])

    if retval == 0:
        subprocess.call(["flashplayerdebugger", 
            os.path.join("bin", target + ".swf")])

if __name__ == "__main__":
    sys.exit(main())

