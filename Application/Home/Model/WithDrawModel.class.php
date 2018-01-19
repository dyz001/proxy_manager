<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/5
 * Time: 16:12
 */
namespace Home\Model;
use Think\Log;

class WithDrawModel extends \Common\Model\CommonModel
{
	public $ESelfPlatform = 1;
	public $EThirdPlatform = 2;
	public function get_withdraws()
	{
		$data = $this->select();
		if(count($data) == 0)
		{
			return null;
		}
		return $data;
	}

	public function get_withdraw_by_userid($user_id)
	{
		$data = $this->where('user_id='.$user_id)->find();
		return $data;
	}

	public function withdraw($user_id, $count, $type)
	{
		Log::write('enter withdraw');
		$data = $this->where('user_id='.$user_id)->find();
		if($data)
		{
			if($type == $this->ESelfPlatform && $data['with_draw'] > $count)
			{
				$ret = $this->where('user_id='.$user_id)->save(array('with_draw'=>($data['with_draw'] - $count)));
				if($ret){
					return true;
				}else{
					trace($this->error);
					return false;
				}
			}else if($type == $this->EThirdPlatform && $data['third_with_draw'] > $count){
				$ret = $this->where('user_id='.$user_id)->save(array('third_with_draw'=>($data['third_with_draw'] - $count)));
				if($ret){
					return true;
				}else{
					trace($this->error);
					return false;
				}
			}
		}else{
			//玩家不存在
			return false;
		}
		return false;
	}
}