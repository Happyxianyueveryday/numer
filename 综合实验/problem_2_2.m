format long 
%part 1:��ԭ����ʹ�ø�������ɭ��ʽ�������
s=simpson(-1,1,10);

%part 2:���������ƺͼ���
res=abs(pi/2-s);
disp('ʹ�ø�������ɭ��ʽ��������Ϊ:');
disp(vpa(res));
