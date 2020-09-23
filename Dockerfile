FROM tomcat:8.0
ADD ./target/digitalbank-2.1.0.local.war /usr/local/tomcat/webapps/
EXPOSE 8084
CMD ["catalina.sh", "run"]
// ENTRYPOINT ["java","-jar","/app.jar"]
