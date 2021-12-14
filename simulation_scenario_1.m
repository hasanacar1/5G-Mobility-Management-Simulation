if u == 3    
    if t >= 0 && t <= 55
        direction = 2;
    elseif t > 55 && t <= 150
        direction = 8;
          
    end
elseif u == 2
   if t >= 0 && t <= 55
        direction = 2;
    elseif t > 55 && t <= 150
        direction = 2; 
   end
elseif u == 1
   if t >= 0 && t <= 60
        direction = 2;
   elseif t > 60 && t <= 150
        direction = 1; 
   end
end