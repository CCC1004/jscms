$.extend($.fn.validatebox.defaults.rules, {
        json: {
          validator: function (value, param) {
        	  var rs = false;
        	  try{
        		  jQuery.parseJSON(value);
        		  rs = true;
        	  }catch(e){
        		  rs = false;
        	  }
        	  return rs;
          },
          message: '请输入JSON'
        }
  });