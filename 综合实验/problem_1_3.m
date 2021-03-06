%part 1:进行分段线性插值
f=@(x) 1/(1+x*x);    %待插值函数f
x=[-5,-4,-3,-2,-1,0,1,2,3,4,5];
y=[f(-5),f(-4),f(-3),f(-2),f(-1),f(0),f(1),f(2),f(3),f(4),f(5)];
x0=[-5,-4,-3,-2,-1,0,1,2,3,4,5];
y0=interp1(x,y,x0);  %直接调用matlab的分段线性插值函数
disp('插值进行完毕，下面进行展示原函数f和插值多项式L的函数图像')

%part 2:作出分段线性插值多项式和原函数的图像
%先绘制原函数f的图像
fplot(f,[-10,10])
hold on 
%再利用较精确的点集，使用plot绘制分段插值多项式L的图像
x1=-5:0.001:5;
y1=interp1(x,y,x1);
plot(x1,y1);
hold on

%part 3:估算分段线性插值的误差
x2=-5:0.1:5;
y2_lag=interp1(x,y,x2);
tar_lag=0;      %误差总值
for i=1:101
    temp_lag=y2_lag(i)-f(x2(i));
    tar_lag=tar_lag+abs(temp_lag);
end
res_lag=tar_lag/101; %误差终值

%part 4:进行分段三次埃尔米特插值
f1=@(x) (y1-2*x)/((1+x*x)*(1+x*x));   %待插值函数f的一阶导数
xn=[-5,-4,-3,-2,-1,0,1,2,3,4,5];
yn=[f(-5),f(-4),f(-3),f(-2),f(-1),f(0),f(1),f(2),f(3),f(4),f(5)];
y1=[f1(-5),f1(-4),f1(-3),f1(-2),f1(-1),f1(0),f1(1),f1(2),f1(3),f1(4),f1(5)];   
x0=[-5,-4,-3,-2,-1,0,1,2,3,4,5];
y0=Section_Hermite(xn,yn,y1,x0);

%part 5:作出分段三次埃尔米特插值多项式的图像
x3=-5:0.001:5;     %使用精确点集作出埃尔米特插值多项式的图像
y3=Section_Hermite(xn,yn,y1,x3);
plot(x3,y3);
hold on

%part 6:估算埃尔米特插值的误差
x2=-5:0.1:5
y2_her=Section_Hermite(x,y,y1,x2)
tar_her=0;      %误差总值
for i=1:101
    temp_her=y2_her(i)-f(x2(i))
    tar_her=tar_her+abs(temp_her);
end
res_her=tar_her/101; %误差终值
disp('分段线性插值多项式的误差值为：')
disp(vpa(res_lag))   %使用vpa函数将误差计算结果转化为小数
disp('分段埃尔米特插值多项式的误差值为：')
disp(vpa(res_her))




