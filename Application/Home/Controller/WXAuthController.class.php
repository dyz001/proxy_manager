<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/10
 * Time: 9:44
 */

namespace Home\Controller;
use Think\Exception;


class WXAuthController extends \Think\Controller {
	protected $GetRequestCodeURL = 'https://open.weixin.qq.com/connect/qrconnect';
	protected $GetAccessTokenURL = 'https://api.weixin.qq.com/sns/oauth2/access_token';
	//https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
	protected $ApiBase = 'https://api.weixin.qq.com/';
	protected $UserInfoUrl = 'https://api.weixin.qq.com/sns/userinfo';//?access_token=ACCESS_TOKEN&openid=OPENID
	protected $api_callback = '';
	protected $Token = [];
	protected $GrantType='authorization_code';
	protected $app_secrete = array(
		'app_id'=>'secret',
	);
	public function wx_login(){
		$res_data = file_get_contents("php://input");
		$json_obj = json_decode($res_data);
		$code = $json_obj->code;
		$app_id = $json_obj->app_id;
		$this->getAccessToken($app_id, $code);
		$token = $this->Token['access_token'];
		$open_id = $this->openid();
		//获取用户信息
		$params = array(
			'access_token'=>$token,
			'openid'=>$open_id
		);
		$data = $this->http($this->UserInfoUrl, $params, 'GET');

	}

	protected function gen_account_info($wx_data){
		$ret = [];
		$ret = array(
			'user_type'=>4,
			'create_time'=>time(),
			'last_login_time'=>time(),
			'nickname'=>base64_encode($wx_data['nickname']),
			'wx_open_id'=>$wx_data['openid'],
			'wx_unionid'=>$wx_data['unionid']
		);
		$user_data = D('user')->where('wx_unionid='.$wx_data['unionid']);
		if(empty($user_data)){
			D('user')->save($ret);
		}
	}

	protected function getRequestCodeURL($app_id){
		$params = array(
			'appid' => $app_id,
			'redirect_uri'=>$this->api_callback,
			'response_type'=>'code',
			'scope'=>'snsapi_login'
		);
		return $this->GetRequestCodeURL . '?' . http_build_query($params);
	}

	public function getAccessToken($app_id, $code, $extend = null){
		$params = array(
			'appid'     => $app_id,
			'secret'    => $this->app_secrete[$app_id],
			'grant_type'    => $this->GrantType,
			'code'          => $code,
		);

		$data = $this->http($this->GetAccessTokenURL, $params, 'POST');
		$this->Token = $this->parseToken($data, $extend);
		return $this->Token;
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

	protected function parseToken($result, $extend){
		$data = json_decode($result,true);
		//parse_str($result, $data);
		if($data['access_token'] && $data['expires_in']){
			$this->Token    = $data;
			$data['openid'] = $this->openid();
			return $data;
		} else
			throw new Exception("获取微信 ACCESS_TOKEN 出错：{$result}");
	}

	public function openid(){
		$data = $this->Token;
		if(!empty($data['openid']))
			return $data['openid'];
		else
			exit('没有获取到微信用户ID！');
	}
}