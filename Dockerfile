FROM openjdk
ADD target/app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
