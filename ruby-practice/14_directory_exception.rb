# w, w+, r, r+, a, a+ 
# File.new('sample.txt', 'w+')
# File.open(filename, mode)
# File.rename(old_name, new_name)
# File.delete("sample1.txt")
# File.file?("sample.txt")
# File.exist?("newSample.txt")
# File.readable?("newSample.txt") - have read permission
# File.writable?("newSample.txt") - have write permission
# syswrite(text)
# close()
# sysread(read_char_num)

# Dir.mkdir()
# Dir.empty?()
# obj=Dir.new("abc")
# obj.path
# Dir.pwd(Dir.getwd)
# Dir.home(Dir.home('nikita-shah'))
# Dir.entries("abc")
# Dir.glob("*") - all folders list in working directory
# Dir.glob("*abc*")
# Dir.exist?("abc/workspace")
# Dir.rmdir("abc/workspace")
# Dir.chdir('abc')
# Dir.pwd.gsub('/abc', '')
# each, close,fileno, path, pos, read, tell, seek(1), rewind

# FileUtils.cp( 'parent_folder/sample1.txt','abc')
# FileUtils.mv("parent_folder", "abc")

P "=======================exception===================="
# class MyException < StandardError
# raise
# begin..rescue MyException => e... end
# begin.. raise "MESSAGE" rescue.. end
# raise StandardError, 'Exception Created! for ensure'
# begin..raise..rescue..else..ensure..end