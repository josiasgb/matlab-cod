function [] = contorno_qo()
% clear all
% clc
% tic
load qo

qaux = [0 0];
for k=1:length(qo)
    qaux = vertcat(qaux,qo{k});
end

q_ = qaux;
q_ = int16(q_);
[lin col] = size(q_);

% hold on
for i=1:lin
    q_(i,1) = q_(i,1) + 200; %21
    q_(i,2) = q_(i,2) + 200; %176
end

%%
im = zeros(400,400);
for i=1:lin
    im(q_(i,1),q_(i,2)) = 1;
end

es_d = strel('arbitrary',[1 1 1 ; 1 1 1 ; 1 1 1]);
d_im = imdilate(im,es_d);
d_im = imdilate(d_im,es_d);
d_im = imdilate(d_im,es_d);
d_im = imdilate(d_im,es_d);
d_im = imdilate(d_im,es_d);
d_im = imdilate(d_im,es_d);

es_e = strel('arbitrary',[0 1 0 ; 1 1 1 ; 0 1 0]);
e_im = imerode(d_im,es_e);
e_im = imerode(e_im,es_e);
e_im = imerode(e_im,es_e);
e_im = imerode(e_im,es_e);
e_im = imerode(e_im,es_e);

%extraçao de fronteira
img = imerode(e_im,es_e);
img = e_im - img;

im_out = img;
% figure(3)
% imshow(img)

%%
% img = e_im;
[lin col] = size(img);
k=1;
for i=1:lin
    for j=1:col
        if(img(i,j)==1)
            q2(k,1) = i;
            q2(k,2) = j;
            k=k+1;
        end
    end
end


% figure(10)
[lin col] = size(q2);
for i=1:lin
    q2(i,1) = q2(i,1) - 200;%21;
    q2(i,2) = q2(i,2) - 200;%176;
end

clear q_
q_ = q2;
% toc
% hold on
% h1=plot(q_(:,1),q_(:,2),'.');
% for k=1:length(qo)
%     h2 = plot(qo{k}(:,1),qo{k}(:,2),'.');
% end

% plot(0,0,'w.')
% plot(0,0,'w*')
% plot(1,1,'w*')
% plot(1,0,'w*')
% plot(0,1,'w*')
% plot(-1,-1,'w*')
% plot(-1,1,'w*')
% plot(1,-1,'w*')
% plot(-1,0,'w*')
% plot(0,-1,'w*')

% legend([h2 h1],{'QO','Resultado do método'})

% load q0
% load s
% h3=plot(q0(1),q0(2),'bo');
% h4=plot(s(1,1),s(1,2),'r*');
% plot(s(2,1),s(2,2),'r*')
% 
% axis square
% 
% legend([h1 h3 h4],{'QO','Configuração inicial','Configurações objetivo'},'Location','NorthOutside')

save('q_','q_')
% save('im_out','im_out')