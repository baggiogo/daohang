<?php
$sql = 'SELECT * FROM '.DBPREFIX.'site_setting';
$sets = $objC->GetRow($sql);

define('CACHE_LIFETIME',                $sets['cacheLifeTime']);        # ��̬������Чʱ��
define('SITE_LOGO',                     $sets['logo']);                 # logoͼƬ·��
define('LOGO_TITLE',                    $sets['logoTitle']);            # logo��������
define('SITE_DOMAIN',                   $sets['siteDomain']);           # վ������
define('SITE_NAME',                     $sets['siteName']);             # վ������
define('FAVORITE_NAME',                 $sets['favoriteName']);         # �ղؼ���ʾ����
define('ADMIN_EMAIL',                   $sets['adminEmail']);           # վ���������
define('COUNT_CODE',                    stripslashes($sets['countCode']));            # ҳ��ײ�ͳ�ƴ���
define('PAGE_INDEX_TITLE',              $sets['indexTitle']);           # ��ҳ����
define('PAGE_INDEX_KEYWORDS',           $sets['indexKeywords']);        # ��ҳ�ؼ��ִ�
define('PAGE_INDEX_DESCRIPTION',        $sets['indexDescription']);     # ��ҳ����
define('PAGE_COMMON_TITLE',             $sets['commonTitle']);          # ����ҳ��ͨ�ñ���
define('PAGE_COMMON_KEYWORDS',          $sets['commonKeywords']);       # ����ҳ��ͨ�ùؼ��ִ�
define('PAGE_COMMON_DESCRIPTION',       $sets['commonDescription']);    # ����ҳ��ͨ������
define('PAGE_APPLY_TITLE',              $sets['commonTitle']);          # ����ҳ�����
define('PAGE_APPLY_KEYWORDS',           $sets['commonKeywords']);       # ����ҳ��ؼ��ִ�
define('PAGE_APPLY_DESCRIPTION',        $sets['commonDescription']);    # ����ҳ������
define('WEB_ICP',                       $sets['icp']);                  # icp����
define('WEB_ICPURL',                    $sets['icpurl']);               # icp����url
define('HTML_PATH',                     $sets['htmlpath']);
define('THEME_PATH',                    $sets['theme']);
define('VERSION_5W',                    $sets['version']);
define('MAILSERVER',                    $sets['mail_server']);
define('MAILPORT',                      $sets['mail_port']);
define('MAILUSERNAME',                  $sets['mail_user']);
define('MAILPASSWORD',                  $sets['mail_password']);
define('MAILNICK',                      $sets['mail_nick']);
define('CACHE_USE',                     $sets['usecache']);
define('CACHE_TIME',                    $sets['sptime']*86400);