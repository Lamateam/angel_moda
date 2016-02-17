<div class="modal fade" id="reg_form" tabindex="-1" role="dialog">
  <div class="modal-dialog call_back register_form">
    <div class="modal-content">        
      <div class="modal-body">
        <span class="close_modal" type="button" data-dismiss="modal">&#10010;</span>
        <h2><?php echo $heading_title ?></h2>
        <form action="<?php echo $action; ?>" method="post" id="send_reg" enctype="multipart/form-data" name="send_reg" class="form-horizontal">
          <fieldset id="account">
            <legend><?php echo $text_your_details; ?></legend>
              <div class="form-group required" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
                <label class="col-sm-12 control-label"><?php echo $entry_customer_group; ?></label>
                <div class="col-sm-12">
                  <?php foreach ($customer_groups as $customer_group) { ?>
                    <div class="radio">
                      <label>
                        <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                        <?php echo $customer_group['name']; ?>
                      </label>
                    </div>
                  <?php } ?>
               
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
              <div class="col-sm-12">
              <input type="text" name="firstname" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
            	</div>
						</div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                <div class="col-sm-12">
                  <input type="text" name="lastname" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-email"><?php echo $entry_email; ?></label>
              <div class="col-sm-12">
                <input type="email" name="email" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
              <div class="col-sm-12">
                <input type="tel" name="telephone" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control phone" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-12 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
              <div class="col-sm-12">
                <input type="text" name="fax" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
              </div>
            </div>
          </fieldset>
          <fieldset id="address">
            <legend><?php echo $text_your_address; ?></legend>
            <div class="form-group">
              <label class="col-sm-12 control-label" for="input-company"><?php echo $entry_company; ?></label>
              <div class="col-sm-12">
                <input type="text" name="company" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
              <div class="col-sm-12">
                <input type="text" name="address_1" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-12 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
              <div class="col-sm-12">
                <input type="text" name="address_2" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-city"><?php echo $entry_city; ?></label>
              <div class="col-sm-12">
                <input type="text" name="city" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
            <label class="col-sm-12 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
              <div class="col-sm-12">
                <input type="text" name="postcode" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-country"><?php echo $entry_country; ?></label>
              <div class="col-sm-12">
                <select name="country_id" id="input-country" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
              <div class="col-sm-12">
                <select name="zone_id" id="input-zone" class="form-control">
                </select>
              </div>
            </div>
          </fieldset>
          <fieldset>
            <legend><?php echo $text_your_password; ?></legend>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-password"><?php echo $entry_password; ?></label>
              <div class="col-sm-12">
                <input type="password" name="password" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-12 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
              <div class="col-sm-12">
                <input type="password" name="confirm" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              </div>
            </div>
          </fieldset>
          <fieldset>
            <legend><?php echo $text_newsletter; ?></legend>
            <div class="form-group">
              <label class="col-sm-12 control-label"><?php echo $entry_newsletter; ?></label>
              <div class="col-sm-12">
                <label class="radio-inline">
                  <input class="checkbox" type="radio" name="newsletter" value="1" checked="checked" />
                  <?php echo $text_yes; ?>
                </label>
                <label class="radio-inline">
                  <input class="checkbox" type="radio" name="newsletter" value="0" />
                  <?php echo $text_no; ?>
                </label>
              </div>
            </div>
          </fieldset>
          <?php echo $captcha; ?>
          <?php if ($text_agree) { ?>
            <div class="buttons">
							
              <div class="pull-right">
								<div>
									<input class="checkbox" type="checkbox" name="agree" value="1" />
                	<?php echo $text_agree; ?>
                </div>
              
                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
              </div>
            </div>
          <?php } else { ?>
            <div class="buttons">
              <div class="pull-right">
                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
              </div>
            </div>
          <?php } ?>
        </form>
      </div>
  </div>
 </div>
 <script type="text/javascript"><!--
// Sort the custom fields
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

$('#reg_form input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}


		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#reg_form input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--

//--></script>
<script type="text/javascript"><!--
$('#reg_form select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#reg_form select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#reg_form input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#reg_form input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#reg_form select[name=\'country_id\']').trigger('change');
//--></script>


</div>