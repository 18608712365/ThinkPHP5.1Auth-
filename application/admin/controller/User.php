<?php


namespace app\admin\controller;


use app\admin\common\controller\Base;
use app\admin\common\model\AuthGroupAccess;
use app\admin\common\model\User as UserModel;
use app\admin\common\model\AuthGroup;
use think\Db;
use think\facade\Request;
use think\facade\Session;
use think\facade\Config;

class User extends Base
{
    // 用户登录页面
    public function login()
    {
        $this -> view -> assign('title', '管理员登录');
        return $this -> view -> fetch('login');
    }

    // 验证后台登录
    public function checkLogin()
    {
        // 获取数据
        $data = Request::param();

        // 查询条件
        $map[] = ['username', '=', $data['username']];
        $map[] = ['password', '=', md5($data['password'])];

        $result = UserModel::where($map) -> find();
        if ( $result ) {
            $roles = AuthGroupAccess::where('user_id', $result['id']) -> column('role_id');
            $accesses = AuthGroup::where('id', 'in', $roles) -> column('rules');

            Session::set('uid', $result['id']);
            Session::set('username', $result['username']);
            Session::set('_auth_list_', $accesses);

            $this -> success('登录成功', '/admin');
        }
        $this -> error('登录失败');
    }

    // 退出登录
    public function logout()
    {
        // 1. 清除session
        Session::clear();
        // 2. 退出登录并跳转到登录页面
        $this -> success('退出成功', 'admin/user/login');
    }

    // 用户管理首页
    public function index()
    {
        $this -> view -> assign('title', '用户管理');
        return $this -> view -> fetch('index');
    }

    // 用户列表
    public function userList()
    {
        // 1. 检测用户是否登录
        $this -> isLogin();

        // 2. 全局查询条件
        $map = []; // 将所有的查询条件封装到这个数组中

        // 3. 条件1
//        $map[] = ['status', '=', 1]; // 这里的等号不允许省略

        // 4. 实现搜索功能
        $keywords = Request::param('keywords');
        if ( !empty($keywords) ) {
            // 条件2
            $map[] = ['name', 'like', '%'.$keywords.'%'];
        }

        // 5. 定义分页参数
        $limit = isset($_GET['limit']) ? $_GET['limit'] : 10;
        $page = isset($_GET['page']) ? $_GET['page'] : 1;

        // 6. 获取到所有的用户
        $userList = UserModel::where($map)
            -> alias('u')
            -> join('think_auth_group_access aga', 'aga.user_id = u.id')
            -> join('think_auth_group ag', 'ag.id = aga.role_id')
            -> order('u.id', 'asc')
            -> page($page, $limit)
            -> select();

        $total = count(UserModel::where($map)->select());
        $result = array("code" => 0, "msg" => "查询成功", "count" => $total, "data" => $userList);
        return json($result);

        // 3. 设置模板变量
        $this -> view -> assign('userList', $userList);

        // 4. 渲染模板
        return $this -> view -> fetch('index');
    }

    // 添加用户
    public function add()
    {
        $role = AuthGroup::all();
        $this -> view -> assign('title', '添加用户');
        $this -> view -> assign('roleList', $role);
        return $this -> view -> fetch('add');
    }

    // 执行添加用户的操作
    public function doAdd()
    {
        // 1. 获取的用户提交的信息
        $data = Request::param();

        $data['logintime'] = time();
        $data['loginip'] = $this -> request -> ip();

        // 2. 执行新增操作，多表插入记录，开启事务操作
        Db::startTrans();
        try {
            // 插入用户表
            $user = UserModel::create($data);

            // 定义用户角色关联表字段
            $role['role_id'] = $data['role_id'];
            $role['user_id'] = $user -> id;

            // 用户角色关联表插入数据
            $res = AuthGroupAccess::create($role);

            // 提交事务处理
            Db::commit();
        } catch ( \Exception $e ) {
            // 回滚事务
            Db::rollback();
            $this -> error('用户添加失败，请检查');
        }
        $this -> success('用户添加成功', 'index');
    }
}