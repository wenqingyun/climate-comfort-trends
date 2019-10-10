%用下面的公式打开nc文件看里有几个维度及单位，以及6个点的坐标
%x=ncinfo('clt_day_CMCC-CMS_rcp45_r1i1p1_20400101-20491231.nc');
%lat = double(ncread('clt_day_CMCC-CMS_rcp45_r1i1p1_20400101-20491231.nc','lat')); 
%lon = double(ncread('clt_day_CMCC-CMS_rcp45_r1i1p1_20400101-20491231.nc','lon'));
%点n的坐标在latlon中的序号，点6的坐标在lat和lon中分别在65，65位
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
%单位换算
PR=PR*86400;
TASMAX=TASMAX-273.15;