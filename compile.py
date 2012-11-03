import sys
import os
import subprocess

def main():
    subprocess.call(["mxmlc", "-source-path", os.path.join("..", "flixel"),
        "-static-link-runtime-shared-libraries=true", "-output",
        os.path.join("bin", "HelloWorld.swf"), 
        os.path.join("src", "HelloWorld.as")])

if __name__ == "__main__":
    sys.exit(main())

