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
		<!-- form start -->
		<form class="am-form form-validation view-save" action="<?php echo U('Admin/Article/Save');?>" method="POST" request-type="ajax-url" request-value="<?php echo U('Admin/Article/Index');?>">
			<legend>
				<span class="fs-16">
					<?php if(empty($data['id'])): echo L('article_add_name');?>
					<?php else: ?>
						<?php echo L('article_edit_name'); endif; ?>
				</span>
				<a href="<?php echo U('Admin/Article/Index');?>" class="fr fs-14 m-t-5 am-icon-mail-reply"> <?php echo L('common_operation_back');?></a>
			</legend>
			<div class="am-form-group">
				<label><?php echo L('article_title_text');?></label>
				<div class="am-input-group am-input-group-sm">
					<input type="hidden" name="title_color" value="<?php if(!empty($data['title_color'])): echo ($data["title_color"]); endif; ?>" />
					<input type="text" name="title" placeholder="<?php echo L('article_title_text');?>" minlength="3" maxlength="60" data-validation-message="<?php echo L('article_title_format');?>" class="am-form-field am-radius" <?php if(!empty($data)): ?>value="<?php echo ($data["title"]); ?>"<?php endif; ?> <?php if(!empty($data['title_color'])): ?>style="color:<?php echo ($data["title_color"]); ?>;"<?php endif; ?> required />
					<span class="am-input-group-btn">
						<button class="am-btn am-btn-default colorpicker-submit" type="button">
							<img src="/Public/Common/Images/colorpicker.png" />
						</button>
					</span>
				</div>
			</div>
			<div class="am-form-group">
				<label><?php echo L('article_class_text');?></label>
				<select name="article_class_id" class="am-radius c-p" data-validation-message="<?php echo L('article_class_format');?>" required>
					<option value=""><?php echo L('common_select_can_choose');?></option>
					<?php if(is_array($article_class_list)): foreach($article_class_list as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>" <?php if(isset($data['article_class_id']) and $data['article_class_id'] == $v['id']): ?>selected<?php endif; ?>><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
				</select>
			</div>
			<div class="am-form-group">
				<label><?php echo L('article_jump_url_text');?></label>
				<input type="url" name="jump_url" placeholder="<?php echo L('article_jump_url_text');?>" data-validation-message="<?php echo L('article_jump_url_format');?>" class="am-radius" <?php if(!empty($data)): ?>value="<?php echo ($data["jump_url"]); ?>"<?php endif; ?> />
			</div>
			<!-- 是否启用 开始 -->
<div class="am-form-group">
	<label><?php echo L('common_view_enable_title');?></label>
	<div>
		<?php if(is_array($common_is_enable_list)): foreach($common_is_enable_list as $key=>$v): ?><label class="am-radio-inline m-r-10">
				<input type="radio" name="is_enable" value="<?php echo ($v["id"]); ?>" <?php if(isset($data['is_enable']) and $data['is_enable'] == $v['id']): ?>checked="checked"<?php else: if(!isset($data['is_enable']) and isset($v['checked']) and $v['checked'] == true): ?>checked="checked"<?php endif; endif; ?> data-am-ucheck /> <?php echo ($v["name"]); ?>
			</label><?php endforeach; endif; ?>
	</div>
</div>
<!-- 是否启用 结束 -->
			<div class="am-form-group">
				<label><?php echo L('article_content_text');?><span class="fs-12 fw-100 cr-999"><?php if(IsMobile()): ?>（<?php echo L('article_content_format_mobile');?>）<?php else: if(L('article_images_upload_format') != ''): ?>（<?php echo L('article_images_upload_format');?>）<?php endif; endif; ?></span></label>
				<textarea class="am-radius am-validate" name="content" rows="5" minlength="50" maxlength="105000" <?php if(!IsMobile()): ?>id="editor-tag" data-url="<?php echo U('Admin/Ueditor/Index', ['path_type'=>'Article']);?>" placeholder="<?php echo L('article_content_format');?>" <?php else: ?> placeholder="<?php echo L('article_content_format'); echo L('article_content_format_mobile');?>"<?php endif; ?> data-validation-message="<?php echo L('article_content_format');?>" required><?php if(!empty($data)): echo ($data["content"]); endif; ?></textarea>
			</div>
			<div class="am-form-group">
				<input type="hidden" name="id" <?php if(!empty($data)): ?>value="<?php echo ($data["id"]); ?>"<?php endif; ?>" />
				<button type="submit" class="am-btn am-btn-primary am-radius btn-loading-example am-btn-sm w100" data-am-loading="{loadingText:'<?php echo L('common_form_loading_tips');?>'}"><?php echo L('common_operation_save');?></button>
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