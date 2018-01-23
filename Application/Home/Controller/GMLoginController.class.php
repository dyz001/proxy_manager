<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/22
 * Time: 12:13
 */
namespace Home\Controller;
use Common\Controller\HomebaseController;

class GMLoginController extends HomebaseController
{
	public function login(){
		$this->display();
	}

	public function dologin(){
		$account=I('post.account');
		$password = I('post.password');
		$record_tag_model = new \Home\Model\RecordTagModel();
		$user_model = $record_tag_model->getRecordModel('user');
		$user_entity =$user_model->where('account=\''.$account.'\'')->find();
		if(!$user_entity){
			$this->error(L('_USER_PASS_EMPTY_'));
		}
		if(md5($password) != $user_entity['password']){
			$this->error(L('_USER_PASS_EMPTY_'));
		}
		$user_model->where('id='.$user_entity['id'])->save(array(
			'last_login_time'=>time()
		));
		session('GM_USER_ID', $user_entity['id']);
		session('gm_user', $user_entity);
		redirect('http://'.$_SERVER['HTTP_HOST'].'/gm_main');
	}
}