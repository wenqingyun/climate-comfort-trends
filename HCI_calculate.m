%va\uaÀ„ws£¨º∆À„HCI
for n=1:10950
WS(n)=sqrt(VA(n)^2+UA(n)^2)*3.6;
ET(n)=TASMAX(n)-0.4*(TASMAX(n)-10)*(1-0.01*HUR(n));
%B¥¢¥Ê∆¿∑÷10950*5£¨B(:,1)¥¢¥Êpr£¨B(:,2)¥¢¥Êclt£¨B(:,3)¥¢¥Êws£¨B(:,4)¥¢¥Êet£¨B(:,5)¥¢¥ÊHCI
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
%B¥¢¥Ê∆¿∑÷10950*5£¨B(:,1)¥¢¥Êpr£¨B(:,2)¥¢¥Êclt£¨B(:,3)¥¢¥Êws£¨B(:,4)¥¢¥Êet£¨HCI¥¢¥ÊHCI
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