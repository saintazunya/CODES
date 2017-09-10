D2=xlsread('d2table');
Tcpk=zeros(20,20);
TCPK=zeros(1,10); 
 CI=cell(14,14);
for m=5:14
    for  n=5:14
       k=1;
      for k=1:10
     x_m_n=random('norm',0.5,1,m,n);
     R=0;
     for i=1:m % obtain range
     R=R+range(x_m_n(i,:));
     end
     R=R/n;
     d2=D2(m,n);
     Cpu=(3)/(3*(R/d2));
     Cpl=(3)/(3*(R/d2));
      TCPK(1,k)=max(Cpu,Cpl);
     k=k+1;
   
     end
     Tcpk(m,n)=max(Cpu,Cpl);  
     stdcpk(m,n)=std(TCPK);
     meancpk(m,n)=mean(TCPK);
     [mu,sigma,muci,sigmaci]=normfit(TCPK,0.05);
     LOWBO=num2str(muci(1,1));
     UPBO=num2str(muci(2,1));
     interval=strcat(LOWBO,'~',UPBO);
 
     CI{m,n}=interval;
     
    end
end
     header='D:\test\';
     filename=strcat(num2str(m),num2str(n));
     appendix='.xls';
     SB=strcat(header,filename);
     name=strcat(SB,appendix);
     xlswrite(name,Tcpk,'data1');
     
      header='D:\test\std';
     filename=strcat(num2str(m),num2str(n));
     appendix='.xls';
     SB=strcat(header,filename);
     name=strcat(SB,appendix);
     xlswrite(name,stdcpk,'data1');
     
     header='D:\test\mean';
     filename=strcat(num2str(m),num2str(n));
     appendix='.xls';
     SB=strcat(header,filename);
     name=strcat(SB,appendix);
     xlswrite(name,meancpk,'data1');
     
  
     