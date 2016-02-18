
   <div class="container">
      <div class="row">
        <div class="col-sm-12 overflow_hidden">
          <div class="lined">
          </div>
           <h2 class="lined top_tow_text">Топ товары</h2>
           </div> 
      </div>
      <div class="row">
        <?php 
            foreach ($products as $product) {
              ?>
            
            <div class="col15-lg-3">
              <div class="product_image">
                <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name'];?>">
                  <img src="<?php echo $product['thumb'];?>" title="<?php echo $product['name'];?>" class="img-resposible">
                </a>
              </div>
              <span class="product_title"><?php echo $product['name'];?></span>
            
            </div>
          
            <?php
            }
        
        ?>
      
      </div>
   </div>
   
   
   
   
   
   
   
   
   
   
   
   
<?php
   
   // print_r($products) 



?>