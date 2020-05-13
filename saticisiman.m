function [cozum cozumeniyi objeniyi sayac objit] = saticisiman(gezici,T ,Tend,sk)

sehirsayisi = size(gezici,1);%Ka� �ehir var ?
cozum=randperm(sehirsayisi);%ba�lang�� ��z�m� (random olarak gidilecek yol.
obj=0;

%a�a��da random olu�an g�zergah�n kat edilen mesafeyi haz�rlar. 
for i=1:sehirsayisi-1
    sehir1=cozum(i);
    sehir2=cozum(i+1);
    obj=obj+gezici(sehir1,sehir2);
end
sehir1=cozum(end);
sehir2=cozum(1);
obj=obj+gezici(sehir1,sehir2);
    
sayac=1;
cozumeniyi=cozum;
objeniyi=obj;
objit=obj;

while (T>Tend) %tavlama ba�lat�l�yor
    
    
    deg=randperm(sehirsayisi);
    deg=deg(1:2);
    komsu=cozum;
    temp=komsu(deg(1));
    komsu(deg(1))=komsu(deg(2));
    komsu(deg(2))=temp;

 obj_komsu=0;
    
    for i=1:sehirsayisi-1
        sehir1=komsu(i);
        sehir2=komsu(i+1);
        obj_komsu=obj_komsu+gezici(sehir1,sehir2);
    end
    sehir1=komsu(end)
    sehir2=komsu(1);
    obj_komsu=obj_komsu+gezici(sehir1,sehir2);
    


    %E�er kom�u iyiyse oray� kabul et de�ilse kabul olas�l���n� hesapla.
    if (obj_komsu<=obj)
    cozum=komsu;
    obj=obj_komsu;
    else
        de=obj_komsu-obj;
        kabul=exp(-de/T);
        rs=unifrnd(0,1);
        if (rs<kabul)
            cozum=komsu;
            obj=obj_komsu;
           
        end

    end
    T=T*sk;
    sayac=sayac+1;
    if(obj<min(objit))
    objit(sayac)=obj;
    else
        objit(sayac)=objit(sayac-1)
    end
    
    if(objit(sayac)<objeniyi)
        cozumeniyi=cozum;
        objeniyi=obj;
    end
    
    
end

end

