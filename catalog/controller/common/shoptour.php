<?php

class ControllerCommonShoptour extends Controller {
	public function index() {		
    $data = array();
    
		$this->load->language('common/shoptour');
    
    $data['config_language'] = $this->config->get('config_language');
    
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/shoptour.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/shoptour.tpl', $data);
		} else {
			return $this->load->view('default/template/common/shoptour.tpl', $data);
		}
	}
}

?>

