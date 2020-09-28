FROM tomcat:9.0
EXPOSE 8080
COPY ./target/bank##2.1.0.local.war /usr/local/tomcat/webapps/
