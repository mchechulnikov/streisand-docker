FROM ubuntu

VOLUME ["/root/.ssh"]

RUN apt-get install git
RUN apt-get install python-paramiko python-pip python-pycurl python-dev build-essential
RUN pip install ansible markupsafe
RUN pip install dopy==0.3.5

RUN git clone https://github.com/StreisandEffect/streisand.git

WORKDIR /streisand

CMD ["streisand"]