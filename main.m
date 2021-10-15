clear all
clc

% importar bibliotecas java
pasta = [pwd '\lib\'];
javaaddpath([pasta 'commons-logging-1.1.jar']);
javaaddpath([pasta 'ws-commons-util-1.0.2.jar']);
javaaddpath([pasta 'xmlrpc-client-3.1.3.jar']);
javaaddpath([pasta 'xmlrpc-common-3.1.3.jar']);
javaaddpath([pasta 'xmlrpc-server-3.1.3.jar']);

import org.apache.xmlrpc.*

%vari�veis
ip_sensor = '192.168.0.69';

% configura��o client xmlrpc
client_xmlrpc = javaObject('org.apache.xmlrpc.client.XmlRpcClient');
config = javaObject('org.apache.xmlrpc.client.XmlRpcClientConfigImpl');
url = javaObject('java.net.URL', strcat('http://',ip_sensor,':8080'));
config.setServerURL(url);
client_xmlrpc.setConfig(config);

% configura��o client socket

client_socket = tcpip(ip_sensor, 50002,'InputBufferSize',13176,'ReadAsyncMode', 'continuous');


configurar_sensor(client_xmlrpc);

fopen(client_socket);

%%
modo='Z';
num = 1;

while (1)
    client_xmlrpc.execute('MDAXMLHeartbeat', []); %Sinal de heartbeat para manter a conexao com o sensor
    fwrite(client_socket,modo); %Envia ao servidor Socket o modo de imagem. � a funcao respons�vel por solicitar a imagem.
    
    resposta = get(client_socket, 'BytesAvailable'); %Analisa quantos bytes estao disponiveis para leitura
    while(resposta~=13176) %13175 bytes correspondem a uma imagem completa (header + dados)
        fwrite(client_socket,modo);                      %|Enquanto a resposta nao estiver completa,
        resposta = get(client_socket, 'BytesAvailable'); %|nao avanca para a proxima parte.
    end
    
    
    V = fread(client_socket, 3294,'float'); %Faz a leitura de todos os 3294 floats = 13175 bytes
    
    h = V(1:94,1); %Obtem o header da mensagem
    
    %% Obtencao e exibicao da imagem
    img = V(95:end,1); %Obtem o restante da mensagem (que corresponde a imagem)
    imagem = zeros(64,50); %Imagem na forma matricial, inicializada com zeros
    k=1;
    for j=1:50
        for i=1:64
            imagem(i,j) = img(k,1); %Aloca a mensagem nos pixels na forma matricial
            k=k+1;
        end
    end
    
    imshow(imagem, [])
    %%2D
    %             tic
    %             MapeamentoObstac2D(imagem);
    %             inversa2D;
    %             qobs2D;
    %             contorno_qo;
    %             cPot_ANGULOS2D;
    %             t(num)=toc
    %             plot_qo2D;
    
    num = num+1;
    pause(0.00001);
    
end

fclose(client_socket); %Encerra comunicacao com o Socket
close all

