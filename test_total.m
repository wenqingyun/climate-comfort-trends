%可以用下面的公式打开看看这个nc文件里有几个维度，单位是什么
%x=ncinfo('clt_day_CMCC-CMS_rcp45_r1i1p1_20400101-20491231.nc');
%lat = double(ncread('clt_day_CMCC-CMS_rcp45_r1i1p1_20400101-20491231.nc','lat')); 
%lon = double(ncread('clt_day_CMCC-CMS_rcp45_r1i1p1_20400101-20491231.nc','lon'));
clear all
%点的坐标在latlon中的序号
i=6;
x=65;
y=65;
%2020-2049
PR=[];HUR=[];VA=[];TASMAX=[];CLT=[];UA=[];HCI=[];
for j=1:3
wj1=(['pr_day_CMCC-CMS_rcp45_r1i1p1_20',num2str(j+1),'00101-20',num2str(j+1),'91231.nc']);
pr = single(ncread(wj1,'pr')); 
pr = pr(x,y,:);pr =squeeze(pr);PR=[PR;pr];
pr=[];
wj2=(['clt_day_CMCC-CMS_rcp45_r1i1p1_20',num2str(j+1),'00101-20',num2str(j+1),'91231.nc']);
clt = single(ncread(wj2,'clt'));
clt = clt(x,y,:);clt =squeeze(clt);CLT=[CLT;clt];
clt=[];
wj3=(['va_day_CMCC-CMS_rcp45_r1i1p1_20',num2str(j+1),'00101-20',num2str(j+1),'91231.nc']);
va = single(ncread(wj3,'va'));
va = va(x,y,1,:);va =squeeze(va);VA=[VA;va];
va=[];
wj4=(['ua_day_CMCC-CMS_rcp45_r1i1p1_20',num2str(j+1),'00101-20',num2str(j+1),'91231.nc']);
ua = single(ncread(wj4,'ua'));
ua = ua(x,y,1,:);ua =squeeze(ua);UA=[UA;ua];
ua=[];
wj5=(['hur_day_CMCC-CMS_rcp45_r1i1p1_20',num2str(j+1),'00101-20',num2str(j+1),'91231.nc']);
hur = single(ncread(wj5,'hur'));
hur = hur(x,y,1,:);hur =squeeze(hur);HUR=[HUR;hur];
hur=[];
wj6=(['tasmax_day_CMCC-CMS_rcp45_r1i1p1_20',num2str(j+1),'00101-20',num2str(j+1),'91231.nc']);
tasmax = single(ncread(wj6,'tasmax'));
tasmax = tasmax(x,y,:);tasmax =squeeze(tasmax);TASMAX=[TASMAX;tasmax];
tasmax=[];
%PR储存10958*1个

end
%去掉闰年多的8天
PR(10288)=[];PR(8827)=[];PR(7365)=[];PR(2904)=[];PR(4443)=[];PR(2983)=[];PR(1522)=[];PR(60)=[];
CLT(10288)=[];CLT(8827)=[];CLT(7365)=[];CLT(2904)=[];CLT(4443)=[];CLT(2983)=[];CLT(1522)=[];CLT(60)=[];
UA(10288)=[];UA(8827)=[];UA(7365)=[];UA(2904)=[];UA(4443)=[];UA(2983)=[];UA(1522)=[];UA(60)=[];
VA(10288)=[];VA(8827)=[];VA(7365)=[];VA(2904)=[];VA(4443)=[];VA(2983)=[];VA(1522)=[];VA(60)=[];
HUR(10288)=[];HUR(8827)=[];HUR(7365)=[];HUR(2904)=[];HUR(4443)=[];HUR(2983)=[];HUR(1522)=[];HUR(60)=[];
TASMAX(10288)=[];TASMAX(8827)=[];TASMAX(7365)=[];TASMAX(2904)=[];TASMAX(4443)=[];TASMAX(2983)=[];TASMAX(1522)=[];TASMAX(60)=[];

PR=PR*86400;
TASMAX=TASMAX-273.15;
%算ws
for n=1:10950
WS(n)=sqrt(VA(n)^2+UA(n)^2)*3.6;
ET(n)=TASMAX(n)-0.4*(TASMAX(n)-10)*(1-0.01*HUR(n));
%B储存评分10950*5，B(:,1)储存pr，B(:,2)储存clt，B(:,3)储存ws，B(:,4)储存et，B(:,5)储存HCI
   if PR(n)<3 && PR(n)>0
     B(n,1) = 9;
   elseif PR(n)==0
     B(n,1)= 10;
   elseif PR(n)>=3 && PR(n)<6
     B(n,1) = 8;
   elseif PR(n)>=6 && PR(n)<9
     B(n,1) = 5;
   elseif PR(n)>=9 && PR(n)<=12
     B(n,1)= 2;
   elseif PR(n)>12 && PR(n)<=25
     B(n,1)= 0;
   else
     B(n,1)= -1;
   end
   if CLT(n)>=11 && CLT(n)<21
      B(n,2) = 10;
   elseif CLT(n)>=21 && CLT(n)<31
      B(n,2)= 9;
   elseif CLT(n)>0 && CLT(n)<11
      B(n,2)= 9;
   elseif CLT(n)>=31 && CLT(n)<41
      B(n,2)= 8;
   elseif CLT(n)==0
      B(n,2) = 8;
   elseif CLT(n)>=41 && CLT(n)<51
      B(n,2)= 7;
   elseif CLT(n)>=51 && CLT(n)<61
      B(n,2)= 6;
   elseif CLT(n)>=61 && CLT(n)<71
      B(n,2) = 5;
   elseif CLT(n)>=71 && CLT(n)<81
      B(n,2) = 4;
   elseif CLT(n)>=81 && CLT(n)<=90
      B(n,2) = 3;
   else
     B(n,2) = 2;
   end
   if WS(n)>0 && WS(n)<10
     B(n,3) = 10;
   elseif WS(n)>=10 && WS(n)<20
     B(n,3) = 9;
   elseif WS(n)>=20 && WS(n)<30
     B(n,3)= 8;
   elseif WS(n)==0
     B(n,3) = 8;
   elseif WS(n)>=30 && WS(n)<40
     B(n,3) = 6;
   elseif WS(n)>=40 && WS(n)<50
     B(n,3)= 3;
   elseif WS(n)>=50 && WS(n)<=70
     B(n,3) = 0;
   else
     B(n,3) = -10;
   end
   if ET(n)<26 && ET(n)>=23
      B(n,4) = 10;     
   elseif ET(n)<23 && ET(n)>=20
      B(n,4)= 9;
   elseif ET(n)==26 
      B(n,4) = 9;
   elseif ET(n)>26 && ET(n)<29
      B(n,4)= 8;
   elseif ET(n)>=18 && ET(n)<20
      B(n,4) = 7;
   elseif ET(n)>=29 && ET(n)<31
      B(n,4) = 7;
   elseif ET(n)>=15 && ET(n)<18
      B(n,4) = 6;
   elseif ET(n)>=31 && ET(n)<33
      B(n,4) = 6;
   elseif ET(n)>=11 && ET(n)<15
      B(n,4) = 5;
   elseif ET(n)>=33 && ET(n)<35
      B(n,4) = 5;
   elseif ET(n)>=7 && ET(n)<11
      B(n,4)= 4;
   elseif ET(n)>=35 && ET(n)<37
      B(n,4) = 4;
   elseif ET(n)>=0 && ET(n)<7
      B(n,4) = 3;
   elseif ET(n)>=-5 && ET(n)<0
      B(n,4) = 2;
   elseif ET(n)>=37 && ET(n)<=39
      B(n,4) = 2;
   elseif ET(n)<-5
      B(n,4) = 1;
   else
      B(n,4) = 0;
   end
%B储存评分10950*5，B(:,1)储存pr，B(:,2)储存clt，B(:,3)储存ws，B(:,4)储存et，HCI储存HCI
  HCI(n) =4*B(n,4)+2*B(n,2)+3*B(n,1)+B(n,3); 
end
WS= reshape(WS,365,30);
TASMAX= reshape(TASMAX,365,30);
PR= reshape(PR,365,30);
HUR= reshape(HUR,365,30);
CLT= reshape(CLT,365,30);
HCI=reshape(HCI,365,30);
sheet=['point_test',num2str(i)];   
xlswrite('pr.xls',PR,sheet);
xlswrite('clt.xls',CLT,sheet);
xlswrite('hur.xls',HUR,sheet);
xlswrite('ws.xls',WS,sheet);
xlswrite('tasmax.xls',TASMAX,sheet);
xlswrite('HCI.xls',HCI,sheet);
%运行完成提示over
'over'