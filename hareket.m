%                                                                
%                         Mobility Model
%                                                                
%==========================================================================



 function [New_MS_pos_x,  New_MS_pos_y] = hareket(MS_POS_X, MS_POS_Y, MS_Speed, T, move_dir)

%==========================================================================
%                         Globale Input Parameters
%==========================================================================
global R;


%===========================================================================================================================================
%                     Direction of UE Movement
%===========================================================================================================================================
% No of diraction choice
Dir_choice = 8;

% Genrate the first MS_move_diraction randomly
% mob_stat(j,t)=randint(1,1,[0,4])
%MS_move_dir = ceil(Dir_choice * rand(1));
MS_move_dir = move_dir;

%===========================================================================================================================================
%                               MS movement 
%===========================================================================================================================================
% MS movement will be consedered based on the HHO time
% MS movement will be slow by divided by HHO_time_factore in order to
%--------------------------------------------------------------------------
% MS_Move = (MS_Speed *1000/(3600) (m/s) mater /(second)
% Change the speed of MS to mater per second  m/s 
% We also divided MS_Speed by Measurment_factore in order to performe  
% evant measurmen every (T_measurment_intervel) period of time.
%--------------------------------------------------------------------------
% MS_move = (MS_Speed  * 1000/(3600 )) ; 
%--------------------------------------------------------------------------
MS_move = (MS_Speed * T) ; 


%===========================================================================================================================================
% To control select the direction for the Mobile Movement in Mobile
% Mobility
%   EX1: select MS_move_dir to South-East or South or  South-West
%   EX2: select MS_move_dir to East or North-East as in this simulation
%===========================================================================================================================================
% Select MS_move_dir to East or North-East only
% 
% if MS_move_dir > 3
%     
%     Rand_Move = ceil(3*rand(1));
%     
%     switch Rand_Move
%         
%         case 1
%             MS_move_dir = 1;
%             
%         case 2
%             MS_move_dir = 2;
%             
%         case 3
%             MS_move_dir = 2;
%     end
% end
%===========================================================================================================================================
%                Mobilelty Model Randomlly
%===========================================================================================================================================
switch MS_move_dir 
    
    case 1   % Mobile move to East
        New_MS_pos_x = MS_POS_X + MS_move;
        New_MS_pos_y = MS_POS_Y ;
        
    case 2   % Mobile move to North-East
        New_MS_pos_x= MS_POS_X + MS_move;
        New_MS_pos_y= MS_POS_Y + MS_move;
        
    case 3   % Mobile move to South-East
        New_MS_pos_x= MS_POS_X + MS_move;
        New_MS_pos_y= MS_POS_Y - MS_move;
        
    case 4   % Mobile move to South
        New_MS_pos_x= MS_POS_X;
        New_MS_pos_y= MS_POS_Y - MS_move;
        
    case 5   % Mobile move to South-West
        New_MS_pos_x= MS_POS_X - MS_move;
        New_MS_pos_y= MS_POS_Y - MS_move;
        
    case 6   % Mobile move to West
        New_MS_pos_x= MS_POS_X - MS_move;
        New_MS_pos_y= MS_POS_Y;
        
    case 7  % Mobile move to North-West
        New_MS_pos_x= MS_POS_X - MS_move;
        New_MS_pos_y= MS_POS_Y + MS_move;
        
    otherwise    % Mobile move to North
        New_MS_pos_x= MS_POS_X;
        New_MS_pos_y= MS_POS_Y + MS_move;
end
%==========================================================================
% To limit the mobilityfor Mobile Station the Mobile Station Move
% inside one cell only cant go out the cell
%==========================================================================
% while  (((New_MS_pos_x)^2 + (New_MS_pos_y)^2)^0.5 ) >= (5*R)
%     
%     MS_move_dir  = ceil(Dir_choice * rand(1));
%     switch MS_move_dir
%         
%         case 1   % Mobile move to East
%             New_MS_pos_x= MS_POS_X + MS_move;
%             New_MS_pos_y= MS_POS_Y;
%             
%         case 2   % Mobile move to North-East
%             New_MS_pos_x= MS_POS_X + MS_move;
%             New_MS_pos_y= MS_POS_Y + MS_move;
%             
%         case 3  % Mobile move to South-East
%             New_MS_pos_x= MS_POS_X + MS_move;
%             New_MS_pos_y= MS_POS_Y - MS_move;
%             
%         case 4   % Mobile move to South
%             New_MS_pos_x= MS_POS_X;
%             New_MS_pos_y= MS_POS_Y - MS_move;
%             
%         case 5  % Mobile move to South-West
%             New_MS_pos_x= MS_POS_X - MS_move;
%             New_MS_pos_y= MS_POS_Y - MS_move;
%             
%         case 6  % Mobile move to West
%             New_MS_pos_x= MS_POS_X - MS_move;
%             New_MS_pos_y= MS_POS_Y;
%             
%         case 7  % Mobile move to North-West
%             New_MS_pos_x= MS_POS_X - MS_move;
%             New_MS_pos_y= MS_POS_Y + MS_move;
%             
%         otherwise   % Mobile move to North
%             New_MS_pos_x= MS_POS_X;
%             New_MS_pos_y= MS_POS_Y + MS_move;
%     end
% end

%==========================================================================
%
%==========================================================================

end