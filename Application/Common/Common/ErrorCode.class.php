<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/6
 * Time: 10:50
 */
namespace Common\Common;
class ErrorCode extends Enum
{
	const SUCCESS = 0;//成功
	const WX_IDENTITY_EMPTY = 101;//微信号为空
	const BANK_CARD_EMPTY = 102;//银行卡号为空
	const REAL_NAME_EMPTY = 103;//真实姓名为空
	const MOBILE_EMPTY = 104;//手机号为空
	const PASSWORD_EMPTY = 105;//登录密码为空
	const WITH_DRAW_PASS_EMPTY = 106;//提现密码为空

}