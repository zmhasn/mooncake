FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install firefox-esr mate-system-monitor  git lxde tightvncserver wget   -y
RUN wget https://github.com/TigerVNC/tigervnc/archive/refs/heads/master.zip
RUN tar -xvf master.zip
RUN mkdir  /root/.vnc
RUN echo '7758258' | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
RUN cp /tigervnc/vnc.html /master/index.html
RUN echo 'cd /root' >>/luo.sh
RUN echo "su root -l -c 'vncserver :2000 ' "  >>/luo.sh
RUN echo 'cd /master' >>/luo.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 80 ' >>/luo.sh
RUN echo root:7758258|chpasswd
RUN chmod 755 /luo.sh
EXPOSE 80
CMD  /luo.sh
