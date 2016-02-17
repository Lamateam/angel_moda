<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['config_language'] = $this->config->get('config_language');
		
		$data['shoptour'] = $this->load->controller('common/shoptour');
		$data['top_products'] = $this->load->controller('common/top_products');
		
		$data['config_language'] = $this->config->get('config_language');
		
		$this->load->language('common/home');
		
		
		$data['home_aftertext'] = $this->language->get('home_aftertext');
		$data['home_aftertext_header'] = $this->language->get('home_aftertext_header');
		
		$data['home_choose'] = $this->language->get('home_choose');
		$data['home_cons'] = $this->language->get('home_cons');
		$data['home_gar'] = $this->language->get('home_gar');
		$data['home_pay'] = $this->language->get('home_pay');
		$data['home_tours'] = $this->language->get('home_tours');
		$data['home_vig'] = $this->language->get('home_vig');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['home_it'] = $this->language->get('home_it');

		
	


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}

?>

