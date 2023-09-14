FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/target/vprofile-v2.war /app/
EXPOSE 9090
ADD target/vprofile-v2.war vprofile-v2.war
CMD [ "java","-war","/hello-world.war" ]