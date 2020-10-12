#FROM tomcat:9.0
#EXPOSE 8080
#COPY ./target/bank##2.1.0.local.war /usr/local/tomcat/webapps/
#
FROM tomcat:9.0
EXPOSE 8080
RUN rm -rf /usr/local/tomcat/webapps/ROOT
ADD ./target/bank##2.1.0.local.war /usr/local/tomcat/webapps/
ADD ./target/digitalbank-2.1.0.local.war /usr/local/tomcat/webapps/
ADD ./target/classes/application.properties /usr/local/tomcat/conf/digitalbank.properties
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
#HEALTHCHECK CMD curl -fail http://localhost:8080/bank/api/v1/health || exit 1
