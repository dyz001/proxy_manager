<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/19
 * Time: 10:08
 */
namespace Home\Controller;
use Home\Model\RecordTagModel;
use Think\Controller;
class DataReceiverController extends Controller{
	public function receive_water(){
		trace('into receive_water');
		$pid = I('post.pid');
		$game_code = I('post.game_code');
		$pump_water = I('post.pump_water');
		$spreader = I('post.spreader');
		if(!$pid || !$game_code || !$pump_water || $spreader === null){
			trace('error parameter '.$pid.', '.$game_code.', '.$pump_water.','.$spreader);
			return 'error parameter '.$pid.', '.$game_code.', '.$pump_water.','.$spreader;
		}
		$record_tag_model = new RecordTagModel();
		$ret_arr = $record_tag_model->procedure('call save_water_record(' .
		                                        $pid . ','.$spreader. ', \'' . $game_code . '\', ' . $pump_water
		                                        . ')', false);
//		$json_ret['code'] = 200;
//		$json_ret['id'] = $ret_arr[0][0]['id'];
		return 'ok';
	}
}