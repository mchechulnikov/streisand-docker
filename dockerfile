FROM ubuntu

VOLUME ["/docs", "/root/.ssh"]

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y python-paramiko python-pip python-pycurl python-dev build-essential
RUN pip install ansible markupsafe
RUN pip install dopy==0.3.5

RUN git clone https://github.com/StreisandEffect/streisand.git

WORKDIR /streisand

COPY ./streisand.run.sh .
RUN chmod +x ./streisand.run.sh

ENTRYPOINT [ "./streisand.run.sh" ]