#stage-1
#FROM maven:3.8-openjdk-18 as build
#RUN git clone https://github.com/gopivurata/spring-petclinic.git && \
#    cd spring-petclinic && \
#   mvn package

#jar file_location: /spring-petclinic/target/spring-petclinic-2.7.3.jar

#stage-2
FROM openjdk:11
LABEL application="spring-petclinic"
LABEL owner="gopi"
EXPOSE 8080
USER ubuntu
#COPY --from=build /spring-petclinic/target/spring-petclinic-2.7.3.jar /spring-petclinic-2.7.3.jar
RUN cd /home/ubuntu/root/workspace/spring-pet-clinic/target/ && pwd
ADD /home/ubuntu/root/workspace/spring-pet-clinic/target/spring-petclinic-2.7.3.jar /spring-petclinic-2.7.3.jar
WORKDIR /
CMD [ "java", "-jar", "spring-petclinic-2.7.3.jar" ]