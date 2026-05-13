# Java 21 आणि Tomcat 10 वापरत आहोत (कारण तुझी फाईल Java 21 वर आहे)
FROM tomcat:10.1-jdk21-openjdk-slim

# १. गरजेची टूल्स इन्स्टॉल करा
RUN apt-get update && apt-get install -y wget

# २. Tomcat Migration Tool डाऊनलोड करा
RUN wget https://repo1.maven.org/maven2/org/apache/tomcat/jakartaee-migration/1.0.8/jakartaee-migration-1.0.8-shaded.jar -O migration.jar

# ३. जुन्या फाईल्स डिलीट करा
RUN rm -rf /usr/local/tomcat/webapps/*

# ४. तुझी जुनी .war फाईल जशीच्या तशी कॉपी करा
# (नावाची खात्री करा: AplaKrushiMitra.war)
COPY AplaKrushiMitra.war /usr/local/tomcat/webapps/old_app.war

# ५. मॅजिक स्टेप: जुन्या फाईलला नवीनमध्ये कन्व्हर्ट करा
RUN java -jar migration.jar /usr/local/tomcat/webapps/old_app.war /usr/local/tomcat/webapps/ROOT.war

# ६. तात्पुरत्या फाईल्स काढून टाका
RUN rm /usr/local/tomcat/webapps/old_app.war migration.jar

EXPOSE 8080
CMD ["catalina.sh", "run"]