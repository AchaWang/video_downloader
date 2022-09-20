<!-- :
:: textSubmitter.bat
@echo off
for /f "tokens=1-2 delims=," %%a in ('mshta.exe "%~f0"') do (
    set "inputUrl=%%a"
    set "output=%%b"
)

cd /d %~dp0
cd /d .\bin\
.\youtube-dl -x --audio-format mp3  --output "../download/%output%.%%(ext)s" --audio-quality 0 %inputUrl%


pause
goto :EOF

-->

<html>
  <head>
    <title>youtube mp3 downloader (ver1.0)</title>
      youtube mp3 downloader (ver1.0)<br>
  </head>
  <body>

    <script language='javascript' >
        function pipeText() {
            var inputUrl=document.getElementById('inputUrl').value;
            var output=document.getElementById('output').value;
            var Batch = new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
            close(Batch.WriteLine(inputUrl+','+output));
      }
    </script>

    <br>Please input the youtube URL: <input type='text' name='inputUrl' size='30'></input><br>
    <br>Output name of the file (ex: 一場遊戲一場夢-王傑): <input type='text' name='output' size='30'></input><br>
    <hr>
    <button onclick='pipeText()'>Download</button>
  </body>
</html>