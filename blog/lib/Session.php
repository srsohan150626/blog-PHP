<?php 

class Session
{
	public static function init(){
		session_start();
	}
	public static function set($key,$value){
		$_SESSION[$key] = $value;
	}
	public static function get($key){
		if (isset($_SESSION[$key])){
			$result = $_SESSION[$key];
		}
		
		if (isset($result)) {
			return $result;
		}else{
			return false;
		}
		
	}

	public static function checkSession(){
		self::init();
		if(self::get("login") == false){
			self::destroy();
			header("Location:login.php");
		}
	}
	public static function checkLogin(){
		self::init();
		if(self::get("login") == true){
			header("Location:index.php");
		}
	}

	public static function destroy(){
		session_destroy();
		header("Location:login.php");
	}
	
}
?>