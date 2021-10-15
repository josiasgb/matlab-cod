function configurar_sensor(client_xmlrpc)

client_xmlrpc.execute('MDAXMLConnectCP', [javaObject('java.lang.String','192.168.0.10') javaObject('java.lang.Integer',0)]);
% m�todo para verificar par�metros de rede
% client_xmlrpc.execute('MDAXMLGetNetworkParams',javaObject('java.lang.String','http://192.168.0.10'));
%comando para programar o modo de trabalho
% client_xmlrpc.execute('MDAXMLGetTrigger', [javaObject('java.lang.Integer',0) javaObject('java.lang.Integer',0) javaObject('java.lang.Integer',3)]);

client_xmlrpc.execute('MDAXMLSetProgram', [javaObject('java.lang.Integer',0) javaObject('java.lang.Integer',0) javaObject('java.lang.Integer',7)]);

% configurar trigger
confTrigger = 3; %3 para trigger autom�tico e 4 para trigger por software
client_xmlrpc.execute('MDAXMLSetTrigger',[javaObject('java.lang.Integer',0) javaObject('java.lang.Integer',0) javaObject('java.lang.Integer',confTrigger)]);

client_xmlrpc.execute('MDAXMLSetWorkingMode', javaObject('java.lang.Integer',1));

