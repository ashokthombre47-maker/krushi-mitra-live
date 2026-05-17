FROM tomcat:9.0-jdk17-openjdk-slim

# 1. टॉमकॅटचे सर्व जुने डीफॉल्ट पेजेस आणि कचरा फाईल्स पूर्णपणे डिलीट करा
RUN rm -rf /usr/local/tomcat/webapps/*
RUN rm -rf /usr/local/tomcat/webapps.dist

# 2. तुझी AplaKrushiMitr.war फाईल टॉमकॅटच्या मुख्य webapps मध्ये ROOT.war म्हणून कॉपी करा
COPY AplaKrushiMitr.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
