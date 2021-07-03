clear a shield encoder dcm
clf;

a = arduino('COM11','MKR1000','Libraries',{'mkrmotorCarrier','I2C','rotaryEncoder'})
shield = mkrMotorCarrier(a)
encoder = rotaryEncoder(a,'D6','D7',12)
dcm = dcmotor(shield,3)


speed = 0;

start(dcm)
currentTime = clock
time = [time currentTime(6)]
while 1
    dcm.Speed = speed;
    %speed = speed + 0.01;
    %disp(readSpeed(encoder)/20)
    currentTime = clock
    time = [time currentTime(6)];
end
stop(dcm)
clear all
arduinoObj = arduino('COM7','Nano33IoT','Libraries','MotorCarrier')
