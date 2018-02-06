<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/4
 * Time: 14:07
 */

namespace Home\Controller;
use Home\Model\GetMoneyRecordModel;
use Home\Model\GoldFlowModel;
use Home\Model\RecordTagModel;
use Home\Model\UserExtraInfoModel;
use Home\Model\UserModel;
use Common\Common\ErrorCode;
use Think\Log;
use Common\Controller\GMAdminbaseController;
use Home\Model\ApplyProxyModel;
use Think\Exception;
require 'vendor/autoload.php';
class GMServiceController extends GMAdminbaseController {
	protected $gold_tag = array(
		'water'=>' 抽水  ',
		'sssSettle'=>' 十三水比牌 ',
		'sssForceLeave'=>'中途退出罚钱 ',
		'niuniuSettle'=>'牛牛结算 ',
		'goldenSettle'=>' 炸金花结算 ',
		'niuniuDownBet'=>' 牛牛下注 ',
		'goldenDownBet'=>' 炸金花下注 ',
		'niuniuBackBet'=>'离开返回下注 ',
		'goldenBackBet'=>'炸金花离开返回下注',
		'recharge'=>'充值 ',
		'rechargeReward'=>'充值奖励',
		'jiuJiJin'=>' 领取救济金 ',
		'taskReward'=>'任务奖励',
		'storeBuy'=>'商城购买',
		'diamondExchange'=>'钻石换金币',
		'adoptBug'=>'采用建议',
		'bindMobile'=>'绑定手机送金币',

	);

	protected $pay_id = array(
		"com.yuexiang.poker_10"=>100000.0.'金币',
		"com.yuexiang.poker_30"=>300000.0.'金币',
		"com.yuexiang.poker_50"=>500000.0.'金币',
		"com.yuexiang.poker_100"=>1e+06.'金币',
		"com.yuexiang.poker_250"=>2.5e+06.'金币',
		"com.yuexiang.poker_500"=>5e+06.'金币',
		"com.yuexiang.poker_1000"=>1e+07.'金币',
		"com.yuexiang.poker_3000"=>3e+07.'金币',
		"com.yuexiang.poker_6000"=>6e+07.'金币',
		"com.yuexiang.poker_10000"=>1e+08.'金币',
		"com.yuexiang.poker_10d"=>100.0.'钻石',
		"com.yuexiang.poker_30d"=>300.0.'钻石',
		"com.yuexiang.poker_50d"=>500.0.'钻石',
		"com.yuexiang.poker_100d"=>1000.0.'钻石',
		"com.yuexiang.poker_250d"=>2500.0.'钻石',
		"com.yuexiang.poker_500d"=>5000.0.'钻石',
		"com.yuexiang.poker_1000d"=>10000.0.'钻石',
	);
	protected $gameIds = array(
		'10001'=>'金鲨银鲨',
		'10002'=>'百人金花',
		'10003'=>'百人牛牛',
		'10006'=>'水果机',
		'20003'=>'小丑',
		'10004'=>'21点',
		'20004'=>'十三水',
		'0'=>'大厅'

	);
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
		$user = session('gm_user');
		$this->assign('gm_user', $user);
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
		$create_time = $entity['fish_sum_start'];
		$table_detail = date('Ym', $create_time);
		$fish_record_model = $record_tag_model->getRecordModel('fish_record_sum_'.$table_detail);
		$count = $fish_record_model->where('id >= '.$start.' and id <='.$end)->count('id');
		$page = $this->page($count, C('DETAIL_NUM_PER_PAGE'));
		$old_list = $fish_record_model->where('id >= '.$start.' and id <='.$end)
		                               ->order('id')->select();
		$total_cost = 0;
		$total_bonus = 0;
		foreach ($old_list as $user_fish){
			$total_cost += $user_fish['cost_sum'];
			$total_bonus += $user_fish['bonus_sum'];
		}
		$data_list = $fish_record_model->where('id >= '.$start.' and id <='.$end)
		                                            ->order('id')->limit($page->firstRow, $page->listRows)->select();
		$row_cnt = count($data_list);
		$user_model = new UserModel();
		for($i = 0; $i < $row_cnt; $i++){
			$user_entity = $user_model->where('account=\''.$data_list[$i]['member_id'].'\'')->find();
			if($user_entity){
				$data_list[$i]['name'] = $user_entity['nickname'];
			}
		}
		$this->assign('total_cost',$total_cost);
		$this->assign('total_bonus',$total_bonus);
		$this->assign('total_profit', ($total_cost - $total_bonus));
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
		$remark = I('post.remark');
		$user_entity = new UserModel();
		$user_data = $user_entity->where('id='.$player_id)->find();
		if(!$user_data){
			//玩家未找到
			$data['status'] = 0;
			$this->ajaxReturn($data);
		}else{
			$proxy_entity = new ApplyProxyModel();
			if($op_type == $proxy_entity->ERefuse){
				$proxy_entity->refuse_apply($player_id, $remark);
			}else if($op_type == $proxy_entity->EAgreeStatus){
				$proxy_entity->agree_apply($player_id);
				//send mail
				$mail_res = $this->http(C('GAME_SERVER_URL').'/sendMail.nd', array(
					'playerId' => $user_data['pid'],
					'title' => '恭喜玩家 '.$user_data['name'].'， 成为悦想棋牌的代理。',
					'mailcontent'=>'not empty'
				), 'post');
			}
		}
		$data['player_id'] = $player_id;
		$data['status'] = 1;
		$this->ajaxReturn($data);
	}



	public function proxy_grant(){
		trace('======proxy_grant======');
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

	public function bag_oper_record(){
		trace('========bag_oper_record==========');
		$gm_user = session('gm_user');
		$record_tag_model = new RecordTagModel();
		$item_oper_record = $record_tag_model->getRecordModel('item_oper_record');
		$record_cnt = $item_oper_record->count('id');
		$p = $this->page($record_cnt, C('RECORD_NUM_PER_PAGE'));
		$list = $item_oper_record->alias('a')->field('a.user_id, a.item_id, a.item_cnt, a.create_time, a.oper_user, b.nickname, c.name')
			->join('h5proxy.user b on a.user_id = b.pid')
			->join('item_config c on a.item_id = c.item_id')
			->order('a.create_time desc')->limit($p->firstRow, $p->listRows)->select();
		$cnt = count($list);
		for($i = 0; $i < $cnt; ++$i){
			$list[$i]['create_time'] = date('Ymd H:i:s', $list[$i]['create_time']);
		}
		$this->assign('select', $list);
		$this->assign('page', $p->show());
		$this->display();
	}

	public function player_bag_oper(){
		$user_id = I('post.user_id');
		if($user_id){
			$res_bag_data = $this->http(C('GAME_SERVER_URL').'/getBagInfo.nd', array(
				'uid'=>$user_id.''
			), 'post');
			$record_tag_model = new RecordTagModel();
			$item_bags = $record_tag_model->getRecordModel('item_config');
			$select = [];
			$item_list = $item_bags->select();

			if($res_bag_data){
				$res_bag_obj = json_decode($res_bag_data);
				foreach($item_list as $item){
					$item['count'] = 0;
					foreach ($res_bag_obj->bag as $name=>$value){
						if($name == $item['item_id']){
							$item['count'] = $value;
						}
					}
					$select[] = $item;
				}
//				if($res_bag_obj->bag){
//					foreach($res_bag_obj->bag as $name=>$value){
//						$item_data = $item_bags->where('item_id='.$name)->find();
//						$bag_data['item_id'] = $item_data['item_id'];
//						$bag_data['name'] = $item_data['name'];
//						$bag_data['price'] = $item_data['price'];
//						$bag_data['count'] = $value;
//						$select[] = $bag_data;
//					}
//				}
			}
			$this->assign('select', $select);
			$this->assign('user_id', $user_id);
		}else{
			$this->assign('select', []);
			$this->assign('user_id', '');
		}
		$this->display();
	}

	public function add_bag_item(){
		$user_id = I('post.user_id');
		$item_id = I('post.item_id');
		$item_cnt = I('post.item_cnt');
		$gm_user = session('gm_user');
		trace('send item_id:'.$item_id);
		if(!$user_id || !$item_id || !$item_cnt){
			$this->ajaxReturn(array(
				'status' => 0,
				'msg' => 'parameter is null or not enough'
			));
		}
		$target_url = C('GAME_SERVER_URL').'/addBagItem.nd';
		if($item_cnt < 0){
			$target_url = C('GAME_SERVER_URL').'/removeBagItem.nd';
		}
		$res_oper = $this->http($target_url, array(
			'uid'=>$user_id,
			'id'=>$item_id,
			'num'=>$item_cnt
		), 'post');
		$res_oper_obj = json_decode($res_oper);
		if($res_oper_obj->code == 200){
			$record_tag_model = new RecordTagModel();
			$item_record_model = $record_tag_model->getRecordModel('item_oper_record');
			$item_record_model->add(array(
				'user_id'=>$user_id,
				'item_id'=>$item_id,
				'item_cnt'=>$item_cnt,
				'create_time'=>time(),
				'oper_user'=>$gm_user['account']
			));
		}
		trace('return item_id:'.$item_id);
		$this->ajaxReturn(array(
			'status' => 1,
			'user_id' => $user_id,
			'item_id_1' => $item_id,
			'item_cnt' => $item_cnt
		));
	}

	public function player_num(){
		$dat_res_4_0 = $this->http(C('GAME_SERVER_URL').'/getSSSTablePlayerNum.nd', array(
			'playerCount'=>4,
			'withGhost' => 0,
		),'post');
		trace('a '.$dat_res_4_0);
		$dat_res_7_0 = $this->http(C('GAME_SERVER_URL').'/getSSSTablePlayerNum.nd', array(
			'playerCount'=>7,
			'withGhost' => 0,
		),'post');
		$dat_res_4_1 = $this->http(C('GAME_SERVER_URL').'/getSSSTablePlayerNum.nd', array(
			'playerCount'=>4,
			'withGhost' => 1,
		),'post');
		$dat_res_7_1 = $this->http(C('GAME_SERVER_URL').'/getSSSTablePlayerNum.nd', array(
			'playerCount'=>7,
			'withGhost' => 1,
		),'post');
		$select = [];
		$dat_res_4_0 = json_decode($dat_res_4_0);
		if($dat_res_4_0->code == 200){
			$data['player_cnt'] = 4;
			$data['ghost'] = '无';
			$data['base_50'] = 0;
			$data['base_20000'] = 0;
			$data['base_50000'] = 0;
			$data['base_100000'] = 0;
			$data['base_200000'] = 0;
			$data['base_500000'] = 0;
			foreach($dat_res_4_0->info as $key=>$value){
				$data['base_'.$key] = $value;
			}
			$select[] = $data;
		}
		$dat_res_4_1 = json_decode($dat_res_4_1);
		if($dat_res_4_1->code == 200){
			$data['player_cnt'] = 4;
			$data['ghost'] = '有';
			$data['base_50'] = 0;
			$data['base_20000'] = 0;
			$data['base_50000'] = 0;
			$data['base_100000'] = 0;
			$data['base_200000'] = 0;
			$data['base_500000'] = 0;
			foreach($dat_res_4_1->info as $key=>$value){
				$data['base_'.$key] = $value;
			}
			$select[] = $data;
		}
		$dat_res_7_0 = json_decode($dat_res_7_0);
		if($dat_res_7_0->code == 200){
			$data['player_cnt'] = 7;
			$data['ghost'] = '无';
			$data['base_50'] = 0;
			$data['base_20000'] = 0;
			$data['base_50000'] = 0;
			$data['base_100000'] = 0;
			$data['base_200000'] = 0;
			$data['base_500000'] = 0;
			foreach($dat_res_7_0->info as $key=>$value){
				$data['base_'.$key] = $value;
			}
			$select[] = $data;
		}
		$dat_res_7_1 = json_decode($dat_res_7_1);
		if($dat_res_7_1->code == 200){
			$data['player_cnt'] = 7;
			$data['ghost'] = '有';
			$data['base_50'] = 0;
			$data['base_20000'] = 0;
			$data['base_50000'] = 0;
			$data['base_100000'] = 0;
			$data['base_200000'] = 0;
			$data['base_500000'] = 0;
			foreach($dat_res_7_1->info as $key=>$value){
				$data['base_'.$key] = $value;
			}
			$select[] = $data;
		}
		$this->assign('select', $select);
		$this->display();
	}

	public function trade_record(){
		$start_time = I('get.dtp_input_start');
		$end_time = I('get.dtp_input_end');
		$seller = I('get.ipt_seller');
		$buyer = I('get.ipt_buyer');
		$item_id = I('get.item_id');
		$cur_page = empty($_GET[C('VAR_PAGE')]) ? 1 : intval($_GET[C('VAR_PAGE')]);
		$select = [];
		$total_cnt = 0;
		if($start_time){
			$post_data = array(
				'buyer'=>$buyer,
				'seller'=>$seller,
				'start_time'=> strtotime($start_time) * 1000,
				'end_time'=> (strtotime($end_time) + 24*3600) * 1000,
				'item_id'=>$item_id,
				'cur_page'=>$cur_page,
				'num_per_page'=>C('RECORD_NUM_PER_PAGE')
			);
			$res_trade = $this->http(C('GAME_SERVER_URL').'/selectDealRecord.nd', $post_data, 'post');
			$res_trade_obj = json_decode($res_trade);
			$record_tag_model = new RecordTagModel();
			$item_config_model = $record_tag_model->getRecordModel('item_config');
			$user_model = new UserModel();
			if($res_trade_obj->code == 200){
				foreach ($res_trade_obj->msg as $trade_obj){
					$data['seller_id'] = $trade_obj->kefuId;
					$data['buyer_id'] = $trade_obj->playerId;
					$seller_obj = $user_model->where('pid='.$trade_obj->playerId)->find();
					$buyer_obj = $user_model->where('pid='.$trade_obj->kefuId)->find();
					$data['seller'] = '';
					if($seller_obj){
						$data['seller'] = $seller_obj['nickname'];
					}
					$data['buyer'] = '';
					if($buyer_obj){
						$data['buyer'] = $buyer_obj['nickname'];
					}
					$data['item_name'] = '';
					$data['trade_time'] = date('Ymd H:i:s', $trade_obj->time / 1000);
					$item_obj = $item_config_model->where('item_id='.$trade_obj->itemId)->find();
					if($item_obj){
						$data['item_name'] = $item_obj['name'];
					}
					$data['item_id'] = $trade_obj->itemId;
					$data['item_cnt'] = $trade_obj->itemNum;
					$data['trade_ip'] = $trade_obj->ip;
					$select[] = $data;
				}
				$total_cnt = $res_trade_obj->count;
			}
		}else{
			$this->assign('start_time', '2018-01-01');
			$this->assign('end_time', '2018-05-01');
		}
		$page = $this->page($total_cnt, C('RECORD_NUM_PER_PAGE'));
		$this->assign('seller', $seller);
		$this->assign('buyer', $buyer);
		$this->assign('item_id', $item_id);
		$this->assign('select', $select);
		$this->assign('page', $page->show());
		$this->display();
	}

	public function proxy_grant_2(){
		trace('======proxy_grant======');
		$proxy_entity = new ApplyProxyModel();
		$total_cnt = $proxy_entity->where('parent_id<>0')->count('id');
		$p = $this->page($total_cnt, C('RECORD_NUM_PER_PAGE'));
		$list = $proxy_entity->field('apply_proxy.id, user_id, pid, apply_proxy.parent_id, apply_time, nickname, status')
		                     ->join('user on apply_proxy.user_id = user.id')
		                     ->where('apply_proxy.parent_id<>0')
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

	public function pay_record(){
		$start_time = I('post.start_time');
		$end_time = I('post.end_time');
		$pid = I('post.user_id');
		$param['endTime'] = $end_time;
		$param['gameId'] = C('GAME_ID');
		$param['pid'] = $pid;
		$param['startTime'] = $start_time;
		$param['t'] = time();
		$param_str = 'endTime='.$end_time.'&gameId='.C('GAME_ID').'&pid='.$pid.'&startTime='.$start_time.'&t='.$param['t'];
		$sign = md5($param_str.C('GAME_SECRET'));
		$param['sign'] = $sign;
		$select = [];
		if($start_time){
			if(!$pid){
				$this->error('用户id不能为空');
			}
			//var_dump($param);
			//echo('<br/>'.$param_str.'&sign='.$param['sign'].'<br/>');
			$res_pay_record = $this->http(C('API_HOST').C('API_ORDERS_URI'), $param, 'post', array() );
			//echo $res_pay_record;
			$sum_money = 0;
			$res_pay_record_obj = json_decode($res_pay_record);
			if($res_pay_record_obj->code == 0){
				$order_cnt = count($res_pay_record_obj->data->orders);
				for($i = 0; $i < $order_cnt; ++$i){
					$target_obj = $res_pay_record_obj->data->orders[$i];
					$data = [];
					foreach ($target_obj as $key=>$value){
						if($key == 'gamePayId'){
							$data[$key] = $this->pay_id[$value];
						}else{
							if($key == 'price') {
								$sum_money += $value;
							}
							$data[$key] = $value;
						}
					}
					$select[] = $data;
				}
				$this->assign('select', $select);
				$this->assign('start_time', $start_time);
				$this->assign('end_time', $end_time);
				$this->assign('user_id', $pid);
				$this->assign('sum_money', $sum_money);
			}
		}else{
			$this->assign('select',$select);
		}
		$this->display();
	}
	public function gold_flow(){
		$user_id = I('get.user_id');
		$start_time = I('get.start_time');
		$end_time = I('get.end_time');
		$start_time_milisecond = strtotime($start_time) * 1000;
		$end_time_milisecond = (strtotime($end_time) + 24*3600) * 1000;
		$table_tail = date('Ymd',strtotime($start_time));
		$gold_flow_model = new GoldFlowModel();
		$test_model = $gold_flow_model->get_model('gold_'.$table_tail);
		$this->assign('start_time', $start_time);
		$this->assign('end_time', $end_time);
		$this->assign('user_id', $user_id);
		//$condition = ['pid'=>'eq '.$user_id,'actionTime'=>$start_time_milisecond],'lt'=>['actionTime'=>$end_time_milisecond]];
		$condition = ['pid'=>['eq',$user_id],'actionTime'=>['between',$start_time_milisecond.','.$end_time_milisecond]];
		//$condition = 'pid eq '.$user_id.'&actionTime gt '. $start_time_milisecond . '&actionTime lt '.$end_time_milisecond;
		if($user_id){
			$cnt = $test_model->mongo_count(['where'=>$condition]);
			$page = $this->page($cnt, C('RECORD_NUM_PER_PAGE'));
			$res_list = $test_model->where($condition)->order(['actionTime'=>-1])->
			limit($page->firstRow, $page->listRows)->select();
			$ret_count = count($res_list);
			for($i = 0; $i < $ret_count; $i++){
				$res_list[$i]['gameId'] = $this->gameIds[$res_list[$i]['gameId']];
				$res_list[$i]['actionTime'] = date('Y-m-d H:i:s',$res_list[$i]['actionTime'] / 1000);
				$res_list[$i]['type'] = $this->gold_tag[$res_list[$i]['type']];
				$res_list[$i]['bgold'] = round($res_list[$i]['bgold']);
				$res_list[$i]['agold'] = round($res_list[$i]['agold']);
				$res_list[$i]['gold'] = round($res_list[$i]['gold']);
			}
			$this->assign('select',$res_list);
			$this->assign('page',$page->show());
		}else{
			$this->assign('select',[]);
			$this->assign('page','');
		}
		$this->display();
	}

	public function recharge_general(){
		$start_time = I('get.start_time');
		$end_time = I('get.end_time');

		$param['endTime'] = $end_time;
		$param['gameId'] = C('GAME_ID');
		$param['startTime']= $start_time;
		$param['t'] = time();
		$param_str = 'endTime='.$end_time.'&gameId='.C('GAME_ID').'&startTime='.$start_time.'&t='.$param['t'];
		$sign = md5($param_str.C('GAME_SECRET'));
		$param['sign'] = $sign;
		$select = [];
		$sum_money = 0;
		if($start_time){
			$res_pay_record = $this->http(C('API_HOST').C('API_GAMEDATAS_URI'), $param, 'post', array() );
			//echo $res_pay_record;
			$sum_money = 0;
			$res_pay_record_obj = json_decode($res_pay_record);
			if($res_pay_record_obj->code == 0){
				$order_cnt = count($res_pay_record_obj->data->gamedatas);
				for($i = 0; $i < $order_cnt; ++$i){
					$data = [];
					foreach ($res_pay_record_obj->data->gamedatas[$i] as $key=>$value){
						$data[$key] = $value;
						if($key == 'recharge'){
							$sum_money += $value;
						}
					}
					$select[] = $data;
				}
			}
		}
		$this->assign('select', $select);
		$this->assign('sum_money', round($sum_money, 2));
		$this->display();
	}

}