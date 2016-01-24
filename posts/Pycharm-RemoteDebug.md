pycharm安装目录里的pycharm-debug.egg
丢进sitepackages
添加到setuptools.pth


```python 
import pydevd
pydevd.settrace('localhost', port=50001, stdoutToServer=True, stderrToServer=True)
```