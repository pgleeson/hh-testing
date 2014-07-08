// adapted from genesis tutorial3.g
include ./hhchan.g
float   PI = 3.1415926

float celsius = 6.3

float tmax = 0.5		
float dt = 5e-5		
setclock 0 {dt}		

float RM = 0.33333333 // specific membrane resistance (ohms m^2)
float CM = 0.01		   // specific membrane capacitance (farads/m^2)
float RA = 0.354	   // specific axial resistance (ohms m)
float Eleak = -0.0543  // membrane leakage potential (volts)
float ENA = 0.050      // sodium equilibrium potential
float EK = -0.077      // potassium equilibrium potential

float soma_l = 100e-6            
float soma_d = 500e-6
float SOMA_A = soma_l*PI*soma_d 

create neutral /cell
create compartment /cell/soma 
float area = soma_l*PI*soma_d
float xarea = PI*soma_d*soma_d/4
setfield /cell/soma Em {Eleak}
setfield /cell/soma Rm 	{RM/area}
setfield /cell/soma Cm 	{CM*area}  
setfield /cell/soma Ra  {RA*soma_l/xarea}
setfield /cell/soma len {soma_l}
setfield /cell/soma dia {soma_d}
setfield /cell/soma initVm {-0.065} 
setfield /cell/soma inject 0.0

pushe /cell/soma
make_Na_squid_hh
make_K_squid_hh
setfield Na_squid_hh Gbar {1200 * area}
setfield K_squid_hh Gbar {360 * area}
pope

// create pulsegen /pulse
// setfield /pulse level1 61e-9 width1 500e-3 delay1 1e-3 baselevel 0.0 trig_mode 0
// addmsg /pulse /cell/soma INJECT output

addmsg /cell/soma/Na_squid_hh /cell/soma CHANNEL Gk Ek
addmsg /cell/soma /cell/soma/Na_squid_hh VOLTAGE Vm
addmsg /cell/soma/K_squid_hh /cell/soma CHANNEL Gk Ek
addmsg /cell/soma /cell/soma/K_squid_hh VOLTAGE Vm

create asc_file /out
setfield /out flush 1 leave_open 1 append 0 float_format %0.9g filename /tmp/hh_nostim.gen.dat
addmsg /cell/soma /out SAVE Vm
addmsg /cell/soma/Na_squid_hh /out SAVE X
addmsg /cell/soma/Na_squid_hh /out SAVE Y
addmsg /cell/soma/K_squid_hh /out SAVE X


check
reset

step {tmax} -time

