<?php
return array(
	//'配置项'=>'配置值'
	'DEFAULT_MODULE'     => 'Index', //默认模块
	'URL_MODEL'          => '2', //URL模式
	'SESSION_AUTO_START' => true, //是否开启session
	'UCENTER_ENABLED'    => true,
	'DEFAULT_AJAX_RETURN' => 'jsonp',
	'APP_SUB_DOMAIN_DEPLOY'=>true,
	'USER_CONFIG'        => array(
		'USER_AUTH' => true,
		'USER_TYPE' => 2,
	),
	'VIEW_PATH'=>'./Theme/',
	'URL_ROUTER_ON'         =>  true,   // 是否开启URL路由
	'URL_ROUTE_RULES'       =>  array(
		"login" => "Home/Login/login",
		"dologin"=>"Home/Login/dologin",
		"my_fee" => "Home/Proxy/spread_fee",
		"auto_getmoney_record"=>"Home/Proxy/auto_getmoney_record",
		"auto_getmoney"=>"Home/Proxy/auto_getmoney",
		"proxy_info"=>"Home/Proxy/proxy_info",
		"proxy_grant"=>"Home/Proxy/proxy_grant",
		"proxy_players"=>"Home/Proxy/proxy_players",
		"spread_fee"=>"Home/Proxy/spread_fee",
		"fill_info"=>"Home/Proxy/fill_info",
		"logout"=>"Home/Proxy/logout",
		"qr_code"=>"Home/Proxy/qr_code",
		"main"=>"Home/Proxy/main",
		"proxy_players_filter_proxy"=>"Home/Proxy/proxy_players_filter_proxy",
		"proxy_players_filter_player"=>"Home/Proxy/proxy_players_filter_player",
		"grant_proxy"=>"Home/Proxy/grant_proxy",
		"apply_proxy" => "Home/Proxy/apply_proxy",
		"bind_proxy_info"=>"Home/Proxy/bind_proxy_info",
		"wxauth"=>"Home/Login/wxauth",
		"get_token"=>"Home/Login/get_access_token",
		'third_games'=>'Home/Proxy/third_games',
		'do_banker'=>'Home/Proxy/do_banker',
		'do_getmoney'=>'Home/Proxy/do_getmoney',
		//GM
		"gm_main"=>"Home/GMService/main",
		"gm_record_query" => "Home/GMService/query_record",
		"gm_gen_fish_sum_record"=>"Home/GMService/gen_fish_sum_record",
		"gm_gen_proxy_profit"=>"Home/GMService/gen_proxy_profit",
		"gm_fish_detail"=>"Home/GMService/fish_detail",
		"gm_platform_detail"=>"Home/GMService/platform_detail",
		'gm_fish_proxy_config'=>'Home/GMService/fish_proxy_bonus_config',
		'gm_proxy_config'=>'Home/GMService/proxy_bonus_config',
		'gm_query_all_order'=>'Home/GMService/query_all_order',
		'gm_transfer_order'=>'Home/GMService/transfer_order',
		'gm_query_settle_order'=>'Home/GMService/query_settle_order',
		'gm_query_unsettle_order'=>'Home/GMService/query_unsettle_order',
		'gm_apply_banker_list'=>'Home/GMService/apply_banker_list',
		'gm_general_proxy_profit'=>'Home/GMService/general_proxy_profit',
		'gm_general_system_profit'=>'Home/GMService/general_system_profit',
		'gm_sum_platform_profit'=>'Home/GMService/sum_platform_profit',
		'gm_sum_fish_profit'=>'Home/GMService/sum_fish_profit',
		'gm_proxy_grant'=>'Home/GMService/proxy_grant',
        'gm_withdraw_record'=>'Home/GMService/gm_withdraw_record',
		//data_receiver
		'data_receive_water' => 'Home/DataReceiver/receive_water',
		//data_process

	), // 默认路由规则 针对模块
	'THINK_SDK_WeixinSDK' => array(
		'APP_SECRET' => '',
		'APP_KEY' => '',
		'APP_ID' => '',
	),
	'SP_ADMIN_TMPL_PATH' => './Theme',
	'THEME_PATH' =>'./Theme',
	'SP_TMPL_PATH'=>'./Theme',
	'URL_MAP_RULES'         =>  array(), // URL映射定义规则
	'DB_TYPE'   => 'mysql', // 数据库类型
	'DB_HOST'   => '192.168.1.36', // 服务器地址
	'DB_NAME'   => 'h5proxy', // 数据库名
	'DB_USER'   => 'douyanzhao', // 用户名
	'DB_PWD'    => '123456', // 密码
	'DB_PORT'   => 3306, // 端口
	'DB_PARAMS' =>  array(), // 数据库连接参数
	'DB_PREFIX' => '', // 数据库表前缀
	'DB_CHARSET'=> 'utf8', // 字符集
	'DB_DEBUG'  =>  TRUE, // 数据库调试模式 开启后可以记录SQL日志
	'RECORD_URL'=>'http://192.168.1.127:8599/getRecord.nd',
	'FISH_RECORD_URL'=>'http://fish.quanjianyou.com/sfangapi/GetBetRecord2.php',
	'FISH_SUM_RECORD_URL'=>'http://45.126.122.22/sfangapi/GetBetRecordSum.php',
	'FISH_PAGE_LIMIT'=>500,
	'DETAIL_NUM_PER_PAGE'=>20,
	'RECORD_NUM_PER_PAGE'=>20,
	'FISH_KEY'=>'2eacd42073d0a1a7ade614fb4d6f733b',
	'APP_SECRET_KEY'=>'cebd5797b878f251af304a8e693aee17',
	'GAME_URL' => 'http://auth.quanjianyou.com/redirect/v1/xkqp/H5/WEIXIN/redirect_uri/',
	'WX_AUTH_URL' => 'https://open.weixin.qq.com/connect/oauth2/authorize',
	'APP_ID' => 'wxb1bc54f79905e4f7',
	'redis_host'=>'192.168.1.36',
	'redis_port'=>6379,
	'redis_pass'=>'',
	'redis_db'=>1,
);