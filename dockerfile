FROM ubuntu

VOLUME ["/docs", "/root/.ssh"]

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y python-paramiko python-pip python-pycurl python-dev build-essential
RUN pip install ansible markupsafe
RUN pip install dopy==0.3.5

RUN git clone https://github.com/StreisandEffect/streisand.git

WORKDIR /streisand

# path GPG key
# for details see https://github.com/StreisandEffect/streisand/issues/1597#issuecomment-509727713
# RUN sed -i \
#     's+streisand_gpg_keyserver_address: "hkps://hkps.pool.sks-keyservers.net"+streisand_gpg_keyserver_address: "hkp://pgp.mit.edu:80"+g' \
#     ./playbooks/roles/gpg/vars/main.yml

COPY ./streisand.run.sh .
RUN chmod +x ./streisand.run.sh

ENTRYPOINT [ "./streisand.run.sh" ]