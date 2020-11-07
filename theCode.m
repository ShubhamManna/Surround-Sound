clc
clear all
load chirp	
Fs=8192;
nBits=16;
sound(y,Fs,nBits)			%playing

soundData=y;
pause(2)
 
silence=zeros(100,1);
delayed=vertcat(silence,soundData(1:end-100)); %Time Shifting

figure(1)
subplot(2,1,1)
plot(soundData)
xlabel('time')
ylabel('Normalised Sound Data')
title('Original')
axis([0 500 -1 1])

subplot(2,1,2)
plot(delayed, 'r')
title('Time delayed')
xlabel('time')
ylabel('Normalised Sound Data')
axis([0 500 -1 1])

%%
%Simulating sound coming from only Left direction
left = soundData;
right = .05*delayed;
outputSound=[left right]
sound(outputSound)	%left side

figure(2)
subplot(5,1,1) %plotting the graph
plot(outputSound)
title('Far Left')
xlabel('time')
ylabel('Normalised Sound Data')
axis([0 500 -1 1])
legend('Left channel', 'Right Channel')
pause(2)

%Slightly Left
left = soundData;
right = .2*delayed;
outputSound=[left right]
sound(outputSound)
subplot(5,1,2) %plotting the graph
plot(outputSound)
title('Slightly Left')
xlabel('time')
ylabel('Normalised Sound Data')
axis([0 500 -1 1])
legend('Left channel', 'Right Channel')
pause(2)

%Gradually moving from left to right
left = 0.7*soundData;
right = 0.7*delayed;
outputSound=[left right]
sound(outputSound)
subplot(5,1,3) %plotting the graph
plot(outputSound)
title('Almost Equidistant from both ears')
xlabel('time')
ylabel('Normalised Sound Data')
axis([0 500 -1 1])
legend('Left channel', 'Right Channel')
pause(2)                  

%Slightly Right
left = 0.2*delayed;
right = soundData;
outputSound=[left right]
sound(outputSound)
subplot(5,1,4) %plotting the graph
plot(outputSound)
title('Slightly Right')
xlabel('time')
ylabel('Normalised Sound Data')
axis([0 500 -1 1])
legend('Left channel', 'Right Channel')
pause(2)

%Now moving from slight right to far right
left = .05*delayed;
right = soundData;
outputSound=[left right]
sound(outputSound)
subplot(5,1,5) %plotting the graph
plot(outputSound)
title('Far Right')
xlabel('time')
ylabel('Normalised Sound Data')
axis([0 500 -1 1])
legend('Left channel', 'Right Channel')
%%100th line of Code :D

%Now using the FIR filter to eliminate the low frequencies which would 
%naturally be neglected due to head shadow

Fs = 3500;
figure(3)
highpass(left,1000,Fs,'ImpulseResponse','fir');
left = highpass(left,1000,Fs);
right = soundData;
outputSound=[left right]
sound(outputSound)

%Please use Earphones for the audio Outputs

