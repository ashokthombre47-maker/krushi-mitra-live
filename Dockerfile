# 1. टॉमकॅट ९ सोबत थेट Java 21 (JDK 21) वापरू, जेणेकरून लोकल आणि लाईव्ह व्हर्जन मॅच होईल
FROM tomcat:9.0-jdk21-openjdk-slim

# 2. टॉमकॅटचे सर्व जुने डीफॉल्ट पेजेस आणि कचरा फाईल्स पूर्णपणे डिलीट करा
RUN rm -rf /usr/local/tomcat/webapps/*
RUN rm -rf /usr/local/tomcat/webapps.dist

# 3. तुझी AplaKrushiMitr.war फाईल टॉमकॅटच्या मुख्य webapps मध्ये ROOT.war म्हणून कॉपी करा
# (खात्री कर की तुझ्या .war फाईलचे स्पेलिंग हुबेहूब 'AplaKrushiMitr.war' असंच आहे)
COPY AplaKrushiMitr.war /usr/local/tomcat/webapps/ROOT.war

# 4. सर्व्हर ८०८० पोर्टवर चालू करू
EXPOSE 8080

CMD ["catalina.sh", "run"]
