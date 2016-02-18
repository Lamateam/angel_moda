<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');
		
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');


// 		$data['text_information'] = $this->language->get('text_information');
// 		$data['text_service'] = $this->language->get('text_service');
// 		$data['text_extra'] = $this->language->get('text_extra');
// 		$data['text_contact'] = $this->language->get('text_contact');
// 		$data['text_return'] = $this->language->get('text_return');
// 		$data['text_sitemap'] = $this->language->get('text_sitemap');
// 		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
// 		$data['text_voucher'] = $this->language->get('text_voucher');
// 		$data['text_affiliate'] = $this->language->get('text_affiliate');
// 		$data['text_special'] = $this->language->get('text_special');
// 		$data['text_account'] = $this->language->get('text_account');
// 		$data['text_order'] = $this->language->get('text_order');
// 		$data['text_wishlist'] = $this->language->get('text_wishlist');
// 		$data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$data['text_aboutus'] = $this->language->get('text_aboutus');
		$data['text_delivery'] = $this->language->get('text_delivery');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_loyaty'] = $this->language->get('text_loyaty');
		$data['text_wholesale'] = $this->language->get('text_wholesale');
		
		$data['text_choose_size'] = $this->language->get('text_choose_size');
		$data['text_shoptour'] = $this->language->get('text_shoptour');
		$data['text_mailus'] = $this->language->get('text_mailus');
		$data['text_contact'] = $this->language->get('text_contact');
		

		$this->load->model('catalog/information');


				$data['blog'] = array(
					'name' => $this->config->get('easy_blog_home_page_name'),
					'href'  => $this->url->link('blog/blog')
				);
            
		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

// 		$data['contact'] = $this->url->link('information/contact');
// 		$data['return'] = $this->url->link('account/return/add', '', 'SSL');
// 		$data['sitemap'] = $this->url->link('information/sitemap');
// 		$data['manufacturer'] = $this->url->link('product/manufacturer');
// 		$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
// 		$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
// 		$data['special'] = $this->url->link('product/special');
// 		$data['account'] = $this->url->link('account/account', '', 'SSL');
// 		$data['order'] = $this->url->link('account/order', '', 'SSL');
// 		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
// 		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
		
		$data['popup_register'] = $this->load->controller('popup/register');
		
		$data['aboutus'] = '/aboutus';
		$data['delivery'] = '/delivery';
		$data['return'] = '/return';
		$data['loyaty'] = '/loyaty';
		$data['wholesale'] = '/wholesale';
		
		$data['choose_size'] = '/choose_size';
		$data['shoptour'] = '/shoptour';
		$data['mailus'] = '/mailus';
		$data['contacts'] = '/contacts';
		
		$data['telephone'] = $this->config->get('config_telephone');
		$data['vk_link'] = $this->config->get('config_vk_link');
		$data['facebook_link'] = $this->config->get('config_facebook_link');
		$data['twitter_link'] = $this->config->get('config_twitter_link');
		$data['instagram_link'] = $this->config->get('config_instagram_link');
		
		$data['config_language'] = $this->config->get('config_language');
		$data['config_language_id'] = $this->config->get('config_language_id');

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);
		} else {
			return $this->load->view('default/template/common/footer.tpl', $data);
		}
	}
}

