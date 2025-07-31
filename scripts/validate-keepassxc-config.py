#!/usr/bin/env python3

import configparser
import pathlib
import sys


def main():
    path = pathlib.Path(sys.argv[1])
    config = configparser.ConfigParser(interpolation=None)
    config.optionxform = str
    config.read(path)

    if "KeeShare" in config:
        print("[KeeShare] section detected.")
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
