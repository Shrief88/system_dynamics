# system_dynamics


This is the Final assignment for system Dynamics 2nd Electrical year, the goal of this assignment is computing and visualizing the output of the system for input signal (unit step, unit impulse) and draw the state space of the system by using numerical methods and computes the state space representation matrices (A, B, C, D) of the system. 

the program asks the user to input order of output (n) and order of input (m) and determine the input type unit step or unit impulse and enter values of a’s and b’s.
In the first gui the program asks the user to enter the data and when the user push the confirm button the second gui opens to plot the input then the third gui opens to plot the output and finally the fourth gui opens to plot the state.  


## description for the numerical approximations: 

we are using Euler’s method (first order Runge-Kutta) to solve the differential equation  
say the user enter equation like that:    
<p align="center">  𝑑3𝑦(𝑡)𝑑𝑡+𝑎2𝑑2𝑦(𝑡)𝑑𝑡+𝑎1𝑑𝑦(𝑡)𝑑𝑡+𝑎0𝑦(𝑡)=𝑢(𝑡)+𝑏1𝑑𝑢(𝑡)𝑑𝑡 𝑤ℎ𝑒𝑟𝑒 𝑢(𝑡) 𝑖𝑠 𝑢𝑛𝑖𝑡 𝑠𝑡𝑒𝑝  </p>  

First, we will divide the equation by a(n) to make sure that, the coefficient of 𝑑𝑛𝑦(𝑡)𝑑𝑡 will be zero Second, we are dealing with the derivatives of the input, In our code we represent unit step as a vector [..0 0 0 0 1 1 1 1...] and unit impulse as a vector [..0 0 0 0 (1/h) 0 0 0...] where h is the step size, and based on the input type which user input we generate the input vector and get the derivatives of this vector so if m = 1 we get 𝑑𝑢(𝑡)𝑑𝑡 and if m=2 we get 𝑑𝑢(𝑡)𝑑𝑡 and 𝑑2𝑢(𝑡)𝑑𝑡 , by multiply them by their coefficient and adding the result we get the input vector like in the equation above the input will be equal 𝑢(𝑡)+𝑏1𝑑𝑢(𝑡)𝑑𝑡 So the equation will be:                           
                                             <p align="center">  𝑑3𝑦(𝑡)𝑑𝑡+𝑎2𝑑2𝑦(𝑡)𝑑𝑡+𝑎1𝑑𝑦(𝑡)𝑑𝑡+𝑎0𝑦(𝑡)=γ(t)=𝑖𝑛𝑝𝑢𝑡 𝑣𝑒𝑐𝑡𝑜𝑟 </p>
                                             
We set the initial conditions for 𝑑2𝑦(𝑡)𝑑𝑡,𝑑𝑦(𝑡)𝑑𝑡,𝑦(𝑡) to be equal to zero and we introduce three new variables x1, x2, x3:   
𝑥1(𝑡)= 𝑦(𝑡) , 𝑥2(𝑡)=𝑑𝑦(𝑡)𝑑𝑡 , x3(t)=𝑑2𝑦(𝑡)𝑑𝑡   
x1′(t) = y′(t) = x2(t)   
x2′(t)= y′′(t) = x3(t)    
x3′(t)= y′′′(t) = γ(t)−a2y′′(t)−a2y′(t)−a0y(t) = γ(t)−a2*x3(t)−a1*x2(t)−a0*x1(t)  
So we can use the state space matrices A and B so the equation will be  
 <p align="center"> x′(t)=A*x(t)+B*γ(t) </p>  
$$
\left(\begin{array}{cc} 
0.8944272 & 0.4472136\\
-0.4472136 & -0.8944272
\end{array}\right)
\left(\begin{array}{cc} 
10 & 0\\ 
0 & 5
\end{array}\right)
$$ 
