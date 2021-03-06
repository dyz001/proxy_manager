<?php
namespace Common\Controller;
use Think\Controller;
use Think\Page;

class AppframeController extends Controller {

	function _initialize() {
		$this->assign("waitSecond", 3);
		$time=time();
		$this->assign("js_debug",APP_DEBUG?"?v=$time":"");
	}

	/**
	 * Ajax方式返回数据到客户端
	 * @access protected
	 * @param mixed $data 要返回的数据
	 * @param String $type AJAX返回数据格式
	 * @return void
	 */
	protected function ajaxReturn($data, $type = '',$json_option=0) {

		$data['referer'] = !empty($data['url']) ? $data['url'] : "";
		$data['state']   = !empty($data['status']) ? "success" : "fail";

		if(empty($type)) $type  =   C('DEFAULT_AJAX_RETURN');
		switch (strtoupper($type)){
			case 'JSON' :
				// 返回JSON数据格式到客户端 包含状态信息
				header('Content-Type:application/json; charset=utf-8');
				header('Access-Control-Allow-Origin: *');
                header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
                header('Access-Control-Allow-Methods: GET, POST, PUT');
				exit(json_encode($data,$json_option));
			case 'XML'  :
				// 返回xml格式数据
				header('Content-Type:text/xml; charset=utf-8');
				exit(xml_encode($data));
			case 'JSONP':
				// 返回JSON数据格式到客户端 包含状态信息
				header('Content-Type:application/json; charset=utf-8');
				$handler  =   isset($_GET[C('VAR_JSONP_HANDLER')]) ? $_GET[C('VAR_JSONP_HANDLER')] : C('DEFAULT_JSONP_HANDLER');
				trace('data :'.json_encode($data,$json_option));
				exit($handler.'('.json_encode($data,$json_option).');');
			case 'EVAL' :
				// 返回可执行的js脚本
				header('Content-Type:text/html; charset=utf-8');
				exit($data);
			case 'AJAX_UPLOAD':
				// 返回JSON数据格式到客户端 包含状态信息
				header('Content-Type:text/html; charset=utf-8');
				exit(json_encode($data,$json_option));
//			default :
//				// 用于扩展其他返回格式数据
//				Hook::listen('ajax_return',$data);
		}

	}

	/**
	 *
	 * @param number $totalSize 总数
	 * @param number $pageSize  总页数
	 * @param number $currentPage 当前页
	 * @param number $listRows 每页显示条数
	 * @param string $pageParam 分页参数
	 * @param string $pageLink 分页链接
	 * @param string $static 是否为静态链接
	 */
	protected function page($totalSize = 1, $listRows = 6) {

		$page = new Page($totalSize, $listRows);
		$page->setConfig('header', '<li class="rows">共<b>%TOTAL_ROW%</b>条记录&nbsp;第<b>%NOW_PAGE%</b>页/共<b>%TOTAL_PAGE%</b>页</li>');
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$page->setConfig('last', '末页');
		$page->setConfig('first', '首页');
		$page->setConfig('theme', '%FIRST%%UP_PAGE%%LINK_PAGE%%DOWN_PAGE%%END%%HEADER%');
		$page->lastSuffix = false;//最后一页不显示为总页数
		return $page;
	}

	//空操作
	public function _empty() {
		$this->error('该页面不存在！');
	}

	/**
	 * 检查操作频率
	 * @param int $duration 距离最后一次操作的时长
	 */
	protected function check_last_action($duration){

		$action=MODULE_NAME."-".CONTROLLER_NAME."-".ACTION_NAME;
		$time=time();

		$session_last_action=session('last_action');
		if(!empty($session_last_action['action']) && $action==$session_last_action['action']){
			$mduration=$time-$session_last_action['time'];
			if($duration>$mduration){
				$this->error("您的操作太过频繁，请稍后再试~~~");
			}else{
				session('last_action.time',$time);
			}
		}else{
			session('last_action.action',$action);
			session('last_action.time',$time);
		}
	}

	/**
	 * 模板主题设置
	 * @access protected
	 * @param string $theme 模版主题
	 * @return Action
	 */
	public function theme($theme){
		$this->theme=$theme;
		return $this;
	}

}