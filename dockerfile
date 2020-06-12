FROM ubuntu:16.04.6

VOLUME ["/docs", "/root/.ssh"]

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y python-paramiko python-pip python-pycurl python-dev python3 build-essential
RUN pip install ansible markupsafe
RUN pip install dopy==0.3.5

RUN git clone https://github.com/StreisandEffect/streisand.git

WORKDIR /streisand

# path GPG key
# for details see https://github.com/StreisandEffect/streisand/issues/1597#issuecomment-509727713
# RUN sed -i \
#     's+streisand_gpg_keyserver_address: "hkps://hkps.pool.sks-keyservers.net"+streisand_gpg_keyserver_address: "hkp://pgp.mit.edu:80"+g' \
#     ./playbooks/roles/gpg/vars/main.yml

# or try it https://github.com/StreisandEffect/streisand/issues/1597#issuecomment-509714725
# RUN sed -i \
#     's+- 2F2B01E7.security@openvpn.net.asc+# - 2F2B01E7.security@openvpn.net.asc+g' \
#     ./playbooks/roles/gpg/vars/main.yml
# RUN sed -i \
#     's+- 7F343FA7.nmav@redhat.com.asc+# - 7F343FA7.nmav@redhat.com.asc+g' \
#     ./playbooks/roles/gpg/vars/main.yml
# RUN sed -i \
#     's+- 96865171.nmav@gnutls.org.asc+# - 96865171.nmav@gnutls.org.asc+g' \
#     ./playbooks/roles/gpg/vars/main.yml
# RUN sed -i \
#     's+- 93298290.torbrowser@torproject.org.asc+# - 93298290.torbrowser@torproject.org.asc+g' \
#     ./playbooks/roles/gpg/vars/main.yml

COPY ./streisand.run.sh .
RUN chmod +x ./streisand.run.sh

ENTRYPOINT [ "./streisand.run.sh" ]