# HowTo

Client: the machine that has limited internet connection:
1. install `proxychains` 
  ``` shell
  git clone https://github.com/rofl0r/proxychains-ng.git
  cd proxychains-ng
  ./configure --prefix=/where/to/install --sysconfdir=/where/is/the/config #${HOME}/.proxychains/
  ```
2. configure `proxychains`
   1. edit `${HOME}/.proxychains/proxychains.proxychains.conf`
   2. an example is given. the key info is at the last line
3. in `~/.zshrc`, add `alias px='proxychains'`
4. usage: `px git clone xxx`   
5. Reference: https://zhuanlan.zhihu.com/p/385463291


Server: the machine offering internet connection:
1. install `dante-server` for socks5 services
   a) `sudo apt install dante-server`
2. configure `dante-server`
   1. `sudo nano etc/danted/conf`
   2. an example file is given
3. start the service
   1. `/etc/init.d/danted start`
4. check if everything ok
   1. `/etc/init.d/danted status`
5. Reference: https://blog.csdn.net/Maxtao_2013/article/details/124267742
  