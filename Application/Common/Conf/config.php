<?php
return array(
	//'配置项'=>'配置值'
	'MODULE_ALLOW_LIST'    =>    array('Home','Common','API'),
	'DEFAULT_MODULE'     => 'Home', //默认模块
	'URL_MODEL'          => '2', //URL模式
	'SESSION_AUTO_START' => true, //是否开启session
	'UCENTER_ENABLED'    => true,
	'DEFAULT_AJAX_RETURN' => 'jsonp',
	'APP_SUB_DOMAIN_DEPLOY'=>true,
	'USER_CONFIG'        => array(
		'USER_AUTH' => true,
		'USER_TYPE' => 2,
	),
	//'DEFAULT_C_LAYER'       =>  'Action',
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
		'create_user' => 'Home/Login/create_user',
		'p_create_wxaccount' => 'Home/Login/create_wxaccount',
		'send_mail' => 'Home/Proxy/send_mail',
		'get_short_url'=>'Home/Proxy/get_short_url',
		//GM
		'gm_logout' => 'Home/GMService/logout',
		'gm_create_user' => 'Home/GMService/create_user',
		'gm_login'=>'Home/GMLogin/login',
		'gm_dologin'=>'Home/GMLogin/dologin',
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
		'gm_process_apply_banker'=>'Home/GMService/process_apply_banker',
		'gm_general_proxy_profit'=>'Home/GMService/general_proxy_profit',
		'gm_general_system_profit'=>'Home/GMService/general_system_profit',
		'gm_sum_platform_profit'=>'Home/GMService/sum_platform_profit',
		'gm_sum_fish_profit'=>'Home/GMService/sum_fish_profit',
		'gm_proxy_grant'=>'Home/GMService/proxy_grant',
        'gm_withdraw_record'=>'Home/GMService/withdraw_record',
		'gm_grant_proxy'=>'Home/GMService/grant_proxy',
		'gm_reset_password'=>'Home/GMService/reset_password',
		'gm_platform_config' => 'Home/GMService/platform_config',
		'gm_reset_proxy_password' => 'Home/GMService/reset_proxy_password',
		'gm_add_bag_item' => 'Home/GMService/add_bag_item',
		'gm_player_bag_oper'=>'Home/GMService/player_bag_oper',
		'gm_bag_oper_record'=>'Home/GMService/bag_oper_record',
		'gm_player_num'=>'Home/GMService/player_num',
		'gm_trade_record'=>'Home/GMService/trade_record',
		'general_proxy_profit'=>'Home/GMService/general_proxy_profit',
		'general_system_profit'=>'Home/GMService/general_system_profit',
		'gm_proxy_grant_2' => 'Home/GMService/proxy_grant_2',
		'gm_pay_record' => 'Home/GMService/pay_record',
		'gm_gold_flow' => 'Home/GMService/gold_flow',
		'gm_recharge_general' => 'Home/GMService/recharge_general',
		'gm_player_id_binding'=>'Home/GMService/player_id_binding',
		//data_receiver
		'data_receive_water' => 'Home/DataReceiver/receive_water',
		//data_process
		'data_gen_fish_record'=>'Home/DataReceiver/gen_fish_record',
		'data_gen_fish_sum_record' => 'Home/DataReceiver/gen_fish_sum_record',

		'data_sum_platform_profit'=>'Home/DataReceiver/sum_platform_profit',
		'data_sum_fish_profit' => 'Home/DataReceiver/sum_fish_profit',
		'data_add_profit_for_proxy' => 'Home/DataReceiver/add_profit_for_proxy',
		'data_gen_platform_sum_record' => 'Home/DataReceiver/gen_platform_sum_record',

		//verify
		'v_apply_proxy' => 'Home/Verify/can_apply_proxy',

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
	'FISH_RECORD_URL'=>'http://fish.498wan.com/sfangapi/GetBetRecord2.php',
	'FISH_SUM_RECORD_URL'=>'http://45.126.122.22/sfangapi/GetBetRecordSum.php',
	'FISH_PAGE_LIMIT'=>500,
	'DETAIL_NUM_PER_PAGE'=>20,
	'RECORD_NUM_PER_PAGE'=>20,
	'FISH_KEY'=>'2eacd42073d0a1a7ade614fb4d6f733b',
	'APP_SECRET_KEY'=>'cebd5797b878f251af304a8e693aee17',
	'GAME_URL' => 'http://auth.498wan.com/redirect/v1/xkqp/H5/WEIXIN/redirect_uri/',
	'H5_ENTER_URL' => 'http://cdn.xk.498wan.com/h5/2L/index.html?t=1516694463',
	'APP_WAKE_UP' => 'yuexiangapp://link',
	'WX_AUTH_URL' => 'https://open.weixin.qq.com/connect/oauth2/authorize',
	'GET_WX_USER_INFO' => 'http://auth.498wan.com/channel/weixin/v1/userinfo/',
	'APP_ID' => 'wxb1bc54f79905e4f7',
	'CREATE_ACCOUNT_URL' => 'http://192.168.1.127:8399/createUser.nd',
	'VERIFY_URL' => 'http://127.0.0.1:8889',
	'CAN_APPLY_PROXY' => '/v_apply_proxy',
	'redis_host'=>'192.168.1.36',
	'redis_port'=>6379,
	'redis_pass'=>'',
	'redis_db'=>1,
	'GAME_SERVER_URL' => 'http://192.168.1.127:8399',
	'MAIL_VIP' => 12,
);