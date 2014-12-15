<?php
//SERVER_NAME

//DOMAIN

//PATH
define('TEST','test');
define('ROOT',dirname(__FILE__).'/');
define('PATH_DATA',ROOT.'data');
define('EDITOR_PATH',ROOT.'admin/fckeditor/');

define('ADMIN_CONFIG',ROOT.'admin/config/');

define('ADMIN_PATH','admin');//后台目录名称
define('CLASS_PATH',ROOT.'class/');

define('LIBS_PATH',ROOT.'class/libs/');

define('ADODB_PATH',CLASS_PATH.'libs/adodb5/');

define('SMARTY_PATH',CLASS_PATH.'libs/smarty/');

define('INC_PATH',ROOT.'inc/');

define('LOG_PATH',PATH_DATA.'/logs/');

define('UPLOAD_PATH',ROOT.'upload/');

define('CONTROLLER_PATH',ROOT.'controllers/');

define('CACHE_PATH',ROOT.'data/cache/');// 文件缓存路径，xugang

//Smarty
define('TEMPLATES',ROOT.'templates/');

define('TEMPLATES_C',PATH_DATA.'/templates_c/');

define('LEFTTAG',"<?{");

define('RIGHTTAG',"}?>");

define('SMARTY_CACHE',PATH_DATA.'/cache/');

define('SMARTY_CACHE_SECOND',3600);

define('WEB_HOST','zhan123.com');

define('COOK_LIFE', time()+60*60*24*30);

//Database Account
define('DBHOST','localhost');
define('DBPORT',3306);
define('DBUSER','a001192_zhan123');
define('DBPWD','12111121');
define('DBNAME','a001192_zhan123');
define('DBTYPE','mysql');
define('DBPREFIX','5w_');

//Database charset and table prefix
define('CHARSET','gbk');

define('GETPWD_MASK','FD6i#RfdfMEihwyb');
?>