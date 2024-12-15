FROM sonarqube:lts-community
USER root
COPY ["cacerts-share", "/tmp"]
RUN cd /opt/java/openjdk/lib/security/; keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias ldapcert -file /tmp/mdt.crt
RUN cd /opt/java/openjdk/lib/security/; keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias zscaler_root -file /tmp/Zscaler_Root_CA.crt 
RUN cd /opt/java/openjdk/lib/security/; keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias zscaler_im -file /tmp/Zscaler_Intermediate_Root_CA.crt 
RUN cd /opt/java/openjdk/lib/security/; keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias zscaler_im_a -file /tmp/Zscaler_Intermediate_Root_CA1_.crt 

USER sonarqube