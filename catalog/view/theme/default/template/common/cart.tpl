<div id="cart" class="btn-group btn-block pull-right text-center">
  
  <div class="cart_block" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>">
      <img src="/image/cart.svg" height="51px" alt="<?php echo $cart_header;?>">
      
      
      <span class="cart_desc">
          <span class="cart_tov" ><?php echo $text_items; ?> <i class="cart_count"><?php echo $count_items ?></i></span> 
          
          <span class="top_height_line"><br></span>
          <span class="cart_cost"><?php echo $total_currency;  ?> </span>
      
      </span>
  </div>
  
  <ul class="dropdown-menu pull-center text-center">
  
    <!--Переделанный кусок -->
      <?php if ($products) { ?>
    <li>
        <?php foreach ($products as $product) { ?>
            <div class="cart_item_header" data-id='<?php echo $product['cart_id']; ?>'>
                <div class="cart_img_block">
                  <?php if ($product['thumb']) { ?>
                   <a href="<?php echo $product['href']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  />
                   </a>
                  <?php } ?>
                </div>
                <div class="cart_remove">
                    <span onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="cart_close_button">
                      	&times;
                    </span>
                </div>
                <div class="cart_text_block">
                    <span class="cart_name_tov">
                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                         <?php if ($product['option']) { ?>
                            <?php foreach ($product['option'] as $option) { ?>
                              <br />
                              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                            <?php } ?>
                          <?php } ?>
                          <?php if ($product['recurring']) { ?>
                            <br />
                            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                          <?php } ?>
                    </span>
                    <span class="cart_name_count">
                        <?php echo $cart_count;?>: <?php echo $product['quantity']; ?>
                    </span>
                    
                     <span class="cart_name_price">
                        <?php echo $product['total']; ?>
                    </span>
                </div>
                
            </div>
        <?php } ?>
     </li>
     <li>
      <span class="cart_sum text-center span12">
              <span class="cart_sum_title text-center"><?php echo $totals[1]['title']; ?>:</span>
              <span class="cart_sum_result text-center"><?php echo $totals[1]['total']; ?></span>
       </span>
       
       <div class="row">
          <div class="col-xs-6">
              <span class="clear_trash">
                <i class="fa fa-trash-o"></i>
                <span><?php echo $cart_trash;?></span>
                
              </span>
          </div>
          <div class="col-xs-6">
              <a  href="<?php echo $checkout; ?>" class="btn btn-primary text-right pull-right ready_order_cart"><?php echo $text_checkout;?></a>
          </div>
       </div>
       
    </li>

     <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
    
   
  </ul>
</div>
