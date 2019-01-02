clc;
clear all;
Photo='';  %Resistor image path
RGB=imread(Photo);
matrixSize=size(RGB);
Y=matrixSize(1,1);
X=matrixSize(1,2);
x1 = Y;
Y=Y/2;
Y=round(Y);

for i=1:x1
    for t=1:X
        if RGB(i,t)<255
            Mask(i,t)=0;
        else
            Mask(i,t)=255;
        end
    end
end
figure, imshow(Mask)

for i=1:X
    if RGB(Y,i)==0 && RGB(Y,i,2)==0 && RGB(Y,i,3)==0
        Temp(i,1)='A';
    else
        Temp(i,1)=0;
    end
end

for i=1:X
    if RGB(Y,i)>=185 && RGB(Y,i,2)>=122 && RGB(Y,i,3)<=87
        Temp(i,1)='B';
    end
end

for i=1:X
    if RGB(Y,i)>=200 && RGB(Y,i,2)<=50 && RGB(Y,i,3)<=50
        Temp(i,1)='R';
    end
end

for i=1:X
    if RGB(Y,i)>=240 && RGB(Y,i,2)>=230 && RGB(Y,i,3)<=10
        Temp(i,1)='Y';
    end
end

for i=1:X
    if RGB(Y,i)<=140 && RGB(Y,i,2)<=140 && RGB(Y,i,3)>=200
        Temp(i,1)='D';
    end
end

for i=1:X
    if RGB(Y,i)==163 && RGB(Y,i,2)==73 &&RGB(Y,i,3)==164
        Temp(i,1)='V';
    end
end

for i=1:X
    if RGB(Y,i)==0 && RGB(Y,i,2)==255 &&RGB(Y,i,3)==0
        Temp(i,1)='G';
    end
end

j=1;
i1=0;
for i=1:X
    if Temp(i,1)~=0
        colorArray(1,j)=Temp(i,1);
        j=j+1;
        i1=i1+1;
    end
end

i1=floor(i1/3);
i2=floor(i1*2);
i3=floor(i2+i1);

j=1;
for i=1:X
    if Temp(i,1)~=0
        colorArray(1,j)=Temp(i,1);
        j=j+1;
    end
end

colorArray(1,1)= colorArray(1,floor(j/6));
colorArray(1,2)= colorArray(1,floor(j/3)+1);
colorArray(1,3)= colorArray(1,floor(j-2));

i=1;
for i=1:3
    if colorArray(1,i)==65      %black
        colorArray(1,i)=0;
    end
     
    if colorArray(1,i)==66      %brown
        colorArray(1,i)=1;
    end  
    
    if colorArray(1,i)==82      %red
        colorArray(1,i)=2;
    end
    
    if colorArray(1,i)==79      %orange
        colorArray(1,i)=3;
    end
    
    if colorArray(1,i)==89      %yellow
        colorArray(1,i)=4;
    end
    
    if colorArray(1,i)==71      %green
        colorArray(1,i)=5;
    end
    
    if colorArray(1,i)==68      %blue
        colorArray(1,i)=6;
    end
    
    if colorArray(1,i)==86      %violet
        colorArray(1,i)=7;
    end
    
    if colorArray(1,i)==72      %grey
        colorArray(1,i)=8;
    end
    
    if colorArray(1,i)==87      %white
        colorArray(1,i)=9;
    end
end
     
     hundreds=power(10,colorArray(1,3));
     tens=colorArray(1,1)*10;
     ones=colorArray(1,2)*1;
     
     resistorValue=(tens+ones)*hundreds;
     
     if resistorValue>=1000 && resistorValue<1000000
         resistorValue=resistorValue/1000;
         fprintf('Resistor Value: %dk ohm',resistorValue);
     elseif resistorValue>=1000000
         resistorValue=resistorValue/1000000;
         fprintf('Resistor Value: %dM ohm',resistorValue);
     else
         resistorValue=(tens+ones)*hundreds;
         fprintf('Resistor Value: %d ohm',resistorValue);
     end
     figure, imshow(Photo);
