FROM java:8
MAINTAINER ZhangLianzhong
ADD target/housemanager-1.0.0.jar app.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","/app.jar"]