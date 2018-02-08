<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/2/5
 * Time: 18:11
 */
namespace Home\Model;
use Think\Model;
class GoldFlowModel extends Model
{
	protected $connection = array(
		'db_type'  => 'mongo',
		'db_user'  => '',
		'db_pwd'   => '',
		'db_host'  => '192.168.1.58',
		'db_port'  => '10001',
		'db_name'  => 'xkqp_log',
		'db_charset' => 'utf8',
		'db_params' =>  array(), // 非必须
	);

	public function get_model($table){
		$model = M($table,'',$this->connection);
		return $model;
	}
}