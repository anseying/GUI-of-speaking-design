% pitch_vad1 中用到了 findSegment
%该函数主要是为了实现对输入向量的开始、结束、持续 三个量的记录；
function soundSegment=findSegment(express)
%存在重大缺陷，不能有效检测到单个的、双个的连续数字，进行记录与判断。
%express 为一个坐标量
if express(1)==0
    voicedIndex=find(express);                     % 寻找express中为1的位置
else
    voicedIndex=express;
end

soundSegment = [];
k = 1;
soundSegment(k).begin = voicedIndex(1);            % 设置第一组有话段的起始位置
for i=1:length(voicedIndex)-1,
	if voicedIndex(i+1)-voicedIndex(i)>1,          % 本组有话段结束
		soundSegment(k).end = voicedIndex(i);      % 设置本组有话段的结束位置
		soundSegment(k+1).begin = voicedIndex(i+1);% 设置下一组有话段的起始位置  
		k = k+1;
	end
end
soundSegment(k).end = voicedIndex(end);            % 最后一组有话段的结束位置
% 计算每组有话段的长度
for i=1 :k
    soundSegment(i).duration=soundSegment(i).end-soundSegment(i).begin+1;
end
