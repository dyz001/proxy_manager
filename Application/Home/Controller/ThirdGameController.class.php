<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/15
 * Time: 10:22
 */
namespace Home\Controller;
use Think\Controller;
class ThirdGameController extends Controller
{
	protected $verify_account_url = '';
	protected $fish_url = 'http://45.126.122.22/sfangapi/';
	protected $fish_key = '2eacd42073d0a1a7ade614fb4d6f733b';
	public function loginFish(){
		$playerId=I('get.playerId');
		$params = array(
			'MemberId'=>$playerId,
			'Lang'=>'cn'
		);
		$params['Sign']=$this->genSign($params);
		redirect($this->fish_url.'/Login.php?'.http_build_query($params));
	}

	protected function genRandomChar($num){
		$ret = '';
		$char_arr = '0123456789qwertyuiopasdfghjklzxcvbnm';
		for($i = 0; $i < $num; ++$i){
			$ret .= $char_arr[random_int(0,35)];
		}
		return $ret;
	}

	public function genSign($params){
		return $this->genRandomChar(5).md5(http_build_query($params).$this->fish_key).$this->genRandomChar(5);
	}

	public function loginCallback(){
		//登录捕鱼成功回调，此时上分
	}

	public function logoutCallback(){
		//退出成功回调，此时下分
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