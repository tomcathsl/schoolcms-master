<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta charset="<?php echo C('DEFAULT_CHARSET');?>" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1">
	<title><?php echo L('common_site_title');?></title>
	<link rel="stylesheet" type="text/css" href="/Public/Common/Lib/assets/css/amazeui.css" />
	<link rel="stylesheet" type="text/css" href="/Public/Common/Lib/amazeui-switch/amazeui.switch.css" />
	<link rel="stylesheet" type="text/css" href="/Public/Common/Lib/amazeui-chosen/amazeui.chosen.css" />
	<link rel="stylesheet" type="text/css" href="/Public/Common/Css/Common.css" />
	<link rel="stylesheet" type="text/css" href="/Public/Admin/<?php echo ($default_theme); ?>/Css/Common.css" />
	<?php if(!empty($module_css)): ?><link rel="stylesheet" type="text/css" href="/Public/<?php echo ($module_css); ?>" /><?php endif; ?>
</head>
<body>

<!-- right content start  -->
<div class="content-right">
	<div class="content">
		<!-- nav start -->
		<ul class="am-nav am-nav-pills table-nav">
	<li <?php if($view_type == 'home'): ?>class="am-active"<?php endif; ?>>
		<a href="<?php echo U('Admin/Theme/Index', ['view_type'=>'home']);?>"><?php echo L('theme_nav_home');?></a>
	</li>
	<li <?php if($view_type == 'upload'): ?>class="am-active"<?php endif; ?>>
		<a href="<?php echo U('Admin/Theme/Index', ['view_type'=>'upload']);?>"><?php echo L('theme_nav_upload');?></a>
	</li>
</ul>
		<!-- nav end -->
		<!-- form start -->
		<form class="am-form form-validation view-save m-t-10" action="<?php echo U('Admin/Theme/Upload');?>" method="POST" request-type="ajax-url" request-value="<?php echo U('Admin/Theme/Index');?>" enctype="multipart/form-data">
			<input type="hidden" name="max_file_size" value="<?php echo MyC('home_max_limit_file', 51200000, true);?>" />
			<div class="am-form-group am-form-file">
				<button type="button" class="am-btn am-btn-default am-btn-sm am-radius">
				<i class="am-icon-cloud-upload"></i> <?php echo L('common_select_file_text');?></button>
				<input type="file" name="theme" multiple data-validation-message="<?php echo L('common_select_file_tips');?>" required />
				<span class="tips fs-12"><?php echo L('theme_upload_tips');?></span>
				<div id="form-theme-tips"></div>
			</div>
			<div class="am-form-group">
				<button type="submit" class="am-btn am-btn-primary am-radius btn-loading-example am-btn-sm" data-am-loading="{loadingText:'<?php echo L('common_upload_loading_tips');?>'}"><?php echo L('common_operation_upload');?></button>
			</div>
		</form>
		<!-- form end -->
	</div>
</div>
<!-- right content end  -->

<!-- footer start -->
<!-- commom html start -->
<!-- delete html start -->
<div class="am-modal am-modal-confirm" tabindex="-1" id="common-confirm-delete">
	<div class="am-modal-dialog am-radius">
		<div class="am-modal-bd"><?php echo L('common_delete_tips');?></div>
		<div class="am-modal-footer">
			<span class="am-modal-btn" data-am-modal-cancel><?php echo L('common_operation_cancel');?></span>
			<span class="am-modal-btn" data-am-modal-confirm><?php echo L('common_operation_confirm');?></span>
		</div>
	</div>
</div>
<!-- delete html end -->
<!-- commom html end -->
</body>
</html>

<!-- 类库 -->
<script type="text/javascript" src="/Public/Common/Lib/jquery/jquery-2.1.0.js"></script>
<script type="text/javascript" src="/Public/Common/Lib/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="/Public/Common/Lib/echarts/echarts.min.js"></script>

<!-- ueditor 编辑器 -->
<script type="text/javascript" src="/Public/Common/Lib/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/Public/Common/Lib/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/Public/Common/Lib/ueditor/lang/zh-cn/zh-cn.js"></script>

<!-- 颜色选择器 -->
<script type="text/javascript" src="/Public/Common/Lib/colorpicker/jquery.colorpicker.js"></script>

<!-- 元素拖拽排序插件 -->
<script type="text/javascript" src="/Public/Common/Lib/dragsort/jquery.dragsort-0.5.2.min.js"></script>

<!-- amazeui插件 -->
<script type="text/javascript" src="/Public/Common/Lib/amazeui-switch/amazeui.switch.min.js"></script>
<script type="text/javascript" src="/Public/Common/Lib/amazeui-chosen/amazeui.chosen.min.js"></script>

<!-- 项目公共 -->
<script type="text/javascript" src="/Public/Common/Js/Common.js"></script>

<!-- 控制器 -->
<?php if(!empty($module_js)): ?><script type="text/javascript" src="/Public/<?php echo ($module_js); ?>"></script><?php endif; ?>
<!-- footer end -->