<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/2
 * Time: 15:44
 */
namespace Home\Controller;
use Common\Controller\AdminbaseController;
use Home\Model\GetMoneyRecordModel;
use Home\Model\ReturnRecordModel;
use Home\Model\UserModel;
use Think\Controller;
use Think\Page;
use Think\Log;
class UserController extends AdminbaseController {
	public function index(){
		$admin_id=session('ADMIN_ID');
		if(!empty($admin_id)){//已经登录
			$this->display("/Proxy/main");
		}else{
			$this->display("/Login/login");
		}
	}
	public function read(){
		$this->assign('id',$_GET['id']);
		$this->display();
	}
	public function doLogin(){
		Log::write('dologin');
		$name = I("post.username");
		if(empty($name)){
			$this->error(L('_USER_PASS_EMPTY_'));
		}
		$pass = I("post.password");
		if(empty($pass)){
			$this->error(L('PASSWORD_REQUIRED'));
		}
		$password = md5($pass);
		$user_entity = new UserModel();
		$user_data = $user_entity->getUserByAccount($name);
		Log::write('asdfasdf');
		if($user_data){
			trace('username:'.$name.', pass:'.$user_data[0]['user_pass']);
			if($user_data[0]['user_pass'] == $password){
				session('ADMIN_ID', $user_data[0]['id']);
				$this->display("Proxy/main");
			}else{
				redirect(U("Home/user/login"));
			}
		}
	}

	public function login(){
		$admin_id=session('ADMIN_ID');
		if(!empty($admin_id)){//已经登录
			redirect(U("Home/Proxy/main"));
		}else{
			$this->display("Login/login");
		}
	}

	public function myQRCode()
	{

	}

	public function showRecords()
	{
		$records = new ReturnRecordModel();
		$count = $records->count("id");
		$p = $this->page($count,3);
		$list = $records->field(true)->order('id')->limit($p->firstRow, $p->listRows)->select();
		$this->assign('select', $list); // 赋值数据集
		$this->assign('page', $p->show()); // 赋值分页输出
		$this->display("User/TestRecord");
	}
}