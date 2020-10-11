%求出每一帧的对应时间；
function f=frame2time(fn,wlen,inc,fs)
f=(((1:fn)-1)*inc+wlen/2)/fs;
end