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

		<!-- list start -->
		<?php if(!empty($data)): ?><ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-bordered data-list" data-am-gallery="{}" data-select-url="<?php echo U('Admin/Theme/Save');?>">
				<?php if(is_array($data)): foreach($data as $key=>$v): ?><li id="data-list-<?php echo ($v["theme"]); ?>">
						<div class="am-gallery-item am-radius <?php if($v['theme'] == $theme): ?>theme-active<?php endif; ?>">
							<a href="javascript:;" class="select-theme" data-theme="<?php echo ($v["theme"]); ?>">
								<img src="<?php echo ($v["preview"]); ?>" alt="<?php echo ($v["name"]); ?>" />
							</a>
							<div class="am-gallery-item-bottom">
								<h3 class="am-gallery-title">
									<?php echo ($v["name"]); ?>
									<a href="javascript:;" class="am-icon-trash-o fr submit-delete" data-url="<?php echo U('Admin/Theme/Delete');?>" data-id="<?php echo ($v["theme"]); ?>"></a>
								</h3>
								<div class="am-gallery-desc"><?php echo L('theme_author_text');?>
									<?php if(empty($v['home'])): echo ($v["author"]); ?>
									<?php else: ?>
										<a href="<?php echo ($v["home"]); ?>" target="_blank"><?php echo ($v["author"]); ?></a><?php endif; ?>
								</div>
								<div class="am-gallery-desc"><?php echo L('theme_ver_text'); echo ($v["ver"]); ?></div>
							</div>
						</div>
					</li><?php endforeach; endif; ?>
			<ul>
		<?php else: ?>
			null---<?php endif; ?>
		<!-- lis end -->
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