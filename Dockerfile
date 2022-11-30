FROM openjdk:8-jdk-alpine

# cd /usr/local/runme
WORKDIR /usr/local/runme

# cp target/app.jar /usr/local/runme/app.jar
COPY  ./target/BankApplicationBackend-0.0.1-SNAPSHOT.jar app.jar

# java -jar /usr/local/runme/app.jar
ENTRYPOINT ["java","-jar","app.jar"]
