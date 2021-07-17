FROM openjdk:8u212-jre-alpine3.9

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file (when packaged)
ARG JAR_FILE=target/spring-petclinic-2.4.5.jar

# Add the application's jar to the container
ADD ${JAR_FILE} app.jar

ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx512m -Xms256m"
ENTRYPOINT java $JAVA_OPTS -jar /app.jar
