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



