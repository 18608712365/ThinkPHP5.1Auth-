<?php


namespace app\admin\controller;


use app\admin\common\controller\Base;
use auth\Auth;
use think\facade\Session;

class Index extends Base
{
    // 后台首页
    public function index()
    {
        // 检测用户是否登录
        $this -> isLogin();

        // 设置模板变量
        $this -> view -> assign('title', 'Auth权限管理系统');

        // 渲染模板
        return $this -> view -> fetch('index');
    }

    // 控制台
    public function console()
    {
        // 设置模板变量
        $this -> view -> assign('title', 'Auth权限管理系统');

        // 渲染模板
        return $this -> view -> fetch('console');
    }
}