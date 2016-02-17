<?php echo $header; ?><?php echo $column_left; ?>



<script src="view/javascript/jquery/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<link type="text/css" href="view/javascript/jquery/jquery-ui/jquery-ui.min.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/g/jquery.ui.timepicker.addon@1.4.5(jquery-ui-timepicker-addon.min.css+jquery-ui-timepicker-addon.css)">
<script src="https://cdn.jsdelivr.net/g/jquery.ui.timepicker.addon@1.4.5(jquery-ui-timepicker-addon.min.js+jquery-ui-sliderAccess.js+jquery-ui-timepicker-addon.js)"></script>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div id="images" class="container-fluid">
            <?php $image_row = 0; ?>
            <?php foreach ($banner_images as $banner_image) { ?>
              <div class="row" style="margin-top: 15px;" id="image-row<?php echo $image_row; ?>">
								<input type="hidden" name="banner_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $image_row; ?>" />
                <div class="col-md-2">
                  <a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail">
                    <img src="<?php echo $banner_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
                  </a>
                  <input type="hidden" name="banner_image[<?php echo $image_row; ?>][image]" value="<?php echo $banner_image['image']; ?>" id="input-image<?php echo $image_row; ?>" />
                </div>
                <div class="col-md-5">
                  <div>
                    <?php foreach ($languages as $language) { ?>
                      <div class="input-group pull-left">
                        <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
                        <input type="text" name="banner_image[<?php echo $image_row; ?>][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($banner_image['banner_image_description'][$language['language_id']]) ? $banner_image['banner_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                      </div>
                      <?php if (isset($error_banner_image[$image_row][$language['language_id']])) { ?>
                        <div class="text-danger"><?php echo $error_banner_image[$image_row][$language['language_id']]; ?></div>
                      <?php } ?>
                    <?php } ?>
                  </div>
                  <div style="clear: both;"></div>
                  <div style="margin-top: 5px;">
                    <div class="input-group pull-left">
                      <span class="input-group-addon">Url</span>
                      <input type="text" name="banner_image[<?php echo $image_row; ?>][link]" value="<?php echo $banner_image['link']; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="checkbox">
                    <label>
										  <input type="checkbox" class="show_date" name="banner_image[<?php echo $image_row; ?>][has_end_date]" value="1" <?php if($banner_image['has_end_date']) { ?>checked<?php } ?> /> <?php echo $entry_has_end_date; ?>
                    </label>
                  </div>
                  <div>
										<input style="margin-top: 7px;" class="form-control date" name="banner_image[<?php echo $image_row; ?>][end_date]" value="<?php echo $banner_image['end_date']; ?>" <?php if(!$banner_image['has_end_date']) { ?>disabled="disabled"<?php } ?> />                    
                  
									</div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="banner_image[<?php echo $image_row; ?>][is_html]" value="1" <?php if($banner_image['is_html']) { ?>checked<?php } ?> /> <?php echo $entry_is_html; ?>
                    </label>
                  </div>
                </div>
                <div class="col-md-1">
                	<button type="button" onclick="$('#image-row<?php echo $image_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                </div>
              </div>
              <?php $image_row++ ?>
            <?php } ?>
            <div class="row" id="button_row">
              <div class="col-md-offset-10 col-md-2">
                <button type="button" onclick="addImage();" class="btn btn-primary"><i class="fa fa-plus-circle"></i>"<?php echo $button_banner_add; ?></button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript">
	
	
	$(document).on("change", ".show_date", function(){
	
	
		if ($(".show_date").is(":checked")) {
			$(this).parent().parent().parent().find(".date").prop("disabled","");
		}else{
			$(this).parent().parent().parent().find(".date").prop("disabled","disabled");
		}
	
		
	});
	
	$.datepicker.setDefaults( $.datepicker.regional[ "" ] );
	
	$('.date').datetimepicker({
		dateFormat: "yy-mm-dd",
		timeFormat: "hh:mm:ss",
		firstDay: 1,
		regional: "ru"
	});
	
	
	<!--
    var image_row = <?php echo $image_row; ?>;
    var button_row = $("#button_row");

function addImage() {  
  var new_line = '<div class="row" style="margin-top: 15px;" id="image-row' + image_row + '">';
	
	new_line += '<input type="hidden" name="banner_image[' + image_row + '][sort_order]" value="<?php echo $image_row; ?>" />';
  
  new_line += '<div class="col-md-2"><a href="" id="thumb-image' + image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="banner_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></div>';
  new_line += '<div class="col-md-5">';
   
  new_line += '<div>';
  
  <?php foreach ($languages as $language) { ?>
	  new_line += '<div class="input-group">';
	  new_line += '<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="banner_image[' + image_row + '][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
    new_line += '</div>';    
  <?php } ?>
  
  new_line += '</div>';
  new_line += '<div style="clear: both;"></div>'
  new_line += '<div style="margin-top: 5px;"><div class="input-group pull-left"><span class="input-group-addon">Url</span><input type="text" name="banner_image[' + image_row + '][link]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" /></div></div>';
   
  new_line += '</div>';
  new_line += '<div class="col-md-4">';
  
  new_line += '<div class="checkbox"><label><input class="show_date" type="checkbox" name="banner_image[' + image_row + '][has_end_date]" value="1" /> <?php echo $entry_has_end_date; ?></label></div>';
  new_line += '<div class="input-append"><input style="margin-top: 7px;" class="form-control" name="banner_image[' + image_row + '][end_date]" value="" disabled /></div>';
  new_line += '<div class="checkbox"><label><input type="checkbox" name="banner_image[' + image_row + '][is_html]" value="1" /> <?php echo $entry_is_html; ?></label></div>';
  
  new_line += '</div>';
  
  new_line += '<div class="col-md-1"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div>';
  
  new_line += '</div>';
	
	$(new_line).insertBefore(button_row);
	

	
	
	image_row++;
}
//--></script></div>
<?php echo $footer; ?>
