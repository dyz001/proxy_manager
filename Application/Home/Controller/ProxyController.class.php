<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/5
 * Time: 10:05
 */
namespace Home\Controller;
use Common\Controller\AdminbaseController;
use Home\Model\ApplyProxyModel;
use Home\Model\GetMoneyRecordModel;
use Home\Model\RecordTagModel;
use Home\Model\UserModel;
use Home\Model\UserWithDrawModel;
use Home\Model\UserExtraInfoModel;
use Common\Common\ErrorCode;

class ProxyController extends AdminbaseController
{
	public function index()
	{
		$user = session('user');
		if(!$user)
		{
			//redirect to login
		}else{
			if($user['user_type'] == 4){
				redirect(U("Home/Proxy/show_qr_code"));
				$this->display();//只展示二维码页面
			}
		}
	}

	public function main(){
		$user_model = new UserModel();
		$user = session('user');
		if($user_model->EPlayer == (int)$user['user_type']){
			redirect('http://'.$_SERVER['HTTP_HOST'].'/qr_code');
		}else{
			$this->display();
		}
	}

	public function qr_code() {
		$user  = session( 'user' );
		$admin = session( 'admin' );
		trace( PUBLIC_PATH . '/Public/QRCode/' . $user['pid'] . '.png' );
		if ( ! file_exists( PUBLIC_PATH . '/QRCode/' . $user['pid'] . '.png' ) ) {
			vendor( "phpqrcode.phpqrcode" );
			//$data = $_SERVER['HTTP_HOST'] . '/bind_code/code/' . $user['id'];
			$data = C('WX_AUTH_URL') .'?appid=' . C('APP_ID') . '&redirect_uri=' . urlencode(C('GAME_URL')) .
			        '&response_type=code&scope=snsapi_userinfo&state=pidXXX'.$user['pid'] . '#wechat_redirect';
			// 纠错级别：L、M、Q、H
			$level = 'L';
			// 点的大小：1到10,用于手机端4就可以了
			$size = 4;
			// 下面注释了把二维码图片保存到本地的代码,如果要保存图片,用$fileName替换第二个参数false
			//$path = "images/";
			// 生成的文件名
			//$fileName = $path.$size.'.png';
			\QRcode::png( $data, PUBLIC_PATH . '/QRCode/' . $user['pid'] . '.png', $level, $size );
		} else {

		}
		$apply_proxy = new ApplyProxyModel();
		$user_model  = new UserModel();
		if ( $user_model->EPlayer == $user['user_type'] ) {
			if ( $apply_proxy->exist( $user['id'] ) ) {
				$this->assign( 'proxy_tag', 1 );
			} else {
				$this->assign( 'proxy_tag', 0 );
			}
		} else {
			$this->assign( 'proxy_tag', 2 );
		}
		$player_cnt = $user_model->where('parent_id='.$user['pid'].' and user_type = 4')->count('id');
		$proxy_cnt = $user_model->where('parent_id='.$user['pid'].' and user_type < 4')->count('id');
		$this->assign('qrcode', './Public/QRCode/'.$user['pid'].'.png');
		$this->assign('user',$user);
		$this->assign('player_cnt', $player_cnt);
		$this->assign('proxy_cnt', $proxy_cnt);
		$this->display();
	}

	public function bind_code()
	{
		$parent_id = $_GET['id'];
		$user = seesion('user');
		if($user['parent_id'] != 0)
		{
			//已经绑定过代理
			$parent_id = $user['parent_id'];
		}else{
			$user_entity = new UserModel();
			$user_entity->where('id='.$user['id'])->save(array('parent_id'=>$parent_id));
		}
		$user['parent_id'] = $parent_id;
		$this->assign('parent_id',$parent_id);
		$this->display();
	}

	//代理授权
	public function grant_proxy()
	{
		$player_id = I("post.player_id");
		$parent_id = I("post.parent_id");
		$op_type = I('post.op_type');
		$user = session('user');
		$user_entity = new UserModel();
		if($user['id'] != $parent_id)
		{
			//不是该玩家的代理，不能直接授权，如果是管理员，可以授权
			trace("user parent not found");
		}
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
				$parent_data = $user_entity->where('id='.$parent_id)->find();
				if(!$parent_data){
					//代理未找到
					$data['status'] = 0;
					trace("user parent not found");
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
		}
		$data['player_id'] = $player_id;
		$data['parent_id'] = $parent_id;
		$data['status'] = 1;
		$this->ajaxReturn($data);
	}

	public function logout(){
		session('ADMIN_ID',null);
		redirect(__ROOT__."/login");
	}

	public function fill_info(){
		trace('======fill_info begin=========');
		$data = [];
		$check_ret = $this->check_fill_info();
		if($check_ret != 0){
			$data['status'] = $check_ret;
			$this->ajaxReturn($data);
			return;
		}
		$user = session('user');
		$wx_identity = I('post.wx_identity');
		$bank_card_number = I('post.bank_card_number');
		$real_name = I('post.real_name');
		$mobile=I('post.mobile');
		$password=I('post.password');
		$withdraw_pass=I('post.withdraw_pass');
		$user_entity = new UserModel();
		$user_entity->where('id='.$user['id'])->save(array(
			'password'=>$password
		));
		$user_extra = new UserExtraInfoModel();
		$user_extra->add(array(
			'user_id'=>$user['id'],
			'wx_identity'=>$wx_identity,
			'bank_card_number'=>$bank_card_number,
			'real_name'=>$real_name,
			'mobile'=>$mobile,
			'withdraw_pass'=>$withdraw_pass,
			'create_time'=>time()
		));
		$data['status'] = 0;
		redirect('http://'.$_SERVER['HTTP_HOST'].'/proxy_info');
		//$this->ajaxReturn($data);
		trace('=======fill_info end=========');
	}

	protected function check_fill_info(){
		$wx_identity = I('post.wx_identity');
		$bank_card_number = I('post.bank_card_number');
		$real_name = I('post.real_name');
		$mobile=I('post.mobile');
		$password=I('post.password');
		$withdraw_pass=I('post.withdraw_pass');
		if(empty($wx_identity)){
			return ErrorCode::WX_IDENTITY_EMPTY;
		}else if(empty($bank_card_number)){
			return ErrorCode::BANK_CARD_EMPTY;
		}else if(empty($real_name)){
			return ErrorCode::REAL_NAME_EMPTY;
		}else if(empty($mobile)){
			return ErrorCode::MOBILE_EMPTY;
		}else if(empty($password)){
			return ErrorCode::PASSWORD_EMPTY;
		}else if(empty($withdraw_pass)){
			return ErrorCode::WITH_DRAW_PASS_EMPTY;
		}
		return ErrorCode::SUCCESS;
	}

	public function spread_fee(){
		$user = session('user');
		$spread_fee_model = D('spread_fee');
		$count = $spread_fee_model->where('proxy_id='.$user['id'])->count('id');
		$page = $this->page($count, C('RECORD_NUM_PER_PAGE'));
		$data_list = $spread_fee_model->where('proxy_id='.$user['pid'])->order('id desc')->limit($page->firstRow, $page->listRows)->select();
		$cnt = count($data_list);
		for($i = 0; $i < $cnt; ++$i){
			$data_list[$i]['create_time'] = date('Y-m-d', $data_list[$i]['create_time']);
			$data_list[$i]['money'] = round($data_list[$i]['money'],3);
		}
		$this->assign('select', $data_list);
		$this->assign('page', $page->show());
		$this->display();
	}

	public function proxy_players(){
		trace('======proxy_players======');
		$user = session('user');
		$data_list = [];
		$user_model = new UserModel();
		$count = $user_model->where('parent_id='.$user['id'])->count("id");
		$p = $this->page($count,10);
		$list = $user_model->field(true)->where('parent_id='.$user['id'])
		                ->order('id')->limit($p->firstRow, $p->listRows)->select();


		foreach($list as $entity){
			$data_entity['id'] = $entity['id'];
			$data_entity['nickname'] = $entity['nickname'];
			$data_entity['type'] = ($entity['user_type'] == $user_model->EPlayer ? '直接玩家' : '代理');
			$data_list[] = $data_entity;
		}
		$this->assign('select', $data_list);
		$this->assign('page', $p->show()); // 赋值分页输出
		$this->display();
		trace('======proxy_players end======');
	}

	//查看代理下的代理
	public function proxy_players_filter_proxy(){
		trace('======proxy_players======');
		$user = session('user');
		$data_list = [];
		$user_model = new UserModel();
		$count = $user_model->where('parent_id='.$user['id'])->count("id");
		$p = $this->page($count,10);
		$list = $user_model->field(true)->where('parent_id='.$user['id'].' and user_type < '.$user_model->EPlayer)
		                   ->order('id')->limit($p->firstRow, $p->listRows)->select();


		foreach($list as $entity){
			$data_entity['id'] = $entity['id'];
			$data_entity['nickname'] = $entity['nickname'];
			$data_entity['type'] = ($entity['user_type'] == $user_model->EPlayer ? '直接玩家' : '代理');
			$data_list[] = $data_entity;
		}
		$this->assign('select', $data_list);
		$this->assign('page', $p->show()); // 赋值分页输出
		$this->display();
		trace('======proxy_players end======');
	}

	//查看代理下的直接玩家
	public function proxy_players_filter_player(){
		trace('======proxy_players======');
		$user = session('user');
		$data_list = [];
		$user_model = new UserModel();
		$count = $user_model->where('parent_id='.$user['id'])->count("id");
		$p = $this->page($count,10);
		$list = $user_model->field(true)->where('parent_id='.$user['id'].' and user_type = '.$user_model->EPlayer)
		                   ->order('id')->limit($p->firstRow, $p->listRows)->select();


		foreach($list as $entity){
			$data_entity['id'] = $entity['id'];
			$data_entity['nickname'] = $entity['nickname'];
			$data_entity['type'] = ($entity['user_type'] == $user_model->EPlayer ? '直接玩家' : '代理');
			$data_list[] = $data_entity;
		}
		$this->assign('select', $data_list);
		$this->assign('page', $p->show()); // 赋值分页输出
		$this->display();
		trace('======proxy_players end======');
	}

	public function proxy_grant(){
		trace('======proxy_grant======');
		$user = session('user');
		$proxy_entity = new ApplyProxyModel();
		$total_cnt = $proxy_entity->where('parent_id='.$user['id'])->count('id');
		$p = $this->page($total_cnt, 10);
		$list = $proxy_entity->field('apply_proxy.id, user_id, apply_proxy.parent_id, apply_time, nickname, status')
		                     ->join('user on apply_proxy.user_id = user.id')
		                     ->where('apply_proxy.parent_id='.$user['id'])
		                ->order('id desc')->limit($p->firstRow, $p->listRows)->select();
		$display_data = [];
		foreach($list as $entity){
			$data['id'] = $entity['id'];
			$data['user_id'] = $entity['user_id'];
			$data['parent_id'] = $entity['parent_id'];
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

	//申请成为代理
	public function apply_proxy(){
		trace('=======apply_proxy==========');
		$user_id = I('post.user_id');
		$user = session('user');
		$proxy_id = $user['parent_id'];
		$proxy_entity = new ApplyProxyModel();
		if(empty($proxy_id)){
			//将请求发送给管理员
			$proxy_entity->add_apply($user_id, 0);
		}else{
			$proxy_entity->add_apply($user_id, $proxy_id);
		}
		$data['user_id'] = $user_id;
		$data['status'] = 1;
		$this->ajaxReturn($data);
		trace('=======apply_proxy end==========');
	}

	public function proxy_info(){
		trace('======proxy_info======');
		$user = session('user');
		$user_extra = (new UserExtraInfoModel())->where('user_id='.$user['id'])->find();
		if(empty($user_extra['wx_identity'])){
			redirect('./bind_proxy_info');
			return;
		}
		$this->assign('user', $user);
		$this->assign('user_extra', $user_extra);
		$this->display();
		trace('======proxy_info end======');
	}

	public function bind_proxy_info(){
		$user = session('user');
		$this->assign('user', $user);
		$this->display();
	}

	//每日汇总需要更新withdraw
	public function auto_getmoney(){
		trace('======auto_getmoney======');
		$with_draw_model = new UserWithDrawModel();
		$user = session('user');
		$money = 0;
		$freeze_money = 0;
		$wx_identity = '';
		$last_settle = 0;
		$with_draw_entity = $with_draw_model->where('user_id='.$user['id'])->find();
		if($with_draw_entity){
			$money = $with_draw_entity['with_draw'] + $with_draw_entity['third_with_draw'];
			$freeze_money = $with_draw_entity['freeze_money'];
			$last_settle = $with_draw_entity['last_update_time'];
		}

		$user_extra = (new UserExtraInfoModel())->where('user_id='.$user['id'])->find();
		if($user_extra){
			$wx_identity = $user_extra['wx_identity'];
		}
		$this->assign('money', $money);
		$this->assign('freeze_money', $freeze_money);
		$this->assign('wx_identity', $wx_identity);
		$this->assign('last_settle', $last_settle);
		$this->display();
		trace('======auto_getmoney end======');
	}

	public function do_getmoney(){
		$ipt_money_cnt = I('post.ipt_money_cnt');
		$ipt_remark = I('post.ipt_remark');
		$ipt_password = I('post.ipt_password');
		$user_extra_info = new UserExtraInfoModel();
		$user = session('user');
		$user_extra_entity = $user_extra_info->where('user_id='.$user['id'])->find();
		if(!$user_extra_entity){
			$this->error(L('_USER_INFO_NOT_BIND_'));
		}
		$with_draw_model = new UserWithDrawModel();
		$with_draw_entity = $with_draw_model->where('user_id='.$user['id'])->find();
		if(!$with_draw_entity){
			$this->error(L('_USER_INFO_NOT_BIND_'));
		}
		if($with_draw_entity['with_draw'] + $with_draw_entity['third_with_draw'] < $ipt_money_cnt){
			$this->error(L('_WITH_DRAW_NOT_ENOUGH_'));
		}
		if(md5($ipt_password) != $user_extra_entity['withdraw_pass']){
			$this->error(L('_WITH_DRAW_PASS_ERROR_'));
		}
		$get_money_record = new GetMoneyRecordModel();
		$get_money_record->add(array(
			'proxy_id' => $user['id'],
			'money' => $ipt_money_cnt,
			'create_time' => time(),
		));
		redirect('http://'.$_SERVER['HTTP_HOST'].'/auto_getmoney_record');
	}

	public function auto_getmoney_record(){
		trace('======auto_getmoney_record======');
		$user = session('user');
		$records = D('get_money_record');
		$count = $records->where('proxy_id='.$user['id'])->count("id");
		$p = $this->page($count,10);
		$list = $records->field(true)->where('proxy_id='.$user['id'])
		                             ->order('id')->limit($p->firstRow, $p->listRows)->select();
		$cnt = count($list);
		for($i=0;$i<$cnt;++$i){
			$list[$i]['create_time'] = date('Y-m-d H:i:s', $list[$i]['create_time']);
			if($list[$i]['status'] == 1){
				$list[$i]['status'] = '已到账';
			}else if($list[$i]['status'] == 0){
				$list[$i]['status'] = '申请中';
			}
		}

		$this->assign('select', $list); // 赋值数据集
		$this->assign('page', $p->show()); // 赋值分页输出
		$this->display();
		trace('======auto_getmoney_record end======');
	}

	public function do_banker(){
		$user = session('user');
		if(!$user){
			$this->ajaxReturn(array(
				'status'=>0,
				'code'=>101,
				'msg'=>'not login'
			));
		}
		$data['status'] = 1;
		$apply_banker_model = D('apply_banker');
		$game_code = I('post.game_code');

		$user_extra_model = new UserExtraInfoModel();
		$user_extra_entity = $user_extra_model->where('user_id=' . $user['id'])->find();
		if(!empty($user_extra_entity)){
			$proxy_gamecodes = explode(',', $user_extra_entity['banker_games']);
			if(in_array($game_code, $proxy_gamecodes)){
				$data['code'] = 1;
				$data['msg'] = 'already banker';
				$this->ajaxReturn($data);
			}
		}

		$entity = $apply_banker_model->where('proxy_id='.$user['id'].' and apply_game='.$game_code)->find();
		if(empty($entity)){
			$apply_banker_model->add(array(
				'proxy_id'=>$user['id'],
				'apply_game'=>$game_code,
				'apply_time'=>time(),
				'status'=>0
			));
			$data['code']=0;
			$data['msg'] = 'wait for check';
			$this->ajaxReturn($data);
		}else{
			if($entity['status'] == 0){
				$data['code']=0;
				$data['msg'] = 'wait for check';
				$this->ajaxReturn($data);
			}else if($entity['status'] == 2){
				$apply_banker_model->where('proxy_id='.$user['id'].' and apply_game='.$game_code)->update(array(
					'status'=>0
				));
				$data['code']=0;
				$data['msg'] = 'wait for check';
				$this->ajaxReturn($data);
			}
		}
	}

	public function third_games(){
		$user = session('user');
		if(!$user){
			$this->error(L('_USER_PASS_EMPTY_'));
		}
		$record_tag_model = new RecordTagModel();
		$third_game_model = $record_tag_model->getRecordModel('third_game');
		$game_list = $third_game_model->select();
		$user_extra_model = new UserExtraInfoModel();
		$user_extra_info = $user_extra_model->where('user_id='.$user['id'])->find();
		if(!$user_extra_info){
			$this->error(L('_USER_INFO_NOT_BIND_'));
		}
		$apply_banker_model = D('apply_banker');
		$game_codes = explode(',', $user_extra_info['banker_games']);
		$apply_list = $apply_banker_model->where('proxy_id = '.$user['id'])->select();
		$cnt = count($game_list);
		for ($i = 0; $i < $cnt; ++$i){
			if(in_array($game_list[$i]['game_code'], $game_codes)){
				$game_list[$i]['status'] = 2;
			}else{
				$find_target = false;
				foreach($apply_list as $apply_entity){
					if(($apply_entity['status'] == 0 || $apply_entity['status'] == 2) &&
					   $apply_entity['apply_game'] == $game_list[$i]['game_code']){
						$game_list[$i]['status'] = 1;
						$find_target = true;
						break;
					}
				}
				if(!$find_target){
					$game_list[$i]['status'] = 0;
				}
			}
		}
		$this->assign('select', $game_list);
		$this->display();
	}
}