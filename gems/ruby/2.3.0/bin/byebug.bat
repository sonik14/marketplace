@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\Categorized\Programming\Ruby23\bin\ruby.exe" "D:/Documents/RubyProjects/marketplace/gems/ruby/2.3.0/bin/byebug" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\Categorized\Programming\Ruby23\bin\ruby.exe" "%~dpn0" %*