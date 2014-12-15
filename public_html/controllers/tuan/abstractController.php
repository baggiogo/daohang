<?php
abstract class abstractController
{
    protected $objS;
    protected $objC;
    protected $params;

		// 输入验证变量区
    private $_validRule = array(); // array('name'=>array('required','word','max'=>10,'min'=>2))
    private $_validResult = array();
    private $_matchArr = array();//设置私有数组变量,用来存取关联数组,如'taobao.nick'=>'A'
    private $_validFlag = true;
    private $_validStr = array(
    	'email' => "请输入正确的email地址",
				'phone' => "请输入正确的电话格式",
				'url' => "请输入正确的网址格式",
				'currency' => "请输入正确的货币格式",
				'qq' => "请输入正确的QQ号码",
				'english' => "请输入英文单词",
				'chinese' =>  "请输入中文",
				'password' => "请输入6-20位英文或数字",
				'name' =>  "请输入2-8中文或3-16英文数字",
				'string' => "请输入正确的字符串",
				'int' => "请输入整数",
				'float' => "请输入数字",
				'time' => "请输入正确的时间格式",
				'card' => "请输入正确的身份证号码",
				'post' => "请输入正确的邮编号码",
				'required' => "不能为空",
				'date' => "请按照yyyy-mm-dd或yyyy-mm-dd hh:ii:ss格式输入日期",
				'word' => "请输入字符串",
    );

    public function __construct(){
        global $objS;
        global $objC;
        global $params;
        global $dataFlag;
        $this->objS = $objS;
        $this->objC = $objC;
        $this->params = $params;
				$dataFlag = array(
				1=>'是',
				0=>'否',
				);
        $objS->assign('loginUser', isset($_SESSION['sUser']['userName']) ? '/' . $_SESSION['sUser']['userName'] : '');
    }

    //
    public function setWhere($whereArr){
		    $this->_matchArr = $whereArr;
    }

    public function setMatchArr($whereArr){
		    $this->_matchArr = $whereArr;
    }
    // 组织更新操作参数
    public function getParam($req = array()){
    	$str = '';
    	foreach($req as $key => $value){
    		if($value !== ''){
    			$str .= ",{$key}='{$value}'";
    		}else{
    			// default value
    			$str .= ",{$key}=''";
    		}
    	}
    	return substr($str,1);
    }

    // 组织查询操作参数
    public function getWhere($req = array()){
    	$str = '';
	    	foreach($req as $key => $value){
	    	if($value !== ''){
		    		if(array_key_exists($key,$this->_matchArr)){
			    		$op = $this->_matchArr[$key];
					    		switch ($op){
					    			case "A"://A，左右模糊查询%xxx%
					    					$str .= " and {$key} like '%{$value}%'";
					    				break;
					    			case "L"://L,左模糊%xxx
					    					$str .= " and {$key} like '%{$value}'";
					    				break;
					    			case "R"://R,右模糊xxx%
					    					$str .= " and {$key} like '{$value}%'";
					    				break;
					    		}
		    			}else{
			    			$str .= " and {$key}='{$value}'";
			    		}
		    	}
    	}
    	if($str == '')
    		return '1=1';
    	return substr($str,5);
    }

    /*
    输入验证主调函数
    $dataSource:数据源，关联数组，默认为_POST
    $valid:验证规则，关联数组，其key应在dataSource有对应，具体规则见_checkValid()
    */
    public function validate($dataSource,$valid){
    	if(is_array($valid) && is_array($dataSource)){
    		$this->_validRule = $valid;
    		$this->checkValid($dataSource);
    	}
    	return $this->_validFlag;
    }

    // 输入验证主函数
    public function checkValid($dataSource){
    	if(is_array($this->_validRule) && count($this->_validRule) && is_array($dataSource) && count($dataSource)){
    		foreach($this->_validRule as $key => $rules){
    			if(isset($dataSource[$key]) && isset($rules) && is_array($rules)){
    				foreach($rules as $ruleKey => $rule){
    					$ruleKey = (string)$ruleKey;
    					switch($ruleKey){
    						case 'max':
    							if(!$this->_checkValid($dataSource[$key],'max',$rule)){
    								$this->_validResult[$key] = '不能超过最大长度:'.$rule;
		    						$this->_validFlag = false;
    							}
    							break;
    						case 'min':
    							if(!$this->_checkValid($dataSource[$key],'min',$rule)){
    								$this->_validResult[$key] = '不能小于最小长度:'.$rule;
		    						$this->_validFlag = false;
    							}
    							break;
    						default :
    							if(!$this->_checkValid($dataSource[$key],$rule)){
	    							$this->_validResult[$key] = $this->_validStr[$rule];
			    					$this->_validFlag = false;
			    				}
    					}
	    			}
    			}
    		}
    	}
    }

    //
    public function setValidRule($valid){
    	$this->_validRule = $valid;
    }

    //
    public function getValidRule(){
    	return $this->_validRule;
    }

    public function setValidResult($key, $value){
    	$this->_validResult[$key] = $value;
    }

    //
    public function getValidResult(){
    	return $this->_validResult;
    }

    //
    public function getValidFlag(){
    	return $this->_validFlag;
    }

    // 输入验证主方法，单个值验证
    public function _checkValid($value,$checkName,$length=0){
    	// 空值且不是验证非空直接返回true
    	//
    	if($checkName == "required"){
    		if($value === "")
    			return false;
    		else
    			return true;
    	}
    	if($value === ""){
    			return true;
    	}
    	// 长度判断函数有待改为兼容多字节字串
    	if($length){
    		if($checkName == 'min'){
    			if(strlen(strval($value)) < intval($length)){
						return false;
					}else{
						return true;
					}
    		}elseif($checkName == 'max'){
    			if (strlen(strval($value)) > $length) {
						return false;
					}else{
						return true;
					}
    		}else{
    			return false;// 参数异常，当做失败
    		}
    	}

			$regex = array(
				'email' => '^[\w_+((-\w+)|(\.\w+))]*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$',
				'phone' => '^([0-9]{3})|([0-9]{3}\-))?1(3)|(5)[0-9]{9}$',
				'url' => '^((http|https|ftp):\/\/)?[A-Za-z0-9_-]+\.[A-Za-z0-9_-]*',
				'currency' => '^[0-9]+(\.[0-9]+)?$',
				'qq' => '^[1-9]\d{4,8}$',
				'english' => '^[A-Za-z]+$',
				'chinese' =>  '^[\xa1-\xff]+$',
				'password' => '/^[a-zA-Z0-9]{6,20}$/i',
				'name' =>  "^[\x80-\xff_a-zA-Z0-9]{3,16}$",
				'string' => "^[^`%&()=;:'\"/\\]*$",
				'int' => "^-?[0-9]+$",
				'float' => "^(-?[0-9]+)(\.[0-9]+)?$",
				'time' => "^(20|21|22|23|1[0-9]{1}|0?[0-9]{1})(:[0-5]?[0-9]{1})(:(60)|([0-5]?[0-9]{1}))?$",
				'card' => "^[0-9]{15}([0-9]{2}[A-Za-z0-9])?$",
				'post' => "^[0-9]{6}$",
				'required' => "^.+$",
				'date' => "^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}( [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2})?$",
				'word' => "^[a-z|A-Z|0-9|_|-]+$",
			);
			if(isset($regex[strtolower($checkName)])) {
				$matchRegex = $regex[strtolower($checkName)];
			}else {
				$matchRegex = $checkName;
			}
			if(eregi($matchRegex,$value) == false){
				return false;
			}

			return true;
		}

    // 共用添加附件操作，放在此处不太合理，以后转移

    public function getFileCache($sql,$expire = 86400){
    	if(empty($sql))return false;

    	$filePath = CACHE_PATH.md5($sql).'.data';
    	if(file_exists($filePath) && ($expire == 0 || time() - filemtime($filePath) < $expire)){
    		// 直接读缓存，并返回
    		return unserialize(file_get_contents($filePath));
    	}else{
    		// 查询并缓存并返回
    		$rs = $this->objC->GetAll($sql);
    		file_put_contents($filePath,serialize($rs));
    		return $rs;
    	}
    	return false;// 执行不到
    }

    // 共用top.tpl需要用到的代码，只能放这
}