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
use Common\Controller\HomebaseController;

class DataReceiverController extends HomebaseController{
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
		trace('pid:'.$pid.',game_code:'.$game_code.',pump_water:'.$pump_water,',spreader:'.$spreader);
		$record_tag_model = new RecordTagModel();
		$ret_arr = $record_tag_model->procedure('call save_water_record(' .
		                                        $pid . ','.$spreader. ', \'' . $game_code . '\', ' . $pump_water
		                                        . ')', false);
		return 'ok';
	}
	public function gen_fish_sum_record(){
		trace('gen_fish_record begin');
		$data = [];
		$data['status'] = 0;
		$fish_record_url = C('FISH_SUM_RECORD_URL');
		$start = mktime(0,0,0, date('m'), date('d') - 1, date('Y'));
		$end = mktime(23,59,59,date('m'), date('d') - 1, date('Y'));
		$total_page = 0;
		$record_tag_model = new RecordTagModel();
		$ret = $record_tag_model->where('start='.$start.' and end='.$end.' and fish_tag=1')->find();
		if($ret){
			$data['msg'] = '记录已经汇总，请查看';
			$this->ajaxReturn($data, 'json');
			return;
		}
		$curPage = 1;
		$first_id = -1;
		$last_id = 0;
		$isOK = true;
		do{
			$param = array(
				'StartTime'=>$start,
				'EndTime'=>$end,
				'Page'=>$curPage,
				'PageLimit'=>C('FISH_PAGE_LIMIT')
			);
			$param['Sign'] = $this->genSign($param);
			trace('url:'.$fish_record_url . http_build_query($param));
			$json_str = $this->http($fish_record_url, $param);
			$json_obj = json_decode($json_str);
			if($json_obj->ErrorCode != 0){
				trace('get record return error:'.$json_obj->ErrorCode.', msg:'.$json_obj->Message);
				$isOK = false;
				break;
			}else{
				$curPage = $json_obj->Data->Pagination->CurrentPage;
				$total_page = $json_obj->Data->Pagination->TotalPages;
				foreach($json_obj->Data->Result as $entity){
					$member_id = $entity->MemberId;//unionid
					$account_id = $entity->accountId;
					$cost_sum = $entity->CostSum;
					$bonus_sum = $entity->BonusSum;
					$ret_id_tbs = $record_tag_model->procedure(
						'CALL save_fish_game_sum_record(\''.$member_id.'\','.$account_id.','.$cost_sum.','.$bonus_sum.');',
						false
					);
					if($first_id == -1){
						$first_id = $ret_id_tbs[0][0]['id'];
					}
					$last_id = $ret_id_tbs[0][0]['id'];
				}
			}
			$curPage += 1;
		}while($curPage < $total_page);
		if($isOK){
			$entity = $record_tag_model->where('start='.$start.' and end='.$end)->find();
			if(empty($entity)){
				trace('platform tag 0');
				$record_tag_model->add(array(
					'start'=>$start,
					'end'=>$end,
					'fish_tag'=>true,
					'platform_tag'=>false,
					'fish_key_start'=>$first_id,
					'fish_key_end'=>$last_id,
					'fish_create_time'=>time()
				));
			}else{
				trace('update record');
				$record_tag_model->where('start='.$start.' and end='.$end)->save(array(
					'fish_tag'=>true,
					'fish_key_start'=>$first_id,
					'fish_key_end'=>$last_id,
					'fish_create_time'=>time()
				));
			}
			$data['status'] = 1;
			$data['msg'] = 'ok';
		}else{
			$data['status'] = 0;
			$data['msg'] = 'error';
		}
		$this->ajaxReturn($data, 'json');
	}

	public function gen_platform_sum_record(){
		$this->ajaxReturn(array(
			'status' => 1,
			'code' => 0
		),'json');
	}

	protected function genRandomChar($num){
		$ret = '';
		$char_arr = '0123456789qwertyuiopasdfghjklzxcvbnm';
		for($i = 0; $i < $num; ++$i){
			$ret .= $char_arr[random_int(0,35)];
		}
		return $ret;
	}

	protected function genSign($params){
		return $this->genRandomChar(5).md5(http_build_query($params).C('FISH_KEY')).$this->genRandomChar(5);
	}

	public function gen_fish_record(){
		trace('gen_fish_record begin');
		$fish_record_url = C('FISH_RECORD_URL');
		$start = mktime(0,0,0, date('m'), date('d') - 1, date('Y'));
		$end = mktime(23,59,59,date('m'), date('d') - 1, date('Y'));
		$total_page = 0;
		$record_tag_model = new RecordTagModel();
		$curPage = 1;
		do{
			$param = array(
				'StartTime'=>$start,
				'EndTime'=>$end,
				'Page'=>$curPage,
				'PageLimit'=>C('FISH_PAGE_LIMIT')
			);
			$param['Sign'] = $this->genSign($param);

			$json_str = $this->http($fish_record_url, $param);
			$json_obj = json_decode($json_str);
			if($json_obj->ErrorCode != 0){
				trace('get record return error:'.$json_obj->ErrorCodce.', msg:'.$json_obj->Message);
				break;
			}else{
				$curPage = $json_obj->Data->Pagination->CurrentPage;
				$total_page = $json_obj->Data->Pagination->TotalPages;
				foreach($json_obj->Data->Result as $entity){
					$member_id = $entity->MemberId;//unionid
					$scene_sn = $entity->Scene_sn;
					$cost = $entity->Cost;
					$bonus = $entity->Bonus;
					$start_time = $entity->Start;
					$end_time = $entity->End;
					$version_key = $entity->VersionKey;
					$version_key_end = $entity->VersionKeyEnd;
					$game_type = $entity->GameType;
					$record_tag_model->procedure(
						'CALL save_fish_game_record(\''.$member_id.'\','.$scene_sn.','.$cost.','.$bonus.',\''.
						$start_time.'\', \''.$end_time.'\','.$version_key.','.$version_key_end.','.$game_type.');',
						false
					);
				}
			}
			$curPage += 1;
		}while($curPage < $total_page);
	}



	public function sum_platform_profit(){
		$record_tag_model = new RecordTagModel();
		trace('=========sum_platform_profit===========');
		$start = mktime(0,0,0, date('m'), date('d') - 1, date('Y'));
		$end = mktime(23,59,59,date('m'), date('d') - 1, date('Y'));
		$ret_array = $record_tag_model->procedure( 'call sum_platform_profit('.$start.','.$end.');', false);
		trace('==============end sum_platform_profit==========');
		$this->ajaxReturn(array(
			'status' => 1,
			'code' => $ret_array[0][0]['code']
		),'json');
	}

	public function sum_fish_profit(){
		$record_tag_model = new RecordTagModel();
		trace('=========sum_fish_profit===========');
		$start = mktime(0,0,0, date('m'), date('d') - 1, date('Y'));
		$end = mktime(23,59,59,date('m'), date('d') - 1, date('Y'));
		$record_tag_model->procedure( 'call sum_fish_profit('.$start.','.$end.');', false);
		trace('==============end sum_fish_profit==========');
		$this->ajaxReturn(array(
			'status' => 1,
			'code' => 0
		), 'json');
	}

	public function add_profit_for_proxy(){
		$record_tag_model = new RecordTagModel();
		$start = mktime(0,0,0, date('m'), date('d') - 1, date('Y'));
		$end = mktime(23,59,59,date('m'), date('d') - 1, date('Y'));
		trace('========add_profit_for_proxy begin==========');
		$record_tag_model->procedure( 'call add_profit_for_proxy('.$start.','.$end.');', false);
		trace('========add_profit_for_proxy end==========');
		$this->ajaxReturn(array(
			'status' => 1,
			'code' => 0
		),'json');
	}



	protected function http($url, $params, $method = 'GET', $header = array(), $multi = false){
		$opts = array(
			CURLOPT_TIMEOUT        => 30,
			CURLOPT_RETURNTRANSFER => 1,
			CURLOPT_SSL_VERIFYPEER => false,
			CURLOPT_SSL_VERIFYHOST => false,
			CURLOPT_HTTPHEADER     => $header
		);

		/* 根据请求类型设置特定参数 */
		switch(strtoupper($method)){
			case 'GET':
				$opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
				break;
			case 'POST':
				//判断是否传输文件
				$params = $multi ? $params : http_build_query($params);
				$opts[CURLOPT_URL] = $url;
				$opts[CURLOPT_POST] = 1;
				$opts[CURLOPT_POSTFIELDS] = $params;
				break;
			default:
				throw new Exception('不支持的请求方式！');
		}

		/* 初始化并执行curl请求 */
		$ch = curl_init();
		curl_setopt_array($ch, $opts);
		$data  = curl_exec($ch);
		$error = curl_error($ch);
		curl_close($ch);
		if($error) throw new Exception('请求发生错误：' . $error);
		return  $data;
	}
}