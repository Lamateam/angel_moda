<?php echo $header; ?>
<div class="container">
  <div class="row">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <div class="row">
    <div class="col-sm-12 ">
      <div class="lined">
      </div>
      <h1 class="lined"><?php echo $heading_title; ?></h1>
      
    </div>
    
    <?php echo $column_left; ?>
    
    
    <div id="content" class="col15-lg-12 col-md-9 col-sm-9 col-xs-12">
    
    <?php echo $content_top; ?>
      
     
     
      <?php if ($categories) { ?>
        <h3><?php echo $text_refine; ?></h3>
        <?php if (count($categories) <= 5) { ?>
        <div class="row">
          <div class="col-sm-3">
            <ul>
              <?php foreach ($categories as $category) { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
            </ul>
          </div>
        </div>
      <?php } else { ?>
        <div class="row">
          <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
            <div class="col-sm-3">
              <ul>
                <?php foreach ($categories as $category) { ?>
                  <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php } ?>
              </ul>
            </div>
          <?php } ?>
        </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
    
      <div class="row">
        <div class="col-md-4">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-md-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-3 text-right">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
         <div class="row">
        <?php 
        $count=0;

            foreach ($products as $product) {
              ?>
            
       
          <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12  product_cart hidden-sm">

           
              <div class="product_image">
             
                  <img src="<?php echo $product['thumb'];?>" title="<?php echo $product['name'];?>" class="img-responsive page_item">
                  <?php if ($product['special']) { ?>
                      <div class="sale"> 
                      </div>
                  <?php } ?>

                  <div class="product_cart_hover">
                    
                      <div class="ru_text" title="Добавить в Wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                        <i class="fa fa-heart-o"></i>
                        <span>Отложить</span>
                      </div>

                      <div class="en_text" title="Add to Wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                        <i class="fa fa-heart-o"></i>
                        <span>put aside</span>

                      </div>
                   


                  </div>


              </div>
              <h3 class="product_title">
                <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name'];?>">
                  <?php echo $product['name'];?>
                </a>
               



              </h3>





               <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($product['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } ?>
                  <?php } ?>


                    <?php if ($product['special']) { ?>
                    <span class="procent">
                        <?php
                          $procent =  floor(($product['price']/$product['special']-1)*100);
                          echo "- ".$procent."%";

                        ?>

                    </span>
                 <?php } ?>

                </div>

                 <p class="price">
                   <?php if (!$product['special']) { ?>
                    <span class="price-normal"><?php echo $product['price']; ?></span> 
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>

                <button  type="button" class=" ru_text btn btn-normal" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                    Купить
                </button>

                <button  type="button" class="en_text btn btn-normal" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                    Buy
                </button>


            </div>
          
            <?php
              $count++;
              if ($count >4) break;
            }
        
        ?>
      
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      
       <?php if ($thumb || $description) { ?>
        <div class="row">
          <?php if ($thumb) { ?>
            <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
          <?php } ?>
          <?php if ($description) { ?>
            <div class="col-sm-10"><?php echo $description; ?></div>
          <?php } ?>
        </div>
        <hr>
      <?php } ?>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
