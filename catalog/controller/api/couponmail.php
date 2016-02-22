<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/php_mailer/class.phpmailer.php';
class ControllerApiCouponMail extends Controller {
	public function index() {
		$output = '';
    if (!isset($this->request->post['email'])) {
      $output = 'Нет поля email';
    } else {
      $output = 'ok';
      $to_email = htmlspecialchars(trim($this->request->post['email']));

      $email = new PHPMailer();
      $email->From      = 'coupon@weblama.me';
      $email->FromName  = '';
      $email->Subject   = 'Купон';
      $email->Body      = 'sended to ' . $to_email;
      $email->AddAddress($to_email);

      $email->Send();			
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
