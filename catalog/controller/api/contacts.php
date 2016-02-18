<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/php_mailer/class.phpmailer.php';
class ControllerApiContacts extends Controller {
	private function sendMail($body){
		$name = htmlspecialchars(trim($this->request->post['name']));
		$phone = htmlspecialchars(trim($this->request->post['phone']));
		$from = htmlspecialchars(trim($this->request->post['mail']));
		
		$address = $this->config->get('config_head_email');

		$email = new PHPMailer();
		$email->From      = $from;
		$email->FromName  = $name;
		$email->Subject   = 'Письмо директору';
		$email->Body      = $body;
		$email->AddAddress($address);

		$email->Send();
	}
	
	public function shoptour() {
    $output = '';
    if (!isset($this->request->post['name'])) {
      $output = 'Нет поля name!';
    } else if(!isset($this->request->post['phone'])) {
      $output = 'Нет поля phone!';
		} else if (!isset($this->request->post['mail'])) {
      $output = 'Нет поля mail!';
    } else if (!isset($this->request->post['text'])) {
      $output = 'Нет поля text!';
    } else if (!isset($this->request->post['date_start'])) {
			$output = 'Нет поля date_start!';
		} else if (!isset($this->request->post['date_end'])) {
			$output = 'Нет поля date_end!';
		} else {
      
      $this->sendMail(trim($this->request->post['text']) + trim($this->request->post['date_start']) + trim($this->request->post['date_end']));

      $output = 'ok';
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
		
	public function index() {
    $output = '';
    if (!isset($this->request->post['name'])) {
      $output = 'Нет поля name!';
    } else if(!isset($this->request->post['phone'])) {
      $output = 'Нет поля phone!';
		} else if (!isset($this->request->post['mail'])) {
      $output = 'Нет поля mail!';
    } else if (!isset($this->request->post['text'])) {
      $output = 'Нет поля text!';
    } else {
      
      $this->sendMail(trim($this->request->post['text']));

      $output = 'ok';
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
