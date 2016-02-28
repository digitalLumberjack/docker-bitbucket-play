FROM java:openjdk-8-jdk

RUN apt-get install unzip git curl 
RUN wget https://downloads.typesafe.com/typesafe-activator/1.3.7/typesafe-activator-1.3.7-minimal.zip 
RUN unzip typesafe-activator-1.3.7-minimal.zip -d /usr/local/ && rm typesafe-activator-1.3.7-minimal.zip && chmod a+x /usr/local/activator-1.3.7-minimal/activator
RUN ln -s /usr/local/activator-1.3.7-minimal/activator /usr/local/bin/activator 

COPY ./start.sh /usr/local/bin/

CMD ["/usr/local/bin/start.sh"] 
