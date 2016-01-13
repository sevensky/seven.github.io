 nikola build 报错
 ########################################
TaskError - taskid:_scan_locs:sitemap
PythonAction Error
Traceback (most recent call last):
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\doit\action.py", line 383, in execute
    returned_value = self.py_callable(*self.args, **kwargs)
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\nikola\plugins\task\sitemap\__init__.py", line 264, in scan_locs_task
    scan_locs()
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\nikola\plugins\task\sitemap\__init__.py", line 153, in scan_locs
    lastmod = self.get_lastmod(root)
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\nikola\plugins\task\sitemap\__init__.py", line 322, in get_lastmod
    lastmod = datetime.datetime.utcfromtimestamp(os.stat(p).st_mtime).replace(tzinfo=dateutil.tz.gettz('UTC'), second=0, microsecond=0).isoformat().replace('+00:00', 'Z')
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\dateutil\tz.py", line 964, in gettz
    tz = tzwin(name)
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\dateutil\tzwin.py", line 92, in __init__
    self._stdname = keydict["Std"].encode("iso-8859-1")
UnicodeEncodeError: 'latin-1' codec can't encode characters in position 0-4: ordinal not in range(256)


tzutil /g
python -c "import sys;  print (sys.stdout.encoding)"
python -c "import dateutil.tz; print( dateutil.tz.gettz('UTC'))"

Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "f:\Anaconda2\envs\dev3.5\lib\site-packages\dateutil\tz.py", line 964, in gettz
    tz = tzwin(name)
  File "f:\Anaconda2\envs\dev3.5\lib\site-packages\dateutil\tzwin.py", line 92, in __init__
    self._stdname = keydict["Std"].encode("iso-8859-1")


UnicodeEncodeError: 'latin-1' codec can't encode characters in position 0-4: ordinal not in range(256)



https://github.com/getnikola/nikola/issues/1806
	https://github.com/dateutil/dateutil/issues/92

#fix
 https://github.com/aschatten/dateutil/commit/81f684ff6c03b336e820cd849cf557b01d2017f9
 self._stdname = keydict["Std"].encode("iso-8859-1")
 -        self._dstname = keydict["Dlt"].encode("iso-8859-1")
 +        self._stdname = keydict["Std"]
 +        self._dstname = keydict["Dlt"]
  
          self._display = keydict["Display"]
  
 @@ -129,8 +132,8 @@ def __init__(self):
              with winreg.OpenKey(handle, TZLOCALKEYNAME) as tzlocalkey:
                  keydict = valuestodict(tzlocalkey)
  
 -            self._stdname = keydict["StandardName"].encode("iso-8859-1")
 -            self._dstname = keydict["DaylightName"].encode("iso-8859-1")
 +            self._stdname = keydict["StandardName"]
 +            self._dstname = keydict["DaylightName"]



 File "f:\anaconda2\envs\dev3.5\lib\site-packages\nikola\plugins\compile\ipynb.py", line 38, in <module>
    from jupyter_client import kernelspec
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\jupyter_client\__init__.py", line 7, in <module>
    from .manager import KernelManager, run_kernel
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\jupyter_client\manager.py", line 32, in <module>
    from .session import Session
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\jupyter_client\session.py", line 53, in <module>
    from jupyter_client.jsonutil import extract_dates, squash_dates, date_default
  File "f:\anaconda2\envs\dev3.5\lib\site-packages\jupyter_client\jsonutil.py", line 25, in <module>

-注释掉    datetime.strptime("1", "%d")


 ............. datetime.strptime("1998072012", "%Y%m%d%H") 
 python -c "from datetime import datetime;  print (datetime.strptime('1', '%d') )"


