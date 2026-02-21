require 'fileutils'
# File Methods
# File Handling Program

# Creating a file
# fileobject = File.new("sample.txt", "w+");
fileobject = File.open("sample.txt", "w");
# Writing to the file
fileobject.syswrite("File Handling");
 # Closing a file
fileobject.close();

# fileobject = File.new("sample.txt", "w+");
fileobject = File.open("sample.txt", "w+");
# Writing to the file
fileobject.syswrite("File Handling 123");  
 # Closing a file
fileobject.close();

# w or w+ will create a new file with write access
# r+ will also write in file

fileobject = File.open("sample.txt", "r+");
# Writing to the file
fileobject.syswrite("File Handling 1234");
 # Closing a file
fileobject.close();

fileobject = File.open("sample.txt", "r");
# Writing to the file
# fileobject.syswrite("File Handling 12345");  # raise an error as its open for read only
 # Closing a file
fileobject.close();

fileobject = File.open("sample.txt", "a");
# Writing to the file
fileobject.syswrite("Test a");
 # Closing a file
fileobject.close();

fileobject = File.open("sample.txt", "a+");
# Writing to the file
fileobject.syswrite("Test a plus");
 # Closing a file
fileobject.close();


# fileobject = File.new("sample.txt", "r");
fileobject = File.open("sample.txt", "r");
p fileobject.sysread(200)
 # Closing a file
fileobject.close();


puts File.rename("sample.txt", "newSample.txt")

File.open("sample1.txt", "w+");
puts File.delete("sample1.txt")

# Checking the old filename is existing or not
puts File.file?("sample.txt")


# Checking the renamed file is exiting or not
puts File.file?("newSample.txt")
puts File.exist?("newSample.txt")
puts File.exists?("newSample.txt")


# Checking the file have read permission
puts File.readable?("newSample.txt")

# Checking the file have read permission
puts File.writable?("newSample.txt")

# Directory

# creating directory
f=Dir.mkdir "abc" 

# a directory named abc is created
p "#{f}"

p Dir.empty?('abc')

obj=Dir.new("abc")
p obj.path

p Dir.pwd
p Dir.getwd

p Dir.home
p Dir.home('nikita-shah')

# Modify current directory
# Dir.chdir("abc")
Dir.mkdir("abc/workspace")
p Dir.entries("abc")

print"\nAll files in the current working directory: \n"
puts Dir.glob("*")
print"\nAll files containing 'abc' in the name: \n"
puts Dir.glob("*abc*")
print"\nAll ruby files: \n"
puts Dir.glob("*.rb")

# p Dir.delete('abc/workspace') if Dir.exists?("abc/workspace")
puts Dir.rmdir("abc/workspace") if Dir.exist?("abc/workspace")

# Dir.mkdir "parent_folder"
FileUtils.mkdir_p "parent_folder/child_folder/folder"


Dir.chdir('abc')
file = File.new('sample.txt', 'w+')
file.syswrite('Testing copy')
file.close()

p Dir.pwd.gsub('/abc', '') + '/parent_folder'

Dir.chdir(Dir.pwd.gsub('/abc', '') + '/parent_folder')
file = File.new('sample1.txt', 'w+')
file.syswrite('Testing copy feature')
file.close()

Dir.chdir(Dir.pwd.gsub('/parent_folder', ''))
FileUtils.cp( 'parent_folder/sample1.txt','abc')

# Move parent_folder into abc
FileUtils.mv("parent_folder", "abc")

p Dir.rmdir("abc/parent_folder/child_folder/folder")
p Dir.rmdir("abc/parent_folder/child_folder")
p File.delete("abc/parent_folder/sample1.txt")
p File.delete("abc/sample1.txt")
p File.delete("abc/sample.txt")
p Dir.rmdir("abc/parent_folder")
p Dir.delete('abc') if Dir.exists?("abc")


# Dir Class Methods

# mkdir : This method is used to create a new directory. You can also put permission on the new directory.
# Dir.mkdir "dir_name", permission

# Deleting directory : To delete a directory rmdir, delete, and unlink methods are used, the work of all these methods are same.
# Dir.delete "dir_name"
# Dir.rmdir "dir_name"
# Dir.unlink " Dir_name"

#  exist? : By using exist? method you can check whether the directory exists or not. It returns value in true or false.
# Dir.exist?"dir_name"

# pwd : To check the current working directory, pwd(present working directory) method is used.
# Dir.pwd

# chdir : To change the current working directory, chdir method is used. In this method, you can simply pass the path to the directory where you want to move.
# Dir.chdir ”path”

# entries : To check what a directory contains. It provides you with an array of content.
# Dir.entries”dir_name” #[“.”, “..”, “file.txt”, “another directory”]

# getwd : This method is used to return path of the current working directory.
# Dir.getwd

# home : This method is used to return home directory of current user.
# Dir.home

# glob : This method is used to heck certain file in the current directory. It works on pattern matching concept. It expands pattern i.e array of pattern or a string pattern and returns the value as matched. Some notations used in glob method are:
# Dir.glob(“pattern”)
# *: It matches all files.
# c*: It matches files starting with c.
# *c: It matches files ending with c.
# *c*: It matches all the files with contains c in them including starting and ending.
# **: It matches directories recursively.
# ?: it matches any one character.
# [set]: It matches any one character in the set.
# {p, q}: It matches either p or either q literal.
# \: It escapes the next metacharacter.

p "-----------------------------------"
# Dir Instance Methods
# close : It is used to close the directory stream.
Dir.mkdir "test"
h_o = Dir.new("test")
p h_o.close

# each : In each method, the block should be called once for each entry in the directory and pass the filename for each entry as a parameter to the block.
h_o = Dir.new("test")
p h_o.each{|x| puts "Got#{x}"}

# fileno : This method is used to provide the file number used in dir or we can say it provides the description of the file in integer value.
h_o = Dir.new("test")
p h_o.fileno

# path : This method returns the path parameter.
h_o = Dir.new("test")
p h_o.path

# pos : This method returns current position parameter.
h_o = Dir.new("test")
p h_o.pos

# read : This method reads the next entry from the dir and returns as a string.
h_o = Dir.new("test")
p h_o.read

# tell : This method is used to tell the current position in dir.
h_o = Dir.new("test")
p h_o.tell

# seek : This method is used to seek the specific location in dir. It returns value in the form of integer.
h_o = Dir.new("test")
p h_o.seek(1)

# Rewind : This method is used to reposition dir to the first position.
h_o = Dir.new("test")
p h_o.rewind

Dir.rmdir "test"