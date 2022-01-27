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
		<!-- operation start -->
		<div class="am-g">
			<button class="am-btn am-btn-secondary am-radius am-btn-xs am-icon-plus submit-add" data-am-modal="{target: '#data-save-win'}"> <?php echo L('common_operation_add');?></button>
		</div>
		<!-- operation end -->

		<!-- save win start -->
		<div class="am-popup am-radius" id="data-save-win">
			<div class="am-popup-inner">
				<div class="am-popup-hd">
					<h4 class="am-popup-title" data-add-title="<?php echo L('link_add_name');?>" data-edit-title="<?php echo L('link_edit_name');?>"><?php echo L('link_add_name');?></h4>
					<span data-am-modal-close class="am-close">&times;</span>
				</div>
				<div class="am-popup-bd">
					<!-- form start -->
					<form class="am-form form-validation" action="<?php echo U('Admin/Link/Save');?>" method="POST" request-type="ajax-reload" request-value="">
						<div class="am-form-group">
							<label><?php echo L('link_name_text');?></label>
							<input type="text" placeholder="<?php echo L('link_name_text');?>" name="name" minlength="2" maxlength="16" data-validation-message="<?php echo L('link_name_format');?>" class="am-radius" required />
						</div>
						<div class="am-form-group">
							<label><?php echo L('link_url_text');?><span class="fs-12 fw-100 cr-999">（<?php echo L('link_url_text_tips');?>）</span></label>
							<input type="url" placeholder="<?php echo L('link_url_text');?>" name="url"  data-validation-message="<?php echo L('link_url_format');?>" class="am-radius" required />
						</div>
						<div class="am-form-group">
							<label><?php echo L('common_view_sort_title');?></label>
							<input type="number" placeholder="<?php echo L('common_view_sort_title');?>" name="sort" min="0" max="255" data-validation-message="<?php echo L('common_sort_error');?>" class="am-radius" value="0" required />
						</div>
						<!-- 是否新窗口打开 开始 -->
<div class="am-form-group">
	<label><?php echo L('common_view_is_new_window_open_title');?></label>
	<div>
		<?php if(is_array($common_is_new_window_open_list)): foreach($common_is_new_window_open_list as $key=>$v): ?><label class="am-radio-inline m-r-10">
				<input type="radio" name="is_new_window_open" value="<?php echo ($v["id"]); ?>" <?php if(isset($data['is_new_window_open']) and $data['is_new_window_open'] == $v['id']): ?>checked="checked"<?php else: if(!isset($data['is_new_window_open']) and isset($v['checked']) and $v['checked'] == true): ?>checked="checked"<?php endif; endif; ?> data-am-ucheck /> <?php echo ($v["name"]); ?>
			</label><?php endforeach; endif; ?>
	</div>
</div>
<!-- 是否新窗口打开 结束 -->
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
						<div class="am-form-group am-form-success">
							<label><?php echo L('link_describe_text');?></label>
							<textarea rows="3" maxlength="60" name="describe" class="am-radius" placeholder="<?php echo L('link_describe_text');?>" data-validation-message="<?php echo L('link_describe_format');?>"></textarea>
						</div>
						<div class="am-form-group">
							<input type="hidden" name="id" />
							<button type="submit" class="am-btn am-btn-primary am-radius btn-loading-example am-btn-sm w100" data-am-loading="{loadingText:'<?php echo L('common_form_loading_tips');?>'}"><?php echo L('common_operation_save');?></button>
						</div>
					</form>
					<!-- form end -->
				</div>
			</div>
		</div>
		<!-- save win end -->

		<!-- list start -->
		<table class="am-table am-table-striped am-table-hover am-text-middle m-t-10">
			<thead>
				<tr>
					<th><?php echo L('link_name_text');?></th>
					<th class="am-hide-sm-only"><?php echo L('link_describe_text');?></th>
					<th><?php echo L('common_view_state_title');?></th>
					<th><?php echo L('common_operation_name');?></th>
				</tr>
			</thead>
			<tbody>
				<?php if(!empty($list)): if(is_array($list)): foreach($list as $key=>$v): ?><tr id="data-list-<?php echo ($v["id"]); ?>" <?php if($v['is_enable'] == 0): ?>class="am-active"<?php endif; ?>>
							<td><?php echo ($v["name"]); ?>
								<a href="<?php echo ($v["url"]); ?>" target="_blank">
									<i class="am-icon-external-link"></i>
								</a>
							</td>
							<td class="am-hide-sm-only"><?php echo ($v["describe"]); ?></td>
							<td>
								<a href="javascript:;" class="am-icon-btn am-icon-check submit-state <?php if($v['is_enable'] == 1): ?>am-success<?php else: ?>am-default<?php endif; ?>" data-url="<?php echo U('Admin/Link/StateUpdate');?>" data-id="<?php echo ($v["id"]); ?>" data-state="<?php echo ($v['is_enable']); ?>"></a>
							</td>
							<td>
								<button class="am-btn am-btn-default am-btn-xs am-radius am-icon-edit submit-edit" data-am-popover="{content: '<?php echo L('common_operation_edit');?>', trigger: 'hover focus'}" data-am-modal="{target: '#data-save-win'}" data-json='<?php echo json_encode($v);?>'></button>
								<button class="am-btn am-btn-default am-btn-xs am-radius am-icon-trash-o submit-delete" data-url="<?php echo U('Admin/Link/Delete');?>" data-am-popover="{content: '<?php echo L('common_operation_delete');?>', trigger: 'hover focus'}" data-id="<?php echo ($v["id"]); ?>"></button>
							</td>
						</tr><?php endforeach; endif; ?>
				<?php else: ?>
					<tr><td colspan="5" class="table-no"><?php echo L('common_not_data_tips');?></td></tr><?php endif; ?>
			</tbody>
		</table>
		<!-- list end -->
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