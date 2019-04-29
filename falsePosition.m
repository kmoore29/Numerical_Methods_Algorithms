function [root, fx, ea, iter] = falsePosition(func, x_l, x_u, es, maxiter) 
%outputs%
x_r = 0; %first approximate error will always be 100% %
ea = Inf; %error will always be higher then specified, until calculations begin% 
iter = 0; %same as x_r = 0, i.e. nothing has happened yet%

    if nargin == 3 %filling default values in for bad users%
        es = 0.0001;
        maxiter = 200;
    
    elseif nargin == 4
        maxiter = 200;
    
    elseif nargin < 3|| nargin > 5 %user did VERY bad%
        error('Put in 5 inputs for best results.')
    
    elseif nargin == 5 %user did just fine%
    
    else
    
    end

    if (x_l < 0 && x_u < 0) || (x_l > 0 && x_u > 0) %root cannot be found where root does not exist%
        error('Your bounds need to bracket where the function crosses the x-axis.')
    
    else
    
    end
    
    while ea > es && iter < maxiter %repeat operation as long as error and iterations do not exceed user values%
    
        iter = iter + 1; %adds an iteration every time%
        fx_l = subs(func, x_l); %lets lower bound be plugged in%
        fx_u = subs(func, x_u); %lets upper bound be plugged in%
        x_old = x_r; %stores previous approximation%
        x_r = x_u-((fx_u*(x_l-x_u))/(fx_l-fx_u)); %to find root (x_r), false-position operation must be excuted%
        fx_r = subs(func, x_r); %plugging root in%
        
            if (fx_r < 0 && fx_l < 0) || (fx_r > 0 && fx_l > 0) %when root guess has same sign as lower bound%
                x_l = x_r; %replace lower bound with root approximation%
                ea = abs(((x_r-x_old)/(x_r))*100); %new minus old over new times 100 to make it a percent%
                
            else
                x_u = x_r; %replace upper bound with root approximation%
                ea = abs(((x_r-x_old)/(x_r))*100); 
                
            end
        
    end

fx = fx_r; %assigning fx to f(root)%
root = x_r; %defining root%
        fprintf('Root of the function is %.8f \n',x_r); %displaying answer to a max of 8 decimal places%
        fprintf('The value of the function is %.8f \n',fx); %displaying value of function at "root"%
        fprintf('Approximate percentage error is %.8f \n',ea) %displaying ea of root%
        fprintf('# of iterations performed was %.0f \n',iter) %Number of iterations of false-position method%
end