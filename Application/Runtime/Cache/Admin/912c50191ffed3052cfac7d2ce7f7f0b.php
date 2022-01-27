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

<!-- module start -->
<div class="am-popup am-radius" id="layout-module-win" data-tag="">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title"><?php echo L('view_module_edit_title');?></h4>
			<span data-am-modal-close class="am-close">&times;</span>
		</div>
		<div class="am-popup-bd">
			<form class="am-form am-form-horizontal form-validation article-form" action="<?php echo U('Admin/View/GetLayoutModuleData');?>" method="POST" request-type="ajax-fun" request-value="LayoutModuleView">
				<div data-am-widget="tabs" class="am-tabs am-tabs-d2 layout-module-win-content">
					<!-- <ul class="am-tabs-nav am-cf">
						<li class="am-active"><a href="[data-tab-panel-0]">数据</a></li>
						<li class=""><a href="[data-tab-panel-1]">标题</a></li>
						<li class=""><a href="[data-tab-panel-2]">样式</a></li>
					</ul> -->
					<div class="am-tabs-bd">
						<div data-tab-panel-0 class="am-tab-panel am-active">
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_name_text');?></label>
								<div class="am-u-sm-10">
									<input type="text" name="name" maxlength="30" class="am-form-field am-radius" placeholder="<?php echo L('view_name_text');?>" data-validation-message="<?php echo L('view_name_format');?>" />
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_right_title_text');?>
									<i class="am-icon-question help fs-12 c-p" data-am-popover="{theme: 'default sm', content:'<?php echo L('view_right_title_tips');?>', trigger:'hover focus'}"></i>
								</label>
								<div class="am-u-sm-10">
									<input type="text" name="right_title" maxlength="255" class="am-form-field am-radius" placeholder="<?php echo L('view_right_title_text');?>" data-validation-message="<?php echo L('view_right_title_format');?>" />
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_article_id_text');?>
									<i class="am-icon-question help fs-12 c-p" data-am-popover="{theme: 'default sm', content:'<?php echo L('view_article_id_tips');?>', trigger:'hover focus'}"></i>
								</label>
								<div class="am-u-sm-10">
									<input type="text" name="article_id" class="am-form-field am-radius" placeholder="<?php echo L('view_article_id_placeholder');?>" pattern="<?php echo L('common_regex_id_comma_split');?>" data-validation-message="<?php echo L('view_article_id_format');?>" />
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_keyword_text');?>
									<i class="am-icon-question help fs-12 c-p" data-am-popover="{theme: 'default sm', content:'<?php echo L('view_keyword_tips');?>', trigger:'hover focus'}"></i>
								</label>
								<div class="am-u-sm-10">
									<input type="text" name="keyword" class="am-form-field am-radius" maxlength="255" placeholder="<?php echo L('view_keyword_format');?>" />
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_show_number_text');?></label>
								<div class="am-u-sm-10">
									<input type="number" name="show_number" value="10" class="am-form-field am-radius" placeholder="<?php echo L('view_show_number_text');?>" min="1" max="1000" data-validation-message="<?php echo l('view_show_number_format');?>" required />
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_abstract_number_text');?>
									<i class="am-icon-question help fs-12 c-p" data-am-popover="{theme: 'default sm', content:'<?php echo L('view_abstract_number_tips');?>', trigger:'hover focus'}"></i>
								</label>
								<div class="am-u-sm-10">
									<input type="number" name="abstract_number" value="80" class="am-form-field am-radius" placeholder="<?php echo L('view_abstract_number_text');?>" min="5" max="500" data-validation-message="<?php echo L('view_abstract_number_format');?>" required />
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_all_class_text');?></label>
								<div class="am-u-sm-10">
									<select name="article_class_id" multiple="multiple" class="am-radius chosen-select" minchecked="1" data-placeholder="<?php echo L('view_all_class_text');?>" data-validation-message="<?php echo L('view_class_format');?>" required>
										<option value="0" selected><?php echo L('view_all_class_text');?></option>
										<?php if(is_array($article_class_list)): foreach($article_class_list as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>"><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
									</select>
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_sort_text');?></label>
								<div class="am-u-sm-10">
									<select name="sort_type" class="am-radius" required>
										<?php if(is_array($common_view_sort_list)): foreach($common_view_sort_list as $k=>$v): ?><option value="<?php echo ($k); ?>" <?php if($v['checked'] == true): ?>selected<?php endif; ?>><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
									</select>
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_add_time_text');?></label>
								<div class="am-u-sm-10">
									<select name="add_time_interval" class="am-radius" required>
										<?php if(is_array($common_view_time_list)): foreach($common_view_time_list as $k=>$v): ?><option value="<?php echo ($k); ?>" <?php if($v['checked'] == true): ?>selected<?php endif; ?>><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
									</select>
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_upd_time_text');?></label>
								<div class="am-u-sm-10">
									<select name="upd_time_interval" class="am-radius" required>
										<?php if(is_array($common_view_time_list)): foreach($common_view_time_list as $k=>$v): ?><option value="<?php echo ($k); ?>" <?php if($v['checked'] == true): ?>selected<?php endif; ?>><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
									</select>
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_title_style_text');?></label>
								<div class="am-u-sm-10">
									<select name="title_style" class="am-radius" required>
										<?php if(is_array($common_view_title_style_list)): foreach($common_view_title_style_list as $key=>$v): ?><optgroup label="<?php echo ($v["name"]); ?>">
												<?php if(is_array($v["item"])): foreach($v["item"] as $key=>$vs): ?><option value="<?php echo ($vs["value"]); ?>" <?php if($vs['checked'] == true): ?>selected<?php endif; ?>><?php echo ($vs["name"]); ?></option><?php endforeach; endif; ?>
											</optgroup><?php endforeach; endif; ?>
									</select>
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_link_open_way_text');?></label>
								<div class="am-u-sm-10">
									<select name="link_open_way" class="am-radius" required>
										<?php if(is_array($common_view_link_open_way_list)): foreach($common_view_link_open_way_list as $k=>$v): ?><option value="<?php echo ($k); ?>" <?php if($v['checked'] == true): ?>selected<?php endif; ?>><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
									</select>
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_date_format_text');?></label>
								<div class="am-u-sm-10">
									<select name="date_format" class="am-radius" required>
										<?php if(is_array($common_view_date_format_list)): foreach($common_view_date_format_list as $k=>$v): ?><option value="<?php echo ($k); ?>" <?php if($v['checked'] == true): ?>selected<?php endif; ?>><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
									</select>
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_data_cache_time_text');?>
									<i class="am-icon-question help fs-12 c-p" data-am-popover="{theme: 'default sm', content:'<?php echo L('view_data_cache_time_tips');?>', trigger:'hover focus'}"></i>
								</label>
								<div class="am-u-sm-10">
									<input type="number" name="data_cache_time" value="60" class="am-form-field am-radius" placeholder="<?php echo L('view_data_cache_time_placeholder');?>" required />
								</div>
							</div>
							<div class="am-form-group am-form-group-sm">
								<label class="am-u-sm-2 am-form-label"><?php echo L('view_summary_text');?>
									<i class="am-icon-question help fs-12 c-p" data-am-popover="{theme: 'default sm', content:'<?php echo L('view_summary_tips');?>', trigger:'hover focus'}"></i>
								</label>
								<div class="am-u-sm-10">
									<textarea name="summary" rows="3" class="am-radius" placeholder="<?php echo L('view_summary_placeholder');?>"></textarea>
								</div>
							</div>
							<input type="hidden" name="id" value="" />
							<input type="hidden" name="layout_value" value="" />
							<button class="am-btn am-btn-secondary am-btn-sm am-radius am-btn-block" type="submit"><?php echo L('common_operation_save');?></button>
						</div>
						<div data-tab-panel-1 class="am-tab-panel ">table-1</div>
						<div data-tab-panel-2 class="am-tab-panel ">table-2</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- module end -->

<!-- module import-export start -->
<div class="am-modal am-modal-no-btn" tabindex="-1" id="layout-import-win">
	<div class="am-modal-dialog am-radius">
		<div class="am-modal-hd">
			<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		</div>
		<div class="am-modal-bd t-l">
			<!-- form start -->
			<form class="am-form form-validation-layout-import view-save m-t-10" action="<?php echo U('Admin/View/LayoutImport');?>" method="POST" request-type="ajax-url" request-value="<?php echo U('Admin/View/Index', ['type'=>$layout_type]);?>" enctype="multipart/form-data">
				<input type="hidden" name="max_file_size" value="<?php echo MyC('home_max_limit_file', 51200000, true);?>" />
				<div class="am-form-group am-form-file">
					<button type="button" class="am-btn am-btn-default am-btn-sm am-radius">
					<i class="am-icon-cloud-upload"></i> <?php echo L('common_select_file_text');?></button>
					<input type="file" name="file" multiple data-validation-message="<?php echo L('common_select_file_tips');?>" required />
					<span class="tips fs-12"><?php echo L('view_layout_import_tips');?></span>
					<div id="form-file-tips"></div>
				</div>
				<div class="am-form-group">
					<button type="submit" class="am-btn am-btn-primary am-radius btn-loading-example am-btn-sm" data-am-loading="{loadingText:'<?php echo L('common_upload_loading_tips');?>'}"><?php echo L('common_operation_upload');?></button>
				</div>
			</form>
			<!-- form end -->
		</div>
	</div>
</div>
<!-- module import-export end -->

<!-- right content start  -->
<div class="content-right">
	<div class="content">
		<!-- layout nav start -->
		<ul class="am-nav am-nav-pills table-nav">
			<li <?php if($layout_type == 'home'): ?>class="am-active"<?php endif; ?>>
				<a href="<?php echo U('Admin/View/Index', ['type'=>'home']);?>"><?php echo L('view_nav_home');?></a>
			</li>
			<li <?php if($layout_type == 'channel'): ?>class="am-active"<?php endif; ?>>
				<a href="<?php echo U('Admin/View/Index', ['type'=>'channel']);?>"><?php echo L('view_nav_channel');?></a>
			</li>
			<li <?php if($layout_type == 'detail'): ?>class="am-active"<?php endif; ?>>
				<a href="<?php echo U('Admin/View/Index', ['type'=>'detail']);?>"><?php echo L('view_nav_detail');?></a>
			</li>
			<div class="fr layout-nav-operation">
				<button type="button" class="am-btn am-btn-secondary am-radius am-btn-sm m-r-5" data-am-modal="{target:'#layout-import-win'}"><?php echo L('common_import_text');?></button>
				<a href="<?php echo U('Admin/View/LayoutExport', ['type'=>$layout_type]);?>" class="am-btn am-btn-success am-radius am-btn-sm"><?php echo L('common_export_text');?></a>
			</div>
		</ul>
		<!-- layout nav end -->

		<!-- layout module list -->
		<div class="am-panel am-panel-default am-radius layout-list m-t-10">
			<!-- layout module tips start -->
			<div class="am-alert am-alert-secondary am-radius" data-am-alert>
				<span class="am-close am-close-spin">&times;</span>
				<?php echo L('view_layout_module_tips');?>
			</div>
			<!-- layout module tips end -->

			<!-- 100全屏 value:100 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="100" data-html='<div class="layout-view" data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs m-r-5" data-am-modal="{target: {layout-module-win}}" data-id="{data-module1-id}" data-value="{data-value}" data-tag="{content-module1-id}"><?php echo L("common_operation_edit");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-layout-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><div class="layout-100" id="{content-module1-id}"></div></div>'>100%</button>

			<!-- 自适应sm[1]-md[2]-lg[2] value:122 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="122" data-html='<div class="layout-view" data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button" class="am-btn am-btn-success am-radius layout-submit-add am-btn-xs m-r-5" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}" {data-html-item}><?php echo L("common_operation_add2");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><ul data-am-widget="gallery" class="am-gallery am-avg-sm-1 am-avg-md-2 am-avg-lg-2 am-gallery-overlay small-banner am-no-layout m-b-5 layout-100-122" data-am-gallery="{}" id="{content-module-id}"></ul></div>' data-html-item='<li class="layout-item"><div class="layout-content-submit"><button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs m-r-5" data-am-modal="{target: {layout-module-win}}" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}"><?php echo L("common_operation_edit");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="module"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-122-item" id="{content-module-id}"></div></li>'>sm[1]-md[2]-lg[2]</button>

			<!-- 自适应sm[1]-md[2]-lg[3] value:123 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="123" data-html='<div class="layout-view" data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button" class="am-btn am-btn-success am-radius layout-submit-add am-btn-xs m-r-5" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}" {data-html-item}><?php echo L("common_operation_add2");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><ul data-am-widget="gallery" class="am-gallery am-avg-sm-1 am-avg-md-2 am-avg-lg-3 am-gallery-overlay small-banner am-no-layout m-b-5 layout-100-123" data-am-gallery="{}" id="{content-module-id}"></ul></div>' data-html-item='<li class="layout-item"><div class="layout-content-submit"><button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs m-r-5" data-am-modal="{target: {layout-module-win}}" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}"><?php echo L("common_operation_edit");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="module"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-123-item" id="{content-module-id}"></div></li>'>sm[1]-md[2]-lg[3]</button>

			<!-- 自适应sm[1]-md[2]-lg[4] value:124 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="124" data-html='<div class="layout-view" data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button" class="am-btn am-btn-success am-radius layout-submit-add am-btn-xs m-r-5" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}" {data-html-item}><?php echo L("common_operation_add2");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><ul data-am-widget="gallery" class="am-gallery am-avg-sm-1 am-avg-md-2 am-avg-lg-4 am-gallery-overlay small-banner am-no-layout m-b-5 layout-100-124" data-am-gallery="{}" id="{content-module-id}"></ul></div>' data-html-item='<li class="layout-item"><div class="layout-content-submit"><button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs m-r-5" data-am-modal="{target: {layout-module-win}}" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}"><?php echo L("common_operation_edit");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="module"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-124-item" id="{content-module-id}"></div></li>'>sm[1]-md[2]-lg[4]</button>

			<!-- 自适应sm[2]-md[3]-lg[6] value:236 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="236" data-html='<div class="layout-view" data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button" class="am-btn am-btn-success am-radius layout-submit-add am-btn-xs m-r-5" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}" {data-html-item}><?php echo L("common_operation_add2");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-6 am-gallery-overlay small-banner am-no-layout m-b-5 layout-100-236" data-am-gallery="{}" id="{content-module-id}"></ul></div>' data-html-item='<li class="layout-item"><div class="layout-content-submit"><button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs m-r-5" data-am-modal="{target: {layout-module-win}}" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}"><?php echo L("common_operation_edit");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="module"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-236-item" id="{content-module-id}"></div></li>'>sm[2]-md[3]-lg[6]</button>

			<!-- 自适应sm[1]-md[3:1]-lg[3:1] value:84 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="84" data-html='<div class="layout-view"data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete"data-id="{data-layout-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-84 o-h"><div class="am-u-md-8"><div class="layout-content-submit"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module1-id}"data-value="{data-value}"data-tag="{content-module1-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module1-id}"></div></div><div class="am-u-md-4"><div class="layout-content-submit b-e"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module2-id}"data-value="{data-value}"data-tag="{content-module2-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module2-id}"></div></div></div></div>'>sm[1]-md[3:1]-lg[3:1]</button>

			<!-- 自适应sm[1]-md[1:3]-lg[1:3] value:48 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="48" data-html='<div class="layout-view"data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete"data-id="{data-layout-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-48 o-h"><div class="am-u-md-4"><div class="layout-content-submit"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module1-id}"data-value="{data-value}"data-tag="{content-module1-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module1-id}"></div></div><div class="am-u-md-8"><div class="layout-content-submit b-e"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module2-id}"data-value="{data-value}"data-tag="{content-module2-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module2-id}"></div></div></div></div>'>sm[1]-md[1:3]-lg[1:3]</button>

			<!-- 自适应sm[1]-md[2:1:1]-lg[2:1:1] value:633 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="633" data-html='<div class="layout-view"data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete"data-id="{data-layout-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-633 o-h"><div class="am-u-md-6"><div class="layout-content-submit"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module1-id}"data-value="{data-value}"data-tag="{content-module1-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module1-id}"></div></div><div class="am-u-md-3"><div class="layout-content-submit b-e"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module2-id}"data-value="{data-value}"data-tag="{content-module2-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module2-id}"></div></div><div class="am-u-md-3"><div class="layout-content-submit b-e"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module3-id}"data-value="{data-value}"data-tag="{content-module3-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module3-id}"></div></div></div></div>'>sm[1]-md[2:1:1]-lg[2:1:1]</button>

			<!-- 自适应sm[1]-md[1:2:1]-lg[1:2:1] value:363 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="363" data-html='<div class="layout-view"data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete"data-id="{data-layout-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-363 o-h"><div class="am-u-md-3"><div class="layout-content-submit"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module1-id}"data-value="{data-value}"data-tag="{content-module1-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module1-id}"></div></div><div class="am-u-md-6"><div class="layout-content-submit b-e"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module2-id}"data-value="{data-value}"data-tag="{content-module2-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module2-id}"></div></div><div class="am-u-md-3"><div class="layout-content-submit b-e"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module3-id}"data-value="{data-value}"data-tag="{content-module3-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module3-id}"></div></div></div></div>'>sm[1]-md[1:2:1]-lg[1:2:1]</button>

			<!-- 自适应sm[1]-md[1:1:2]-lg[1:1:2] value:336 -->
			<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" data-value="336" data-html='<div class="layout-view"data-layout-id="{data-layout-id}"><div class="layout-content-submit drag-submit"><input type="checkbox" name="switch-checkbox" checked="true" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="{data-layout-id}" /><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete"data-id="{data-layout-id}" data-type="layout"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-336 o-h"><div class="am-u-md-3"><div class="layout-content-submit"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module1-id}"data-value="{data-value}"data-tag="{content-module1-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module1-id}"></div></div><div class="am-u-md-3"><div class="layout-content-submit b-e"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module2-id}"data-value="{data-value}"data-tag="{content-module2-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module2-id}"></div></div><div class="am-u-md-6"><div class="layout-content-submit b-e"><button type="button"class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs"data-am-modal="{target: {layout-module-win}}"data-id="{data-module3-id}"data-value="{data-value}"data-tag="{content-module3-id}"><?php echo L("common_operation_edit");?></button></div><div id="{content-module3-id}"></div></div></div></div>'>sm[1]-md[1:1:2]-lg[1:1:2]</button>
		</div>
		<!-- layout module end -->

		<!-- layuot start -->
		<div class="o-h m-b-10">
			<?php if(in_array($layout_type, ['channel', 'detail'])): ?><div class="am-u-md-8 layout-no-edit t-c bk-cr-ffd m-b-10 p-d-5">
					<?php if(C('IS_DEVELOP')): ?><div class="fl m-l-10">
							<?php switch($layout_type): case "channel": ?>$list<?php break;?>
								<?php case "detail": ?>$article<?php break;?>
								<?php default: endswitch;?>
						</div><?php endif; ?>
					<?php echo L('view_no_edit_area');?>
				</div><?php endif; ?>
			<div class="layout-content <?php if(in_array($layout_type, ['channel', 'detail'])): ?>am-u-md-4 pc-10-h5-0<?php endif; ?>" data-layout-save-url="<?php echo U('Admin/View/LayoutSave');?>" data-layout-delete-url="<?php echo U('Admin/View/LayoutDelete');?>" data-layout-state-url="<?php echo U('Admin/View/StateUpdate');?>" data-layout-sort-save-url="<?php echo U('Admin/View/LayoutSortSave');?>" data-module-add-url="<?php echo U('Admin/View/ModuleAdd');?>" data-module-save-url="<?php echo U('Admin/View/ModuleSave');?>" data-module-delete-url="<?php echo U('Admin/View/ModuleDelete');?>" data-type="<?php echo ($layout_type); ?>">
				<!-- layout init start -->
				<div class="drag-submit none">init</div>
				<!-- layout init end -->

				<!-- layout module start -->
				<?php if(!empty($data)): if(is_array($data)): foreach($data as $key=>$v): switch($v["value"]): case "100": ?><div class="layout-view <?php if($v['is_enable'] == 0): ?>layout-view-hidden<?php endif; ?>" data-layout-id="<?php echo ($v["id"]); ?>">
									<div class="layout-content-submit drag-submit">
										<?php if(C('IS_DEVELOP')): if(!empty($v['item'][0]['id'])): ?><div class="fl data-variable">$data_<?php echo ($v['item'][0]['id']); ?></div><?php endif; endif; ?>
										<input type="checkbox" name="switch-checkbox" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="<?php echo ($v["id"]); ?>" <?php if($v['is_enable'] == 1): ?>checked="true"<?php endif; ?> />
										<?php if(!empty($v['item'][0])): ?><button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs m-r-5" data-am-modal="{target: '#layout-module-win'}" data-id="<?php echo ($v['item'][0]['id']); ?>" data-value="{data-value}" data-tag="layout-content-<?php echo ($v['item'][0]['id']); ?>" data-json='<?php echo ($v['item'][0]['json']); ?>'><?php echo L("common_operation_edit");?></button>
											<button type="button" class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="<?php echo ($v["id"]); ?>" data-type="layout"><?php echo L("common_operation_remove");?></button><?php endif; ?>
									</div>
									<?php if(!empty($v['item'][0])): ?><div class="layout-<?php echo ($v["value"]); ?>" id="layout-content-<?php echo ($v['item'][0]['id']); ?>"><?php echo ($v['item'][0]['html']); ?></div><?php endif; ?>
								</div><?php break;?>
							<?php case "122": case "123": case "124": case "236": list($t1, $t2, $t3) = str_split($v['value']); ?>
								<div class="layout-view <?php if($v['is_enable'] == 0): ?>layout-view-hidden<?php endif; ?>" data-layout-id="<?php echo ($v["id"]); ?>">
									<div class="layout-content-submit drag-submit">
										<input type="checkbox" name="switch-checkbox" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="<?php echo ($v["id"]); ?>" <?php if($v['is_enable'] == 1): ?>checked="true"<?php endif; ?> />
										<button type="button" class="am-btn am-btn-success am-radius layout-submit-add am-btn-xs m-r-5" data-id="<?php echo ($v["id"]); ?>" data-value="<?php echo ($v["value"]); ?>" data-tag="layout-content-<?php echo ($v["value"]); ?>-<?php echo ($v["id"]); ?>" data-html='<li class="layout-item"><div class="layout-content-submit"><button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs m-r-5" data-am-modal="{target: {layout-module-win}}" data-id="{data-module-id}" data-value="{data-value}" data-tag="{content-module-id}"><?php echo L("common_operation_edit");?></button><button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="{data-module-id}" data-type="module"><?php echo L("common_operation_remove");?></button></div><div class="layout-100-<?php echo ($v["value"]); ?>-item" id="{content-module-id}"></div></li>'><?php echo L("common_operation_add2");?></button>
										<button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="<?php echo ($v["id"]); ?>" data-type="layout"><?php echo L("common_operation_remove");?></button>
									</div>
									<ul data-am-widget="gallery" class="am-gallery am-avg-sm-<?php echo ($t1); ?> am-avg-md-<?php echo ($t2); ?> am-avg-lg-<?php echo ($t3); ?> am-gallery-overlay small-banner am-no-layout m-b-5 layout-100-<?php echo ($v["value"]); ?>" data-am-gallery="{}" id="layout-content-<?php echo ($v["value"]); ?>-<?php echo ($v["id"]); ?>">
										<?php if(!empty($v['item'])): if(is_array($v["item"])): foreach($v["item"] as $key=>$vs): ?><li class="layout-item">
													<div class="layout-content-submit">
														<?php if(C('IS_DEVELOP')): ?><div class="fl data-variable">$data_<?php echo ($vs["id"]); ?></div><?php endif; ?>
														<button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs m-r-5" data-am-modal="{target: '#layout-module-win'}" data-id="<?php echo ($vs["id"]); ?>" data-value="{data-value}" data-tag="layout-content-<?php echo ($v["value"]); ?>-<?php echo ($vs["id"]); ?>" data-json='<?php echo ($vs["json"]); ?>'><?php echo L("common_operation_edit");?></button>
														<button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="<?php echo ($vs["id"]); ?>" data-type="module"><?php echo L("common_operation_remove");?></button>
													</div>
													<div class="layout-100-<?php echo ($v["value"]); ?>-item" id="layout-content-<?php echo ($v["value"]); ?>-<?php echo ($vs["id"]); ?>"><?php echo ($vs["html"]); ?></div>
												</li><?php endforeach; endif; endif; ?>
									</ul>
								</div><?php break;?>
							<?php case "84": case "48": case "633": case "363": case "336": $t_all = str_split($v['value']); ?>
								<div class="layout-view <?php if($v['is_enable'] == 0): ?>layout-view-hidden<?php endif; ?>" data-layout-id="<?php echo ($v["id"]); ?>">
									<div class="layout-content-submit drag-submit">
										<input type="checkbox" name="switch-checkbox" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="<?php echo ($v["id"]); ?>" <?php if($v['is_enable'] == 1): ?>checked="true"<?php endif; ?> />
										<button type="button"class="am-btn am-btn-danger am-radius am-btn-xs layout-submit-delete" data-id="<?php echo ($v["id"]); ?>" data-type="layout"><?php echo L("common_operation_remove");?></button>
									</div>
									<div class="layout-100-<?php echo ($v["value"]); ?> o-h">
										<?php if(!empty($v['item'])): if(is_array($v["item"])): foreach($v["item"] as $ks=>$vs): ?><div class="am-u-md-<?php echo ($t_all[$ks]); ?>">
													<div class="layout-content-submit">
														<?php if(C('IS_DEVELOP')): ?><div class="fl data-variable">$data_<?php echo ($vs["id"]); ?></div><?php endif; ?>
														<button type="button" class="am-btn am-btn-secondary am-radius layout-submit-edit am-btn-xs" data-am-modal="{target: '#layout-module-win'}" data-id="<?php echo ($vs["id"]); ?>" data-value="<?php echo ($v["value"]); ?>" data-tag="layout-content-<?php echo ($v["value"]); ?>-<?php echo ($vs["id"]); ?>" data-json='<?php echo ($vs["json"]); ?>'><?php echo L("common_operation_edit");?></button>
													</div>
													<div id="layout-content-<?php echo ($v["value"]); ?>-<?php echo ($vs["id"]); ?>"><?php echo ($vs["html"]); ?></div>
												</div><?php endforeach; endif; endif; ?>
									</div>
								</div><?php break; endswitch; endforeach; endif; endif; ?>
				<!-- layout module end -->
			</div>
		</div>
		<!-- layuot end -->

		<!-- layuot site-oneself start -->
		<div class="site-oneself">
			<!-- link start -->
			<?php if(!empty($link['layout'])): ?><div class="layout-view <?php if($link['layout']['is_enable'] == 0): ?>layout-view-hidden<?php endif; ?>">
					<div class="layout-content-submit">
						<?php if(C('IS_DEVELOP')): ?><div class="fl data-variable">$link</div><?php endif; ?>
						<input type="checkbox" name="switch-checkbox" data-size="xs" data-on-color="success" data-off-color="warning" data-off-text="<?php echo L("common_operation_off_text");?>" data-on-text="<?php echo L("common_operation_on_text");?>" data-id="<?php echo ($link["layout"]["id"]); ?>" <?php if($link['layout']['is_enable'] == 1): ?>checked="true"<?php endif; ?> />
					</div>
					<div class="layout-100">
						<div class="my-link o-h">
							<legend><?php echo L('common_view_link_name');?></legend>
							<?php if(!empty($link['data'])): ?><ul>
									<?php if(is_array($link["data"])): foreach($link["data"] as $key=>$v): ?><li><a href="<?php echo ($v["url"]); ?>" <?php if($v['is_new_window_open'] == 1): ?>target="_blank"<?php endif; ?> title="<?php echo ($v["describe"]); ?>"><?php echo ($v["name"]); ?></a></li><?php endforeach; endif; ?>
								</ul><?php endif; ?>
						</div>
					</div>
				</div><?php endif; ?>
			<!-- link end -->
		</div>
		<!-- layuot site-oneself end -->
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

<script>
/**
 * [LayoutModuleView 模型（公共表单方法校验需要放在这里，不能校验其它文件的方法）]
 * @author   Devil
 * @blog     http://gong.gg/
 * @version  0.0.1
 * @datetime 2017-02-11T21:46:50+0800
 * @param    {[object]}    data [模型数据]
 */
function LayoutModuleView(data)
{
	if(data.code == 0)
	{
		var $tag = $('#layout-module-win').attr('data-tag');
		$('#'+$tag).html(data.data.html);
		$('#'+$tag).prev().find('.layout-submit-edit').attr('data-json', data.data.json);
		$('#layout-module-win').modal('close');
		$('.am-slider').flexslider();
	} else {
		Prompt(data.msg);
	}
	$.AMUI.progress.done();
	$('.form-validation').find('button[type="submit"]').button('reset');
}
</script>