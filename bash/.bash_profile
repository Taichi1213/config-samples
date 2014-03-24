proxy_host=proxy.sin.sap.corp
proxy_port=8080

unset HTTP_PROXY
unset HTTPS_PROXY
unset FTP_PROXY
unset NO_PROXY

#export http_proxy="http://$proxy_host:$proxy_port/"
#export https_proxy=$http_proxy
#export ftp_proxy=$http_proxy
#export no_proxy="localhost, 127.0.0.1, 10.0, sap-ag.de, sap.corp, corp.sap, co.sap.com, sap.biz"

export JAVA_HOME="/usr/java/jdk1.6.0_21"
export JRE_HOME="/usr/java/jdk1.6.0_21/jre"
export M2_HOME="/home/build/apache-maven-3.0.4"
export M2="$M2_HOME/bin"
export P4PORT="perforce5558.wdf.sap.corp:5558"
export PATH=$JAVA_HOME/bin:$PATH:$HOME/bin:$M2_HOME/bin
#export DEBUG_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=9999,server=y,suspend=y "
export JAVA_OPTS="
$DEBUG_OPTS
-XX:PermSize=512M -XX:MaxPermSize=1024m
-Xmn512m -Xms1024m -Xmx1024m
-Djava.net.preferIPv4Stack=true
-Dhttp.proxyHost=$proxy_host
-Dhttp.proxyPort=$proxy_port
-Dhttp.nonProxyHosts=\"localhost|*.sap.corp\"
-XX:+HeapDumpOnOutOfMemoryError"
