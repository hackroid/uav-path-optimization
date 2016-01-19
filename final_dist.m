function [line_length] = final_dist(x_guess_final)

global t;
global num_path;
global x0;

line_length = 0;


p_prev = x_guess_final(1,:);
for i = 1 : num_path
    
    if i == 1
        
        for j = 1 : length(t)
            %calculate position
            p = (1-t(j))^2*x0(1,:) + 2*(1-t(j))*t(j)*x_guess_final(1,:)+t(j)^2*x_guess_final(2,:);
            
            %find distance from previous position to new position
            d = norm(p-p_prev);
            
            %add distance to total length
            line_length = line_length + d;
            
            %change initial position
            p_prev = p;
            
            
        end
        
    else
        
        for j = 1 : length(t)
            %calculate position
            p = (1-t(j))^2*x_guess_final(2*i-2,:) + 2*(1-t(j))*t(j)*x_guess_final(2*i-1,:)+t(j)^2*x_guess_final(2*i,:);
            
            %find distance from previous position to new position
            d = norm(p-p_prev);
            
            %add distance to total length
            line_length = line_length + d;
            
            %change initial position
            p_prev = p;
        end
        
    end
end

end