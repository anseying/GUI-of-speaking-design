%�ú�����Ҫ��Ϊ�����ԭ�����ļ�
function Clear_File()
string_name={'cjyy.txt';'hzyy.txt';'lbyy.txt';'JBMM.txt'};
for i=1:4
    fid=fopen(char(string_name(i)),'w');
    fclose(fid);
end
ensure3;

