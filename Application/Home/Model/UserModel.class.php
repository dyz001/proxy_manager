<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/3
 * Time: 17:12
 */
namespace Home\Model;
use Think\Model;
class UserModel extends Model{
	protected $tablePrefix = '';
	public $EMainProxy = 1;
	public $ESpecialProxy = 2;
	public $ENormalProxy = 3;
	public $EPlayer = 4;
	public function getUserByAccount($account){
		$condition['account'] = $account;
		$data = $this->where($condition)->select();
		return $data;
	}

	public function getUserByMobile($phone_no)
	{
		$condition['mobile'] = $phone_no;
		$data = $this->where($condition)->select();
		return $data;
	}
}