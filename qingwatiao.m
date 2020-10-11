%Clearing variables in memory and Matlab command screen
%有问题，出警告；
clear all;
clc;
% %  洗牌的飞跃青蛙算法 （样图） 是新自然启发智能算法利用整个的更新和评价战略解决方案。求解多维函数优化问题，这一战略将会恶化的收敛速度和算法由于维度之间的干涉现象的解决方案的质量。为了克服这方面的不足，提出了基于样图的维度的维度改进。拟议的战略结合到其他维度值更新后的值的一维
% 将贪婪地接受新的解决方案，而且其更新后的值可以完善的解决方案。此外，新的个别更新配方，旨在同时学习经验既从全局和局部最优解。同时，他们还彰显改性
% 算法是竞争相比其他一些改进算法的连续函数优化问题。
%Courant stability factor
S=1/(2^0.5);
 
% Parameters of free space (permittivity and permeability and speed of
% light) are all not 1 and are given real values
epsilon0=(1/(36*pi))*1e-9;
mu0=4*pi*1e-7;
c=3e+8;
 
% Spatial grid step length (spatial grid step = 10 nm)
delta=10e-9;
% Temporal grid step obtained using Courant condition
deltat=S*delta/c;
 
%Total no of time steps
time_tot=6000;
 
% Grid Dimension in x (xdim) and y (ydim) directions
ydim=360;%The domain is 305 space steps or 360*0.01=3.6 microns long
xdim=305;%The domain is 310 space steps or 305*0.01=3.05 microns wide
 
%Free-space wavelength in microns
wav=1.753;
 
%Index of the periodic structures
index=6^0.5;
 
% Initialization of permittivity and permeability matrices
epsilon=epsilon0*ones(xdim,ydim);
mu=mu0*ones(xdim,ydim);
 
 
% Defining of the permittivity profile of the region:-
 
% Defining of the circular waveguide
xcord=zeros(xdim,ydim);
ycord=zeros(xdim,ydim);
for i=1:1:xdim
    ycord(i,:)=1:1:ydim;
end
for i=1:1:ydim
    xcord(:,i)=1:1:xdim;
end
epsilon(find((xcord-152.5*ones(xdim,ydim)).^2+(ycord-207.5*ones(xdim,ydim)).^2<122.5^2))=index*index*epsilon0;
epsilon(find((xcord-152.5*ones(xdim,ydim)).^2+(ycord-207.5*ones(xdim,ydim)).^2<77.5^2))=epsilon0;
 
% Defining of the straight waveguide 
epsilon(:,31:75)=index*index*epsilon0;
 
% Initialization of field matrices
Ez=zeros(xdim,ydim);
Ezx=zeros(xdim,ydim);
Ezy=zeros(xdim,ydim);
Hy=zeros(xdim,ydim);
Hx=zeros(xdim,ydim);
 
% Initializing electric conductivity matrices in x and y directions
sigmax=zeros(xdim,ydim);
sigmay=zeros(xdim,ydim);
 
 
%Perfectly matched layer boundary design
%Reference:-http://dougneubauer.com/wp-content/uploads/wdata/yee2dpml1/yee2d_c.txt
%(An adaptation of 2-D FDTD TE code of Dr. Susan Hagness)
 
%Boundary width of PML in all directions
bound_width=20;
 
%Order of polynomial on which sigma is modeled
gradingorder=6;
 
%Required reflection co-efficient
refl_coeff=1e-6;
 
%Polynomial model for sigma
sigmamax=(-log10(refl_coeff)*(gradingorder+1)*epsilon0*c)/(2*bound_width*delta);
boundfact1=((epsilon(round(xdim/2),bound_width)/epsilon0)*sigmamax)/((bound_width^gradingorder)*(gradingorder+1));
boundfact2=((epsilon(round(xdim/2),ydim-bound_width)/epsilon0)*sigmamax)/((bound_width^gradingorder)*(gradingorder+1));
boundfact3=((epsilon(bound_width,round(ydim/2))/epsilon0)*sigmamax)/((bound_width^gradingorder)*(gradingorder+1));
boundfact4=((epsilon(xdim-bound_width,round(ydim/2))/epsilon0)*sigmamax)/((bound_width^gradingorder)*(gradingorder+1));
x=0:1:bound_width;
for i=1:1:xdim
    sigmax(i,bound_width+1:-1:1)=boundfact1*((x+0.5*ones(1,bound_width+1)).^(gradingorder+1)-(x-0.5*[0 ones(1,bound_width)]).^(gradingorder+1));
    sigmax(i,ydim-bound_width:1:ydim)=boundfact2*((x+0.5*ones(1,bound_width+1)).^(gradingorder+1)-(x-0.5*[0 ones(1,bound_width)]).^(gradingorder+1));
end
for i=1:1:ydim
    sigmay(bound_width+1:-1:1,i)=boundfact3*((x+0.5*ones(1,bound_width+1)).^(gradingorder+1)-(x-0.5*[0 ones(1,bound_width)]).^(gradingorder+1))';
    sigmay(xdim-bound_width:1:xdim,i)=boundfact4*((x+0.5*ones(1,bound_width+1)).^(gradingorder+1)-(x-0.5*[0 ones(1,bound_width)]).^(gradingorder+1))';
end
 
%Magnetic conductivity matrix obtained by Perfectly Matched Layer condition
%This is also split into x and y directions in Berenger's model
sigma_starx=(sigmax.*mu)./epsilon;
sigma_stary=(sigmay.*mu)./epsilon;
 
%Multiplication factor matrices for H matrix update to avoid being calculated many times
%in the time update loop so as to increase computation speed
G=((mu-0.5*deltat*sigma_starx)./(mu+0.5*deltat*sigma_starx));
H=(deltat/delta)./(mu+0.5*deltat*sigma_starx);
A=((mu-0.5*deltat*sigma_stary)./(mu+0.5*deltat*sigma_stary));
B=(deltat/delta)./(mu+0.5*deltat*sigma_stary);
 
%Multiplication factor matrices for E matrix update to avoid being calculated many times
%in the time update loop so as to increase computation speed
C=((epsilon-0.5*deltat*sigmax)./(epsilon+0.5*deltat*sigmax));
D=(deltat/delta)./(epsilon+0.5*deltat*sigmax);
E=((epsilon-0.5*deltat*sigmay)./(epsilon+0.5*deltat*sigmay));
F=(deltat/delta)./(epsilon+0.5*deltat*sigmay);
 
% Update loop begins
for n=1:1:time_tot
 
    %matrix update instead of for-loop for Hy and Hx fields
    Hy(1:xdim-1,1:ydim-1)=A(1:xdim-1,1:ydim-1).*Hy(1:xdim-1,1:ydim-1)+B(1:xdim-1,1:ydim-1).*(Ezx(2:xdim,1:ydim-1)-Ezx(1:xdim-1,1:ydim-1)+Ezy(2:xdim,1:ydim-1)-Ezy(1:xdim-1,1:ydim-1));
    Hx(1:xdim-1,1:ydim-1)=G(1:xdim-1,1:ydim-1).*Hx(1:xdim-1,1:ydim-1)-H(1:xdim-1,1:ydim-1).*(Ezx(1:xdim-1,2:ydim)-Ezx(1:xdim-1,1:ydim-1)+Ezy(1:xdim-1,2:ydim)-Ezy(1:xdim-1,1:ydim-1));
 
    %matrix update instead of for-loop for Ez field
    Ezx(2:xdim,2:ydim)=C(2:xdim,2:ydim).*Ezx(2:xdim,2:ydim)+D(2:xdim,2:ydim).*(-Hx(2:xdim,2:ydim)+Hx(2:xdim,1:ydim-1));
    Ezy(2:xdim,2:ydim)=E(2:xdim,2:ydim).*Ezy(2:xdim,2:ydim)+F(2:xdim,2:ydim).*(Hy(2:xdim,2:ydim)-Hy(1:xdim-1,2:ydim));
 
    % Source condition incorporating given free space wavelength 'wav'
    % and having a location at the left end of central waveguide just
    % after PML boundary
    tstart=1;
    N_lambda=wav*1e-6/delta;
    Ezx(21,31:75)=0.5*sin(((2*pi*(c/(delta*N_lambda))*(n-tstart)*deltat)));
    Ezy(21,31:75)=0.5*sin(((2*pi*(c/(delta*N_lambda))*(n-tstart)*deltat)));
 
    Ez=Ezx+Ezy;
    a=(Ez/Ezy).^2;
 
    %Movie type colour scaled image plot of Ez
    h=imagesc(delta*(1:1:xdim)*1e+6,(delta*(1:1:ydim)*1e+6)',Ez',[-1,1]);colorbar;
    set(h,'AlphaData',2.5*epsilon'/epsilon0);
    title(['\fontsize{20}Color-scaled image plot of Ez in ring resonator with PML boundary and at time=',num2str(round(n*deltat*1e+15)),' fs']);
    xlabel('x (in um)','FontSize',20);
    ylabel('y (in um)','FontSize',20);
    set(gca,'FontSize',20);
    getframe;
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF PROGRAM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 