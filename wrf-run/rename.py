from os import listdir, rename, getcwd
from os.path import isfile, join
import sys

path = getcwd()

files = [f for f in listdir(path) if isfile(join(path, f)) and f.startswith('gfs')]

letters = [chr(x) for x in range(65,91)]

toExtension = lambda i : letters[int((i / (26*26)) % 26)]+letters[int((i / 26) % 26)]+letters[int(i % 26)]

for i, name in enumerate(files, start=0):
    src = join(path, name)
    ext = toExtension(i)
    dest = join(path, "GRIBFILE." + ext) 
    rename(src, dest)    
    print ("Renamed {} to {}".format(src, dest))