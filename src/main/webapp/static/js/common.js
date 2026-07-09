/**
 * 全局公共JS common.js
 * 统一页面跳转、参数获取、表单校验、空状态处理
 */
(function () {
    window.Common = {
        // 页面跳转统一封装
        jump: function (url, params) {
            let targetUrl = url;
            // 拼接参数
            if (params && typeof params === 'object') {
                const arr = [];
                for (let key in params) {
                    arr.push(`${key}=${encodeURIComponent(params[key])}`);
                }
                if (arr.length > 0) {
                    targetUrl += '?' + arr.join('&');
                }
            }
            location.href = targetUrl;
        },

        // 获取地址栏URL参数
        getUrlParam: function (name) {
            const reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            const r = window.location.search.substr(1).match(reg);
            if (r != null) return decodeURIComponent(r[2]);
            return null;
        },

        // 通用表单非空校验
        checkEmpty: function (val, tipText) {
            if (!val || val.trim() === '') {
                alert(tipText || '输入内容不能为空');
                return false;
            }
            return true;
        },

        // 切换无数据空白提示显示/隐藏
        toggleEmptyTip: function (emptyDom, dataListDom, hasData) {
            if (hasData) {
                emptyDom.style.display = 'none';
                dataListDom.style.display = 'block';
            } else {
                emptyDom.style.display = 'block';
                dataListDom.style.display = 'none';
            }
        },

        // 快速返回首页
        backIndex: function () {
            this.jump('front/index.jsp');
        }
    };
})();