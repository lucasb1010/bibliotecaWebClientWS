# ProgApProyDesarrolloWeb
REPOSITORIO DEL LABORATORIO DE PROGRAMACIÓN DE APLICACIONES PARA EL FRONTEND

Sarazola, Piriz, Bergara

https://github.com/lucasb1010/ProgApProyDesarrolloWeb

 $env:JAVA_HOME = 'C:\Program Files\Java\jdk-24'                                 
>> $env:PATH = "$env:JAVA_HOME\bin;$env:PATH"                                                                                                    
>> java -version


$TOMCAT='C:\apache-tomcat-9.0.110'; & "$TOMCAT\bin\shutdown.bat"; Remove-Item "$TOMCAT\webapps\bibliotecaWebClientWS-1.0.0-SNAPSHOT" -Recurse -Force -ErrorAction SilentlyContinue; Copy-Item ".\target\bibliotecaWebClientWS-1.0.0-SNAPSHOT.war" "$TOMCAT\webapps" -Force; & "$TOMCAT\bin\startup.bat"