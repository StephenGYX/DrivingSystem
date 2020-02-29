<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/25
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8">
	<title>${sessionScope.strategy.stitle}</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link rel="shortcut icon" href="">
	<meta name="viewport"
	      content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<!--[if lt IE 9]>
	<script src="lib/ie8-responsive-file-warning.js"></script>
	<![endif]-->

	<link rel="stylesheet" href="https://static.xcx.co.ltd/css/bootstrap.min.css?_v=202002251802">
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/lib/font-awesome/4.7.0/css/font-awesome.min.css?_v=202002251802">
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/lib/animate.css/3.5.2/animate.min.css?_v=202002251802">
	<link rel="stylesheet" href="https://static.xcx.co.ltd/assets/lib/Swiper/3.4.2/css/swiper.min.css?_v=202002251802"/>
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/cdn/sliderPro/1.5/css/slider-pro.min.css?_v=202002251802"/>
	<link rel="stylesheet" href="https://static.xcx.co.ltd/visual-editor/lib/marquee.css?_v=202002251802"/>
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/lib/layer/3.0.1/skin/default/layer.min.css?_v=202002251802"/>
	<link rel="stylesheet" href="https://static.xcx.co.ltd/visual-editor/css/style.css?_v=202002251802">
	<link rel="stylesheet" href="//at.alicdn.com/t/font_925836_jkocxsylryr.css">
	<link rel="stylesheet"
	      href="https://static.xcx.co.ltd/assets/lib/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css?_v=202002251802">

	<script src="https://static.xcx.co.ltd/assets/lib/jquery/3.1.1/jquery.min.js?_v=202002251802"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/bootstrap/3.3.7/js/bootstrap.min.js?_v=202002251802"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/jquery_lazyload/1.9.7/jquery.lazyload.min.js?_v=202002251802"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/wow/1.1.2/wow.min.js?_v=202002251802"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/Swiper/3.4.2/js/swiper.jquery.min.js?_v=202002251802"></script>
	<script src="https://static.xcx.co.ltd/assets/cdn/sliderPro/1.5/js/jquery.sliderPro.min.js?_v=202002251802"></script>
	<script src="https://static.xcx.co.ltd/assets/lib/layer/3.0.1/layer.js?_v=202002251802"></script>
	<script src="https://static.xcx.co.ltd/assets/cdn/laydate/laydate.js?_v=202002251802"></script>
	<script src="https://static.xcx.co.ltd/visual-editor/lib/marquee.js?_v=202002251802"></script>
	<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=8mDd90m55IFYptT4xHOPpuABYTVtjHkH"></script>
	<script type="text/javascript"
	        src="https://static.xcx.co.ltd/assets/lib/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js?_v=202002251802"></script>


	<script type="text/javascript">
	</script>
	<script type="text/javascript"
	        src="https://static.xcx.co.ltd/visual-editor/js/page.min.js?_v=202002251802"></script>
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
									<a style="" href="<%=path+"/homepage/drivingSchool"%>"><img class="gw-browse-component-content"
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
										                            href=<%=path + "/homepage/drivingSchool"%>>返回首页</a></div>
										<div class="gw-nav-cont"><a target="_self" class="gw-nav" style=""
										                            href=<%=path + "/homepage/returnSchoolJoinMain"%>>驾校加盟</a></div>
										<div class="gw-nav-cont"><a target="_self" class="gw-nav" style=""
										                            href=<%=path + "/jsp/frontlogin3.jsp"%>>用户登录</a>
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

<link rel="stylesheet" href="https://static.xcx.co.ltd/assets/css/frcss.css?_v=202002251802">
<div class="article-detail-container" id="article-detail-container">
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-xs-12 article-detail">
				<c:if test="${sessionScope.strategy !=null}">
					<h1 class="article-detail-title">${sessionScope.strategy.stitle}</h1>
					<div class="article-detail-date">
						发布日期：${sessionScope.strategy.stime}
						&nbsp; 作者 ：${sessionScope.strategy.sauthor}
						&nbsp; 浏览量：${sessionScope.strategy.sliulan}
					</div>
				</c:if>

				<div class="article-detail-content fr-element fr-view">

					${sessionScope.strategy.stext}

				</div>
<%--				<div class='article'>--%>
<%--					<div class="left">--%>
<%--						<c:if test="${sessionScope.news.jid>2}">--%>
<%--							<div class="article-url">上一篇:--%>
<%--								<a href="/article/4981"--%>
<%--								   target="_blank">${sessionScope.newsList[sessionScope.news.jid-1].jtitle}</a>--%>
<%--							</div>--%>
<%--						</c:if>--%>
<%--						<c:if test="${sessionScope.news.jid < fn:length(sessionScope.news)}">--%>
<%--							<div class="article-url">下一篇:--%>
<%--								<a href="/article/4981"--%>
<%--								   target="_blank">${sessionScope.newsList[sessionScope.news.jid+1].jtitle}</a>--%>
<%--							</div>--%>
<%--						</c:if>--%>
<%--						<div class="article-url">下一篇:<a href="/article/4933" target="_blank">通州线</a></div>--%>
<%--					</div>--%>
<%--				</div>--%>
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
				<img class="wechat-img" src="https://static.xcx.co.ltd/images/qrcode.jpg?_v=202002251802">
			</div>
			<p class="wechat-tips tips-mobile">长按屏幕识别二维码</p>
			<p class="wechat-tips tips-pc">打开手机扫描二维码</p>
		</div>
	</div>
</div>

<!-- 表单弹出窗口模态框 -->


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
	<div class="img-content"><img class="img-dialog" src="https://static.xcx.co.ltd/images/qrcode.jpg?_v=202002251802">
	</div>

</div>

<!-- 站点统计代码 -->


<div class="report-mobile report-pc report">
        <span class="copyright_span">版权所有 ©<span>                    传一驾校网
                </span></span>
	<img src="https://static.xcx.co.ltd/images/guan.png?_v=202002251802" alt="" height="17"
	     style="padding: 0 4px 0 10px;">
	<span style="font-size:12px">认证官网</span>
	<img src="https://static.xcx.co.ltd/images/ring.png?_v=202002251802" alt="" height="12" style="padding-right:4px">
	<span style="font-size:12px;cursor:pointer" id="report-click">举报反馈</span>
</div>


<!-- 任意html代码 -->

<!-- 页面级自定义代码 -->


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
	<img src="https://static.xcx.co.ltd/images/wshare.png?_v=202002251802" alt="" style="width:200px;">
</div>
<script src="//res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script type="text/javascript">
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
<script type="text/javascript" src="https://static.xcx.co.ltd/assets/js/analyst.js?_v=202002251802"></script>
<script type="text/javascript">
	_ga.url = 'https://wei.ltd.com/analyst';
	_ga.params['wi'] = '3';
	_ga.params['ui'] = '0';
	_ga.init(559);
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
					"request_id": "89a85eb2379c57dda7bb46d03d53f97d",
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
		"146303": {"index": 0, "id": 146303, "html": ""},
		"145684": {"index": 1, "id": 145684, "html": ""},
		"146304": {"index": 2, "id": 146304, "html": ""},
		"145685": {"index": 3, "id": 145685, "html": ""}
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
