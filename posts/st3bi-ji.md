
#cubie COM
	ttl 线 黑 -- GND ； 红 -- VCC千万不要接 ； 绿 -- RX  ；  白 -- TX)
	putty连com 看设备管理器com端口
	BaudRate:115200
	 
##cubian ssh
	端口36000 账户cubie:cubie
		sudo -i		指令切换到 root。
		ssh -p 36000 YOUR_CUBIEBOARD_IP -l cubie
##启用Root帐号
	root用户默认未启用，你可以使用以下指令启用，
	cubie@Cubian:~# sudo passwd root
##对比
	sudo df -h 			#nand有 /dev/nandc
	sudo free -h

#系统转nand
	sudo rm -rf /var/lib/apt/lists/*
	sudo apt-get update
	sudo apt-get install cubian-nandinstall
	sudo cubian-nandinstall
*** 成功后提示 ***
	*** Success! remember to REMOVE your SD card from board ***
	*** Read http://tinyurl.com/qyee5k2, if the board won't boot from NAND ***

##Cubian
	Cubian-nandinstall 可以让你非常简单的把根文件系统从SD卡迁移到NAND上。但是有时候即使你执行安装脚本并没有出错，系统仍然有可能启不起来。
	boot0 和 boot1
		其中一个已知的原因是设备上的 boot0 和 boot1 代码, boot0 和 boot1 位于 NAND 上的一个特殊区域，据我所知，只有 livesuit 能够访问。它们可能并不是为了运行Linux而设计的，比如，Cubieboard 就会在出厂的时候在NAND上安装 Android系统。

		要解决这个问题也很简单，你只需要首先使用 livesuit 刷入 lubuntu，然后再使用cubian-nandinstall 即可。

		请注意，每次你都需要重复这个步骤，如果你在NAND里重新刷入了Android系统。

		uEnv.txt 里的 root 参数
		另一个常见的问题是 uEnv.txt 里设置的 root 参数不对。 nand安装脚本会设置 root=/dev/nandb。这是没有问题，如果你使用的是Cubian的内核。 如果你用的是patwood的内核，那么它应该是 /dev/nand2。 这里的设备名称取决于内核配置 CONFIG_SUNXI_NAND_COMPAT_DEV.

		如果nand安装仍然有问题，请留言。
	 	uEnv.txt  root=/dev/nandb
	 	/dev/nandb

	 	Connect to serial and enter the uboot command mode before kernel boot.Then
	 	-> setenv root /dev/nandb &Reboot
#amysql编译方式 不成功
	wget http://amh.sh/amh.sh && bash amh.sh gcc 2>&1 | tee amh.log	
		[Notice] AMH and MySQL Account:
		admin: 9ce783c80fca
		root: 9ce783c80fca 
###配置时间
	sudo ntpdate-debian
###Cubian update
	apt-get install cubian-update
	sudo cubian-update	
#修改密码 
	sudo passwd cubie
#解除root锁定，为root用户设置密码
	sudo passwd
		Password:<---------输入当前用户密码
		Enter new UNIX password:<------输入root帐号密码
		Retype new UNIX password:<------重复新的root用户密码

		pwsswd:已成功更新密码，启用root帐号
#Midnight Commander文件管理
	sudo apt-get install mc
#mysql
	sudo apt-get install mysql-server mysql-client
#nginx
	sudo apt-get install nginx
	sudo /etc/init.d/nginx start
	#Configure 
	sudo nano /etc/nginx/sites-available/default #default virtual host file
		监听端口 默认index
		location ~ \.php$ {
		      fastcgi_split_path_info ^(.+\.php)(/.+)$;
		      # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini

		      # With php5-cgi alone:
		      #fastcgi_pass 127.0.0.1:9000;
		      # With php5-fpm:
		      fastcgi_pass unix:/var/run/php5-fpm.sock;
		      fastcgi_index index.php;
		      include fastcgi_params;
		}
#php
	sudo apt-get install php5-fpm
	sudo nano /etc/php5/fpm/php.ini
			find the line
			   ;cgi.fix_pathinfo=1
			remove ; and change the 1 to 0
	sudo nano /etc/php5/fpm/pool.d/www.conf
		 <code>listen=/var/run/php5-fpm.sock</code>

	sudo service php5-fpm restart
	#create
	sudo nano /usr/share/nginx/www/info.php 	#<?php phpinfo();?>
#python 
	python -m SimpleHTTPServer 8080
	curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python
	#apt-get install python-pip
		 pip install --upgrade pip 
			Permission denied: '/usr/bin/pip-2.7'
	easy_install -U distribute
	apt-get install python-scipy
	git clone https://github.com/waditu/tushare.git
	cd tushare &pip install -r requirements.txt 

	win7 安装 pyautogui
	pip install -i https://pypi.anaconda.org/pypi/simple pyautogui  --proxy 127.0.0.1:8787

#花生壳
	SN:RAPIc0000000f4c00010
	Please visit http://b.oray.com 
	Oraynewph start success !	
#nodejs  不要了....
		# Ubuntu node
		sudo apt-get install nodejs nodejs-legacy

		# Or Chris Lea's PPA Node (more up to date)
		sudo add-apt-repository ppa:chris-lea/node.js
		sudo apt-get update
		sudo apt-get install nodejs

		sudo apt-get install build-essential
		npm install serialport

	http://stackoverflow.com/questions/16628118/node-js-source-code-build-giving-segmentation-fault-on-arm
	http://cubie.cc/forum.php?mod=viewthread&tid=843&highlight=nodejs


	wget http://www.nodejs.org/dist/v0.10.15/node-v0.10.15.tar.gz
	tar -xzvf node-v0.10.15.tar.gz
	cd node-v0.10.15
	./configure --without-snapsho	##注释：这一句是关键 'v8_use_snapshot': 'false' ，就可以继续
	make && make install
	node -v
	console.log('Hello World run in NodeJS'); > Helloworld.js
	node Helloworld.js 
Win + R->sysdm.cpl -> ST3.path  subl命令

	subl file    :: 使用Sublime Text打开file文件
	subl folder  :: 使用Sublime Text打开folder文件夹
	subl .       :: 使用Sublime Text当前文件夹

#命令
	ctrl + ` 控制台s
	Ctrl + Shift + P   命令板

	Ctrl + Enter 	在当前行下面新增一行然后跳至该行；
	Ctrl + Shift + Enter在当前行上面增加一行并跳至该行。
	Ctrl + ←/→进行逐词移动，相应的，
	Ctrl + Shift + ←/→进行逐词选择
	Ctrl + ↑/↓移动当前显示区域，
	Ctrl + Shift + ↑/↓移动当前行。
	Ctrl + Shift + K 删除当前行

	Ctrl + Shift + L 可以将当前选中区域同时编辑 [数组、json成员]
	Ctrl + j 向后合并 可单行， 多选区域↑方
		values = [
			'a', 
			'b', 
			'c', 
		]

# 查找 
	Ctrl+D 多重逐个选择 应用场景批量重命名
	Alt+F3 多重选择所有位置
	快速向下查找F3  向上S+F3

# 跳转
	ctrl+p 高级跳  [文件名][@跳语法 #跳关键字 :跳行]
	ctrl+g 跳行

#侧栏 
	ctrl+k,ctrl+b

##窗口(Window)
	使用Ctrl + Shift + N创建一个新窗口
	c+s+t 恢复
#屏幕
	Alt + Shift + 2进行左右分屏，
	Alt + Shift + 8进行上下分屏，
	Alt + Shift + 5进行上下左右分屏（即分为四屏）
	Ctrl + 数字键跳转到指定屏，
	Ctrl + Shift + 字键将当前屏移动到指定屏。
	Ctrl + 1会跳转到1屏，而Ctrl + Shift + 2会将当前屏移动到2屏。
	全屏 F11 无干扰全屏Shift + F11
#括号
	ctrl+m括号切换
	Ctrl + Shift + M	则可以快速选择括号间的内容，
	Ctrl + Shift + space 选择当前作用域（Scope）的内容
	Ctrl + Shift + J	缩进型语言（如Python）

#行操作
	Ctrl+L 选中行（按住继续选中下行）
	Ctrl+J 合并行
	Ctrl+Shift+↑ 与上行互换
	Ctrl+Shift+↓ 与下行互换
	Ctrl+Shift+K 删除整行
	Ctrl+Shift+D 复制整行
	Ctrl+Shift+L 同时编辑所选行
	Ctrl+K,Backspace 从光标处删除至行首
	Ctrl+K,K 从光标处删除至行尾
	Ctrl+Enter 光标所在行后插入行
	Ctrl+Shift+Enter 光标所在行前插入行
	Ctrl+F2 设置书签
	F2 下一个书签
	Shift+F2 上一个书签
#编译
	F7 
	ctrl+b
	Ctrl+Shift+B	Run ‘Run’ build task
	Ctrl+Break		Cancel running build task
#文件系统
.sublime-commands 命令配置
.sublime-build 编译配置

Packages/Default/Default.sublime-commands

#插件
##OmniMarkupPreviewer 文档预览
	Ctrl+Alt+O: 实时浏览器预览 
	Ctrl+Alt+X: 静默导出同目录 Export Markup as HTML.
	Ctrl+Alt+C: Copy Markup as HTML.
##HTMLBeautify：格式化HTML。
##AutoPEP8：格式化Python代码。
##Alignment：进行智能对齐。
##BracketHighlighter 高亮显示配对括号以及当前光标所在区域
#SublimePythonIDE
	https://github.com/JulianEberius/SublimePythonIDE
	
# Terminal
	https://packagecontrol.io/packages/Terminal
## Usage
	改建 ctrl + alt + t
 - **Open Terminal at File**
     Press *ctrl+shift+t* on Windows and Linux, or *cmd+shift+t* on OS X
 - **Open Terminal at Project Folder**
     Press *ctrl+alt+shift+t* on Windows and Linux, or *cmd+alt+shift+t* on OS X
### Examples
#### Cmder on Windows

```js
{
  // Replace with your own path to cmder.exe
  "terminal": "C:\\Program Files\\cmder_mini\\cmder.exe",
  "parameters": ["/START", "%CWD%"]
}
```     
##Sublime​REPL  调试插件
    // 键盘绑定 sublimerepl python调试
	{ 
		"keys": ["alt+q"], 
		"command": "repl_open", 
		"caption": "Python",
		"mnemonic": "p",
		"args": {
			"type": "subprocess",
			"encoding": "utf8",
			"cmd": ["F:/Anaconda2/envs/dev/python", "-i", "-u", "$file"],
			"cwd": "$file_path",
			"syntax": "Packages/Python/Python.tmLanguage",
			"external_id": "python"
		}
	}
#sublimecodeintel
    For Windows:
      * Jump to definition = ``Alt+Click``
      * Jump to definition = ``Control+Windows+Alt+Up``
      * Go back = ``Control+Windows+Alt+Left``
      * Manual CodeIntel = ``Control+Shift+space``
	More information
	----------------  
  		* Online - http://sublimecodeintel.github.io/SublimeCodeIntel/

#QuickGotoAnything
	QuickGotoAnything是一个轻量级的sublime text插件，同时支持SublimeText2/3及Windows/Linux/MacOSX，该插件扩展了sublime text默认的goto anything，能够将选中的或当前光标所在的字符串放到 goto anything 面板中，当然在复制字符串的时候也做了一些过滤。

	要更好的使用QuickGotoAnything，请先了解sublime默认的GotoAnything，QuickGotoAnything 将变量和函数分别对应于#和@。

	适用版本

	Sublime Text 2/3
	Windows/Linux/MacOSX

	安装方法

	通过Package Control安装：

	【Ctrl+Shift+P】快捷键
	【Package Control: install Package】
	输入QuickGotoAnything，点击QuickGotoAnything项
	等待安装完成即可使
	使用方法

	将光标放在想要快速跳转的源字符串中或选中该字符串，按下相应的快捷键，源字符串将自动放到 goto anything 面板，跳到第一个搜索到的位置并高亮显示跳转到的目标字符串。
	为防止误操作，对源字符串做了一些过滤处理。符合规则的源字符串才会被放到 goto anything 面板。

	变量名规则：^[a-zA-Z_]+[a-zA-Z0-9_]*$
	函数名规则：^[a-zA-Z_]+[a-zA-Z0-9_]*$
	文件规则：^[ !#-)+-9;=@-{}~]+$ 空格和ASCII可见字符（不含:*?"<>|）

	快速转到变量：Ctrl+;(Windows/Linux) Super+;(OSX)
	快速转到方法：Ctrl+R(Windows/Linux) Super+R(OSX)
	快速转到文件：Ctrl+P(Windows/Linux) Super+P(OSX)
#BufferScroll
	会记住代码折叠等设置
#sublime text 调试选项
	SublimeLog 调试插件
	ctrl+alt+c  Console logging activated 开关console.log

#控制台命令
	False True
	跟命令有关的操作实时打印 D:\\Program Files (x86)\\Sublime Text 3\\sublime.py
	sublime.log_commands(True) 
	
	sublime.log_input(True)
	    """ Enables or disables input logging. This is useful to find the names of certain keys on the keyboard """

	sublime.log_result_regex(True)
    """ Enables or disables result regex logging. This is useful when trying to debug file_regex and line_regex in build systems """
   
	sublime.log_indexing(True)
	sublime.log_build_systems(True)