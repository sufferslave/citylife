<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>发布信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <style>
        /* 新增弹窗专属样式，不覆盖原有样式 */
        .tip-modal{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            background: #fff;
            padding: 24px 40px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.2);
            z-index: 9999;
            display: none;
            color: #2f6fad;
            font-size: 16px;
        }
    </style>
</head>
<body>
<%-- 新增弹窗容器，页面最顶部追加，原有页面结构不变 --%>
<div class="tip-modal" id="successTip">
    发布成功！信息等待管理员审核，5秒后自动跳转首页
</div>

<div class="header">
    <h1>都市生活网站</h1>
    <div class="nav">
        <a href="${pageContext.request.contextPath}/index">首页</a >
        <a href="${pageContext.request.contextPath}/category">分类信息</a >
        <a href="${pageContext.request.contextPath}/publish">发布信息</a >
        <a href="${pageContext.request.contextPath}/admin/index">后台管理</a >
    </div>
</div>

<div class="publish-container">
    <div class="publish-card">
        <h2>发布生活信息</h2>
        <form id="publishForm" action="${pageContext.request.contextPath}/publish" method="post">
            <div class="form-item">
                <label>信息分类：</label>
                <select name="infoType" id="infoType" required>
                    <option value="">请选择分类</option>
                    <option value="1">招聘信息</option>
                    <option value="2">培训信息</option>
                    <option value="3">房屋信息</option>
                    <option value="4">求购信息</option>
                    <option value="5">招商引资</option>
                    <option value="6">公寓信息</option>
                    <option value="7">求职信息</option>
                    <option value="8">家教信息</option>
                    <option value="9">车辆信息</option>
                    <option value="10">出售信息</option>
                    <option value="11">寻找启示</option>
                </select>
            </div>

            <div class="form-item">
                <label>标题</label>
                <input type="text" name="infoTitle" id="infoTitle" required maxlength="40">
                <span class="word-tip">标题最多40字符</span>
            </div>

            <div class="form-item">
                <label>联系人</label>
                <input type="text" name="infoLinkman" id="infoLinkman" required>
            </div>

            <div class="form-item">
                <label>联系电话</label>
                <input type="text" name="infoPhone" id="infoPhone" maxlength="11">
            </div>

            <div class="form-item">
                <label>邮箱</label>
                <input type="email" name="infoEmail" id="infoEmail">
            </div>

            <div class="form-item">
                <label>信息内容</label>
                <textarea name="infoContent" id="infoContent" maxlength="1000"></textarea>
                <span class="word-tip">内容最多1000字符</span>
            </div>

            <div class="button-group">
                <button type="submit" onclick="return checkSubmit()">提交发布</button>
                <a href="${pageContext.request.contextPath}/index">返回首页</a >
            </div>
        </form>
    </div>
</div>

<script>
    // 表单校验函数（复用common.js公共校验方法）
    function checkSubmit(){
        let typeVal = document.getElementById("infoType").value;
        let titleVal = document.getElementById("infoTitle").value;
        let linkmanVal = document.getElementById("infoLinkman").value;
        let phoneVal = document.getElementById("infoPhone").value;
        let contentVal = document.getElementById("infoContent").value;

        if(!Common.checkEmpty(typeVal,"请选择信息分类")) return false;
        if(!Common.checkEmpty(titleVal,"标题不能为空")) return false;
        if(titleVal.length > 40){
            alert("标题不能超过40个字符");
            return false;
        }
        if(!Common.checkEmpty(linkmanVal,"联系人不能为空")) return false;
        if(!Common.checkEmpty(phoneVal,"联系电话不能为空")) return false;
        if(!Common.checkEmpty(contentVal,"信息内容不能为空")) return false;
        if(contentVal.length > 1000){
            alert("内容不能超过1000个字符");
            return false;
        }

        // 校验通过，弹出成功弹窗
        const tipDom = document.getElementById("successTip");
        tipDom.style.display = "block";

        // 5秒后允许表单提交，后端自动跳转首页
        setTimeout(()=>{
            document.getElementById("publishForm").submit();
        },5000);

        // 阻止立即提交，等待5秒倒计时
        return false;
    }
</script>
</body>
</html>