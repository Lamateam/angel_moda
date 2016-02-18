<footer>
  <div class="container">
    <div class="row">
      <!-- <?php if ($informations) { ?>
        <div class="col-sm-3">
          <ul class="list-unstyled">
            <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      <?php } ?> -->
      
      <div class="col15-md-5 col-sm-6">
          <div class="subscribe_form">
            <form method="POST" target="_blank">
              <input class="form-control" name="EMAIL" type="email" placeholder="<?php if ($config_language=='ru') { echo 'Подпишитесь на новости';} else { echo 'Subscribe our news';  }?>" id="subscribe_mailchimp">
              <div class="subscribe_buttons_half">
                  <span class="btn btn-default active" data-url="http://angel-moda.us10.list-manage.com/subscribe/post?u=64c1fd0541d58ceb1f20f33ea&amp;id=9e52662a62"><?php if ($config_language=='ru') { echo 'Для него';} else { echo 'For him';  }?></span>
                  
              </div>
              <div class="subscribe_buttons_half">
                  <span class="btn btn-default" data-url="http://angel-moda.us10.list-manage.com/subscribe/post?u=64c1fd0541d58ceb1f20f33ea&amp;id=15179228f1"><?php if ($config_language=='ru') { echo 'Для нее';} else { echo 'For her';  }?></span>
              </div>
              
             </form>
          </div>
      </div>
      
       <div class="col15-md-5 col-sm-6 hidden-md hidden-lg">
     
     <div class="hald-sm">
          <div class="phone_wrapper">
            <a title="<?php if ($config_language=='ru') { echo 'Наш телефон';} else { echo 'Our phone';  }?>" href="tel:<?php echo $telephone ?>"><?php echo $telephone ?></a>
          </div>

          <span href="#basicModal" role="button"  data-toggle="modal" class="order_back"><?php if ($config_language=='ru') { echo 'Заказать обратный звонок';} else { echo 'Request  call back';  }?>   </span>
      </div>
   
      <ul class="social_buttons">

        
        <?php 
            if ($vk_link!="") {
                echo '<li><a title="ВКонтакте" class="vk" href="'.$vk_link.'"></a></li>';
            }
        ?>
        
        <?php 
            if ($facebook_link!="") {
                echo '<li><a title="Facebook" class="fb" href="'.$facebook_link.'"></a></li>';
            }
        ?>
        
        <?php 
            if ($twitter_link!="") {
                echo '<li><a title="Twitter" class="tw" href="'.$twitter_link.'"></a></li>';
            }
        ?>
        
        
        <?php 
            if ($instagram_link!="") {
                echo '<li><a title="Instagram" class="instagram" href="'.$instagram_link.'"></a></li>';
            }
        ?>
        
       
      </ul>

     </div>
      
      <div class="col15-md-5 col-sm-12">
        <ul class="list-unstyled col-xs-6">
          <li><a href="<?php echo $aboutus; ?>" title="<?php echo $text_aboutus; ?>"><?php echo $text_aboutus; ?></a></li>
          <li><a href="<?php echo $delivery; ?>" title="<?php echo $text_delivery; ?>"><?php echo $text_delivery; ?></a></li>
          <li><a href="<?php echo $return; ?>" title="<?php echo $text_return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $loyaty; ?>" title="<?php echo $text_loyaty; ?>"><?php echo $text_loyaty; ?></a></li>
          <li><a href="<?php echo $wholesale; ?>" title="<?php echo $text_wholesale; ?>"><?php echo $text_wholesale; ?></a></li>
        </ul>
        <ul class="list-unstyled col-xs-6">
          <li><a href="<?php echo $choose_size; ?>" title="<?php echo $text_choose_size; ?>"><?php echo $text_choose_size; ?></a></li>
          <li><a href="<?php echo $shoptour; ?>" title="<?php echo $text_shoptour; ?>"><?php echo $text_shoptour; ?></a></li>
          <li><a href="<?php echo $mailus; ?>" title="<?php echo $text_mailus; ?>"><?php echo $text_mailus; ?></a></li>
          <li><a href="<?php echo $contacts; ?>" title="<?php echo $text_contact; ?>"><?php echo $text_contact; ?></a></li>
       
        </ul>
      </div>
     <div class="col15-md-5 col-sm-6 hidden-sm hidden-xs">
     
     <div class="hald-sm">
          <div class="phone_wrapper">
            <a title="<?php if ($config_language=='ru') { echo 'Наш телефон';} else { echo 'Our phone';  }?>" href="tel:<?php echo $telephone ?>"><?php echo $telephone ?></a>
          </div>

          <span href="#basicModal" role="button"  data-toggle="modal" class="order_back"><?php if ($config_language=='ru') { echo 'Заказать обратный звонок';} else { echo 'Request  call back';  }?>   </span>
      </div>
   
      <ul class="social_buttons">

        
        <?php 
            if ($vk_link!="") {
                echo '<li><a title="ВКонтакте" class="vk" href="'.$vk_link.'"></a></li>';
            }
        ?>
        
        <?php 
            if ($facebook_link!="") {
                echo '<li><a title="Facebook" class="fb" href="'.$facebook_link.'"></a></li>';
            }
        ?>
        
        <?php 
            if ($twitter_link!="") {
                echo '<li><a title="Twitter" class="tw" href="'.$twitter_link.'"></a></li>';
            }
        ?>
        
        
        <?php 
            if ($instagram_link!="") {
                echo '<li><a title="Instagram" class="instagram" href="'.$instagram_link.'"></a></li>';
            }
        ?>
        
       
      </ul>

     </div>
    </div>
    <div class="row top_10">
         <div class="col15-md-5">
            <span class="site-desc"> 
                
                <?php if ($config_language=='ru') { echo '© 2014-2016. Angel-moda.com - интернет-магазин с итальянским шиком и русским характером. Все права защищены.';} else { echo '© 2014-2016. Angel-moda.com - an online store with Italian chic and the Russian character. All rights reserved.';  }?>
             </span>
         </div>
          <div class="col15-md-5 col-sm-6 payment_mode">
              <span class="footer_more"><?php if ($config_language=='ru') { echo 'Способы оплаты';} else { echo 'Payment';  }?></span>
              <div class="col15-lg-3 col-md-4 col-sm-4  col-xs-4  img_footer visa">
              </div>
              <div class="col15-lg-3 col-md-4 col-sm-4 col-xs-4 img_footer master">
              </div>
              <div class="col15-lg-3 col-md-4 col-sm-4 col-xs-4 img_footer paypal">
              </div>
              <div class="col15-lg-3 col-md-4 col-sm-6 col-xs-4 img_footer alpha">
              </div>
              <div class="col15-lg-3 col-md-4 col-sm-6 col-xs-4  img_footer yandex">
              </div>
          </div>
          <div class="col15-md-5 col-sm-6 delivery_mode">
               <span class="footer_more"><?php if ($config_language=='ru') { echo 'Способы доставки';} else { echo 'Delivery';  }?></span>
                <div class="col-xs-3 col-lg-3 col-md-6 col-sm-3 img_footer sdec">
                
                </div>
                <div class="col-xs-3 col-lg-3 col-md-6 col-sm-3 img_footer dhl">
                
                </div>
                 <div class="col-xs-3 col-lg-3 col-md-6 col-sm-3 img_footer topdelivery">
                
                </div>
                 <div class="col-xs-3 col-lg-3 col-md-6 col-sm-3 img_footer shoplogistic">
                
                </div>
          </div>
         
    </div>
  </div>
</footer>

<!-- call back -->
<div class="modal fade" id="basicModal" tabindex="-1" role="dialog">
     <div class="modal-dialog call_back call_back_form">
       <div class="modal-content">        
        <div class="modal-body">
           <span class="close_modal" type="button" data-dismiss="modal">&#10010;</span>
          <h2><?php if ($config_language=='ru') { echo 'Заказать обратный звонок';} else { echo 'Request call back';  }?></h2>
          
          <div class="">
              <input type="text" class="form-control" placeholder="<?php if ($config_language=='ru') { echo 'Как вас зовут?';} else { echo 'Name';  }?>" name="name" id="call_back_name">
              <input type="phone" class="phone form-control" placeholder="<?php if ($config_language=='ru') { echo 'Контактный телефон';} else { echo 'Phone';  }?>" name="phone" id="call_back_phone">
          </div>
              <button class="btn btn-default"><?php if ($config_language=='ru') { echo 'Отправить';} else { echo 'Send';  }?></button>
        </div>
    </div>
  </div>
</div>

<!-- enter -->
<div class="modal fade" id="enter_form" tabindex="-1" role="dialog">
     <div class="modal-dialog call_back enter_form">
       <div class="modal-content">        
        <div class="modal-body">
           <span class="close_modal" type="button" data-dismiss="modal">&#10010;</span>
          <h2><?php if ($config_language=='ru') { echo 'Авторизация';} else { echo 'Autorize';  }?></h2>
          
          <div class="">
              <input type="text" class="form-control" placeholder="<?php if ($config_language=='ru') { echo 'Email';} else { echo 'Email';  }?>" name="name" id="enter_form_name">
              <input type="password" class="pass form-control" placeholder="<?php if ($config_language=='ru') { echo 'Пароль';} else { echo 'Password';  }?>" name="password" id="enter_form_password">
              <span onclick="add_padding_modal();" href="#forgot_password" role="button" data-toggle="modal" class="forgot_password"><?php if ($config_language=='ru') { echo 'Забыли пароль';} else { echo 'Forgot password';  }?></span>
          </div>
              <div class="btn btn-default"><?php if ($config_language=='ru') { echo 'Войти';} else { echo 'Enter';  }?></div>
        </div>
    </div>
  </div>
</div>


<!-- register -->
<?php echo $popup_register; ?>


<!-- forgot_password -->
<div class="modal fade " id="forgot_password" tabindex="-1" role="dialog">
     <div class="modal-dialog call_back forgot_password_form">
       <div class="modal-content">        
        <div class="modal-body">
           <span class="close_modal" type="button" data-dismiss="modal">&#10010;</span>
          <h2><?php if ($config_language=='ru') { echo 'Забыли пароль?';} else { echo 'Forgot your password?';  }?></h2>
          <div class="">
               <input type="text" class="form-control" placeholder="<?php if ($config_language=='ru') { echo 'Ваш Email';} else { echo 'Email';  }?>" name="name" id="forgot_password_input">
          </div>     
              <div class="btn btn-default"><?php if ($config_language=='ru') { echo 'Отправить';} else { echo 'Send';  }?></div>
        </div>
    </div>
  </div>
</div>

</body></html>