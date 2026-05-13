# ही ओळ बदला (Tomcat 10.1 सह JDK 21 वापरा)
FROM tomcat:10.1-jdk21-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*
COPY AplaKrushiMitra.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]