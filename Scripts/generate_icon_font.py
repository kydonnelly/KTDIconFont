##
##  generate_icon_font.py
##  KTDIconFont
##
##  Created by Kyle Donnelly on 3/21/20.
##
##  Use this script to connect an IcoMoon download to your KTDIconFont project.
##  https://icomoon.io/
##  https://github.com/kydonnelly/KTDIconFont
##
##  Use IcoMoon to generate an icon font zip.
##  Run this script and provide:
##    1. The path to the zip/folder you downloaded from IcoMoon
##    2. The path to a directory to place the generated swift file in.
##    3. [Optional] The path to a directory to copy the .ttf into.
##    and a target directory to place the generated files in.
##
##  The generated swift file defines an IconFont enum you can use in your project.
##

import argparse
from json import load, loads
from shutil import copyfile, copyfileobj
from string import Template
from os import path
from sys import exit
import zipfile

##### Argument parsing #####
parser = argparse.ArgumentParser(description='Generate IconFont swift enum from IcoMoon font file.')
parser.add_argument('-s', '--source', help='path to the zip or folder downloaded from IcoMoon')
parser.add_argument('-t', '--target', help='path to place the generated swift file in')
parser.add_argument('-f', '--font', help='directory to copy the font file to')
args = parser.parse_args()

source_path = args.source
swift_directory = args.target
font_directory = args.font

##### Argument validation #####
if source_path == None:
    print 'Source directory is required! Specify with -s or --source'
    exit()
    
if swift_directory == None:
    print 'Target directory is required! Specify with -t or --target'
    exit()
    
if font_directory == None:
    if path.isdir(swift_directory):
        font_directory = swift_directory
    else:
        font_directory = path.dirname(swift_directory)

if not path.isdir(font_directory):
    print('Must provide a directory with -f or --font!')
    exit()

##### Load font file info from selection.json #####
def font_file_contents(source_path):
    selection_relative_path = 'selection.json'
    
    if path.isdir(source_path):
        selection_path = path.join(source_path, selection_relative_path)
        f = open(selection_path, 'r')
        contents = load(f)
        f.close()
        
        return contents
    elif zipfile.is_zipfile(source_path):
        zip = zipfile.ZipFile(source_path, 'r')
        try:
            selection_zip = zip.getinfo(selection_relative_path)
            f = zip.open(selection_zip, 'r')
            data = f.read()
            contents = loads(data.decode("utf-8"))
            f.close()
        except KeyError as ke:
            print 'Unable to find selection.json in the zip file.'
            zip.close()
            exit()
        else:
            zip.close()
            return contents
    else:
        print 'Source must be either the directory or zip file downloaded from IcoMoon.'
        exit()

font_json = font_file_contents(source_path)

##### Parse font info from json #####
class FontInfo:
    def __init__(self, json):
        self.name = json['metadata']['name']
        self.iconProperties = [j['properties'] for j in json['icons']]
        
    def __str__(self):
        return "Font name: {0}\nIcons: {1}".format(self.name, ', '.join([p['name'] for p in self.iconProperties]))
        
font_info = FontInfo(font_json)

##### Generate swift code from template #####
current_directory = path.dirname(path.realpath(__file__))

enum_file = open(path.join(current_directory, 'FontEnum.template'), 'r')
enum_template = Template(enum_file.read())
enum_list = [enum_template.substitute(icon_name=p['name'], hex_code=hex(p['code'])) for p in font_info.iconProperties]
enum_code = "\n".join(enum_list)
enum_file.close()

font_file = open(path.join(current_directory, 'FontFile.template'), 'r')
font_template = Template(font_file.read())
font_code = font_template.substitute(font_name=font_info.name, enum_cases=enum_code)
font_file.close()

##### Write swift code to target directory #####
def target_swift_filename(target_path, font_name):
    if path.isdir(target_path):
        return path.join(target_path, font_name + '.swift')
    else:
        return target_path
        
swift_file_name = target_swift_filename(swift_directory, font_info.name)
print("Writing to {0}...".format(swift_file_name))

swift_file = open(swift_file_name, 'w')
swift_file.write(font_code)
swift_file.close()

##### Copy ttf file out of source directory #####
def copy_font_file(source_path, target_path):
    font_file_name = "{0}.ttf".format(font_info.name)
    file_relative_path = path.join('fonts/', font_file_name)
    target_path = path.join(target_path, font_file_name)

    if path.isdir(source_path):
        file_path = path.join(source_path, file_relative_path)
        copyfile(file_path, target_path)
    elif zipfile.is_zipfile(source_path):
        zip = zipfile.ZipFile(source_path, 'r')
        # Copy single file rather than extracting full path
        ttf_file = zip.open(file_relative_path, 'r')
        ttf_target_file = open(target_path, 'w')
        copyfileobj(ttf_file, ttf_target_file)

copy_font_file(source_path, font_directory)

##### All done! #####
print("Done!")
