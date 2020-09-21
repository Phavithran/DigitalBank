FROM openjdk
ADD ./target/digitalbank-2.1.0.local.war app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
