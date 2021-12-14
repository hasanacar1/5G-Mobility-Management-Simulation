% sorted_RSP_smallcell_M = ones(50, 50);
% sorted_RSP_smallcell_s = ones(50, 50);
%siralama_RSP_for_smallcell = ones(50,50);
for m=1:1:makrocell_number                %i : karþýlaþtýrýlacak baz istasyonu
     for s=1:1:4
        count = 1;
        for i=1:1:makrocell_number
            for j=1:1:4
                if RSP_smallcell(m, s, t, u) < RSP_smallcell(i, j, t, u)
                    count = count + 1;
                end
            end
        end
        siralama_RSP_for_smallcell(m, s) = count;
    end
end

for m=1:1:makrocell_number
    for s=1:1:4
        if siralama_RSP_for_smallcell(m, s)==1
            sorted_RSP_smallcell_M(1)= m; %Makrocell  
            sorted_RSP_smallcell_s(1)= s; %t. saniyedeki en yüksek RSS deðerine sahip olan baz istasyonu
        end

        if siralama_RSP_for_smallcell(m, s)==2
            sorted_RSP_smallcell_M(2)= m; % Makrocell
            sorted_RSP_smallcell_s(2)= s; %t. saniyedeki en yüksek RSS deðerine sahip olan baz istasyonu
        end

        if siralama_RSP_for_smallcell(m, s)==3
            sorted_RSP_smallcell_M(3)= m; % Makrocell 
            sorted_RSP_smallcell_s(3)= s; %t. saniyedeki en yüksek RSS deðerine sahip olan baz istasyonu
        end
        if siralama_RSP_for_smallcell(m, s)==4
            sorted_RSP_smallcell_M(4)= m; % Makrocell
            sorted_RSP_smallcell_s(4)= s; %t. saniyedeki en yüksek RSS deðerine sahip olan baz istasyonu
        end
    end
end