<?php
namespace Home\Controller;
use Home\Model\UserModel;
use Think\Controller;
use Think\Page;
use Home\Model\ReturnRecordModel;
class IndexController extends Controller {
    public function index(){
        $this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px } a,a:hover{color:blue;}</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>版本 V{$Think.version}</div><script type="text/javascript" src="http://ad.topthink.com/Public/static/client.js"></script><thinkad id="ad_55e75dfae343f5a1"></thinkad><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
    }
    public function add(){
    	echo 'enter add';
    }
	public function showRecords()
	{
		$records = new ReturnRecordModel();
		$count = $records->count("id");
		$p = $this->page($count,3);
		$list = $records->field(true)->order('id')->limit($p->firstRow, $p->listRows)->select();
		$this->assign('select', $list); // 赋值数据集
		$this->assign('page', $p->show()); // 赋值分页输出
		$this->display("User/TestRecord.html");
	}
	protected function page($total_size = 1, $listRows = 6) {

		$page = new Page($total_size, $listRows);
		$page->setConfig('header', '<li class="rows">共<b>%TOTAL_ROW%</b>条记录&nbsp;第<b>%NOW_PAGE%</b>页/共<b>%TOTAL_PAGE%</b>页</li>');
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$page->setConfig('last', '末页');
		$page->setConfig('first', '首页');
		$page->setConfig('theme', '%FIRST%%UP_PAGE%%LINK_PAGE%%DOWN_PAGE%%END%%HEADER%');
		$page->lastSuffix = false;//最后一页不显示为总页数
		return $page;
	}
}