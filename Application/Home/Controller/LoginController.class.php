<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/5
 * Time: 13:53
 */
namespace Home\Controller;
use Common\Controller\HomebaseController;
use Home\Model\UserExtraInfoModel;
use Think\Log;
use Home\Model\UserModel;
use Think\Exception;

class LoginController extends HomebaseController
{
	public function index(){
		trace('display login');
		$this->display('login');
	}
	public function login(){
		if(session('ADMIN_ID')) {
			$this->display( "Proxy/main" );
		}
//		}else{
//			redirect('./wxauth');
//			return;
//		}
		$this->display();
	}
	// 登录验证提交
	public function dologin(){
		$name = I("post.username");
		if(empty($name)){
			$this->error(L('_USER_PASS_EMPTY_'));
		}
		$pass = I("post.password");
		if(empty($pass)){
			trace('pass empty');
			$this->error(L('PASSWORD_REQUIRED'));
			trace('=========');
		}
		$password = md5($pass);
		$user_entity = new UserModel();
		$user_data = null;
		if(preg_match('/(^(13\d|15[^4\D]|17[13678]|18\d)\d{8}|170[^346\D]\d{7})$/', $name)){//手机号登录
			$user_data = $user_entity->getUserByMobile($name);
		}else{
			 // 用户名或者邮箱登录
			$user_data = $user_entity->getUserByAccount($name);
		}
		if($user_data){
			if($user_data[0]['password'] == $password){
				$user_entity->where('id='.$user_data[0]['id'])->save(array(
					'last_login_time'=>time()
				));
				session('ADMIN_ID', $user_data[0]['id']);
				redirect('./main');
				//$this->display("Proxy/main");
			}else{
				redirect("./login");
			}
		}
	}

	public function bind_code(){
		//
		$code = I('get.code');
		redirect('./wxauth/proxy_id/'.$code);
	}

	public function wxauth(){
		$proxy_id=I('get.proxy_id');
		$this->assign('state','0#'.$proxy_id);
		$this->assign('redirect_uri', urlencode( $_SERVER['HTTP_HOST'].'/wxauth_response'));
		$wxSDKParam = C('THINK_SDK_WeixinSDK');
		$this->assign('app_id', $wxSDKParam['APP_ID']);
		$this->display();
	}

	public function wxauth_response(){
		$code = I('get.code');
		$state = I('get.state');//proxy_id
		$state_code = explode('#', $state);
		$wxSDK = \ThinkOauth::getInstance('WeixinSDK');
		$accessToken = $wxSDK->getAccessToken($code);
		$openId = $wxSDK->openid();
		$user_entity = new UserModel();
		//按openid 查找用户
		$user_info = $user_entity->where('wx_open_id=\''.$openId.'\'')->find();
		if(empty($userInfo)){
			$userInfo = $wxSDK->getUserInfo($accessToken, $openId);
			$userInfoObj = json_decode($userInfo);

			$nickname = $userInfoObj->nickname;
			$province = $userInfoObj->province;
			$city = $userInfoObj->city;
			$country = $userInfoObj->country;
			$headimgurl = $userInfoObj->headimgurl;
			$unionid = $userInfoObj->unionid;

			$user_entity->add(array(
				'user_type'=>$user_entity->EPlayer,
				'create_time'=>time(),
				'last_login_time'=>time(),
				'password'=>md5('123456'),
				'nickname'=>$nickname,
				'wx_open_id'=>$openId,
				'parent_id'=>$state_code[1],
				'wx_unionid'=>$unionid,
			));
			$userInfo = $user_entity->where('wx_open_id=\''.$openId.'\'')->find();
		}
		session('ADMIN_ID', $userInfo['id']);
		if($state_code[0] == '0'){
			redirect(C('GAME_URL'));
		}else{
			redirect('./main');
		}
	}

	public function create_user(){
		$user_id = I('post._id');
		$nickname = I('post.name');
		$openid = I('post.openid');
		$unionid = I('post.unionid');
		$mobile = I('post.mobile');
		$spreader = I('post.spreader');
		$account = I('post.account');
		$headurl = I('post.headurl');

		$user_model = new UserModel();
		$user_data = $user_model->where('pid = '.$user_id)->find();
		if(empty($user_data)){
			$user_model->add(array(
				'pid'=>$user_id,
				'user_type'=>$user_model->EPlayer,
				'create_time'=>time(),
				'last_login_time'=>time(),
				'nickname'=>$nickname,
				'wx_open_id'=>$openid,
				'parent_id'=>$spreader,
				'account'=>$account,
				'wx_unionid'=>$unionid
			));
		}
		$this->ajaxReturn(array(
			'status'=>1,
		), 'json');
	}

	public function create_wxaccount(){
		$open_id = I('get.openId');
		$token = I('get.accessToken');
		$gameId = I('get.gameId');
		$channelId = I('get.channelId');
		$state = I('get.state');
		$res_data = $this->http(C('GET_WX_USER_INFO'),array(
		'gameId'=>$gameId,
			'channelId'=>$channelId,
			'openId'=>$open_id,
			'accessToken'=>$token
		), 'POST');
		if(!$res_data){
			trace('data not return:');
		}
		$res_data_obj = json_decode($res_data);
		if(!$res_data_obj){
			trace('data decode error:'.$res_data);
		}
		if(!$res_data_obj->user){
			trace('user info not found');
			//用户信息拉取失败
		}
		if(!$res_data_obj->loginUser){
			trace('wx userinfo not found');
		}
		$user_model = new UserModel();
		$user_data = $user_model->where('pid = '.$res_data_obj->user->pid)->find();
		if(!$user_data){
			$user_model->add(array(
				'pid'=>$res_data_obj->user->pid,
				'user_type'=>$user_model->EPlayer,
				'create_time'=>time(),
				'last_login_time'=>time(),
				'nickname'=>$res_data_obj->user->pid,
				'wx_open_id'=>$res_data_obj->loginUser->openid,
				'parent_id'=>$state,
				'account'=>'user'.$res_data_obj->user->pid,
				'wx_unionid'=>$res_data_obj->loginUser->unionid
			));
			$user_data = $user_model->where('pid = '.$res_data_obj->user->pid)->find();
		}
		session('ADMIN_ID', $user_data['id']);
		if($user_data['user_type'] != $user_model->EPlayer){
			redirect('http://'.$_SERVER['HTTP_HOST'].'/main');
		}else{
			redirect('http://'.$_SERVER['HTTP_HOST'].'/qr_code');
		}
	}

	public function get_access_token(){
		$user_id = I('post._id');
		$nickname = I('post.name');
		$openid = I('post.openid');
		$unionid = I('post.unionid');
		$mobile = I('post.mobile');
		$spreader = I('post.spreader');
		$account = I('post.account');
		$headurl = I('post.headurl');

		$user_model = new UserModel();
		$user_data = $user_model->where('pid = '.$user_id)->find();
		if(empty($user_data)){
			$user_model->add(array(
				'pid'=>$user_id,
				'user_type'=>$user_model->EPlayer,
				'create_time'=>time(),
				'last_login_time'=>time(),
				'nickname'=>$nickname,
				'wx_open_id'=>$openid,
				'parent_id'=>$spreader,
				'account'=>$account,
				'wx_unionid'=>$unionid
			));
			$user_data = $user_model->where('pid = '.$user_id)->find();
		}

		//检查user_id是否有效
		$redis = get_redis();
		//$redis->connect(C('redis_host'), C('redis_port'));
		$token = md5($user_data['id'].time());
		$redis->set($token, $user_data['id']);
		$redis->close();
		$data['status'] = 1;
		$data['token'] = $token;
		$this->ajaxReturn($data, 'json');
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