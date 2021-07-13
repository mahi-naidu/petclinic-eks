FROM maven:3.5-jdk-8 as BUILD
COPY . /usr/src/
RUN mvn -f /usr/src/pom.xml clean package

from tomcat
COPY from=BUILD /usr/src/target/petclinic.war
