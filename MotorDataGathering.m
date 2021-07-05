clear a shield encoder dcm
clf;

a = arduino('COM11','MKR1000','Libraries',{'mkrmotorCarrier','I2C','rotaryEncoder'})
shield = mkrMotorCarrier(a)
encoder = rotaryEncoder(a,'D6','D7',12)
dcm = dcmotor(shield,3)

timeArr = [];
dataArr = [];
inputArr = [];
time = 0
prevInc = 0
start(dcm)
tic
dcm.Speed = 0
while time <= 120
    if time >= 96
        dcm.Speed = 0;
    elseif time >= 72
        dcm.Speed = 1;
    elseif time >= 48
        dcm.Speed = -0.5;
    elseif time >= 24
        dcm.Speed = 0.5;
    end
    time = toc;
    data = readSpeed(encoder);
    
    timeArr = [timeArr ; time];
    dataArr = [dataArr ; data];
    inputArr = [inputArr ; dcm.Speed];
    
end
hold on
plot(timeArr,dataArr)
plot(timeArr,inputArr*100)
inputArr = inputArr * 8.03

stop(dcm)