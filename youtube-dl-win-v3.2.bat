<!-- :
:: textSubmitter.bat
@echo on
set "goEnd=1"
set "openFolders=0"
:top

for /f "tokens=1-4 delims=," %%a in ('mshta.exe "%~f0"') do (
    set "openFolders=%%a"
    set "goEnd=%%b"
    set "inputUrl=%%c"
    set "output=%%d")
if "%openFolders%" == "1" goto Folder
if "%goEnd%" == "1" goto endMission
if "%goEnd%" == "0" goto mission



:Folder
%SystemRoot%\explorer.exe ".\download"
set "openFolders=0"
goto top

:mission

cd /d %~dp0
cd /d .\bin\
.\youtube-dl -x --referer "youtube.com" --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36" --audio-format mp3  --output "../download/%output%.%%(ext)s" --audio-quality 0 %inputUrl% 
set "goEnd=1"
cd ..\
goto top


:endMission
exit




-->

<html>
  <head>
    <title>youtube mp3 downloader (ver3.1)</title>
      youtube mp3 downloader (ver3.1)<br>
  </head>
  <body>

    <script language='javascript' >
    function pipeText() {
	    var goEnd = 0;
      var openFolders=0;
      var inputUrl=document.getElementById('inputUrl').value;
      var output=document.getElementById('output').value;
      var Batch = new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
      close(Batch.WriteLine(openFolders+','+goEnd+','+inputUrl+','+output));
      } 

	  function goEnd(){
		  var goEnd=1;
      var openFolders=0;
		  var Batch = new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
		  close(Batch.WriteLine(openFolders+','+goEnd+','+inputUrl+','+output));
		  }

    function openFolder(){
      var goEnd=0;
      var openFolders=1;
		  var Batch = new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
		  close(Batch.WriteLine(openFolders+','+goEnd+','+inputUrl+','+output));
      }

    </script>

    <br>Please input the youtube URL: <input type='text' name='inputUrl' size='30'></input><br>
    <br>Output name of the file (ex:一場遊戲一場夢-王傑): <input type='text' name='output' size='30'></input><br>
    <hr>
    <button onclick='pipeText()'>Download</button></t></t>
    <button onclick='goEnd()'>Exit</button>
    <button onclick='openFolder()'>Open Folder</button>
  </body>
</html>