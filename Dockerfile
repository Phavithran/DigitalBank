FROM openjdk
ADD target/digitalbank.jar digitalbank.jar
ENTRYPOINT ["java","-jar","/digitalbank.jar"]
