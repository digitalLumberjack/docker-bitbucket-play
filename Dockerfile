FROM java:openjdk-8-jdk

ARG ACTIVATOR_VERSION=1.3.7

RUN apt-get install unzip git curl 
RUN wget https://downloads.typesafe.com/typesafe-activator/${ACTIVATOR_VERSION}/typesafe-activator-${ACTIVATOR_VERSION}.zip 
RUN unzip typesafe-activator-${ACTIVATOR_VERSION}.zip -d /usr/local/ && rm typesafe-activator-${ACTIVATOR_VERSION}.zip && chmod a+x /usr/local/activator-dist-${ACTIVATOR_VERSION}/activator
RUN ln -s /usr/local/activator-dist-${ACTIVATOR_VERSION}/activator /usr/local/bin/activator 

COPY ./start.sh /usr/local/bin/

CMD ["/usr/local/bin/start.sh"] 
