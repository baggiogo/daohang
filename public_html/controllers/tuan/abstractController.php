<?php
abstract class abstractController
{
    protected $objS;
    protected $objC;
    protected $params;

		// ������֤������
    private $_validRule = array(); // array('name'=>array('required','word','max'=>10,'min'=>2))
    private $_validResult = array();
    private $_matchArr = array();//����˽���������,������ȡ��������,��'taobao.nick'=>'A'
    private $_validFlag = true;
    private $_validStr = array(
    	'email' => "��������ȷ��email��ַ",
				'phone' => "��������ȷ�ĵ绰��ʽ",
				'url' => "��������ȷ����ַ��ʽ",
				'currency' => "��������ȷ�Ļ��Ҹ�ʽ",
				'qq' => "��������ȷ��QQ����",
				'english' => "������Ӣ�ĵ���",
				'chinese' =>  "����������",
				'password' => "������6-20λӢ�Ļ�����",
				'name' =>  "������2-8���Ļ�3-16Ӣ������",
				'string' => "��������ȷ���ַ���",
				'int' => "����������",
				'float' => "����������",
				'time' => "��������ȷ��ʱ���ʽ",
				'card' => "��������ȷ�����֤����",
				'post' => "��������ȷ���ʱ����",
				'required' => "����Ϊ��",
				'date' => "�밴��yyyy-mm-dd��yyyy-mm-dd hh:ii:ss��ʽ��������",
				'word' => "�������ַ���",
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
				1=>'��',
				0=>'��',
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
    // ��֯���²�������
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

    // ��֯��ѯ��������
    public function getWhere($req = array()){
    	$str = '';
	    	foreach($req as $key => $value){
	    	if($value !== ''){
		    		if(array_key_exists($key,$this->_matchArr)){
			    		$op = $this->_matchArr[$key];
					    		switch ($op){
					    			case "A"://A������ģ����ѯ%xxx%
					    					$str .= " and {$key} like '%{$value}%'";
					    				break;
					    			case "L"://L,��ģ��%xxx
					    					$str .= " and {$key} like '%{$value}'";
					    				break;
					    			case "R"://R,��ģ��xxx%
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
    ������֤��������
    $dataSource:����Դ���������飬Ĭ��Ϊ_POST
    $valid:��֤���򣬹������飬��keyӦ��dataSource�ж�Ӧ����������_checkValid()
    */
    public function validate($dataSource,$valid){
    	if(is_array($valid) && is_array($dataSource)){
    		$this->_validRule = $valid;
    		$this->checkValid($dataSource);
    	}
    	return $this->_validFlag;
    }

    // ������֤������
    public function checkValid($dataSource){
    	if(is_array($this->_validRule) && count($this->_validRule) && is_array($dataSource) && count($dataSource)){
    		foreach($this->_validRule as $key => $rules){
    			if(isset($dataSource[$key]) && isset($rules) && is_array($rules)){
    				foreach($rules as $ruleKey => $rule){
    					$ruleKey = (string)$ruleKey;
    					switch($ruleKey){
    						case 'max':
    							if(!$this->_checkValid($dataSource[$key],'max',$rule)){
    								$this->_validResult[$key] = '���ܳ�����󳤶�:'.$rule;
		    						$this->_validFlag = false;
    							}
    							break;
    						case 'min':
    							if(!$this->_checkValid($dataSource[$key],'min',$rule)){
    								$this->_validResult[$key] = '����С����С����:'.$rule;
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

    // ������֤������������ֵ��֤
    public function _checkValid($value,$checkName,$length=0){
    	// ��ֵ�Ҳ�����֤�ǿ�ֱ�ӷ���true
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
    	// �����жϺ����д���Ϊ���ݶ��ֽ��ִ�
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
    			return false;// �����쳣������ʧ��
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

    // ������Ӹ������������ڴ˴���̫�����Ժ�ת��

    public function getFileCache($sql,$expire = 86400){
    	if(empty($sql))return false;

    	$filePath = CACHE_PATH.md5($sql).'.data';
    	if(file_exists($filePath) && ($expire == 0 || time() - filemtime($filePath) < $expire)){
    		// ֱ�Ӷ����棬������
    		return unserialize(file_get_contents($filePath));
    	}else{
    		// ��ѯ�����沢����
    		$rs = $this->objC->GetAll($sql);
    		file_put_contents($filePath,serialize($rs));
    		return $rs;
    	}
    	return false;// ִ�в���
    }

    // ����top.tpl��Ҫ�õ��Ĵ��룬ֻ�ܷ���
}