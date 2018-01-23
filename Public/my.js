Date.prototype.Format = function(fmt)
{ //author: meizz
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "H+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
};

function getJsonp(url,data,success,error){
    $.ajax({
        type:"get",    //请求方式
        async:true,    //是否异步
        url:url,
        dataType:"jsonp",    //跨域json请求一定是jsonp
        jsonp: "callbackparam",    //跨域请求的参数名，默认是callback
        jsonpCallback:"jsonpReturn",    //自定义跨域参数值，回调函数名也是一样，默认为jQuery自动生成的字符串
        data:data,    //请求参数

        beforeSend: function() {
            //请求前的处理
        },

        success: function(data) {
            //请求成功处理，和本地回调完全一样
            if(success)
                success(data);
        },

        complete: function() {
            //请求完成的处理
        },

        error: function() {
            //请求出错处理
            if(error)
                error();
        }
    });
}

function postJsonp(url, data1, success, error){
    $.ajax({
        type:"post",    //请求方式
        async:true,    //是否异步
        url:url,
        dataType:"jsonp",    //跨域json请求一定是jsonp
        jsonp: "callbackparam",    //跨域请求的参数名，默认是callback
        jsonpCallback:"jsonpReturn",    //自定义跨域参数值，回调函数名也是一样，默认为jQuery自动生成的字符串
        data:data1,    //请求参数

        beforeSend: function() {
            //请求前的处理
            console.log("before send");
        },

        success: function(data) {
            //请求成功处理，和本地回调完全一样
            console.log("success");
            if(success)
                success(data);
        },

        complete: function() {
            console.log("complete");
            //请求完成的处理
        },

        error: function(a) {
            //请求出错处理
            console.log("error ");
            if(error)
                error();
        }
    });
}

function open_url(url){
    window.location.href = url;
}

var browser={
    versions:function(){
        var u = navigator.userAgent, app = navigator.appVersion;
        return {//移动终端浏览器版本信息
            trident: u.indexOf('Trident') > -1, //IE内核
            presto: u.indexOf('Presto') > -1, //opera内核
            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
            mobile: !!u.match(/Mobile/), //是否为移动终端
            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
            iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
            iPad: u.indexOf('iPad') > -1, //是否iPad
            webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
        };
    }(),
    language:(navigator.browserLanguage || navigator.language).toLowerCase()
};
var touch_target = null;
function init_tap_event() {
    if(browser.versions.mobile){
        document.addEventListener('touchstart',touch, false);
        document.addEventListener('touchmove',touch, false);
        document.addEventListener('touchend',touch, false);
        function touch (event){
            var event = event || window.event;
            switch(event.type){
                case "touchstart":
                    if($(event.target).attr('ontap')){
                        touch_target = event.target;
                    }
                    break;
                case "touchend":
                    if(touch_target === event.target){
                        eval($(touch_target).attr('ontap'));
                    }
                    touch_target = null;
                    break;
                case "touchmove":
                    event.preventDefault();
                    break;
            }
        }
    }else{
        var taps = $('[ontap]');
        for(var i = 0; i < taps.length; ++i){
            $(taps[i]).attr('onclick', $(taps[i]).attr('ontap'));
        }
    }
}

function randPassword()
{
    var text=['abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ','1234567890','~!@#$%^&*()_+";",./?<>'];
    var rand = function(min, max){return Math.floor(Math.max(min, Math.random() * (max+1)));}
    var len = rand(9, 16); // 长度为8-16
    var pw = '';
    for(i=0; i<len; ++i)
    {
        var strpos = rand(0, 3);
        pw += text[strpos].charAt(rand(0, text[strpos].length));
    }
    return pw;
}