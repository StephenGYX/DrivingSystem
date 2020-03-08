<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/23
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>传一驾校官网-首页</title>
	<meta name="description" content="XX驾驶学校提供优质服务，采用廉政教学，圆您一个学车梦，让学车变得更简单！">
	<meta name="keywords" content="驾驶学校  优质服务  廉政教学  学车">
	<link rel="shortcut icon" href="">
	<meta name="viewport"
	      content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<!--[if lt IE 9]>
	<script src="lib/ie8-responsive-file-warning.js"></script>
	<![endif]-->

	<link rel="stylesheet" href="https://static.xcx.co.ltd/css/bootstrap.min.css?_v=202002231700">
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/lib/font-awesome/4.7.0/css/font-awesome.min.css?_v=202002231700">
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/lib/animate.css/3.5.2/animate.min.css?_v=202002231700">
	<link rel="stylesheet" href="https://static.xcx.co.ltd/assets/lib/Swiper/3.4.2/css/swiper.min.css?_v=202002231700"/>
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/cdn/sliderPro/1.5/css/slider-pro.min.css?_v=202002231700"/>
	<link rel="stylesheet" href="https://static.xcx.co.ltd/visual-editor/lib/marquee.css?_v=202002231700"/>
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/lib/layer/3.0.1/skin/default/layer.min.css?_v=202002231700"/>
	<link rel="stylesheet" href="https://static.xcx.co.ltd/visual-editor/css/style.css?_v=202002231700">
	<link rel="stylesheet" href="//at.alicdn.com/t/font_925836_jkocxsylryr.css">
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/lib/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css?_v=202002231700">


	<script type="text/javascript" src=<%=path + "/js/jquery-3.4.1.js"%>></script>
	<script src="<%=path+"/lib/layer/layer.js"%>"></script>


	<script src="https://static.xcx.co.ltd/assets/lib/jquery/3.1.1/jquery.min.js?_v=202002231700"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/bootstrap/3.3.7/js/bootstrap.min.js?_v=202002231700"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/jquery_lazyload/1.9.7/jquery.lazyload.min.js?_v=202002231700"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/wow/1.1.2/wow.min.js?_v=202002231700"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/Swiper/3.4.2/js/swiper.jquery.min.js?_v=202002231700"></script>
	<script src="https://static.xcx.co.ltd/assets/cdn/sliderPro/1.5/js/jquery.sliderPro.min.js?_v=202002231700"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/layer/3.0.1/layer.js?_v=202002231700"></script>
	<script src="https://static.xcx.co.ltd/assets/cdn/laydate/laydate.js?_v=202002231700"></script>
	<script src="https://static.xcx.co.ltd/visual-editor/lib/marquee.js?_v=202002231700"></script>
	<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=8mDd90m55IFYptT4xHOPpuABYTVtjHkH"></script>
	<script type="text/javascript"
	        src="https://static.xcx.co.ltd/assets/lib/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js?_v=202002231700"></script>
	<script type="text/javascript">
	</script>
	<script type="text/javascript"
	        src="https://static.xcx.co.ltd/visual-editor/js/page.min.js?_v=202002231700"></script>

	<%--	置顶滚轮效果--%>
	<style>
		.wraper {
			width: 960px;
			margin: 0 auto
		}

		.top_arrow {
			border: 0 none;
			bottom: 150px;
			cursor: pointer;
			display: none;
			height: auto;
			margin: 0;
			opacity: 0.5;
			padding: 0;
			position: fixed;
			right: 40px;
			width: 35px;
			z-index: 2147483647;
		}

		.top_kefu {
			border: 0 none;
			bottom: 195px;
			cursor: pointer;
			display: none;
			height: auto;
			margin: 0;
			opacity: 0.5;
			padding: 0;
			position: fixed;
			right: 40px;
			width: 35px;
			z-index: 2147483647;
		}
	</style>
	<style>
		html, body {
			background-color: transparent;
		}

		.share {
			position: fixed;
			width: 40px;
			height: 40px;
			bottom: 120px;
			right: 10px;
			display: none;
			cursor: pointer;
			z-index: 999;
		}

		.share i {
			font-size: 40px;
		}

		.wechatShare {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			z-index: 1000;
			opacity: 0.8;
			display: none;
			background: #888888;
		}

		.browserShare {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			z-index: 1000;
			opacity: 0.7;
			display: none;
			text-align: center;
			background: #000;
		}

		.browserShare img {
			margin-top: 150px;
		}

		.dark {
			background-color: #333;
			color: #ccc !important;
		}

		.dark ul li a {
			color: #ccc;
		}

		.light {
			color: #666;
			background-color: #f5f5f5;
		}

		.light ul li a {
			color: #666;
		}

		.user-bar {
			width: 100%;
			height: 40px;
			font-size: 14px;
			display: flex;
			align-items: center;
			padding: 0 30px;
			justify-content: space-between;
		}

		.user-bar ul, .user-bar ul li a {
			display: flex;
			align-items: center;
			margin: 0;
			justify-content: center
		}

		.user-bar ul li + li {
			margin-left: 15px;
		}

		.user-bar ul li i {
			margin-right: 5px;
		}

		.user-btn {
			width: 60px;
			height: 60px;
			position: fixed;
			z-index: 999;
			top: 60%;
			right: 10px;
		}

		.user-btn img {
			width: 100%;
			height: 100%;
		}

		.share-user-phone {
			position: fixed;
			bottom: 0;
			width: 100%;
			height: 50px;
			font-size: 30px;
			z-index: 9999;
			background-color: #fffcfc;
		}

		.share-user-phone-pc {
			position: fixed;
			right: 1px;
			bottom: 200px;
			width: 240px;
			height: 50px;
			font-size: 30px;
			z-index: 9999;
			opacity: 0.8;
			border-radius: 30px 0;
			background-color: #fffcfc;
		}

		.share-user-phone i, .share-user-phone-pc i {
			font-size: 14px;
			width: 20px;
			display: flex;
			color: #fff;
			justify-content: center;
			align-items: center;
			height: 20px;
			border: 1px solid #fff;
			border-radius: 50%;
			margin-right: 10px;
		}

		.share-user-phone-content {
			width: 100%;
			height: 100%;
			background-color: #999999;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		/* 举报 */
		.report {
			height: auto;
			font-size: 14px;
			display: flex;
			justify-content: center;
			align-items: center;
			color: #a7a0a0;
			padding: 5px;
		}

		.report > * {
			line-height: 100%;
		}

		.report img {
			padding: 0 20px 0 10px;
		}

		.copyright_span {
			font-size: 12px;
			text-align: center;
			line-height: 16px;
		}

		/**/
		.mobile .animated {
			visibility: hidden;
			backface-visibility: hidden; /* 加入动画以后莫名其妙的空白 */
			-webkit-backface-visibility: hidden; /* 加入动画以后莫名其妙的空白 */
		}

		.top_bank {
			width: 100%;
			height: 40px;
			font-size: 14px;
			display: flex;
			align-items: center;
			padding: 0 30px;
			justify-content: space-between;
			background: #fff;
			border-bottom: 1px solid #e1e1e1;
		}

		.top_bank ul {
			display: flex;
			align-items: center;
			margin: 0;
			justify-content: space-between;
			color: rgba(67, 66, 93, 1);
		}

		.top_bank_left {
			width: 86px;
		}

		.top_bank_right {
			width: 68px;
		}

		.friendly_link-pc {
			width: 1170px;
		}

		.mobile .friendly_link {
			width: 100%;
		}

		.friendly_link {
			height: auto;
			font-size: 14px;
			margin: 10px auto;
			display: flex;
			align-items: flex-start;
			flex-direction: column;
		}

		.friendly_link p {
			font-weight: 600;
			font-size: 14px;
			color: #333333;
		}

		.friendly_link div {
			width: 100%;
			display: flex;
			align-items: flex-start;
			flex-direction: row;
			flex-wrap: wrap;
		}

		.friendly_link a {
			font-size: 12px;
			color: #333333;
			margin-right: 24px;
			margin-bottom: 10px;
		}

		@media (min-width: 320px) and (max-width: 768px) {
			.friendly_link-mobile {
				width: 100%;
				margin: 10px 14px;
			}

			.friendly_link p {
				font-size: 12px;
			}

			.friendly_link a {
				margin-right: 14px;
				margin-bottom: 8px;
			}
		}

	</style>
	<style>

		.gw-copyright.fixed-bottom {
			height: 120px;
			text-align: center;
			cursor: pointer;
			color: #fff;
			width: 100%;
		}

		.gw-copyright.fixed-bottom .gw-copyright-swiper {
			width: 100%;
			height: 100%;
		}

		.gw-copyright.fixed-bottom .gw-copyright-content {
			background-repeat: no-repeat;
			background-position: center center;
			width: 100%;
			height: 100%;
			/* background-color:#FFA084; */
		}

		.gw-copyright.fixed-bottom.gw-copyright-mobile {
			height: 60px;
		}

		.gw-copyright.fixed-bottom.gw-copyright-mobile .gw-copyright-content {
			background-size: contain;
		}

		.gw-copyright.fixed-bottom .gw-copyright-close-box {
			background-color: #EEEEEE;
			color: #101010;
			position: absolute;
			top: 0;
			right: 0;
		}

		.gw-copyright.fixed-bottom .gw-copyright-close {
			font-size: 1.3em;
			height: 30px;
			width: 32px;
			margin: auto 5px;
		}

		.gw-copyright.fixed-bottom.gw-copyright-mobile {
			font-size: 12px;
		}

		.gw-copyright.fixed-bottom.gw-copyright-mobile .gw-copyright-close {
			margin: auto 2px;
		}
	</style>
</head>

<body class="pc">
<%--<div>--%>
<%--	<button id="fancybox" >点击me</button>--%>
<%--</div>--%>

<input type="hidden" id="hid" value=<%=path%>>

<div class="user-bar  dark  ">
	<ul class="user-bar-left">
		<li>学车从这里开始 - 传一驾校网</li>
	</ul>
	<ul class="user-bar-right">
		<li><i class="iconfont icon-shouji1"></i>学车报名电话：0592-66666666</li>
		<li><i class="iconfont icon-huiyuan1"></i>驾校加盟电话：0592-88888888</li>
	</ul>
</div>

<!--自定义html目前不适用 2019 11 04-->
<div class="gw-browse-module " data-full="" data-fixed-position="" id="gw-module-145688" name="顶部导航"
     data-anchor-id="anchor-1500339852730-3532"
     style="background-color:rgb(255, 255, 255);background-image:url(https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-11/15101082554307.jpg);background-repeat:repeat;background-size:auto;">
	<div class="gw-browse-module-content clearfix" style="background-repeat:repeat;background-size:auto;">
		<div class="gw-grid-col grid-col-pc-12">
			<div class="gw-browse-grid" style="height:616px;">
				<div class="gw-browse-grid-content">
					<div class="gw-browse-container" style="" data-editable="0">
						<div class="gw-browse-container-content">
							<div class="images-component">
								<div class="gw-browse-component" id="module-145688-components-images-1501482126373-7364"
								     style="top:43px;left:0;width:93px;height:24px;">
									<style>
										#module-145688-components-images-1501482126373-7364 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<a style="" href="<%=path+"/homepage/drivingSchool"%>"><img
											class="gw-browse-component-content"
											style="width:93px;max-width:none;height:24px;max-height:none;opacity:1;"
											alt=""
											src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-07/15014676714704.png"/></a>
								</div>
							</div>
							<div class="nav-component">
								<div class="gw-browse-component" id="module-145688-components-nav-1501482126373-7437"
								     style="top:42px;left:479px;width:689px;height:26px;line-height:26px;">
									<style>
										#module-145688-components-nav-1501482126373-7437 .gw-nav {
											font-family: 微软雅黑;
											font-size: 16px;
											color: rgb(255, 255, 255);
											font-weight: normal;
											font-style: normal;
											text-decoration: none;
											display: inline-block;
											text-align: center;
										}

										#module-145688-components-nav-1501482126373-7437 .gw-nav-cont {
											margin-left: 25px;
											margin-right: 25px;
										}

										#module-145688-components-nav-1501482126373-7437 .gw-nav-cont-row {
											margin-left: 25px;
											margin-right: 25px;
										}

										#module-145688-components-nav-1501482126373-7437 .sec-menu {
											font-family: 微软雅黑;
											font-size: 14px;
											font-style: normal;
											font-weight: normal;
											background-color: #FFFFFF;
											color: #666666;
											height: 38px;
										}

										#module-145688-components-nav-1501482126373-7437 .menu-list {
											position: absolute;
											margin-left: 0;
										}

										#module-145688-components-nav-1501482126373-7437 .menu-list ul {
											background-color: #FFFFFF;
											line-height: 38px;
										}

										#module-145688-components-nav-1501482126373-7437 .menu-list-row {
											position: absolute;
										}

										#module-145688-components-nav-1501482126373-7437 .menu-list-row ul {
											background-color: #FFFFFF;
											line-height: 38px !important;
										}

										#module-145688-components-nav-1501482126373-7437 .menu-list-row ul li {
											margin-left: 0;
										}

										#module-145688-components-nav-1501482126373-7437 .menu-list .triangle_border_up {
											border-bottom-color: #FFFFFF;
										}

										#module-145688-components-nav-1501482126373-7437 .sec-menu a {
											color: #666666;
											text-decoration: none;
											font-weight: normal;
										}

										#module-145688-components-nav-1501482126373-7437 .gw-nav-cont:hover .gw-nav {
											font-family: 微软雅黑;
											font-size: 16px;
											color: rgb(255, 101, 54);
											font-weight: normal;
											font-style: normal;
											text-decoration: none;
											display: inline-block;
											text-align: center;
										}

										#module-145688-components-nav-1501482126373-7437 .gw-nav-cont-row:hover .gw-nav {
											font-family: 微软雅黑;
											font-size: 16px;
											color: rgb(255, 101, 54);
											font-weight: normal;
											font-style: normal;
											text-decoration: none;
											display: inline-block;
											text-align: center;
										}

										#module-145688-components-nav-1501482126373-7437 .first-nav-cont:hover .gw-nav {
											font-family: 微软雅黑;
											font-size: 16px;
											color: rgb(255, 101, 54);
											font-weight: normal;
											font-style: normal;
											text-decoration: none;
											display: inline-block;
											text-align: center;
										}

										#module-145688-components-nav-1501482126373-7437 .gw-nav-cont:hover {
											margin-left: 25px !important;
											margin-right: 25px !important;
										}

										#module-145688-components-nav-1501482126373-7437 .gw-nav-cont-row:hover {
											margin-left: 25px !important;
											margin-right: 25px !important;
										}

										#module-145688-components-nav-1501482126373-7437 .sec-menu:hover {
											background-color: #FFFFFF;
											font-size: 14px;
											height: 38px;
											font-weight: normal;
										}

										#module-145688-components-nav-1501482126373-7437 .sec-menu:hover a {
											color: #000000;
											font-family: 微软雅黑;
											font-weight: normal;
											font-style: normal;
											text-decoration: none;
										}

										#module-145688-components-nav-1501482126373-7437 .gw-nav.active {
											font-family: 微软雅黑;
											font-size: 16px;
											color: rgb(255, 101, 54);
											font-weight: normal;
											font-style: normal;
											text-decoration: none;
											display: inline-block;
											text-align: center;
										}

									</style>
									<div class="module-145688-components-nav-1501482126373-7437 gw-browse-component-content"
									     style="background-color: transparent">
										<div class="gw-nav-cont"><a target="_self" class="gw-nav" style=""
										                            href="<%=path+"/homepage/drivingSchool"%>">首页</a>
										</div>
										<div class="gw-nav-cont" id="school"><a target="_self" class="gw-nav" style=""
										                                        href="#drivingschool">品牌驾校</a></div>
										<div class="gw-nav-cont" id="news1"><a target="_self" class="gw-nav" style=""
										                                       href="#gw-module-146158">行业资讯</a></div>
										<div class="gw-nav-cont" id="exam1"><a target="_self" class="gw-nav" style=""
										                                       href="#gw-module-146157">考试攻略</a></div>
										<div class="gw-nav-cont"><a target="_self" class="gw-nav" style=""
										                            href=<%=path + "/homepage/returnSchoolJoinMain"%>>驾校加盟</a>
										</div>
										<div class="gw-nav-cont">
											<a target="_self" class="gw-nav" style="" href=<%=path+"/jsp/frontlogin3.jsp"%>>
											用户中心</a>
										</div>
									</div>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-145688-components-images-1510104488332-8608"
								     style="top:166px;left:286px;width:595px;height:347px;">
									<style>
										#module-145688-components-images-1510104488332-8608 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content"
									     style="width:595px;max-width:none;height:347px;max-height:none;opacity:1;"
									     alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-11/15101044963184.png"/>
								</div>
							</div>
							<div class="bglayer-component">
								<div class="gw-browse-component"
								     id="module-145688-components-bglayer-1510104552625-6856"
								     style="top:189px;left:308px;width:551px;height:211px;">
									<div style="width:100%;height:100%;background-color:rgba(0, 0, 0, 0.15);border-style:dashed;border-color:rgb(255, 101, 54);border-width:1px;"></div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145688-components-text-1510104653050-2439"
								     style="top:235px;left:391px;width:385px;height:39px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:36px;font-weight:normal;font-style:normal;color:rgb(255, 255, 255);background-color:transparent;line-height:36px;text-decoration:none;text-align:center;">
										<span>甄 选 驾 校  优 质 教 学</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145688-components-text-1510104728973-4032"
								     style="top:312px;left:397px;width:177px;height:47px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:42px;font-weight:bold;font-style:normal;color:rgb(255, 255, 255);background-color:transparent;line-height:42px;text-decoration:none;text-align:left;">
										<span>圆您一个</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145688-components-text-1510104784596-7846"
								     style="top:292px;left:580px;width:211px;height:69px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:64px;font-weight:normal;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:64px;text-decoration:none;text-align:left;">
										<span>学车梦</span>
									</div>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-145688-components-images-1510127209656-2963"
								     style="top:421px;left:347px;width:71px;height:44px;">
									<style>
										#module-145688-components-images-1510127209656-2963 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceInUp"
									     style="width:71px;max-width:none;height:44px;max-height:none;opacity:1;" alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-11/15101069756390.png"/>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145688-components-text-1510127230290-9473"
								     style="top:473px;left:342px;width:82px;height:26px;">
									<div class="gw-browse-component-content animated bounceInUp"
									     style="font-family:微软雅黑;font-size:18px;font-weight:normal;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>班车接送</span>
									</div>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-145688-components-images-1510127283041-9304"
								     style="top:421px;left:553px;width:71px;height:44px;">
									<style>
										#module-145688-components-images-1510127283041-9304 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceInUp"
									     style="width:71px;max-width:none;height:44px;max-height:none;opacity:1;" alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-11/15101075345002.png"/>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145688-components-text-1510127283329-8161"
								     style="top:472px;left:537px;width:103px;height:25px;">
									<div class="gw-browse-component-content animated bounceInUp"
									     style="font-family:微软雅黑;font-size:18px;font-weight:normal;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>朋友式教学</span>
									</div>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-145688-components-images-1510127312650-6564"
								     style="top:419px;left:751px;width:77px;height:47px;">
									<style>
										#module-145688-components-images-1510127312650-6564 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceInUp"
									     style="width:77px;max-width:none;height:47px;max-height:none;opacity:1;" alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-11/15101082095467.png"/>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145688-components-text-1510127312944-5531"
								     style="top:473px;left:745px;width:89px;height:25px;">
									<div class="gw-browse-component-content animated bounceInUp"
									     style="font-family:微软雅黑;font-size:18px;font-weight:normal;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>通过率高</span>
									</div>
								</div>
							</div>
							<div class="divide-component">
								<div class="gw-browse-component" id="module-145688-components-divide-1510127374117-8938"
								     style="top:444px;left:440px;width:80px;height:26px;transform:rotate(90deg);">
									<div class="gw-browse-component-content"
									     style="border-color:rgba(255, 255, 255, 0.63);border-bottom-style:dashed;border-width:1px;height:13.5px;"></div>
								</div>
							</div>
							<div class="divide-component">
								<div class="gw-browse-component" id="module-145688-components-divide-1510127410826-7494"
								     style="top:443px;left:654px;width:80px;height:26px;transform:rotate(90deg);">
									<div class="gw-browse-component-content"
									     style="border-color:rgba(255, 255, 255, 0.63);border-bottom-style:dashed;border-width:1px;height:13.5px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--自定义html目前不适用 2019 11 04-->
<div class="gw-browse-module " data-full="" data-fixed-position="" id="gw-module-146504" name="服务"
     data-anchor-id="anchor-1501485686386-4547"
     style="background-color:rgb(255, 255, 255);background-repeat:repeat;background-size:auto;">
	<div class="gw-browse-module-content clearfix" style="background-repeat:repeat;background-size:auto;">
		<div class="gw-grid-col grid-col-pc-12">
			<div class="gw-browse-grid" style="height:453px;">
				<div class="gw-browse-grid-content">
					<div class="gw-browse-container" style="" data-editable="0">
						<div class="gw-browse-container-content">
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501486117121-7058"
								     style="top:70px;left:421px;width:325px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:tahoma;font-size:28px;font-weight:bold;font-style:normal;color:rgb(204, 204, 204);background-color:transparent;line-height:28px;text-decoration:none;text-align:center;">
										<span>LEARNING PROCESS</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489117857-2503"
								     style="top:113px;left:519px;width:125px;height:31px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:26px;font-weight:normal;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>学车流程</span>
									</div>
								</div>
							</div>
							<div class="divide-component">
								<div class="gw-browse-component" id="module-146504-components-divide-1501489169006-7609"
								     style="top:115px;left:416px;width:97px;height:26px;">
									<div class="gw-browse-component-content"
									     style="border-color:rgb(238, 238, 238);border-bottom-style:solid;border-width:1px;height:13.5px;"></div>
								</div>
							</div>
							<div class="divide-component">
								<div class="gw-browse-component" id="module-146504-components-divide-1501489186640-4171"
								     style="top:115px;left:649px;width:97px;height:26px;">
									<div class="gw-browse-component-content"
									     style="border-color:rgb(238, 238, 238);border-bottom-style:solid;border-width:1px;height:13.5px;"></div>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-146504-components-images-1501489222871-1426"
								     style="top:204px;left:500px;width:165px;height:165px;">
									<style>
										#module-146504-components-images-1501489222871-1426 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:165px;max-width:none;height:165px;max-height:none;opacity:1;"
									     alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/569/2017-07/15014893022534.png"/>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-146504-components-images-1501489304448-2928"
								     style="top:203px;left:742px;width:165px;height:165px;">
									<style>
										#module-146504-components-images-1501489304448-2928 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}
									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:165px;max-width:none;height:165px;max-height:none;opacity:1;"
									     alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/569/2017-07/15014893022534.png"/>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-146504-components-images-1501489311607-9617"
								     style="top:204px;left:982px;width:165px;height:165px;">
									<style>
										#module-146504-components-images-1501489311607-9617 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:165px;max-width:none;height:165px;max-height:none;opacity:1;"
									     alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/569/2017-07/15014893022534.png"/>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-146504-components-images-1501489319135-4673"
								     style="top:203px;left:261px;width:165px;height:165px;">
									<style>
										#module-146504-components-images-1501489319135-4673 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:165px;max-width:none;height:165px;max-height:none;opacity:1;"
									     alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/569/2017-07/15014893022534.png"/>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-146504-components-images-1501489322711-2330"
								     style="top:202px;left:10px;width:165px;height:165px;">
									<style>
										#module-146504-components-images-1501489322711-2330 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:165px;max-width:none;height:165px;max-height:none;opacity:1;"
									     alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/569/2017-07/15014893022534.png"/>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489415591-7207"
								     style="top:195px;left:77px;width:34px;height:26px;">
									<div class="gw-browse-component-content "
									     style="font-family:微软雅黑;font-size:22px;font-weight:bold;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>01</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489442927-5274"
								     style="top:195px;left:327px;width:34px;height:26px;">
									<div class="gw-browse-component-content "
									     style="font-family:微软雅黑;font-size:22px;font-weight:bold;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>02</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489447472-6274"
								     style="top:195px;left:567px;width:34px;height:26px;">
									<div class="gw-browse-component-content "
									     style="font-family:微软雅黑;font-size:22px;font-weight:bold;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>03</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489450776-7424"
								     style="top:195px;left:808px;width:34px;height:26px;">
									<div class="gw-browse-component-content "
									     style="font-family:微软雅黑;font-size:22px;font-weight:bold;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>04</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489458279-2290"
								     style="top:195px;left:1047px;width:34px;height:26px;">
									<div class="gw-browse-component-content "
									     style="font-family:微软雅黑;font-size:22px;font-weight:bold;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>05</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489491418-6464"
								     style="top:269px;left:48px;width:92px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:19px;font-weight:bold;font-style:normal;color:rgb(51, 51, 51);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										驾校报名
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489516153-5763"
								     style="top:269px;left:298px;width:92px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:19px;font-weight:bold;font-style:normal;color:rgb(51, 51, 51);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										理论考试<br/>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489525697-9920"
								     style="top:269px;left:538px;width:92px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:19px;font-weight:bold;font-style:normal;color:rgb(51, 51, 51);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										驾车基础<br/>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489529706-6388"
								     style="top:269px;left:779px;width:92px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:19px;font-weight:bold;font-style:normal;color:rgb(51, 51, 51);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										路跑实践
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146504-components-text-1501489532641-9251"
								     style="top:269px;left:1019px;width:92px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:19px;font-weight:bold;font-style:normal;color:rgb(51, 51, 51);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										拿证上路
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="drivingschool">
	<%--品牌驾校--%>
	<iframe id="mainContent" style="display: none;border: medium none;" src="<%=path+"/dSchool/queryqianDSC"%>"
	        scrolling="no" width="100%" height="800px"></iframe>
</div>

<!--自定义html目前不适用 2019 11 04-->
<div class="gw-browse-module " data-full="" data-fixed-position="" id="gw-module-146158" name="新闻资讯"
     data-anchor-id="anchor-1501479054110-1648"
     style="background-color:rgb(246, 246, 246);background-repeat:repeat;background-size:auto;">
	<div class="gw-browse-module-content clearfix" style="background-repeat:repeat;background-size:auto;">
		<div class="gw-grid-col grid-col-pc-12">
			<div class="gw-browse-grid" style="height:800px;">
				<div class="gw-browse-grid-content">
					<div class="gw-browse-container" style="" data-editable="0">
						<div class="gw-browse-container-content">
							<div class="text-component">
								<div class="gw-browse-component" id="module-146158-components-text-1501479054110-6164"
								     style="top:100px;left:545px;width:160px;height:36px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:33px;font-weight:normal;font-style:normal;color:rgb(68, 68, 68);background-color:transparent;line-height:33px;text-decoration:none;text-align:left;">
										<span>新闻资讯</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146158-components-text-1501479054111-1701"
								     style="top:135px;left:548px;width:68px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:15px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<span>NEWS</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146158-components-text-1501479054111-4628"
								     style="top:94px;left:487px;width:53px;height:59px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:62px;font-weight:normal;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:62px;text-decoration:none;text-align:left;">
										<span>N</span>
									</div>
								</div>
							</div>
							<div class="article-component">
								<div class="gw-browse-component gw-dynamic-component"
								     id="module-146158-components-article-1501479106113-3181"
								     style="top:209px;left:399px;width:768px;height:520px;">
									<div class="gw-browse-component-content row">
										<c:if test="${sessionScope.newsList !=null}">
											<c:forEach items="${sessionScope.newsList}" begin="0" end="3"
											           var="newsList">
												<div class="col-xs-12 article_style_5">
													<a href="<%=path+"/homepage/queryNewsWithId/"%>${newsList.jid}"
													   target="_blank">
														<div class="article_style_5_content">
															<div class="article_date">
														<span class="article_ss"
														      style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">${newsList.jday}</span>
																<span class="article_yy"
																      style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">${newsList.jyear}</span>
																<span class="article_xiegang"
																      style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">/</span>
																<span class="article_yy"
																      style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">${newsList.jmonth}</span>
															</div>
															<div>
																<p class="article_title"
																   style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">
																		${newsList.jtitle}</p>
																<p class="article_abstract"
																   style="font-size:14px;font-family:微软雅黑;font-style:normal;color:rgb(102, 102, 102);">
																		${newsList.jabstract}
															</div>
														</div>
													</a>
												</div>
											</c:forEach>
										</c:if>


									</div>
								</div>
							</div>
							<%--							<div class="images-component">--%>
							<%--								<div class="gw-browse-component" id="module-146158-components-images-1501479541610-1449"--%>
							<%--								     style="top:760px;left:475px;width:218px;height:65px;">--%>
							<%--									<style>--%>
							<%--										#module-146157-components-images-1501479541610-1449 .gw-image-hoverShadow:hover img {--%>
							<%--											box-shadow: 0px 0px 10px 1px #ababab !important;--%>
							<%--										}--%>

							<%--									</style>--%>
							<%--									<a style="" href="<%=path+"/homepage/drivingschool"%>"><img class="gw-browse-component-content animated bounceIn"--%>
							<%--									                               style="width:218px;max-width:none;height:65px;max-height:none;opacity:1;"--%>
							<%--									                               alt=""--%>
							<%--									                               src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-07/15014675213641.png"/></a>--%>
							<%--								</div>--%>
							<%--							</div>--%>
							<div class="images-component">
								<div class="gw-browse-component" id="module-146158-components-images-1510112053349-7731"
								     style="top:210px;left:0;width:361px;height:489px;">
									<style>
										#module-146157-components-images-1510112053349-7731 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:361px;max-width:none;height:489px;max-height:none;opacity:1;"
									     alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-11/15101120619511.jpg"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--自定义html目前不适用 2019 11 04-->
<div class="gw-browse-module " data-full="" data-fixed-position="" id="gw-module-146157" name="考试攻略"
     data-anchor-id="anchor-1501479054110-1648"
     style="background-color:rgb(255, 255, 255);background-repeat:repeat;background-size:auto;">
	<div class="gw-browse-module-content clearfix" style="background-repeat:repeat;background-size:auto;">
		<div class="gw-grid-col grid-col-pc-12">
			<div class="gw-browse-grid" style="height:800px;">
				<div class="gw-browse-grid-content">
					<div class="gw-browse-container" style="" data-editable="0">
						<div class="gw-browse-container-content">
							<div class="text-component">
								<div class="gw-browse-component" id="module-146157-components-text-1501479054110-6164"
								     style="top:100px;left:545px;width:160px;height:36px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:33px;font-weight:normal;font-style:normal;color:rgb(68, 68, 68);background-color:transparent;line-height:33px;text-decoration:none;text-align:left;">
										<span>考试攻略</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146157-components-text-1501479054111-1701"
								     style="top:135px;left:548px;width:68px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:15px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<span>EXAM </span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-146157-components-text-1501479054111-4628"
								     style="top:94px;left:487px;width:53px;height:59px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:62px;font-weight:normal;font-style:normal;color:rgb(255, 101, 54);background-color:transparent;line-height:62px;text-decoration:none;text-align:left;">
										<span>E</span>
									</div>
								</div>
							</div>
							<div class="article-component">
								<div class="gw-browse-component gw-dynamic-component"
								     id="module-146157-components-article-1501479106113-3181"
								     style="top:209px;left:399px;width:768px;height:520px;">
									<div class="gw-browse-component-content row">
										<c:if test="${sessionScope.strategyList !=null}">
											<c:forEach items="${sessionScope.strategyList}" begin="0" end="3"
											           var="strategyList">
												<div class="col-xs-12 article_style_5">
													<a href="<%=path+"/homepage/queryNewsWithId/"%>${strategyList.jid}"
													   target="_blank">
														<div class="article_style_5_content">
															<div class="article_date">
														<span class="article_ss"
														      style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">${strategyList.jday}</span>
																<span class="article_yy"
																      style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">${strategyList.jyear}</span>
																<span class="article_xiegang"
																      style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">/</span>
																<span class="article_yy"
																      style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">${strategyList.jmonth}</span>
															</div>
															<div>
																<p class="article_title"
																   style="font-size:16px;font-family:微软雅黑;font-style:normal;color:rgb(51, 51, 51);">
																		${strategyList.jtitle}</p>
																<p class="article_abstract"
																   style="font-size:14px;font-family:微软雅黑;font-style:normal;color:rgb(102, 102, 102);">
																		${strategyList.jabstract}
															</div>
														</div>
													</a>
												</div>
											</c:forEach>
										</c:if>
									</div>
								</div>
							</div>
							<%--							<div class="images-component">--%>
							<%--								<div class="gw-browse-component" id="module-146157-components-images-1501479541610-1449"--%>
							<%--								     style="top:760px;left:475px;width:218px;height:65px;">--%>
							<%--									<style>--%>
							<%--										#module-146157-components-images-1501479541610-1449 .gw-image-hoverShadow:hover img {--%>
							<%--											box-shadow: 0px 0px 10px 1px #ababab !important;--%>
							<%--										}--%>

							<%--									</style>--%>
							<%--									<a style="" href="<%=path+"/homepage/drivingschool"%>"><img class="gw-browse-component-content animated bounceIn"--%>
							<%--									                               style="width:218px;max-width:none;height:65px;max-height:none;opacity:1;"--%>
							<%--									                               alt=""--%>
							<%--									                               src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-07/15014675213641.png"/></a>--%>
							<%--								</div>--%>
							<%--							</div>--%>
							<div class="images-component">
								<div class="gw-browse-component" id="module-146157-components-images-1510112053349-7731"
								     style="top:210px;left:0;width:361px;height:489px;">
									<style>
										#module-146157-components-images-1510112053349-7731 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:361px;max-width:none;height:489px;max-height:none;opacity:1;"
									     alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-11/15101120619511.jpg"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--自定义html目前不适用 2019 11 04-->
<div class="gw-browse-module " data-full="" data-fixed-position="" id="gw-module-145942" name="底部导航"
     data-anchor-id="anchor-1501469893983-8184"
     style="background-color:rgb(51, 51, 51);background-repeat:repeat;background-size:auto;">


	<div class="gw-browse-module-content clearfix" style="background-repeat:repeat;background-size:auto;">
		<div class="gw-grid-col grid-col-pc-12">
			<div class="gw-browse-grid" style="height:308px;">
				<div class="gw-browse-grid-content">
					<div class="gw-browse-container" style="" data-editable="0">
						<div class="gw-browse-container-content">
							<div class="images-component">
								<div class="gw-browse-component" id="module-145942-components-images-1501482131142-6911"
								     style="top:80px;left:143px;width:93px;height:26px;">
									<style>
										#module-145942-components-images-1501482131142-6911 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<a style="" href="<%=path+"/homepage/drivingSchool"%>"><img
											class="gw-browse-component-content animated bounceIn"
											style="width:93px;max-width:none;height:26px;max-height:none;opacity:1;"
											alt=""
											src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-07/15014676714704.png"/></a>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-145942-components-images-1501482131143-7258"
								     style="top:136px;left:120px;width:17px;height:17px;">
									<style>
										#module-145942-components-images-1501482131143-7258 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:17px;max-width:none;height:17px;max-height:none;opacity:1;" alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-07/15014675219466.png"/>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-145942-components-images-1501482131144-4388"
								     style="top:184px;left:97px;width:16px;height:16px;">
									<style>
										#module-145942-components-images-1501482131144-4388 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="width:16px;max-width:none;height:16px;max-height:none;opacity:1;" alt=""
									     src="https://uploadfile.xcx.co.ltd/uploadfile/image/0/0/559/2017-07/15014675216118.png"/>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1501482131145-6912"
								     style="top:137px;left:145px;width:132px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<span>${sessionScope.buttonlink.fixedphone}</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1501482131145-5339"
								     style="top:184px;left:123px;width:167px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<span>${sessionScope.buttonlink.worktime}</span>
									</div>
								</div>
							</div>
							<div class="divide-component">
								<div class="gw-browse-component" id="module-145942-components-divide-1501482131145-9367"
								     style="top:128px;left:309px;width:150px;height:26px;transform:rotate(90deg);">
									<div class="gw-browse-component-content"
									     style="border-color:rgb(102, 102, 102);border-bottom-style:solid;border-width:1px;height:13.5px;"></div>
								</div>
							</div>
							<div class="divide-component">
								<div class="gw-browse-component" id="module-145942-components-divide-1501482131145-9316"
								     style="top:128px;left:710px;width:150px;height:26px;transform:rotate(90deg);">
									<div class="gw-browse-component-content"
									     style="border-color:rgb(102, 102, 102);border-bottom-style:solid;border-width:1px;height:13.5px;"></div>
								</div>
							</div>
							<div class="images-component">
								<div class="gw-browse-component" id="module-145942-components-images-1501482131145-8783"
								     style="top:69px;left:920px;height:131px;">
									<style>
										#module-145942-components-images-1501482131145-8783 .gw-image-hoverShadow:hover img {
											box-shadow: 0px 0px 10px 1px #ababab !important;
										}

									</style>
									<img class="gw-browse-component-content animated bounceIn"
									     style="height:131px;max-height:none;opacity:1;" alt=""
									     src="${pageContext.request.contextPath}${sessionScope.buttonlink.workimage}"/>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1501482131145-3716"
								     style="top:205px;left:877px;width:218px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:12px;font-weight:normal;font-style:normal;color:rgb(102, 102, 102);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>扫描添加客服微信</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510119206069-6435"
								     style="top:72px;left:499px;width:49px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<span>地址：</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510119207479-4149"
								     style="top:109px;left:499px;width:49px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<span>电话：</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510119209183-4490"
								     style="top:146px;left:499px;width:49px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<a target="_blank" style="color:rgb(153, 153, 153);" href="mailto:22@22.cn"
										   class="gw-nav">邮箱：</a>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510119210683-6956"
								     style="top:183px;left:499px;width:49px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<a target="_blank" style="color:rgb(153, 153, 153);"
										   href="http://wpa.qq.com/msgrd?v=3&uin=22222&site=qq&menu=yes" class="gw-nav">QQ：
											Q：</a>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510119212251-5540"
								     style="top:72px;left:547px;width:194px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<span>${sessionScope.buttonlink.workaddress}</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510119213894-3366"
								     style="top:109px;left:547px;width:194px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<span>${sessionScope.buttonlink.mobilephone}</span>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510119215905-7030"
								     style="top:146px;left:547px;width:194px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<a target="_blank" style="color:rgb(153, 153, 153);" href="mailto:22@22.cn"
										   class="gw-nav">${sessionScope.buttonlink.workemail}</a>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510119217717-1710"
								     style="top:183px;left:547px;width:194px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:left;">
										<a target="_blank" style="color:rgb(153, 153, 153);"
										   href="http://wpa.qq.com/msgrd?v=3&uin=22222&site=qq&menu=yes"
										   class="gw-nav">${sessionScope.buttonlink.workQQ}</a>
									</div>
								</div>
							</div>
							<div class="text-component">
								<div class="gw-browse-component" id="module-145942-components-text-1510120011272-8312"
								     style="top:270px;left:339px;width:489px;height:26px;">
									<div class="gw-browse-component-content animated bounceIn"
									     style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;color:rgb(153, 153, 153);background-color:transparent;line-height:26px;text-decoration:none;text-align:center;">
										<span>Copyright © 2020,www.cykjgroup.com,All rights reserved 版权所有</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 微信弹出二维码模态框 -->
<div class="modal fade gw-modal wechatModal" id="myWechatModal" tabindex="-1" role="dialog">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
	</button>
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<img class="wechat-img" src="${pageContext.request.contextPath}${sessionScope.buttonlink.workimage}">
			</div>
			<p class="wechat-tips tips-mobile">长按屏幕识别二维码</p>
			<p class="wechat-tips tips-pc">打开手机扫描二维码</p>
		</div>
	</div>
</div>

<!-- 视频弹出窗口播放模态框 -->
<div class="modal fade gw-modal videoModal" id="myVideoModal" tabindex="-1" role="dialog">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
	</button>
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<iframe class="video-iframe" frameborder="0" allowfullscreen=""></iframe>
			</div>
		</div>
	</div>
</div>

<!-- 图片弹出模态框 -->
<div class="imageModal">
	<div class="img-content"><img class="img-dialog" src="<%=path+"/images/QRcode.jpg"%>">
	</div>

</div>

<div class="report-mobile report-pc report">
        <span class="copyright_span">版权所有 ©<span>                    传一驾校网
                </span></span>
	<img src="https://static.xcx.co.ltd/images/guan.png?_v=202002231700" alt="" height="17"
	     style="padding: 0 4px 0 10px;">
	<span style="font-size:12px">认证官网</span>
	<img src="https://static.xcx.co.ltd/images/ring.png?_v=202002231700" alt="" height="12" style="padding-right:4px">
	<span style="font-size:12px;cursor:pointer" id="report-click">举报反馈</span>
</div>

<!-- 友链 -->

<!-- 分享 -->
<div class="share">
	<i class="iconfont icon-fenxiang"></i>
</div>
<div class="share-phone">
	<span></span>
</div>
<div class="wechatShare">
	<img src="" alt="" style="width:100%;">
</div>
<div class="browserShare">
	<img src="https://static.xcx.co.ltd/images/wshare.png?_v=202002231700" alt="" style="width:200px;">
</div>
<script src="//res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script src="<%=path+"/js/drivinghomepage.js"%>" charset="utf-8"></script>

<script type="text/javascript">
	$(document).ready(function () {
		$("#mainContent").css('display', 'block');
	});
</script>

<script type="text/javascript">

	$("#school").on("click", function () {
		$("html,body").animate({scrollTop: $("#drivingschool").offset().top}, 1000);
	});

	$("#exam1").on("click", function () {
		$("html,body").animate({scrollTop: $("#gw-module-146157").offset().top}, 1000);
	});

	$("#news1").on("click", function () {
		$("html,body").animate({scrollTop: $("#gw-module-146158").offset().top}, 1000);
	});

	$(function () {
		var shareImg = ''
		var config = {}
		var websiteTitle = ''
		var websiteLogo = ''
		var description = ''
		var uid = ''
		$(function () {
			$('[data-toggle="popover"]').popover()
			getWebsiteInfo()
			$('.share').on('click', function () {
				share()
			})
			$('.browserShare').on('click', function () {
				$('.browserShare').css('display', 'none')
			})

			$('.wechatShare').on('click', function () {
				$('.wechatShare').css('display', 'none')
			})
			$('#report-click').on('click', function () {
				location.href = '/report'
			})
		})

		// 获取微信config
		function getWechatInfo() {
			$.ajax({
				url: '/gzh/self/jsInfo',
				headers: {
					"Gw-Shop-User-Token": window.localStorage.getItem("GwShopUserToken")
				},
				data: {
					url: window.location.href
				},
				type: 'get',
				success: function (res) {
					if (res.code === 0) {
						config = JSON.parse(res.data.jsInfo)
						wechatShare()
					}
				}
			})
		}

		function getUserInfo() {
			var token = window.localStorage.getItem("GwShopUserToken") ? window.localStorage.getItem("GwShopUserToken") : ''
			if (token) {
				$.ajax({
					url: '/shop/frontend/share/isshare',
					headers: {
						"Gw-Shop-User-Token": token
					},
					dataType: 'json',
					type: 'get',
					success: function (res) {
						if (res.code === 0) {
							if (res.data.is_share == 1) {
								//开启分享
								shareImg = res.data.share_url
								$('.share').css('display', 'block')
								getWechatInfo()
							} else {
								$('.share').css('display', 'none')
							}
						}
					}
				})
			}
		}

		function getWebsiteInfo() {
			$.ajax({
				url: '/shop/user/me/getProfile',
				type: 'get',
				success: function (res) {
					if (res.code == 0) {
						uid = res.data.u_id
						websiteLogo = res.data.website.company_logo.url
						websiteTitle = res.data.website.name
						description = res.data.tdk.description
						getUserInfo()
					}
				}
			})
		}

		// function share() {
		// 	let browser = {
		// 		versions: (function () {
		// 			let u = navigator.userAgent
		// 			return {
		// 				// 移动终端浏览器版本信息
		// 				trident: u.indexOf('Trident') > -1, // IE内核
		// 				presto: u.indexOf('Presto') > -1, // opera内核
		// 				webKit: u.indexOf('AppleWebKit') > -1, // 苹果、谷歌内核
		// 				gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') === -1, // 火狐内核
		// 				mobile: !!u.match(/AppleWebKit.*Mobile.*/), // 是否为移动终端
		// 				ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), // os终端
		// 				android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, // android终端或uc浏览器
		// 				iPhone: u.indexOf('iPhone') > -1, // 是否为iPhone或者QQHD浏览器
		// 				iPad: u.indexOf('iPad') > -1, // 是否iPad
		// 				webApp: u.indexOf('Safari') === -1 // 是否web应该程序，没有头部与底部
		// 			}
		// 		})(),
		// 		language: (navigator.browserLanguage || navigator.language).toLowerCase()
		// 	}
		// 	if (browser.versions.mobile) { // 判断是否是移动设备打开
		// 		let ua = navigator.userAgent.toLowerCase() // 获取判断用的对象
		// 		if (ua.match(/MicroMessenger/i) == 'micromessenger' || ua.match(/WeiBo/i) == 'weibo') {
		// 			$('.wechatShare img').attr('src', '/images/wshare.png')
		// 			$('.wechatShare').css('display', 'block')
		// 		} else if (ua.match(/QQ/i) == 'qq') {
		// 			$('.wechatShare img').attr('src', '/images/wshare.png')
		// 			$('.wechatShare').css('display', 'block')
		// 		} else {
		// 			$('.browserShare img').attr('src', shareImg)
		// 			$('.browserShare').css('display', 'block')
		// 		}
		// 	} else {
		// 		// 否则就是PC浏览器打开
		// 		$('.browserShare img').attr('src', shareImg)
		// 		$('.browserShare').css('display', 'block')
		// 	}
		// }

		function wechatShare() {
			wx.config({
				debug: config.debug, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				appId: config.appId, // 必填，公众号的唯一标识
				timestamp: config.timestamp, // 必填，生成签名的时间戳
				nonceStr: config.nonceStr, // 必填，生成签名的随机串
				signature: config.signature, // 必填，签名
				jsApiList: config.jsApiList // 必填，需要使用的JS接口列表
			})
			wx.ready(function () { // 需在用户可能点击分享按钮前就先调用
				wx.updateAppMessageShareData({
					title: websiteTitle, // 分享标题
					desc: description, // 分享描述
					link: 'http://' + location.host + '/?u=' + uid, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
					imgUrl: websiteLogo // 分享图标
				})
				wx.onMenuShareAppMessage({
					title: websiteTitle, // 分享标题
					desc: description, // 分享描述
					link: 'http://' + location.host + '/?u=' + uid, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
					imgUrl: websiteLogo, // 分享图标
					type: '', // 分享类型,music、video或link，不填默认为link
					dataUrl: '' // 如果type是music或video，则要提供数据链接，默认为空
				})
				wx.onMenuShareQQ({
					title: websiteTitle, // 分享标题
					desc: description, // 分享描述
					link: 'http://' + location.host + '/?u=' + uid, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
					imgUrl: websiteLogo // 分享图标
				})
			})
		}
	});

</script>
<!-- 官网统计代码 -->
<script type="text/javascript" src="https://static.xcx.co.ltd/assets/js/analyst.js?_v=202002231700"></script>
<%--<script>--%>
<%--	var mainContent = document.getElementById('mainContent');--%>
<%--	<!-- 指定所展示url -->--%>
<%--	mainContent.src = "";--%>
<%--</script>--%>
<script type="text/javascript">
	_ga.url = 'https://wei.ltd.com/analyst';
	_ga.params['wi'] = '3';
	_ga.params['ui'] = '0';
	_ga.init(559);
</script>


<script type="text/javascript">
	$(function () {
		var $img = $('<img alt="Top_arrow" class="top_arrow" id="top_arrow" src="<%=path+"/images/top.png"%>" />');
		$("body").append($img);
		$(window).scroll(
			function () {
				$(window).scrollTop() > 20 ? $img.fadeIn(400) : $img.fadeOut(400)
			});
		$("body, html").scroll(
			function () {
				$("body,html").scrollTop() > 20 ? $img.fadeIn(400) : $img.fadeOut(400)
			});
		$img.click(
			function () {
				$("body,html").animate({scrollTop: 0}, 400);
			});

		$("#top_arrow").hide(),
			$(window).scroll(
				function () {
					$(window).scrollTop() > 20 ? $("#top_arrow").fadeIn(400) : $("#top_arrow").fadeOut(400)
				}),
			$("body, html").scroll(
				function () {
					$("body,html").scrollTop() > 20 ? $("#top_arrow").fadeIn(400) : $("#top_arrow").fadeOut(400)
				}),
			$("#top_arrow").click(
				function () {
					$("body,html").animate({scrollTop: 0}, 400);
				})

	});
</script>

<script type="text/javascript">
	$(function () {
		var $img = $('<img alt="top_kefu" class="top_kefu" id="top_kefu" src="<%=path+"/images/kefu.png"%>" />');
		$("body").append($img);
		$(window).scroll(
			function () {
				$(window).scrollTop() > 20 ? $img.fadeIn(400) : $img.fadeOut(400)
			});
		$("body, html").scroll(
			function () {
				$("body,html").scrollTop() > 20 ? $img.fadeIn(400) : $img.fadeOut(400)
			});
		$img.click(
			function () {
				// $("body,html").animate({scrollTop:0},400);
			});

		$("#top_kefu").hide(),
			$(window).scroll(
				function () {
					$(window).scrollTop() > 20 ? $("#top_kefu").fadeIn(400) : $("#top_kefu").fadeOut(400)
				}),
			$("body, html").scroll(
				function () {
					$("body,html").scrollTop() > 20 ? $("#top_kefu").fadeIn(400) : $("#top_kefu").fadeOut(400)
				}),
			$("#top_kefu").click(
				function () {

					layer.open({
						type: 2,
						area: ['42%', '95%'],
						title: false,
						offset: '20px',
						shadeClose: true,
						scrollbar: true,
						content: ['returnChattest'],
						// success: function (layero, index) {
						// 	var iframe = window['layui-layer-iframe' + index];
						// 	iframe.selectinfo(data);
						// }
					});
				})
	});
</script>

<script>
	function GetQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) return unescape(r[2]);
		return null;
	}

	var url = window.location.href
	if (url.indexOf("?") != -1) {
		var id = GetQueryString('recommend')
		localStorage.setItem("recommend_id", id)
	}
	if (localStorage.getItem('GwShopUserToken')) {
		$('.user-btn').attr('href', '/shop/#/user')
	}
</script>

<script>
	if ('WebSocket' in window) {
		var url = 'wss://ws.ltd.com/9051';
		socket = new WebSocket(url);
		socket.onopen = function () {
			var gmac = _ga.getCookie('gmac');
			socket.send(JSON.stringify({
				"cmd": "hello",
				"params": {
					"referer": window.location.href,
					"gmac": gmac ? gmac : '',
					"request_id": "d7d7972bcd977772bf67aecb7443bf02",
					"website_id": "559"
				}
			}));

			if (!gmac) {
				//ga的cookie还没来得及设置，延迟再发一次hello
				setTimeout(function () {
					socket.send(JSON.stringify({
						"cmd": "hello",
						"params": {
							"gmac": _ga.getCookie('gmac'),
						}
					}));
				}, 1000);
			}

			setInterval(function () {
				socket.send(JSON.stringify({
					"cmd": "ping"
				}));
			}, 30000);
		}

		$('a').on('click', function () {
			//记录浏览器跳转
			socket.send(JSON.stringify({
				"cmd": "jump",
				"params": {
					"href": $(this).attr('href'),
				}
			}));
		}).on('mousedown', function (e) {
			if (e.button === 1) {
				//中键打开新页面，click时间获取不到
				socket.send(JSON.stringify({
					"cmd": "jump",
					"params": {
						"href": $(this).attr('href'),
					}
				}));
			}
		})
	}

</script>
<script>
	var _data = {
		"145688": {"index": 0, "id": 145688, "html": ""},
		"465608": {"index": 1, "id": 465608, "html": ""},
		"145939": {"index": 2, "id": 145939, "html": ""},
		"145940": {"index": 3, "id": 145940, "html": ""},
		"465948": {"index": 4, "id": 465948, "html": ""},
		"146125": {"index": 5, "id": 146125, "html": ""},
		"146157": {"index": 6, "id": 146157, "html": ""},
		"145942": {"index": 7, "id": 145942, "html": ""},
		"145687": {"index": 8, "id": 145687, "html": ""}
	};
	for (var item in _data) {
		//请求module的html的值 将less 转成css
		if (_data[item].html) {
			// //塞入当前模块即时生效
			$("#gw-module-" + _data[item].id).append(" <style> " + _data[item].html + "</style>");
		}
	}

	$('.laydate-year').each(function () {
		laydate.render({
			elem: this
			, zIndex: '198910161'
			, theme: '#49A7E0'
		});
	});

	$('.laydate-year-range').each(function () {
		laydate.render({
			elem: this
			, range: true
			, zIndex: '198910161'
			, theme: '#49A7E0'
			, ready: function () {
				if (window.screen.width <= 480) {
					var top = '50px';
					if (window.screen.height < 600) {
						top = '-5px';
						$('.layui-laydate-content').css({padding: '5px 10px'})
					}
					$('.layui-laydate-range').css({left: '50%', top: top, marginLeft: '-137px', width: '250px'});
					$('.layui-laydate-main').css({display: 'block'})
				}
			}
		});
	});

	$('.gw-copyright-close-box').on('click', function () {
		$('.gw-copyright').addClass('hidden');
	});
	//底部广告幻灯片
	new Swiper('.swiper-container.gw-copyright-swiper', {
		effect: 'fade',
		autoplay: 3000,//可选选项，自动滑动
		loop: true
	})

</script>

</body>
</html>

