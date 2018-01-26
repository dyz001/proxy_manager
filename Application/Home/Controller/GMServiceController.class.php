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
use Common\Controller\GMAdminbaseController;
use Home\Model\ApplyProxyModel;
use Think\Exception;
class GMServiceController extends GMAdminbaseController {
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
		$record_tag_model = new RecordTagModel();
		$ret_arr = $record_tag_model->procedure('call test_proc();', false);
		var_dump($ret_arr);
	}
	public function check_account(){
		$file_content = file_get_contents('php://input');
		$data_obj = json_decode($file_content);
		$user = new UserModel();
		$proxy_entity = $user->where('id='.$data_obj.account)->find();
		if(!$proxy_entity){
			$this->ajaxReturn(array(
				'code'=>0,
				'status'=>1
			),'json');
		}else{
			$this->ajaxReturn(array(
				'code'=>101,
				'status'=>1
			),'json');
		}
	}

	public function reset_proxy_password(){
		$proxy_id = I('post.proxy_id');
		$password = I('post.password');
		if($proxy_id){
			$user_model = new UserModel();
			$user_model->where('id='.$proxy_id)->save(array(
				'password'=>md5($password)
			));
			$this->success(L('_PROXY_PASSWORD_RESET_'));
		}else{
			$this->display();
		}
	}

	public function reset_password(){
		$old_pass = I('post.old_pass');
		$password = I('post.password');
		$user = session('gm_user');
		if(!$user){
			$this->error(L('_USER_NOT_LOGON_'));
		}
		if($old_pass){
			$record_tag_model = new RecordTagModel();
			$user_model = $record_tag_model->getRecordModel('user');
			$user_entity = $user_model->where('id='.$user['id'])->find();
			if(md5($old_pass) == $user_entity['password']){
				$user_model->where('id='.$user['id'])->save(array(
					'password' => md5($password)
				));
				session('gm_user', null);
				session('GM_USER_ID', 0);
				session('[destroy]');
				redirect('http://'.$_SERVER['HTTP_HOST'].'/gm_login');
			}else{
				$this->error(L('_USER_PASS_EMPTY_'));
			}
		}else{

			$this->display();
		}
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

	public function logout(){
		session('GM_USER_ID', null);
		session('[destroy]');
		redirect('http://'.$_SERVER['HTTP_HOST'].'/gm_login');
	}

	public function create_user(){
		$account = I('post.account');
		$password=I('post.password');
		$role_id = I('post.role_id');
		$record_tag_model = new RecordTagModel();
		$user_model = $record_tag_model->getRecordModel('user');
		if($account){
			if($user_model->where('account=\''.$account.'\'')->find()){
				$this->error(L('_ACCOUNT_EXIST_'));
			}
			$user_model->add(array(
				'account'=>$account,
				'password'=>md5($password),
				'role_id'=>$role_id,
				'create_time'=>time(),
			));
			$this->success(L('_SUCCESS_TXT_'));
		}else{
			$role_model = $record_tag_model->getRecordModel('user_rule');
			$data_list = $role_model->select();
			$this->assign('role_list', $data_list);
			$this->display();
		}
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

	public function platform_detail_2(){
//		$start = mktime(0,0,0, date('m'), date('d') - 1, date('Y'));
//		$end = mktime(23,59,59,date('m'), date('d') - 1, date('Y'));
//		$record_tag_model = new RecordTagModel();
//		$data_arr = $record_tag_model->query('select pid, sum(pump_water) as pump_water from platform_water_record where '.
//		'create_time>='.$start.' and create_time <='.$end.' group by pid', false);
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
			$apply_banker_model->where('id='.$record_id)->save(array(
				'status'=>$op_type
			));
			$user_extra_info->where('user_id='.$entity['proxy_id'])->save(array(
				'banker_games'=>$entity['apply_game'].','.$user_extra_entity['banker_games']
			));
			$data['code'] = 0;
			$data['op_type'] = $op_type;
			$this->ajaxReturn($data);
		}
	}

	public function proxy_bonus_config(){
		$system_first = I('post.system_first');
		$system_second = I('post.system_second');
		$system_third = I('post.system_third');
		$record_tag_model = new RecordTagModel();
		$config_model = $record_tag_model->getRecordModel('config');
		if($system_first){
			$config_model->where('type = 1 and name = \'system_first\'')->save(array(
				'value' => $system_first
			));
			$config_model->where('type = 1 and name = \'system_second\'')->save(array(
				'value' => $system_second
			));
			$config_model->where('type = 1 and name = \'system_third\'')->save(array(
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
			$config_model->where('type = 2 and name = \'fish_first\'')->save(array(
				'value' => $fish_first
			));
			$config_model->where('type = 2 and name = \'fish_second\'')->save(array(
				'value' => $fish_second
			));
			$config_model->where('type = 2 and name = \'fish_third\'')->save(array(
				'value' => $fish_third
			));
		}

		$fish_config = $config_model->where('type=2')->select();
		$this->assign('select', $fish_config);
		$this->display();
	}

	public function withdraw_record(){
		$record_tag_model = new RecordTagModel();
		$transfer_record_model = $record_tag_model->getRecordModel('transfer_record');
		$count = $transfer_record_model->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));

		$data_list = $transfer_record_model->order('id desc')
		                                   ->limit($page->firstRow, $page->listRows)
			                               ->select();
		$cnt = count($data_list);
		$user_model = new UserModel();
		for($i = 0; $i < $cnt; ++$i){
			$user_entity = $user_model->where('id='.$data_list[$i]['proxy_id'])->find();
			$data_list[$i]['nickname'] = '';
			if($user_entity){
				$data_list[$i]['nickname'] = $user_entity['nickname'];
			}
		}
		$this->assign('select', $data_list);
		$this->assign('page', $page->show());
		$this->display();
	}

	//代理收益汇总
	public function general_proxy_profit(){
		$record_tag_model = new RecordTagModel();
		$proxy_profit_record = $record_tag_model->getRecordModel('proxy_profit');
		$count = $proxy_profit_record->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));
		$data_list = $proxy_profit_record->order('id desc')->limit($page->firstRow, $page->listRows)
			->select();
		$cnt = count($data_list);
		$user_model = new UserModel();
		for($i = 0; $i < $cnt; ++$i){
			$data_list[$i]['start_time'] = date('Y-m-d H:i:s', $data_list[$i]['start_time']);
			$data_list[$i]['end_time'] = date('Y-m-d H:i:s', $data_list[$i]['end_time']);
			$data_list[$i]['create_time'] = date('Y-m-d H:i:s', $data_list[$i]['create_time']);
			$user_entity = $user_model->where('id='.$data_list[$i]['proxy_id'])->find();
			if($user_entity){
				$data_list[$i]['nickname'] = $user_entity['nickname'];
			}
		}
		$this->assign('select', $data_list);
		$this->assign('page', $page->show());
		$this->display();
	}

	public function general_system_profit(){
		$record_tag_model = new RecordTagModel();
		$system_profit_record = $record_tag_model->getRecordModel('system_profit');
		$count = $system_profit_record->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));
		$data_list = $system_profit_record->order('id desc')->limit($page->firstRow, $page->listRows)
		                                 ->select();
		$cnt = count($data_list);
		$user_model = new UserModel();
		for($i = 0; $i < $cnt; ++$i){
			$data_list[$i]['start_time'] = date('Y-m-d H:i:s', $data_list[$i]['start_time']);
			$data_list[$i]['end_time'] = date('Y-m-d H:i:s', $data_list[$i]['end_time']);
			$data_list[$i]['create_time'] = date('Y-m-d H:i:s', $data_list[$i]['create_time']);
		}
		$this->assign('select', $data_list);
		$this->assign('page', $page->show());
		$this->display();
	}

	public function platform_config(){
		$params = I('');
		$record_tag_model = new RecordTagModel();
		$config_model = $record_tag_model->getRecordModel('config');
		if(count($params) > 1){
			foreach ($params as $key=>$value){
				$config_model->where('name=\''.$key.'\'')->save(array(
					'value' => $value
				));
			}
		}
		$platform_conf = $record_tag_model->getRecordModel('config')->select();
		$this->assign('select', $platform_conf);
		$this->display();
	}

	public function grant_proxy()
	{
		$player_id = I("post.player_id");
		$op_type = I('post.op_type');
		$user = session('user');
		$user_entity = new UserModel();
		if($user['user_type'] == $user_entity->EPlayer){
			//普通玩家不可对代理授权
			$data['status'] = 0;
			trace("user type is not a proxy");
			$this->ajaxReturn($data);
		}else{
			$user_data = $user_entity->where('id='.$player_id)->find();
			if(!$user_data){
				//玩家未找到
				$data['status'] = 0;
				$this->ajaxReturn($data);
			}else{
				$proxy_entity = new ApplyProxyModel();
				if($op_type == $proxy_entity->ERefuse){
					$proxy_entity->refuse_apply($player_id);
				}else if($op_type == $proxy_entity->EAgreeStatus){
					$proxy_entity->agree_apply($player_id);
				}
			}
		}
		$data['player_id'] = $player_id;
		$data['status'] = 1;
		$this->ajaxReturn($data);
	}

	public function proxy_grant(){
		trace('======proxy_grant======');
		$user = session('user');
		$proxy_entity = new ApplyProxyModel();
		$total_cnt = $proxy_entity->where('parent_id=0')->count('id');
		$p = $this->page($total_cnt, C('RECORD_NUM_PER_PAGE'));
		$list = $proxy_entity->field('apply_proxy.id, user_id, pid, apply_proxy.parent_id, apply_time, nickname, status')
		                     ->join('user on apply_proxy.user_id = user.id')
		                     ->where('apply_proxy.parent_id=0')
		                     ->order('id desc')->limit($p->firstRow, $p->listRows)->select();
		$display_data = [];
		$user_model = new UserModel();
		foreach($list as $entity){
			$data['id'] = $entity['id'];
			$data['user_id'] = $entity['user_id'];
			$data['parent_id'] = $entity['parent_id'];
			$player_cnt = $user_model->query('select count(id) as cnt from user where pid='.$entity['pid']);
			$data['player_cnt'] = $player_cnt[0]['cnt'];
			$data['apply_time'] = date('Y-m-d H:i:s', $entity['apply_time']);
			$data['status'] = $entity['status'];
			$data['nickname'] = $entity['nickname'];
			$display_data[] = $data;
		}
		$this->assign('select', $display_data);
		$this->assign('page', $p->show());
		$this->display();
		trace('======proxy_grant end======');
	}
}