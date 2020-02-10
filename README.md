# ThinkPHP 5.1 Auth权限管理系统

#### 介绍

ThinkPHP 5.1 Auth权限管理系统，实现了基本的权限管理，本系统是基于Module/Controller/Action进行权限认证，该版本不控制菜单显示隐藏，仅针对Module/Controller/Action进行权限认证，基于角色控制权限节点认证。

#### 软件架构

1. 前端框架：layui 2.5.5
2. 后端框架：ThinkPHP 5.1.38

#### 安装教程

1. 搭建开发环境，推荐使用PhpStudy；
2. 下载或Git项目代码到本地，将代码拷贝至：E:/phpstudy_pro/www/目录下；
3. 通过PhpStudy面板添加网站，并指向项目根目录的public/目录下；
4. 新建数据库think_auth（可自定义数据库名称，然后在config/database.php文件中修改数据库配置），导入数据库文件think_auth.sql;
5. 使用浏览器（推荐chrome浏览器）访问：http://yourdomain.com/admin，默认用户名/密码：admin。

#### 使用说明

1. 角色管理：添加角色、编辑角色、删除角色、角色授权
2. 权限管理：添加权限、编辑权限、删除权限、
3. 用户管理：添加用户、编辑用户、删除用户
4. 菜单管理：添加菜单、编辑菜单、删除菜单
5. 文章管理：模拟菜单，未开发功能

#### 预览截图

![后台首页](https://images.gitee.com/uploads/images/2019/1226/142138_da813866_1163529.png "01.png")
![角色管理](https://images.gitee.com/uploads/images/2019/1226/142151_345a4c50_1163529.png "02.png")
![权限管理](https://images.gitee.com/uploads/images/2019/1226/142202_79b09316_1163529.png "03.png")
![角色授权](https://images.gitee.com/uploads/images/2019/1226/142210_4b84dfc0_1163529.png "04.png")
![菜单管理](https://images.gitee.com/uploads/images/2019/1226/142219_14e84413_1163529.png "05.png")
![用户管理](https://images.gitee.com/uploads/images/2019/1226/142228_5a7b5f4d_1163529.png "06.png")

