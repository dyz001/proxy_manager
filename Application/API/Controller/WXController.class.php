<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/26
 * Time: 17:38
 */
namespace API\Controller;
use Common\Controller\HomebaseController;
use Think\Exception;
class WXController extends HomebaseController
{
	public function get_wxauth_config(){
		$redis = get_redis();
		$access_token = '';
		$nonceStr = 'yuexiang';
		$url = I('post.src_url');
		$url = str_replace('&amp;','&', $url);
		$ticket = '';
		$data['status'] = 1;
		$access_data = $redis->get(C('WX_TOKEN_KEY'));
		if($access_data && json_decode($access_data)->expires_in > time()){
			$access_token = json_decode($access_data)->access_token;
			trace('token exist:'.$access_token);
		}else{
			$res_data = $this->http(C('ACCESS_TOKEN_URL'), array(
				'grant_type'=>'client_credential',
				'appid' => C('APP_ID'),
				'secret' => C('APP_SECRET')
			));
			if(!$res_data){
				trace('res data is empty');
				$data['status'] = 0;
				$data['msg'] = 'accesstoken data is empty';
			}else{
				$res_data_obj = json_decode($res_data);
				if(isset($res_data_obj->errcode)){
					$data['status'] = 0;
					$data['code'] = $res_data_obj->errcode;
					$data['msg'] = $res_data_obj->errmsg;
				}else{
					$wx_token = array(
						'access_token' => $res_data_obj->access_token,
						'expires_in' => $res_data_obj->expires_in + time(),
					);
					$redis->set(C('WX_TOKEN_KEY'), json_encode($wx_token));
					$access_token = $res_data_obj->access_token;
				}
			}
		}

		if($access_token){
			$js_ticket_data = $redis->get(C('TICKET_KEY'));
			if($js_ticket_data && json_decode($js_ticket_data)->expires_in > time()){
				$ticket = json_decode($js_ticket_data)->ticket;
				trace('ticket exist:'.$ticket);
			}else{
				$res_data = $this->http(C('JSAPI_TICKET_URL'), array(
					'access_token'=>$access_token,
					'type'=>'jsapi'
				));
				if(!$res_data){
					$data['status'] = 0;
					$data['msg'] = 'jsapi data is empty';
				}else{
					$res_data_obj = json_decode($res_data);
					if($res_data_obj->errcode == 0){
						$ticket_data = array(
							'ticket' => $res_data_obj->ticket,
							'expires_in' => $res_data_obj->expires_in + time(),
						);
						$ticket = $res_data_obj->ticket;
						$redis->set(C('TICKET_KEY'), json_encode($ticket_data));
					}
				}
			}
		}
		$time_stamp = time();
		$query_string = 'jsapi_ticket='.$ticket.'&noncestr='.$nonceStr. '&timestamp='.$time_stamp.'&url='.$url;
		$sign = sha1($query_string);
		$data['signature'] = $sign;
		$data['nonceStr'] = $nonceStr;
		$data['timestamp'] = $time_stamp;
		$data['appId'] = C('APP_ID');
		trace('signature:'.$sign.', nonceStr:'.$nonceStr.', timestamp:'.$time_stamp.',url:'.$url);
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