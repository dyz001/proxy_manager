<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/26
 * Time: 17:03
 */
namespace Home\Controller;
use Common\Controller\HomebaseController;
use Think\Controller;
use Home\Model\RecordTagModel;
use Common\Common\ErrorCode;
class VerifyController extends HomebaseController
{
	public function can_apply_proxy(){
		$player_id = I('get.player_id');
		$player_cnt = I('get.player_cnt');
		$record_tag_model = new RecordTagModel();
		$config_entity = $record_tag_model->getRecordModel('config')->where('name=\'proxy_min_players\'')->find();
		if($player_cnt < (int)$config_entity['value']){
			$this->ajaxReturn(array(
				'status'=>1,
				'code'=> ErrorCode::PLAYER_CNT_NOT_ENOUGH
			),'json');
		}else{
			$this->ajaxReturn(array(
				'status'=>1,
				'code'=> ErrorCode::SUCCESS
			),'json');
		}
	}
}