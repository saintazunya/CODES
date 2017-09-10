Tcpk=zeros(100,100);
TCPK=zeros(1,10);
 for MU=0:0.5:3
for m=5:5:100
    for  n=5:5:100
        g=0;
      for g=1:10
     x_m_n=random('norm',MU,1,m,n);
     STD=std((x_m_n)');
     temp=zeros(1,m);
     c4=4*(n-1)/(4*n-3);
     h=c4^2/(1-c4^2);
     for k=1:m
         temp(1,k)=h*STD(1,k)/c4;
     end
     Sigma=sum(temp)/(h*m);
     Cpu=(3-0)/(3*Sigma);
     Cpl=(3-0)/(3*Sigma);
         
     TCPK(1,g)=max(Cpu,Cpl);
     g=g+1;
      end
     Tcpk(m/5,n/5)=max(Cpu,Cpl);
     stdcpk(m/5,n/5)=std(TCPK);
     meancpk(m/5,n/5)=mean(TCPK);
     [mu,sigma,muci,sigmaci]=normfit(TCPK,0.05);
     LOWBO=num2str(muci(1,1));
     UPBO=num2str(muci(2,1));
     interval=strcat(LOWBO,'~',UPBO);
     CI{m/5,n/5}=interval;
       Tcpk;
    header='D:\test\';
     filename=strcat(num2str(MU),num2str(m),num2str(n));
     appendix='.xls';
     SB=strcat(header,filename);
     name=strcat(SB,appendix);
     xlswrite(name,Tcpk,'data1');
     
      header='D:\test\std';
    filename=strcat(num2str(MU),num2str(m),num2str(n));
     appendix='.xls';
     SB=strcat(header,filename);
     name=strcat(SB,appendix);
     xlswrite(name,stdcpk,'data1');
     
     header='D:\test\mean';
    filename=strcat(num2str(MU),num2str(m),num2str(n));
     appendix='.xls';
     SB=strcat(header,filename);
     name=strcat(SB,appendix);
     xlswrite(name,meancpk,'data1');
    end
    
end
  
 end
     