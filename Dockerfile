FROM alpine/java:21-jdk

WORKDIR /app

ADD target/admin-service-0.0.1-SNAPSHOT.jar .
ADD www_avdeev-sa_ru.crt .

RUN keytool -noprompt -storepass changeit -keystore $JAVA_HOME/lib/security/cacerts -import -file www_avdeev-sa_ru.crt -alias www_avdeev

CMD ["java", "-jar", "admin-service-0.0.1-SNAPSHOT.jar"]