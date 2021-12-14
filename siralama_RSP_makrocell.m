
for i=1:1:makrocell_number                %i : karþýlaþtýrýlacak baz istasyonu
    count = 1; 
    for j=1:1:makrocell_number              %j : diðer baz istasyonlarý
        if RSP_makrocell(i) < RSP_makrocell(j)
            count = count + 1;
        end
    end
    siralama_RSP_for_makrocell(i) = count;
end

for m = 1:1:makrocell_number
    if siralama_RSP_for_makrocell(m)==1
        sorted_RSP_makrocell(1)= m; %t. saniyedeki en yüksek RSP deðerine sahip olan makrocell 
    end
    
    if siralama_RSP_for_makrocell(m)==2
        sorted_RSP_makrocell(2)= m;  %t. saniyedeki en yüksek 2. RSP deðerine sahip olan makrocell
    end
    
    if siralama_RSP_for_makrocell(m)==3
        sorted_RSP_makrocell(3)= m; %t. saniyedeki en yüksek 3. RSP deðerine sahip olan makrocell 
    end
    if siralama_RSP_for_makrocell(m)==4
        sorted_RSP_makrocell(4)= m; %t. saniyedeki en yüksek 4. RSP deðerine sahip olan makrocell
    end
    
    if siralama_RSP_for_makrocell(m)==5
        sorted_RSP_makrocell(5)= m; %t. saniyedeki en yüksek 5. RSP deðerine sahip olan makrocell 
    end
    
    if siralama_RSP_for_makrocell(m)==6
        sorted_RSP_makrocell(6)= m; %t. saniyedeki en yüksek 6. RSP deðerine sahip olan makrocell
    end
    if siralama_RSP_for_makrocell(m)==7
        sorted_RSP_makrocell(7)= m; %t. saniyedeki en yüksek 7.  RSP deðerine sahip olan makrocell 
    end
    
end

