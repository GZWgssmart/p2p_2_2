<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2018/1/11
  Time: 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>

<head>
    <style type="text/css">
        body, html {  width: 100%;  height: 100%;  margin: 0;  font-family: "微软雅黑";}
        #allmap {  height: 300px;  width: 100%;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=  SMzETm9LifHwplyUPOI9YVl96CiPvY9B"></script>
</head>
<body>

    <div class="about-right-nav">
        <div class="sub-a-nav">
            <a href="javascript:void(0);" class="active">联系我们</a>
        </div>
        <em class="em-line"></em>
    </div>

    <div class="about-content">
        <div id="zxns" class="content">
            <!--百度地图-->
           <%-- <div class="form-group">
                <div style="margin-top: 15px" class="col-lg-2" id="allmap"></div>
                <div class="col-lg-offset-1 form-inline">
                    <a class="btn btn-primary"
                       onclick="add_scale_control();">增加比例控件</a>
                    <a class="btn btn-default" onclick="delete_scale_control()">删除比例控件</a>
                    <a class="btn btn-primary"
                       onclick="add_type_control();">增加类型控件</a>
                    <a class="btn btn-default" onclick="delete_type_control()">删除类型控件</a>
                </div>
            </div>--%>
            <div id="allmap"></div>

            <!--联系我们-->
            <div class="content-lxwm">
                <div>
                    <p class="top">联系方式</p>
                    <div class="bottom">
                        <p class="left one"></p>
                        <p class="b-r">
                            公司地址：赣州市长征大道1号中航城国际大厦10F<br>
                            公司电话： 0797-2190888<br>
                            邮政编码：341000
                        </p>
                    </div>
                </div>
                <div class="right">
                    <p class="top">客服服务</p>
                    <div class="bottom">
                        <p class="left two"></p>
                        <p class="b-r">
                            客服电话： 400-606-2079<br>
                            客服邮件：fuying.zhang@pujinziben.com<br>
                            服务时间： 周一至周六08:30-17:30
                        </p>
                    </div>
                </div>
                <div>
                    <p class="top">商务合作</p>
                    <div class="bottom">
                        <p class="left three"></p>
                        <p class="b-r" style="padding-top:16px;">
                            E-mail：yong.wen@pujinziben.com<br>
                            联系人：温先生
                        </p>
                    </div>
                </div>
                <div class="right">
                    <p class="top">关注我们</p>
                    <div class="bottom">
                        <p class="left four"></p>
                        <p class="b-r two"><img src="<%=path %>/static/images/xdp/lxwm_erwei.png"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script src="<%=path %>/static/js/our/huser/xdp/jsp/map_plugins.js"></script>
<script src="<%=path%>/static/js/jquery.min.js"></script>
</body>

<%--
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(116.331398, 39.897445), 13);
    map.enableScrollWheelZoom(true);

    // 用经纬度设置地图中心点
    function theLocation(longitude, latitude) {
        if (longitude != undefined && latitude != undefined) {
            map.clearOverlays();
            var new_point = new BMap.Point(longitude, latitude);
            var marker = new BMap.Marker(new_point);  // 创建标注
            map.addOverlay(marker);// 将标注添加到地图中
            map.panTo(new_point);
        }
    }
    theLocation(${requestScope.longitude}, ${requestScope.latitude});
</script>--%>

<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
    //添加地图类型控件
    map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));
    map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
</script>