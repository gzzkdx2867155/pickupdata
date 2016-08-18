load('traindata.mat','traindata')

j=1;
trainset=zeros(10000,10,3);
aimset=zeros(10000,3);
vmax=max(traindata(:,7));
vmin=min(traindata(:,7));
xmax=max(traindata(:,9));
xmin=min(traindata(:,9));
v0max=max(traindata(:,10));
v0min=min(traindata(:,10));
traindata(:,7)=(traindata(:,7)-vmin)./(vmax-vmin);
traindata(:,9)=(traindata(:,9)-xmin)./(xmax-xmin);
traindata(:,10)=(traindata(:,10)-v0min)./(v0max-v0min);
while j<10000
    i=randi([1,944850]);
    if(traindata(i,1)==traindata(i+120,1)&&traindata(i+120,2)==(traindata(i,2)+12))
        trainset(j,:,:)=traindata(i:10:i+95,[7,9,10]);
        aimset(j,:)=traindata(i+100:10:i+120,7)';
        j=j+1;
    end
    
end
save('trainset3second.mat','trainset');
save('aimset3second.mat','aimset')