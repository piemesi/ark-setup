#FROM python:2.7

ARG UBUNTU_VERSION=14.04
#FROM ubuntu:$UBUNTU_VERSION
#FROM kegs/ubuntu-14-python-2.7
FROM python:2.7.9-slim

#RUN apt-get update && apt-get -y install \
#    libldap2-dev libsasl2-dev python-tk tk tk-dev libffi-dev libblas-dev libssl-dev libblas3gf \
#    liblapack-dev liblapack3gf gfortran

RUN apt-get update \
  && apt-get install -y python python-pip \
  && apt-get clean

RUN python --version

#.9
# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements_freeze.txt requirements_freeze.txt

RUN apt-get update && apt-get -y install python-dev python-virtualenv \
    libldap2-dev libsasl2-dev python-tk tk tk-dev libffi-dev libblas-dev libssl-dev libblas3gf \
    liblapack-dev liblapack3gf gfortran

#RUN apt-get install -y libffi-dev libssl-dev <-- duplicates the above lines
## <!-- probably is needed
ENV PYTHONWARNINGS="ignore:a true SSLContext object"
#ARG request_domain =
ENV PATH_CONFIG_FILE="/arkenstone/opt/nest/etc/arkenstone.conf"

#RUN pip install pyopenssl ndg-httpsclient pyasn1

RUN apt-get update && apt-get install curl wget nano -y
#COPY pip.conf ~/.pip/pip.conf <!-- check do we need it
#RUN easy_install pip
##<!-- check do we need it
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && python get-pip.py
RUN pip install --upgrade setuptools

RUN pip install --upgrade pip
##RUN pip install numpy
RUN apt-get update && apt-get install libmysqlclient-dev git mysql-client -y
RUN apt-get install python-tk tk-dev -y


# copy the content of the local src directory to the working directory
COPY app/. .
COPY init/sp ./sp
RUN pip install -r requirements_freeze.txt

RUN mkdir -p /arkenstone/opt/nest/etc

#TODO: configs from env
COPY init/arkenstone.conf /arkenstone/opt/nest/etc/arkenstone.conf
#TODO: configs from env
COPY init/quarry.json /arkenstone/opt/nest/etc/service_account.json
RUN cd /arkenstone && mkdir -p static db builds logs cache device-data dplots eplots data data_mountpoint

# inital migrations to the DB.
#RUN python manage.py migrate
#migrations

# command to run on container start
#ENTRYPOINT ["python manage.py migrate"]
#ADD init/init.sh /docker-entrypoint.sh

CMD [ "python"]
#CMD python manage.py migrate


# docker run -t -d -p 5000:5000 myimage tail -f /dev/null
