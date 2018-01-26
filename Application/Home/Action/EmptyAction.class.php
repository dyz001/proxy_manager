<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/26
 * Time: 14:22
 */
namespace Home\Action;
use Think\Controller;
class EmptyAction extends Controller{
	public function index(){
		//根据当前控制器名来判断要执行那个城市的操作
		$cityName = CONTROLLER_NAME;
		$this->city($cityName);
	}
	//注意 city方法 本身是 protected 方法
	protected function city($name){
		//和$name这个城市相关的处理
		echo 'not found page';
	}
}