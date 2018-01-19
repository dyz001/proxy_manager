<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/17
 * Time: 9:56
 */
namespace Home\Model;
use Think\Model;

class RecordTagModel extends Model
{
	// 数据库名称
	protected $dbName           =   'game_record';
	// 数据表名（不包含表前缀）
	protected $tableName        =   'record_tag';
	protected $connection = array(
		'db_type'  => 'mysql',
		'db_user'  => 'douyanzhao',
		'db_pwd'   => '123456',
		'db_host'  => '192.168.1.36',
		'db_port'  => '3306',
		'db_name'  => 'game_record',
		'db_charset' =>    'utf8',
		'db_params' =>  array(), // 非必须
	);

	public function getRecordModel($table){
		$model = M($table,'',$this->connection);
		return $model;
	}
}
