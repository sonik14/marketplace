@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\ProgramsExcluded\Programming\RailsInstaller\Ruby2.3.3\bin\ruby.exe" "D:/Documents/Work/RubyProjects/marketplace/gems/ruby/2.3.0/bin/rubocop" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\ProgramsExcluded\Programming\RailsInstaller\Ruby2.3.3\bin\ruby.exe" "%~dpn0" %*
