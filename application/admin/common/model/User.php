<?php


namespace app\admin\common\model;


use think\Model;
use app\admin\common\model\AuthGroupAccess;
use app\admin\common\model\AuthGroup;

class User extends Model
{
    protected $pk = 'id';
    protected $table = 'think_user';

    protected $autoWriteTimestamp = true;
    protected $createTime = 'logintime';
    protected $dateFormat = 'Y-m-d H:i:s';

    // 修改器
    public function setPasswordAttr($value)
    {
        return md5($value);
    }
}