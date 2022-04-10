FROM gradle:latest
ENV APP_HOME=/usr/app
WORKDIR $APP_HOME
COPY --chown=gradle:gradle build.gradle settings.gradle $APP_HOME/
COPY --chown=gradle:gradle src $APP_HOME/src
COPY --chown=gradle:gradle config $APP_HOME/config
RUN gradle --no-daemon build


FROM openjdk:latest
ARG BUILD_HOME=/usr/app_new
ARG APP_HOME=/usr/app
ARG JAR_FILE=${APP_HOME}/build/libs/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]