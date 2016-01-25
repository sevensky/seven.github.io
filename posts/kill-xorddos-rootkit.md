该木马的持续化的方式是通过多种方式进行的。
首先，它将自己安装在/boot/目录下,命名为一个包含10个字节的字符串。
然后脚本将木马以相同的名字在/etc/init.d/ 目录下创建，
同时在/etc/rc%u.d/90%s目录建立五个符号链接，其中u%是1-5，s%是一个随机值。
这样保证每次重启系统木马可以随时启动起来。
而且，脚本还会对/etc/cron.hourly/cron.sh文件加入以下内容：

```bash
#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin’
for i in `cat /proc/net/dev|grep :|awk -F: {‘,27h,’print $1′,27h,’}`; do ifconfig $i up& done
cp /lib/udev/udev /lib/udev/debug
/lib/udev/debug
```

最后在crontab中插入一行代码“*/3 * * * * root /etc/cron.hourly/cron.sh”
主程序主要有三个任务，而且这三个任务是无限循环执行的：
1、下载并执行机器的配置文件；
2、将自身重装到/lib/udev/udev的文件；
3、进行洪水攻击
在此之前，我们曾截获过一个该木马的32位变种，变种木马有了一些差异。木马文件安装为/lib/libgcc4.so文件，含有辨识字符串（见下文）的唯一的文件是/var/run/udev.pid。安装的脚本文件则在 /etc/cron.hourly/udev.sh，并且rootkit特性被完全移除。所有的这些文件就是攻陷指标（IoC）。


#######
crontab -l 正常

ls /etc/rc.d/init.d/ 发现可疑10字符文件
    duxzcpslwz pjflzewwkc dlyycvhuze
    
cat /etc/rc.d/init.d/

/etc/rc%u.d/

cat /etc/crontab
cat /etc/cron.hourly/gcc4.sh 
cat /etc/cron.hourly/kill.sh
cat /etc/cron.hourly/cron.sh
cat /proc/net/dev|grep :|awk -F: {'print $1'}

/lib/libudev4.so 
/lib/libudev4.so.6
/lib/libkill.so


####################################

#删除启动脚本 awk '$7>=8 && $NF~/^K90/{print $NF}' 这里的8是当天的日期8号的意思，且控制目录不能写东西了
#awk是一个强大的文本分析工具，相对于grep的查找，sed的编辑，awk在其对数据分析并生成报告时，显得尤为强大。简单来说awk就是把文件逐行的读入，以空格为默认分隔符将每行切片，切开的部分再进行各种分析处理
chmod 0000 /lib/libudev4.so && rm -rf /lib/libudev4.so &&chmod 0000 /lib/libkill.so && rm -rf /lib/libkill.so 
&& chattr +i /lib/
ls /etc/rc.d/rc3.d/ | awk '$7>=8 && $NF~/^K90/{print $NF}' | egrep '^.{10}$'| xargs -i rm -rf /etc/rc.d/rc3.d/{}
chmod 0000 /etc/rc.d/rc3.d/ && chmod 0000 /etc/rc.d/init.d && chattr +i /etc/rc.d/rc3.d/ && chattr +i /etc/rc.d/init.d

#删除计划任务且控制计划任务不能写
#sed 删除 /etc/crontab gcc4.sh 行
#chattr +i 锁定     lsattr 显示 eg. lsattr /etc/crontab
    + ：在原有参数设定基础上，追加参数。
    - ：在原有参数设定基础上，移除参数。
    = ：更新为指定参数设定。
    i：设定文件不能被删除、改名、设定链接关系，同时不能写入或新增内容。i参数对于文件 系统的安全设置有很大帮助。
sed '/gcc4.sh/d' /etc/crontab && chmod 0000 /etc/crontab && chattr +i /etc/crontab

####################################
top
  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND                                           
  2349 root      20   0 21508  604  192 S 85.2  0.1  19:37.58 duxzcpslwz 

ps -ef 列出进程   
    ps aux | grep 2349     
     ps -ef | grep pwd

    ps aux | grep 'duxzcpslwz' |grep -v grep   
    ps -ef | grep pjflzewwk
    ps -ef | grep khugepaged khungtaskd
    find / -name khugepaged
    find / -name pjflzewwk
http://www.dwhd.org/20150908_191437.html?mType=Group
kill -pid              kill -l PID