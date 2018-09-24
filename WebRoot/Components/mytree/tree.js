
//折叠按钮发生点击事件
var handSpanClick = function (event,obj) {
    var hideDiv = $(obj).attr("value");

    if ($(obj).text() == "◥") {
        $("#"+hideDiv).slideDown(200);
        $(obj).text("◢");
    } else if ($(obj).text() == "◢") {
        $("#"+hideDiv).slideUp(200);
        $(obj).text("◥");
    }

    if(window.event){       //这是IE浏览器
        window.event.cancelBubble=true;//阻止冒泡事件
        window.event.returnValue=false;//阻止默认事件
    }else if(e && e.stopPropagation){     //这是其他浏览器
        event.stopPropagation();//阻止冒泡事件
        eevent.preventDefault();//阻止默认事件
    }
}

//双击选中项，效果类似于上面折叠按钮
function toHandSpanClick(event,obj) {
    clearTimeout(clicktimer);
    var children = $(obj).children("span").children(".handSpan");

    var hideDiv = $(children).attr("value");

    if ($(children).text() == "◥") {
        $("#"+hideDiv).slideDown(200);
        $(children).text("◢");
    } else if ($(children).text() == "◢") {
        $("#"+hideDiv).slideUp(200);
        $(children).text("◥");
    }

}
//单击选中选项
var clicktimer = null; //使用定时器的目的是为了区分开单击事件和双击事件
function selectedChose(obj,functionName) {
    clearTimeout(clicktimer);
    clicktimer=setTimeout(function(){
        var id = $(obj).attr("id");
        var option = $("#"+id+"  .fontSpan");

        var value = $(option).attr("value");
        var text = $(option).text();

        //获取select的id值
        var selectid = id.substring(0, id.indexOf("LoulanSelectDiv"));
        $("#" + selectid).val(value);
        //获取值之后关闭下拉框
        $("#" + selectid + "LoulanSelectDiv").slideUp(100);

        //如果用户设置了点击事件
        if(functionName != "undefined")
        {
            var methodClick = eval(functionName);
            new methodClick(value,text);
        }
    },200);
}

//鼠标在选项的上方颜色变化
function colorMark(obj) {
    var id = $(obj).attr("id");
    $(obj).addClass("myTreeSelectDivInnerDivChoseSelected");

    $("#"+id+"  .fontSpan").addClass("fontSpanSelected");
}
function colorUnMark(obj) {
    var id = $(obj).attr("id");
    $(obj).removeClass("myTreeSelectDivInnerDivChoseSelected");

    $("#"+id+"  .fontSpan").removeClass("fontSpanSelected");
}


//创建树(obj是下拉框)
function createTree(treeData,obj,num,options) {
    var id = $(obj).attr("id");

    //遍历数据
    for(var i=0;i<treeData.length;i++)
    {
        //判断当前数据是否有子数据
        if (treeData[i].children != null && treeData[i].children.length != 0) {
            //添加选项的框（父类框）
            $(obj).append("<div id='"+id+"P1_"+i+"' class='test2 myTreeSelectDivInnerDiv'>" +
                "<div id='"+id+"NewOptionChose"+i+"' class='test7 myTreeSelectDivInnerDivChose' onclick=\"selectedChose(this,'"+options.clickName+"')\" onmouseover='colorMark(this)' onmouseleave='colorUnMark(this)' ondblclick='toHandSpanClick(event,this)'>" +
                "<span class='test6' style='margin-left: "+(20*num-8.4)+"px'>" +
                "<span class='handSpan' value='"+id+"P2_"+i+"' onclick='handSpanClick(event,this)'>◥</span>" +
                "<span class='fontSpan' value='"+treeData[i][options.valueField]+"'>&nbsp;"+treeData[i][options.textField]+"</span>" +
                "</span>" +
                "</div>" +
                "</div>");
            $("#"+id+"P1_"+i).append("<div id='"+id+"P2_"+i+"' class='test3 myTreeSelectDivInnerDiv' style='display: none'></div>");

            //判断这些折叠是打开还是关闭
            if (treeData[i].state == "open")
            {
                $("#"+id+"NewOptionChose"+i+"  .handSpan").text("◢");

                $("#"+id+"P2_"+i).show();
            }

            createTree(treeData[i].children, $("#"+id+"P2_"+i),num+1,options);
        }
        else
        {
            //子类框
            $(obj).append("<div id='"+id+"NewOptionChose"+i+"' class='test7 myTreeSelectDivInnerDivChose' data='test' onclick=\"selectedChose(this,'"+options.clickName+"')\"   onmouseover='colorMark(this)' onmouseleave='colorUnMark(this)'>" +
                "<span style='margin-left: "+(20*num)+"px' class='test5 fontSpan' value='"+treeData[i][options.valueField]+"'>&nbsp;"+treeData[i][options.textField]+"</span>" +
                "</div>");

        }
    }
}


//list 转成树形json
function listToTree(list,pid,options) {
    var ret = [];//一个存放结果的临时数组
    for(var i=0;i<list.length;i++) {
        if(list[i][options.parentField] == pid) {//如果当前项的父id等于要查找的父id，进行递归
            list[i].children = listToTree(list, list[i][options.valueField],options);
            ret.push(list[i]);//把当前项保存到临时数组中
        }
    }
    return ret;//递归结束后返回结果
}
//访问获取数据
var getTreeData = function (url,obj,options) {
    var id = $(obj).attr("id");

    $.ajax({
        type: "post",
        url: url,
        dataType: "text",
        async:options.async,
        success: function (data) {
            var zNodes = eval("(" + data + ")");

            //获取select的id值
            var selectid = id.substring(0, id.indexOf("LoulanSelectDiv"));


            //添加隐藏的option选项
            for (var i=0; i<zNodes.length;i++)
            {
                $("#"+selectid).append("<option value='"+zNodes[i][options.valueField]+"' class='treeOption'>"+zNodes[i][options.textField]+"</option>");
            }
            createTree(listToTree(zNodes,0,options),obj,1,options)
        },
        error: function () {
            alert("treeSelect数据读取错误");
        }
    });
}

//mytree初始化
function myTreeInit(options,obj) {
    var id = $(obj).attr("id");

    //创建一个下拉框
    $(obj).after("<div style='width: 100%;height:auto;position: relative' >" +
        "<div id='"+id+"LoulanSelectDiv' class='test1 myTreeSelectDiv' tabindex='-1'></div>" +
        "</div>");

    //如果选项有宽度高度，设置宽度高度
    if(options.width != null) {
        $(obj).outerWidth(options.width);
        $("#"+id+"LoulanSelectDiv").outerWidth(options.width);
    }
    if (options.height != null) {
        $(obj).outerHeight(options.height);
    }

    //将原来的option隐藏//并将原来的option数据进行显示
    var selectOptions = $(obj).children("option");
    for (var i=0;i<selectOptions.length;i++)
    {
        if(options.valueHide != $(selectOptions[i]).val()) {
            $("#" + id + "LoulanSelectDiv").append("<div id='" + id + "LoulanSelectDiv" + "OldOptionChose" + i + "' class='test7 myTreeSelectDivInnerDivChose'  onclick=\"selectedChose(this,'" + options.clickName + "')\" onmouseover='colorMark(this)' onmouseleave='colorUnMark(this)'>" +
                "<span style='margin-left: " + (20 * 1) + "px' class='test5 fontSpan' value='" + $(selectOptions[i]).val() + "'>&nbsp;" + $(selectOptions[i]).text() + "</span>" +
                "</div>");
        }
        $(selectOptions[i]).addClass("treeOption")

    }

    if(options.url != null) {
        //获取json数据
        getTreeData(options.url,$("#"+id+"LoulanSelectDiv"),options);
    }


    /********************************事件区**************************************/
    //点击select打开下拉框
    $(obj).mousedown(function () {

        if( $("#"+id+"LoulanSelectDiv").css("display") == "none")
        {
            $("#"+id+"LoulanSelectDiv").slideDown(200);
            $("#"+id+"LoulanSelectDiv").focus();

        }
        else
        {
            $("#"+id+"LoulanSelectDiv").slideUp(200);
        }

        return false;
    });


    //当下拉框失去焦点，关闭下拉框
    $(".myTreeSelectDiv").focusout(function (){
        if(selectDivShowMark)
        {
            $(this).slideUp(200);
        }
    });

    /*此处转为ie浏览器设置，因为，ie子标签获取焦点付标签失去焦点，其他浏览器不会*/
    $(".myTreeSelectDiv").mouseover(function () {
        selectDivShowMark = false;
    });
    $(".myTreeSelectDiv").mouseleave(function () {
        selectDivShowMark = true;
    });

}

/*此处转为ie浏览器设置，因为，ie子标签获取焦点付标签失去焦点，其他浏览器不会*/
var selectDivShowMark = false;



//进入mytree
$.fn.myTree = function (options) {
    if (typeof options == String)
    {
        alert("方法")
    }
    else
    {
        if(options.valueField == null) {
            options.valueField = "id";
        }

        if (options.textField == null) {
            options.textField = "text";
        }

        if (options.parentField == null) {
            options.parentField = "pid";
        }

        myTreeInit(options, this);
    }
}