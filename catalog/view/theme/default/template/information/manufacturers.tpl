<?php print_r($manufacturers); ?>
<?php echo $header; ?>

<script src="catalog/view/javascript/jquery/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<link type="text/css" href="catalog/view/javascript/jquery/jquery-ui/jquery-ui.min.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/g/jquery.ui.timepicker.addon@1.4.5(jquery-ui-timepicker-addon.min.css+jquery-ui-timepicker-addon.css)">
<script src="https://cdn.jsdelivr.net/g/jquery.ui.timepicker.addon@1.4.5(jquery-ui-timepicker-addon.min.js+jquery-ui-sliderAccess.js+jquery-ui-timepicker-addon.js)"></script>


<div class="container normal_page">
  <div class="row">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  </div>
  <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row"> 
        <div class="col-sm-12">
          <h1><?php echo $heading_title; ?></h1>
          <?php echo $description; ?><?php echo $content_bottom; ?>
        </div>
      </div>

        <div class="brands_row">

            <span class="brand_alpha">
                 <?php if ($current_language_code='en') {?>
                    Brand index:
                 <?php }else { ?>
                    Алфавитный указатель:
                 <?php }?>
            </span>




            <?php foreach($manufacturers as $category){?> &nbsp;&nbsp;&nbsp;
              <a class="brand_alpha_item" title="<?php echo $category['name'];?>" href="/manufacturers#<?php echo $category['name'];?>"
              ><?php echo $category['name'];?></a> <?php }?> </p>

        </div>
        <div class="items">
          <div class="row">
          <?php foreach($manufacturers as $category){?> 
            <div class="brand_cate col-sm-12" id="#<?php echo $category['name'];?>">
              <div class="brand_cate_left pull-left" >
                  <div class="brand_cate_left-top text-center">
                      <?php echo $category['name'];?>
                  </div>
              </div>
            </div>

          <?php } ?>
          </div>
        </div>


         
        </div>
      </div>
    </div>
</div>
<?php echo $footer; ?>