%�������������ʽ����
function s=Ladder()
format long
y=@(x) 1/(1+x*x); %�����ֵ�ԭ����
a=-1;   %��������
b=1;    %��������
n=20;   %��Ҫ�ȷֵĶ���
h=(b-a)/n;
s=0;
for k=1:n
    xk=a+h*(k-1);
    xkk=a+h*(k);
    s=s+y(xk)+y(xkk);
end
s=h*s/2;
