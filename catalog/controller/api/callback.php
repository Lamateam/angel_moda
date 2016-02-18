<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/php_mailer/class.phpmailer.php';
class ControllerApiCallback extends Controller {
	public function index() {
    $output = '';
    if (!isset($this->request->post['name'])) {
      $output = 'Нет поля name!';
    } else {
      if (!isset($this->request->post['phone'])) {
        $output = 'Нет поля phone!';
      } else {
        $name = htmlspecialchars(trim($this->request->post['name']));
        $phone = htmlspecialchars(trim($this->request->post['phone']));
        $address = $this->config->get('config_callback_email');

        $email = new PHPMailer();
        $email->From      = 'callback@weblama.me';
        $email->FromName  = $name;
        $email->Subject   = 'Обратный звонок';
        $email->Body      = 'sended to ' . $address . ' from ' . $name . ' ' . $phone;
        $email->AddAddress($address);

        $email->Send();   
        
        $output = 'ok';
      }      
    }

		if (isset($this->request->server['HTTP_ORIGIN'])) {
			$this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			$this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			$this->response->addHeader('Access-Control-Max-Age: 1000');
			$this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: text/html; charset=utf-8');
		$this->response->setOutput($output);
	}
}
