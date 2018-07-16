FROM ansibleplaybookbundle/apb-base:canary
MAINTAINER Ansible Playbook Bundle Community

LABEL "com.redhat.apb.spec"=\
"LS0tCgp2ZXJzaW9uOiAxLjAKbmFtZTogb3BlbnN0YWNrLXZtLWFwYgpkZXNjcmlwdGlvbjogIE9w\
ZW5zdGFjayBWTSBhcGIgaW1wbGVtZW50YXRpb24KYmluZGFibGU6IGZhbHNlCmFzeW5jOiBvcHRp\
b25hbAp0YWdzOgogIC0gcXVldWUKbWV0YWRhdGE6CiAgZG9jdW1lbnRhdGlvblVybDogaHR0cHM6\
Ly93aWtpLm9wZW5zdGFjay5vcmcKICBsb25nRGVzY3JpcHRpb246IEFuIGFwYiB0aGF0IGRlcGxv\
eXMgYW4gb3BlbnN0YWNrIFZNCiAgZGlzcGxheU5hbWU6IE9wZW5zdGFjayBWTSAoQVBCKQogIGNv\
bnNvbGUub3BlbnNoaWZ0LmlvL2ljb25DbGFzczogaWNvbi1vcGVuc3RhY2sKICBwcm92aWRlckRp\
c3BsYXlOYW1lOiAiUmVkIEhhdCwgSW5jLiIKcGxhbnM6CiAgLSBuYW1lOiBkZWZhdWx0CiAgICBk\
ZXNjcmlwdGlvbjogQSBzaW5nbGUgT3BlbnN0YWNrIFZNCiAgICBmcmVlOiB0cnVlCiAgICBtZXRh\
ZGF0YToKICAgICAgZGlzcGxheU5hbWU6IERlZmF1bHQKICAgICAgbG9uZ0Rlc2NyaXB0aW9uOiBU\
aGlzIHBsYW4gcHJvdmlkZXMgYSBzaW5nbGUgT3BlbnN0YWNrIFZNCiAgICAgIGNvc3Q6ICQwLjAw\
CiAgICBwYXJhbWV0ZXJzOgogICAgICAtIG5hbWU6IGluc3RhbmNlX3R5cGUKICAgICAgICB0eXBl\
OiBzdHJpbmcKICAgICAgICB0aXRsZTogRmxhdm9yCiAgICAgICAgcmVxdWlyZWQ6IHRydWUKICAg\
ICAgLSBuYW1lOiBpbWFnZV9uYW1lCiAgICAgICAgdHlwZTogc3RyaW5nCiAgICAgICAgdGl0bGU6\
IEltYWdlIE5hbWUKICAgICAgICByZXF1aXJlZDogdHJ1ZQogICAgICAtIG5hbWU6IG5ldHdvcmtf\
bmFtZQogICAgICAgIHR5cGU6IHN0cmluZwogICAgICAgIHRpdGxlOiBOZXR3b3JrIE5hbWUKICAg\
ICAgICByZXF1aXJlZDogdHJ1ZQogICAgICAtIG5hbWU6IGtleV9uYW1lCiAgICAgICAgdHlwZTog\
c3RyaW5nCiAgICAgICAgdGl0bGU6IFNTSCBLZXkgUGFpciBOYW1lCiAgICAgICAgcmVxdWlyZWQ6\
IGZhbHNlCiAgICAgIC0gbmFtZTogc2VjdXJpdHlfZ3JvdXBfbmFtZQogICAgICAgIHR5cGU6IHN0\
cmluZwogICAgICAgIHRpdGxlOiBTZWN1cml0eSBHcm91cCBOYW1lCiAgICAgICAgcmVxdWlyZWQ6\
IGZhbHNlCiAgICAgIC0gbmFtZTogdXNlcgogICAgICAgIHRpdGxlOiBVc2VyCiAgICAgICAgdHlw\
ZTogc3RyaW5nCiAgICAgICAgcmVxdWlyZWQ6IHRydWUKICAgICAgICBkaXNwbGF5X2dyb3VwOiAi\
T3BlbnN0YWNrIEF1dGhlbnRpY2F0aW9uIgogICAgICAtIG5hbWU6IHBhc3MKICAgICAgICB0eXBl\
OiBzdHJpbmcKICAgICAgICB0aXRsZTogUGFzc3dvcmQKICAgICAgICByZXF1aXJlZDogdHJ1ZQog\
ICAgICAgIGRpc3BsYXlfdHlwZTogcGFzc3dvcmQKICAgICAgICBkaXNwbGF5X2dyb3VwOiAiT3Bl\
bnN0YWNrIEF1dGhlbnRpY2F0aW9uIgogICAgICAtIG5hbWU6IHByb2plY3QKICAgICAgICB0aXRs\
ZTogUHJvamVjdAogICAgICAgIHR5cGU6IHN0cmluZwogICAgICAgIHJlcXVpcmVkOiB0cnVlCiAg\
ICAgICAgZGlzcGxheV9ncm91cDogIk9wZW5zdGFjayBBdXRoZW50aWNhdGlvbiIKICAgICAgLSBu\
YW1lOiB1cmwKICAgICAgICB0aXRsZTogSWRlbnRpdHkgVVJMCiAgICAgICAgdHlwZTogc3RyaW5n\
CiAgICAgICAgcmVxdWlyZWQ6IHRydWUKICAgICAgICBkaXNwbGF5X2dyb3VwOiAiT3BlbnN0YWNr\
IEF1dGhlbnRpY2F0aW9uIgo="


RUN pip install shade

ADD playbooks /opt/apb/actions

# Add our role into the ansible roles dir
ADD . /opt/ansible/roles/openstack-vm-apb

RUN chmod -R g=u /opt/{ansible,apb}

USER apb