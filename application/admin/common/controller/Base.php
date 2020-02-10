<?php


namespace app\admin\common\controller;


use app\admin\common\model\AuthRule;
use think\Controller;
use think\facade\Request;
use think\facade\Session;
use think\facade\Config;
use auth\Auth;
use app\admin\common\model\Menu;
use think\facade\Tree;

class Base extends Controller
{
    /**
     * 初始化方法
     * 创建常量、公共方法
     * 在所有的方法之前被调用
     */
    protected function initialize()
    {
        // 权限检测
        $auth = Auth::instance();
        $controller = request()->controller();
        $action = request()->action();
        if ( $action == '' ) {
            $node = 'admin/' . $controller;
        } else {
            $node = 'admin/' . $controller . '/' . $action;
        }
        $uid = session('uid');

        if ( !$auth -> check($node, $uid) ) {
            $this -> error('您没有权限访问，请联系管理员', 'admin/Index/console');
        }

        // 显示侧边导航菜单
        $this -> showNav();
    }

    /**
     * 检测用户是否登录
     * 调用位置：后台入口 admin.php/index/index
     */
    protected function isLogin()
    {
        if ( !Session::has('uid') ) {
            $this -> redirect('admin/user/login');
        }
    }

    /**
     * 显示侧边栏导航
     */
    public function showNav()
    {
        $menuList = Menu::where('status', 1) -> field('module, controller, action') -> select();

        foreach ($menuList as $k => $v) {
            $controller = $v['controller'] ? $v['controller'] : 'Index';
            $action = $v['action'] ? $v['action']  : 'index';
            $url = $v['module'] . '/' . $controller . '/' . $action;
        }

        $menus = Menu::where([
            'status' => 1,
        ]) -> select() -> toArray();

        $menu =  makeTree($menus);

        // 2. 将分类信息赋值给模板 nav.html
        $this -> view -> assign('menu', $menu);
        $this -> view -> assign('title', 'ThinkPHP 5.1 Auth权限管理系统');

        // 3. 渲染菜单
        return $this -> view -> fetch('index');
    }
}