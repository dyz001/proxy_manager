<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/4
 * Time: 14:07
 */

namespace Home\Controller;
use Home\Model\GetMoneyRecordModel;
use Home\Model\RecordTagModel;
use Home\Model\UserExtraInfoModel;
use Home\Model\UserModel;
use Home\Model\WaterRecordModel;
use Common\Controller\HomebaseController;
use Think\Controller;
use Think\Log;
class GMServiceController extends HomebaseController{
	public function query_all_order(){
		$get_money_record = new GetMoneyRecordModel();
		$count = $get_money_record->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));
		$data_list = $get_money_record
			->alias('a')
			->field('a.id,a.proxy_id, a.money, a.create_time, a.process_time, a.status, a.remark, user.nickname, user.account')
			->join('left join user on user.id=a.proxy_id')->order('a.id desc')->limit($page->firstRow, $page->listRows)->select();
		$list_cnt = count($data_list);
		for($i = 0; $i < $list_cnt; ++$i){
			$data_list[$i]['create_time'] = date('Y-m-d H:i:s', $data_list[$i]['create_time']);
			$data_list[$i]['process_time'] = date('Y-m-d H:i:s', $data_list[$i]['process_time']);
		}

		$this->assign('select', $data_list);
		$this->assign('page',$page->show());
		$this->display();

	}
	public function query_settle_order(){
		$get_money_record = new GetMoneyRecordModel();
		$count = $get_money_record->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));
		$data_list = $get_money_record
			->alias('a')->where('a.status=1')
			->field('a.id,a.proxy_id, a.money, a.create_time, a.process_time, a.status, a.remark, user.nickname, user.account')
			->join('left join user on user.id=a.proxy_id')->order('a.id desc')->limit($page->firstRow, $page->listRows)->select();
		$list_cnt = count($data_list);
		for($i = 0; $i < $list_cnt; ++$i){
			$data_list[$i]['create_time'] = date('Y-m-d H:i:s', $data_list[$i]['create_time']);
			$data_list[$i]['process_time'] = date('Y-m-d H:i:s', $data_list[$i]['process_time']);
		}

		$this->assign('select', $data_list);
		$this->assign('page',$page->show());
		$this->display();
	}
	public function query_unsettle_order(){
		$get_money_record = new GetMoneyRecordModel();
		$count = $get_money_record->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));
		$data_list = $get_money_record
			->alias('a')->where('a.status=0')
			->field('a.id,a.proxy_id, a.money, a.create_time, a.process_time, a.status, a.remark, user.nickname, user.account')
			->join('left join user on user.id=a.proxy_id')->order('a.id desc')->limit($page->firstRow, $page->listRows)->select();
		$list_cnt = count($data_list);
		for($i = 0; $i < $list_cnt; ++$i){
			$data_list[$i]['create_time'] = date('Y-m-d H:i:s', $data_list[$i]['create_time']);
			$data_list[$i]['process_time'] = date('Y-m-d H:i:s', $data_list[$i]['process_time']);
		}

		$this->assign('select', $data_list);
		$this->assign('page',$page->show());
		$this->display();
	}
	public function process_order(){

	}
	public function check_account(){

	}
	public function reset_password(){

	}

	public function transfer_order(){
		$get_order_id = I('get.order_id');
		$post_order_id = I('post.order_id');
		$user_model = new UserModel();
		$get_money_record_model = new GetMoneyRecordModel();
		$record_tag_model = new RecordTagModel();
		$trasfer_record = $record_tag_model->getRecordModel('transfer_record');
		if($get_order_id){
			$record_entity = $get_money_record_model->where('id='.$get_order_id)->find();
			if(!$record_entity)return 'error order id';
			$this->assign('order_id', $get_order_id);
			$this->assign('proxy_id', $record_entity['proxy_id']);
			$user_entity = $user_model->where('id='.$record_entity['proxy_id'])->find();
			$this->assign('nickname', $user_entity['nickname']);
			$this->assign('money_amount', $record_entity['money']);
			$this->assign('transfer_type','');
			$this->assign('transfer_account','');
			$this->assign('remark','');
			$this->assign('transfer_tag', false);
			$this->assign('refer_url', $_SERVER['HTTP_REFERER']);
		}else if($post_order_id){
			$proxy_id = I('post.proxy_id');
			$money_amount = I('post.money_amount');
			$transfer_type = I('post.transfer_type');
			$transfer_account = I('post.transfer_account');
			$transfer_time = time();
			$remark = I('post.remark');
			$trasfer_record->add(array(
				'order_id'=>$post_order_id,
				'proxy_id'=>$proxy_id,
				'money_amount'=>$money_amount,
				'transfer_type'=>$transfer_type,
				'transfer_account'=>$transfer_account,
				'transfer_time'=>$transfer_time,
				'remark'=>$remark
			));
			$get_money_record_model->where('id='.$post_order_id)->save(array(
				'status'=>1
			));
			$this->assign('order_id', $post_order_id);
			$this->assign('proxy_id', $proxy_id);
			$user_entity = $user_model->where('id='.$proxy_id)->find();
			$this->assign('nickname', $user_entity['nickname']);
			$this->assign('money_amount', $money_amount);
			$this->assign('transfer_type',$transfer_type);
			$this->assign('transfer_account',$transfer_account);
			$this->assign('remark',$remark);
			$this->assign('transfer_tag', true);
			$this->assign('refer_url', I('post.refer'));
		}
		$this->display();
	}

	public function main(){
		$this->display();
	}

	public function login(){
		$this->display();
	}

	public function gen_proxy_profit(){
		$data = [];
		$start = mktime(0,0,0, date('m'), date('d') - 1, date('Y'));
		$end = mktime(23,59,59,date('m'), date('d') - 1, date('Y'));
		$rowsPerPage = 1000;
		$get_data_url = C('RECORD_URL');
		$curPage = 1;
		$first_id = -1;
		$last_id = -1;
		$record_tag_model = new RecordTagModel();
		$ret = $record_tag_model->where('start='.$start.' and end='.$end.' and platform_tag=1')->find();
		if($ret){
			$data['msg'] = '记录已经汇总，请查看';
			$this->ajaxReturn($data);
			return;
		}
		$total_page = 0;
		do{
			$params = array(
				'startTime'=>$start,
				'endTime'=>$end,
				'pageIndex'=>$curPage,
				'rowPerPage'=>$rowsPerPage
			);
			$data_list = $this->http($get_data_url, $params, 'POST');
			$data_list_obj = json_decode($data_list);
			$curPage = $data_list_obj->curPage;
			$record_cnt = $data_list_obj->count;
			$record_list = $data_list_obj->info;
			if(count($record_list) > 0){
				foreach($record_list as $record){
					$ret_record = $record_tag_model->procedure(
						'CALL save_game_record('
						.$record['pid'].'\''.$record['unionid'].'\', '.$record['water'].');', false);
					if($first_id == -1){
						$first_id = $ret_record[0]['id'];
					}
					$last_id = $ret_record[0]['id'];
				}
			}
			$total_page = floor($record_cnt/$rowsPerPage) + 1;
			$curPage += 1;
		}while($curPage < $total_page);

		$entity = $record_tag_model->where('start='.$start.' and end='.$end)->find();
		if(empty($entity)){
			$record_tag_model->add(array(
				'start'=>$start,
				'end'=>$end,
				'platform_tag'=>true,
				'platform_key_start'=>$first_id,
				'platform_key_end'=>$last_id,
				'platform_create_time'=>time()
			));
		}else{
			$record_tag_model->where('start='.$start.' and end='.$end)->save(array(
				'platform_tag'=>true,
				'platform_key_start'=>$first_id,
				'platform_key_end'=>$last_id,
				'platform_create_time'=>time()
			));
		}
		//statistic fish record
		$this->ajaxReturn($data);
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
			$this->ajaxReturn($data);
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
		$this->ajaxReturn($data);
	}

	public function fish_detail(){
		$id = I('get.id');
		$record_tag_model = new RecordTagModel();
		$entity = $record_tag_model->where('id='.$id)->find();
		$start = $entity['fish_key_start'];
		$end = $entity['fish_key_end'];
		$create_time = $entity['fish_create_time'];
		$table_detail = date('Ym', $create_time);
		$fish_record_model = $record_tag_model->getRecordModel('fish_record_sum_'.$table_detail);
		$count = $fish_record_model->where('id >= '.$start.' and id <='.$end)->count('id');
		$page = $this->page($count, C('DETAIL_NUM_PER_PAGE'));
		$data_list = $fish_record_model->where('id >= '.$start.' and id <='.$end)
		                                            ->order('id')->limit($page->firstRow, $page->listRows)->select();
		$this->assign('select', $data_list);
		$this->assign('page', $page->show());
		$this->display();
	}

	public function platform_detail(){
		$id = I('get.id');
		$record_tag_model = new RecordTagModel();
		$entity = $record_tag_model->where('id='.$id)->find();
		$start = $entity['platform_key_start'];
		$end = $entity['platform_key_end'];
		$create_time = $entity['platform_create_time'];
		$table_detail = date('Ym', $create_time);
		$platform_model = $record_tag_model->getRecordModel('game_record_'.$table_detail);
		$count =  $platform_model->where('id >= '.$start.' and id <='.$end)->count('id');
		$page = $this->page($count, C('DETAIL_NUM_PER_PAGE'));
		$data_list = $platform_model->where('id >= '.$start.' and id <='.$end)
		                   ->order('id')->limit($page->firstRow, $page->listRows)->select();
		$this->assign('select', $data_list);
		$this->assign('page', $page->show());
		$this->display();
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

	public function query_record(){
		$record_tag_model = new RecordTagModel();
		$count = $record_tag_model->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));
		$record_data = $record_tag_model->order('id')->limit($page->firstRow, $page->listRows)->select();
		$this->assign('select', $record_data);
		$this->assign('page', $page->show());
		$this->display();
	}

	public function apply_banker_list(){
//		$user = session('user');
//		if(!$user){
//			$this->error(L('_USER_NOT_LOGON_'));
//		}
		$user_model = new UserModel();
		$record_tag_model = new RecordTagModel();
		$third_game_model = $record_tag_model->getRecordModel('third_game');
		$apply_banker_model = D('apply_banker');
		$count = $apply_banker_model->where('status!=2')->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));
		$list_data = $apply_banker_model->where('status != 2')->
			order('id desc')->limit($page->firstRow, $page->listRows)->select();
		$cnt = count($list_data);
		for($i=0;$i<$cnt;++$i){
			$list_data[$i]['nickname']='sss';
			$user_entity = $user_model->where('id='.$list_data[$i]['proxy_id'])->find();
			if($user_entity){
				$entity['nickname'] = $user_entity['nickname'];
			}
			$game_entity = $third_game_model->where('game_code='.$list_data[$i]['apply_game'])->find();
			$list_data[$i]['game_name']='';
			if($game_entity){
				$list_data[$i]['game_name'] = $game_entity['game_name'];
			}
			$list_data[$i]['apply_time'] = date('Y-m-d H:i:s', $list_data[$i]['apply_time']);
		}
		$this->assign('select', $list_data);
		$this->assign('page', $page->show());
		$this->display();
	}

	public function process_apply_banker(){
		$record_id = I('post.record_id');
		$op_type = I('post.op_type');
		$data = [];
		$data['status'] = 0;
		$data['code'] = 0;
		$apply_banker_model = D('apply_banker');
		$entity = $apply_banker_model->where('id='.$record_id)->find();
		$user_extra_info = new UserExtraInfoModel();
		if(!$entity){
			$data['code'] = 101;
			$data['msg'] = 'record not found ' . $record_id;
			$this->ajaxReturn($data);
		}else{
			$user_extra_entity = $user_extra_info->where('user_id='.$entity['proxy_id'])->find();
			$apply_banker_model->where('id='.$record_id)->update(array(
				'status'=>$op_type
			));
			$user_extra_info->where('user_id='.$entity['proxy_id'])->update(array(
				'banker_games'=>$user_extra_entity['banker_games'].'|'.$entity['apply_game']
			));
			$data['code'] = 0;
			$data['op_type'] = $op_type;
			$this->ajaxReturn($data);
		}
	}

	public function proxy_bonus_config(){
		$system_first = I('post.system_first');
		$system_second = I('post.system.second');
		$system_third = I('post.system.third');
		$record_tag_model = new RecordTagModel();
		$config_model = $record_tag_model->getRecordModel('config');
		if($system_first){
			$config_model->where('type = 1 and key = system_first')->update(array(
				'value' => $system_first
			));
			$config_model->where('type = 1 and key = system_second')->update(array(
				'value' => $system_second
			));
			$config_model->where('type = 1 and key = system_third')->update(array(
				'value' => $system_third
			));
		}
		$platform_config = $config_model->where('type=1')->select();
		$this->assign('select', $platform_config);
		$this->display();
	}

	public function fish_proxy_bonus_config(){
		$fish_first = I('post.fish_first');
		$fish_second = I('post.fish_second');
		$fish_third = I('post.fish_third');
		$record_tag_model = new RecordTagModel();
		$config_model = $record_tag_model->getRecordModel('config');
		if($fish_first){
			$config_model->where('type = 2 and key = fish_first')->update(array(
				'value' => $fish_first
			));
			$config_model->where('type = 2 and key = fish_second')->update(array(
				'value' => $fish_second
			));
			$config_model->where('type = 2 and key = fish_third')->update(array(
				'value' => $fish_third
			));
		}

		$fish_config = $config_model->where('type=2')->select();
		$this->assign('select', $fish_config);
		$this->display();
	}
}