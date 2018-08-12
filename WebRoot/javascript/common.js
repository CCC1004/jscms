window.YWT = window.YWT || {};
window.YWT_COMMON = (function ($) {
    var tool = {
        init: function () {
            window.charts = [];
            this.icheck($(".JS-icheck-radio"));
            this.tab($(".JS-tab"));
            this.datepicker($('.JS-datepicker'));
            this.checkAll();
            this.menuOnOff();
        },
        icheck: function (e, options) {
            var def = {
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_flat-blue'
            }
            var settings = $.extend({}, def, options || {});
            return e.iCheck(settings);
        },
        tab: function (e, options) {
            var def = {
                activeClass: "active",
                childItem: ".tab-item",
                tabContent: ".JS-tab-content"
            }
            var s = $.extend({}, def, options || {});
            var c = e.next(s.tabContent);
            e.find(s.childItem).off("click").on("click", function () {
                var self = $(this);
                var id = self.data("href");
                $(id).show().siblings().hide();
                if (self.hasClass(s.activeClass)) return;
                self.addClass(s.activeClass);
                self.siblings(s.childItem).removeClass(s.activeClass);
            });
        },
        echart: function (el, options) {
            var def = {
                calculable: true,
                color: ['#fdb984', '#5eb2ed', '#b6a3dc', '#39c7c8', '#d67b81',
                    '#ff69b4', '#ba55d3', '#cd5c5c', '#ffa500', '#40e0d0',
                    '#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
                    '#6b8e23', '#ff00ff', '#3cb371', '#b8860b', '#30e0e0'
                ],
                title: {
                    textStyle: {
                        fontSize: 18,
                        fontWeight: 'lighter',
                        color: '#444'
                    }
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        lineStyle: {
                            color: '#348eed',
                            width: 1,
                            type: 'solid'
                        },
                    }
                },
                calculable: true,
            };
            var chart = echarts.init(el.get(0));
            chart.setOption($.extend(true, {}, def, options));
            return chart;
        },
        datepicker: function (el, options) {
            var def = {
                language: "zh-CN",
                calendarWeeks: true,
                autoclose: true,
                todayHighlight: true
            }
            var settings = $.extend({}, def, options || {});
            if (!el.datepicker) return;
            return el.datepicker(settings);
        },
        checkAll: function (options) {
            var def = {
                all: $("input.JS-check-all"),
                item: $("input.JS-check-item"),
            }
            var settings = $.extend({}, def, options || {});
            var all = settings.all;
            var item = settings.item;
            var allStatus = false;

            item.on('ifChanged', function (event) {
                var self = $(this);
                if (!self.is(':checked')) {
                    allStatus = false;
                    all.iCheck('uncheck')
                } else {
                    if (allChecked(item)) {
                        allStatus = true;
                        all.iCheck('check')
                    }
                }
            });

            all.on("ifChecked", function () {
                item.iCheck("check")
            }).on("ifUnchecked", function () {
                if (!allStatus) return;
                item.iCheck("uncheck")
            });

            function allChecked(item) {
                var status = true;
                item.each(function () {
                    var self = $(this)
                    if (!self.is(":checked")) {
                        status = false;
                        return false;
                    }
                });
                return status;
            }
        },
        menuOnOff: function(){
            var that = this;
            var control = $(".JS-menu-control");
            control.off("click").on("click",function(){
                var self = $(this);
                self.toggleClass("glyphicon-chevron-right");
                setTimeout(function(){
                    that.chartsObj();
                },100);
                $("html").toggleClass("ywt-system-full");
            })
        },
        chartsObj: function(){
            for(var i=0;i<window.charts.length;i++){
                window.charts[i].reflow();
            }
        }
    }

    tool.init();
    return tool;

})(jQuery || window.jquery)