# Rodeo
~~ Rodeo IDE版本并不好用 ~~

初始化
----
```
conda install jupyter
conda install matplotlib
for %i in (python.exe) do @echo. %~$PATH:i
F:\Anaconda2\envs\dev27\python.exe
conda install pandas
conda install lxml
```

console
----
内置console执行系统命令前面加!
    eg. !activate dev27

[~目录](C:\Users\Administrator)
start notepad ".rodeorc"
{
  "id": "662148f0bedf11e58326b1cbea06dd93",
  "fontType": "Helvetica Neue",
  "version": "1.2.1",
  "paneVertical": "54.569327731092436%",
  "paneHorizontalRight": "39.08523908523909%",
  "paneHorizontalLeft": "44.6985446985447%",
  "pythonCmd": "F:\\Anaconda2\\envs\\dev27\\python.exe",
  "defaultWd": "E:\\1GitHub\\Python\\5rodeo",
  "autoSave": false,
  "theme": "css/styles-dark.css",
  "fontSize": 14,
  "displayDotFiles": false,
  "editorTheme": "ace/theme/monokai"
}

全局加载配置
---
~/.rodeoprofile 

env 环境
---
在Conda env 环境运行需要加入PYTHONPATH
```
echo set PYTHONPATH=F:\Anaconda2\envs\dev27\^&start C:\PROGRA~2\Rodeo\rodeo.exe > C:\PROGRA~2\Rodeo\run2.bat
```