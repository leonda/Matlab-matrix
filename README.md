# Matlab-matrix

#### 介绍
**2020年矩阵与数值分析上机实验，MATLAB实现。**

* 2.1 
  * `GaussElimination.m`实现了高斯消去法求解方程组
  * `L_GaussElimination.m`实现了带列主元的高斯消去法求解方程组
  * `LU.m`实现了LU分解
  * `LUP.m`实现了带列主元的LU分解
  * `reverse_and_det.m`实现了利用LU分解求矩阵的逆和行列式
  * `usefunction.m`为调用各个函数的文件
* 2.2
  * `cholesky.m` 实现了cholesky分解及求解线性方程组
  * `usefunction.m`为调用函数的文件
* 2.7
  * `Gauss_Seidel.m`实现了Gauss-Seidel迭代求解线性方程组
  * `jacobi.m`实现了Jacobi迭代求解线性方程组
  * `usefunction.m`为调用各个函数的文件
* 2.8
  * `CG.m`实现了共轭梯度法求解线性方程组
  * `usefunction.m`为调用各个函数的文件
* 3.4
  * `Newton.m`实现了Newton迭代法求解非线性方程的根
  * `usefunction.m`为调用函数的文件
* 3.5
  * `xianjiefa.m`实现了弦截法求非线性方程的根
* 3.6
  * `plot_xianjiefa.m`实现了使用弦截法求非线性方程的根，并判断是线性收敛还是超线性收敛
  * `plot_newton.m`实现了使用Newton法求非线性方程的根，并判断是2阶收敛还是1阶收敛
* 4.3
  * `Lagrange.m`实现了拉格朗日插值
  * `Chebyshev.m`实现了切比雪夫零点插值和拉格朗日插值的对比
* 4.4
  * `OLS.m`实现了用最小二乘法拟合数据生成直线、二次曲线、三次曲线
  * `GaussElimination.m`调用了前面的高斯消元法求解线性方程组
  * `newton.m`实现了[生成newton插值多项式](https://blog.csdn.net/seamanj/article/details/37562791)
  * `usefunction.m`为调用函数的文件
* 4.7
  * [用MATLAB实现了三次样条插值第二类边界条件](https://blog.csdn.net/cugautozp/article/details/107068452)，并生成了图像
* 5.1
  * `f.m`定义了用到的函数图像
  * `usefunction.m`定义了区间、具体实现了复化的梯形求积公式和复化的Simpson求积公式
* 6.1
  * `ut_.m`定义了$u'(t)$
  * `Euler.m`实现了Euler法求微分方程的解，并且绘制了函数图像.
  * `Eulerplus.m`实现了改进的Euler法求解微分方程的解，并绘制了函数图像.

* jingxijifen
  * 实现了精细积分法

* rkf.m实现了四阶RK法求解微分方程
* p243_1.m 用了RK法解决刚性问题

本项目到此全部完成 2020/12/12