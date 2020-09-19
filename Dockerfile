FROM openjdk
ADD ./target/digital-bank.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
