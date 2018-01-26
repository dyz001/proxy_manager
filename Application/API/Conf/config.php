<?php
return array(
	//'配置项'=>'配置值'
	//api 路由
	'URL_ROUTE_RULES'       =>  array(
		'get_js_auth_config' => 'API/WX/get_wxauth_config',//json 形式返回配置数据
	),
	'ACCESS_TOKEN_URL' => 'https://api.weixin.qq.com/cgi-bin/token',
	'APP_SECRET' => '7214da2450d255fa23dfe16318d9d2b4',
	'APP_ID'=>'wx3d22722fd01bbb25',
	'WX_TOKEN_KEY'=>'wx_access_token',
	'JSAPI_TICKET_URL' => 'https://api.weixin.qq.com/cgi-bin/ticket/getticket',
	'TICKET_KEY' => 'wx_ticket'
);