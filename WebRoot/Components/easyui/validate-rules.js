$.extend($.fn.validatebox.defaults.rules, {
    //电话号码
    phoneRex: {
        validator: function(value){
            var rex = /^1[3-8]+\d{9}$/;
            //var rex=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
            //区号：前面一个0，后面跟2-3位数字 ： 0\d{2,3}
            //电话号码：7-8位数字： \d{7,8
            //分机号：一般都是3位数字： \d{3,}
            //这样连接起来就是验证电话的正则表达式了：/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/		 
            var rex2 = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
            if (rex.test(value) || rex2.test(value)) {
                // alert('t'+value);
                return true;
            }
            else {
                //alert('false '+value);
                return false;
            }
        },
        message: '请输入正确电话或手机格式'
    },
    //国内邮编验证
    zipcode: {
        validator: function(value){
            var reg = /^[1-9]\d{5}$/;
            return reg.test(value);
        },
        message: '邮编必须是非0开始的6位数字.'
    },
    //用户名验证  
    account: {//param的值为[]中值
        validator: function(value, param){
            if (value.length < param[0] || value.length > param[1]) {
                $.fn.validatebox.defaults.rules.account.message = '用户名长度必须在' + param[0] + '至' + param[1] + '范围';
                return false;
            }
            else {
                if (!/^[\w]+$/.test(value)) {
                    $.fn.validatebox.defaults.rules.account.message = '用户名只能数字、字母、下划线组成.';
                    return false;
                }
                else {
                    return true;
                }
            }
        },
        message: ''
    },
    // 验证IP地址  
    checkIp: {
        validator: function(value){
            var reg = /^((1?\d?\d|(2([0-4]\d|5[0-5])))\.){3}(1?\d?\d|(2([0-4]\d|5[0-5])))$/;
            return reg.test(value);
        },
        message: 'IP地址格式不正确'
    },
    //两次输入密码验证
    equalTo: {
        validator: function(value, param){
            return $("#" + param[0]).val() == value;
        },
        message: '两次输入的密码不一致!'
    },
    //检查旧密码
    checkPassword: {
        validator: function(value, param){
            var sysUser = {};
            var flag;
            var url = root + param[0];
            sysUser.userPassword = value;
            $.ajax({
                url: url,
                type: 'POST',
                timeout: 60000,
                data: sysUser,
                async: false,
                success: function(data, textStatus, jqXHR){
                    if (data == "0") {
                        flag = true;
                    }
                    else {
                        flag = false;
                    }
                }
            });
            if (flag) {
                $("#userPassword").removeClass('validatebox-invalid');
            }
            return flag;
        },
        message: '原始密码输入错误！'
    },
    // 验证身份证 
    idcard: {
        validator: function(value){
            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value) || /^\d{18}(\d{2}[A-Za-z0-9])?$/i.test(value);
        },
        message: '身份证号码格式不正确'
    },
    intOrFloat: {// 验证整数或小数  
        validator: function(value){
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message: '请输入数字，并确保格式正确'
    },
    currency: {// 验证货币  
        validator: function(value){
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message: '货币格式不正确'
    },
    qq: {// 验证QQ,从10000开始  
        validator: function(value){
            return /^[1-9]\d{4,9}$/i.test(value);
        },
        message: 'QQ号码格式不正确'
    },
    integer: {// 验证整数  
        validator: function(value){
            return /^[+]?[1-9]+\d*$/i.test(value);
        },
        message: '请输入整数'
    },
    chinese: {// 验证中文  
        validator: function(value){
            return /^[\u0391-\uFFE5]+$/i.test(value);
        },
        message: '请输入中文'
    },
    chineseAndLength: {// 验证中文及长度  
        validator: function(value){
            var len = $.trim(value).length;
            if (len >= param[0] && len <= param[1]) {
                return /^[\u0391-\uFFE5]+$/i.test(value);
            }
        },
        message: '请输入中文'
    },
    english: {// 验证英语  
        validator: function(value){
            return /^[A-Za-z]+$/i.test(value);
        },
        message: '请输入英文'
    },
    englishAndLength: {// 验证英语及长度  
        validator: function(value, param){
            var len = $.trim(value).length;
            if (len >= param[0] && len <= param[1]) {
                return /^[A-Za-z]+$/i.test(value);
            }
        },
        message: '请输入英文'
    },
    englishUpperCase: {// 验证英语大写  
        validator: function(value){
            return /^[A-Z]+$/.test(value);
        },
        message: '请输入大写英文'
    },
    unnormal: {// 验证是否包含空格和非法字符  
        validator: function(value){
            return /.+/i.test(value);
        },
        message: '输入值不能为空和包含其他非法字符'
    },
    faxno: {// 验证传真  
        validator: function(value){
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message: '传真号码不正确'
    },
    name: {// 验证姓名，可以是中文或英文  
        validator: function(value){
            return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
        },
        message: '请输入姓名'
    },
    engOrChinese: {// 可以是中文或英文  
        validator: function(value){
            return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
        },
        message: '请输入中文'
    },
    engOrChineseAndLength: {// 可以是中文或英文  
        validator: function(value){
            var len = $.trim(value).length;
            if (len >= param[0] && len <= param[1]) {
                return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
            }
        },
        message: '请输入中文或英文'
    },
    carNo: {
        validator: function(value){
            return /^[\u4E00-\u9FA5][\da-zA-Z]{6}$/.test(value);
        },
        message: '车牌号码无效（例：粤B12350）'
    },
});
