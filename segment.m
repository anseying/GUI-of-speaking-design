%MYP13
function Seg=segment(signal,W,SP,Window)
%主要用途是为了进行分帧
%与 enframe
% SEGMENT chops a signal to overlapping windowed segments
% A= SEGMENT(X,W,SP,WIN) returns a matrix which its columns are segmented
% and windowed frames of the input one dimentional signal, X. W is the
% number of samples per window, default value W=256. SP is the shift
% percentage, default value SP=0.4. WIN is the window that is multiplied by
% each segment and its length should be W. the default window is hamming
% window.
% 06-Sep-04
% Esfandiar Zavarehei

if nargin<3
    SP=.4;
end
if nargin<2
    W=256;
end
if nargin<4
    Window=hamming(W);
end

Window=Window(:); %make it a column vector
L=length(signal);
SP=fix(W.*SP);        %求取  inc
N=fix((L-W)/SP +1); %number of segments
                                  %求取帧数
Index=(repmat(1:W,N,1)+repmat((0:(N-1))'*SP,1,W))';
%与 enframe 中的 f(:)=x(indf(:,ones(1,len))+inds(ones(nf,1),:));  
hw=repmat(Window,1,N);
Seg=signal(Index).*hw;

