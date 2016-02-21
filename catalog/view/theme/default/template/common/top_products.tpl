
   <div class="container top_products">
      <div class="row">
        <div class="col-sm-12 overflow_hidden">
          <div class="lined">
          </div>
           <h2 class="lined top_tow_text">Топ товары</h2>
           </div> 
      </div>
      <div class="row">
        <?php 
        $count=0;

            foreach ($products as $product) {
              ?>
            





          <?php 
            if (($count == 3) || ($count == 4)){ 
             if ($count == 3) { ?> 
                      <div class="col15-lg-3 col-md-3 col-sm-4 col-xs-12  product_cart hidden-sm">

                  <?php
                   }else{ ?>
                        <div class="col15-lg-3 col-md-3 col-sm-4 col-xs-12 hidden-md hidden-sm"  product_cart">


                      <?php } ?>
            

            <?php
            }else{ ?>
               <div class="col15-lg-3 col-md-3 col-sm-4 col-xs-12  product_cart">
                 <?php
            }
            ?>
           
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
   </div>
   
   <?php //echo "<pre>"; print_r($products) ?>
   
   
   
   
   
   
   
   
   
   
<?php
   
   // print_r($products) 



?>