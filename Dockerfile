FROM adoptopenjdk/openjdk11:alpine-jre
ARG JAR_FILE=target/ms-api-gateway-*-SNAPSHOT.jar
COPY ${JAR_FILE} ms-api-gateway.jar
RUN addgroup -S bootcampgroup && adduser -S bootcampuser -G bootcampgroup
RUN mkdir -p /opt/logs/ms-api-gateway
RUN chown -R bootcampuser:bootcampgroup /opt/logs/ms-api-gateway
USER bootcampuser:bootcampgroup
ENTRYPOINT ["java", "-jar", "/ms-api-gateway.jar"]
