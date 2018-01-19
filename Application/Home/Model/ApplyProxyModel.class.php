<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/5
 * Time: 15:36
 */
namespace Home\Model;
class ApplyProxyModel extends \Common\Model\CommonModel
{
	public $EAgreeStatus = 1;
	public $ERefuse = 2;
	public $EApplying = 0;
	public function agree_apply($player_id)
	{
		$user_data = $this->where('user_id = '.$player_id)->find();
		if($user_data)
		{
			$this->where('user_id = '.$player_id)->save(array('status'=>$this->EAgreeStatus));
			//更新用户表
			$user = new \Home\Model\UserModel();
			$user->where('id='.$player_id)->save(array('user_type'=>$user->ENormalProxy));
			return true;
		}
		return false;
	}

	public function add_apply($player_id, $parent_id)
	{
		$player_data = $this->where('user_id='.$player_id)->find();
		if(!$player_data)
		{
			$this->add(array('user_id'=>$player_id, 'parent_id'=>$parent_id, 'apply_time'=>time(), 'status'=>$this->EApplying));
		}
		return true;
	}

	public function refuse_apply($player_id)
	{
		trace('=====refuse apply');
		$user_data = $this->where('user_id = '.$player_id)->find();
		if($user_data)
		{
			$this->where('user_id = '.$player_id)->save(array('status'=>$this->ERefuse));
			return true;
		}
		return false;
	}

	public function exist($player_id)
	{
		$user_data= $this->where('user_id = '.$player_id)->find();
		if(!$user_data)
		{
			return false;
		}
		return true;
	}
}