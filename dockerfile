FROM maven:3.6.3-openjdk-11 as BUILD

COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
WORKDIR /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package

FROM tomcat:9.0

COPY --from=BUILD /usr/src/myapp/target/petclinic.war /usr/local/tomcat/webapps/petclinic.war
