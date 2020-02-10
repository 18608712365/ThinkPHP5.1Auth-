<?php


namespace app\admin\common\model;


use think\Model;
use think\model\Pivot;

class AuthGroupAccess extends Pivot
{
    protected $table = 'think_auth_group_access';
    protected $autoWriteTimestamp = true;
}