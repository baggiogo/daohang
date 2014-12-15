<?php

/*
 * ClassName: PDOConn for PDO
 * Date: 2008-08-27
 * Author: ziyan.suo@163.com
 */
 
class PDOConn extends PDO{

	public $count = 0;
	
	/*
	 * Function: Conn
	 * Parameter: string
	 * Parameter: string
	 * Parameter: int
	 * Parameter: string
	 * Parameter: string
	 * Parameter: string
	 * Parameter: string
	 * Parameter: array
	 * Return: object
	 */
	public function __construct($dbname=DBNAME,$dbhost=DBHOST,$dbport=DBPORT,$dbuser=DBUSER,$dbpwd=DBPWD,$dbtype=DBTYPE,$charset=CHARSET,$arrOptions=array(PDO::ATTR_PERSISTENT=>false)){
		try{
			//���ӣ�Ĭ�ϲ�ʹ�ó־�����
			parent::__construct("$dbtype:host=$dbhost;port=$dbport;dbname=$dbname",$dbuser,$dbpwd,$arrOptions);
			//�������ݿ�����
			//parent::setAttribute(PDO::ATTR_DRIVER_NAME,$dbtype);
			//�����������һ�ָ�ʽ��ǿ�ƴ�д(CASE_UPPER)��ǿ��Сд(CASE_LOWER)��ԭʼ��ʽ(CASE_NATURAL)
			parent::setAttribute(PDO::ATTR_CASE, PDO::CASE_NATURAL);
			//������ʾ��ֻ��ʾ������(ERRMODE_SILENT)����ʾ�������(ERRMODE_WARNING)���׳��쳣(ERRMODE_EXCEPTION)
			parent::setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
			//����Ĭ�Ϸ�������ģʽ����������(FETCH_ASSOC)��������������(FETCH_NUM)��Ĭ������(FETCH_BOTH)��������ʽ(FETCH_OBJ)
			parent::setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
			//�����ַ���
			parent::query("SET NAMES $charset");
		}
		catch(PDOException $e){
			//print_r($e->getMessage());
			$this->errorLog($e->getMessage());
		}
	}
	
	/*
	 * Function: query
	 * Parameter: string
	 * Return: statement
	 */
	public function query($query){
		try{
			if($result = parent::query($query)){
				$this->count++;
				return $result;
			}
		}
		catch(PDOException $e){
			$this->errorLog($e->getMessage(),$query);
		}
	}
	
	/*
	 * Function: exec
	 * Parameter: string
	 * Return: int
	 */
	public function exec($query){
		try{
			if($rows = parent::exec($query)){
				$this->count++;
				return $rows;
			}
		}
		catch(PDOException $e){
			$this->errorLog($e->getMessage(),$query);
		}
	}
	
	/*
	 * Function: prepare
	 * Parameter: string
	 * Parameter: array
	 * Return: statement
	 */
	public function prepare($query,$arrValues=array(PDO::ATTR_CURSOR=>PDO::CURSOR_FWDONLY)){
		try{
			if($result = parent::prepare($query)){
				return $result;
			}
		}
		catch(PDOException $e){
			$this->errorLog($e->getMessage(),$query);
		}
	}
	
	/*
	 * Function: execute
	 * Parameter: statement
	 * Parameter: array
	 * Return: bool
	 */
	public function execute($result,$arrValues=array()){
		try{
			$this->count++;
			return $result->execute($arrValues);
		}
		catch(PDOException $e){
			$this->errorLog($e->getMessage());
		}
	}
	
	/*
	 * Function: getAll
	 * Parameter: string
	 * Parameter: int
	 * Return: array
	 */
	public function getAll($query,$column=NULL){
		if($result=$this->query($query)){
			if($column===NULL){
				return $result->fetchAll();
			}
			else{
				return $result->fetchAll(PDO::FETCH_COLUMN,$column);
			}
		}
	}
	
	/*
	 * Function: fetchRow
	 * Parameter: statement
	 * Return: array
	 */
	public function fetch($result){
		return $result->fetch();
	}
	
	/*
	 * Function: getOne
	 * Parameter: string
	 * Parameter: int
	 * Return: array
	 */
	public function getOne($query,$column=0){
		if($result=$this->query($query)){
			return $result->fetchColumn($column);
		}
	}
	
	/*
	 * Function: getRow
	 * Parameter: string
	 * Return: array
	 */
	public function getRow($query){
		if($result=$this->query($query)){
			return $result->fetch();
		}
	}
	
	/*
	 * Function: getID
	 * Return: int
	 */
	public function getID(){
		return parent::lastInsertId();
	}
		
	/*
	 * Function: begin
	 * Return: bool
	 */
	public function begin(){
		return parent::beginTransaction();
	}
	
	/*
	 * Function: commit
	 * Return: bool
	 */
	public function commit(){
		return parent::commit();
	}
	
	/*
	 * Function: back
	 * Return: bool
	 */
	public function back(){
		return parent::rollBack();
	}
	
	/*
	 * Function: rowCount
	 * Parameter: statement
	 * Return: int
	 */
	public function rowCount($result){
		return $result->rowCount();
	}
	
	/*
	 * Function: columnCount
	 * Parameter: statement
	 * Return: int
	 */
	public function columnCount($result){
		return $result->columnCount();
	}
	
	public function close(){

	}
	
	/*
	 * Function: errorLog
	 * Parameter: msg;
	 * Parameter: query;
	 * Return: void
	 */
	private function errorLog($msg='',$query=''){
		$text  = "Addr:".getenv("REMOTE_ADDR");
		$text .= "\r\nData:".date("Y-m-d H:i:s");
		$text .= "\r\nCode:".PDO::errorCode();
		$text .= "\r\nPage:".$_SERVER['PHP_SELF'];
		$text .= "\r\nWarning:".$msg;
		$text .= "\r\nQuery:".$query."\r\n\r\n";
		
		if(!file_exists(LOG_PATH)){
			mkdir(LOG_PATH,0200);
		}
		if(file_exists(LOG_PATH."/conn.log")){
			if(filesize(LOG_PATH."/conn.log") > 2*1024*1024){
				rename(LOG_PATH."/conn.log",LOG_PATH.date("Y-m-d",time()).".log");	
			}
		}
		error_log($text,3,LOG_PATH."/conn.log");
		
		//exit("Server busy, please try again later!");
	}
	
}
?>