-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Comment_comment`
--

DROP TABLE IF EXISTS `Comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `loves` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `belong_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Comment_comment_author_id_d0db0190_fk_Myaccount_user_id` (`author_id`),
  KEY `Comment_comment_belong_id_a9e75da7_fk_Storm_article_id` (`belong_id`),
  KEY `Comment_comment_parent_id_dbda7c7f_fk_Comment_comment_id` (`parent_id`),
  KEY `Comment_comment_rep_to_id_9bfa33ff_fk_Comment_comment_id` (`rep_to_id`),
  CONSTRAINT `Comment_comment_author_id_d0db0190_fk_Myaccount_user_id` FOREIGN KEY (`author_id`) REFERENCES `Myaccount_user` (`id`),
  CONSTRAINT `Comment_comment_belong_id_a9e75da7_fk_Storm_article_id` FOREIGN KEY (`belong_id`) REFERENCES `Storm_article` (`id`),
  CONSTRAINT `Comment_comment_parent_id_dbda7c7f_fk_Comment_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `Comment_comment` (`id`),
  CONSTRAINT `Comment_comment_rep_to_id_9bfa33ff_fk_Comment_comment_id` FOREIGN KEY (`rep_to_id`) REFERENCES `Comment_comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment_comment`
--

LOCK TABLES `Comment_comment` WRITE;
/*!40000 ALTER TABLE `Comment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment_userlike`
--

DROP TABLE IF EXISTS `Comment_userlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Comment_userlike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `belong_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Comment_userlike_author_id_68f073c3_fk_Myaccount_user_id` (`author_id`),
  KEY `Comment_userlike_belong_id_f60c5b61_fk_Storm_article_id` (`belong_id`),
  CONSTRAINT `Comment_userlike_author_id_68f073c3_fk_Myaccount_user_id` FOREIGN KEY (`author_id`) REFERENCES `Myaccount_user` (`id`),
  CONSTRAINT `Comment_userlike_belong_id_f60c5b61_fk_Storm_article_id` FOREIGN KEY (`belong_id`) REFERENCES `Storm_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment_userlike`
--

LOCK TABLES `Comment_userlike` WRITE;
/*!40000 ALTER TABLE `Comment_userlike` DISABLE KEYS */;
INSERT INTO `Comment_userlike` VALUES (2,1,2),(3,1,4),(4,1,3),(5,1,5);
/*!40000 ALTER TABLE `Comment_userlike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Myaccount_user`
--

DROP TABLE IF EXISTS `Myaccount_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Myaccount_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `link` varchar(200) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Myaccount_user`
--

LOCK TABLES `Myaccount_user` WRITE;
/*!40000 ALTER TABLE `Myaccount_user` DISABLE KEYS */;
INSERT INTO `Myaccount_user` VALUES (1,'pbkdf2_sha256$120000$i7ZVAraURdsL$w/5qJANv8VVvvzOfHwQRoXogV4+kjyO0focRmySa1VI=','2019-06-19 11:14:31.957532',1,'CRIME','','','374542101@qq.com',1,1,'2019-05-28 23:26:57.002821',NULL,'www.eosones.com','avatar/CRIME/2ca84915cdda46dfb059495e8508e032.jpg');
/*!40000 ALTER TABLE `Myaccount_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Myaccount_user_groups`
--

DROP TABLE IF EXISTS `Myaccount_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Myaccount_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Myaccount_user_groups_user_id_group_id_78b207a4_uniq` (`user_id`,`group_id`),
  KEY `Myaccount_user_groups_group_id_bf0e5a31_fk_auth_group_id` (`group_id`),
  CONSTRAINT `Myaccount_user_groups_group_id_bf0e5a31_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `Myaccount_user_groups_user_id_dce6a8e4_fk_Myaccount_user_id` FOREIGN KEY (`user_id`) REFERENCES `Myaccount_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Myaccount_user_groups`
--

LOCK TABLES `Myaccount_user_groups` WRITE;
/*!40000 ALTER TABLE `Myaccount_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Myaccount_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Myaccount_user_user_permissions`
--

DROP TABLE IF EXISTS `Myaccount_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Myaccount_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Myaccount_user_user_perm_user_id_permission_id_ae43388d_uniq` (`user_id`,`permission_id`),
  KEY `Myaccount_user_user__permission_id_b3e8de1f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `Myaccount_user_user__permission_id_b3e8de1f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `Myaccount_user_user__user_id_545bfb6a_fk_Myaccount` FOREIGN KEY (`user_id`) REFERENCES `Myaccount_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Myaccount_user_user_permissions`
--

LOCK TABLES `Myaccount_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `Myaccount_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Myaccount_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_activate`
--

DROP TABLE IF EXISTS `Storm_activate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_activate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `is_active` tinyint(1) NOT NULL,
  `add_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_activate`
--

LOCK TABLES `Storm_activate` WRITE;
/*!40000 ALTER TABLE `Storm_activate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Storm_activate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_article`
--

DROP TABLE IF EXISTS `Storm_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `summary` longtext NOT NULL,
  `body` longtext NOT NULL,
  `img_link` varchar(255) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `views` int(11) NOT NULL,
  `loves` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `Storm_article_author_id_e706173b_fk_Myaccount_user_id` (`author_id`),
  KEY `Storm_article_category_id_64e9d529_fk_Storm_category_id` (`category_id`),
  CONSTRAINT `Storm_article_author_id_e706173b_fk_Myaccount_user_id` FOREIGN KEY (`author_id`) REFERENCES `Myaccount_user` (`id`),
  CONSTRAINT `Storm_article_category_id_64e9d529_fk_Storm_category_id` FOREIGN KEY (`category_id`) REFERENCES `Storm_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_article`
--

LOCK TABLES `Storm_article` WRITE;
/*!40000 ALTER TABLE `Storm_article` DISABLE KEYS */;
INSERT INTO `Storm_article` VALUES (2,'Django搭建个人博客 | 通过IIS部署腾讯云Winsows服务器','## · 部署前准备\r\n如今比较流行的是Nginx + Gunicorn 的方式部署 Django 项目，但本文采用的是小众的Windows Server和IIS方式，其中需要一个Python包wfastcgi来将进入IIS的请求移交到Python应用程序进行处理。\r\n### 1、购买服务器\r\n在 linux 上部署时，一般有两种选择。centos系统使用较多，新人可以选择有桌面环境的ubuntu系统。学生优惠9.9 元/月购买地址：[阿里云服务器学生专区','如今比较流行的是Nginx + Gunicorn 的方式部署 Django 项目，但本文采用的是小众的Windows Server和IIS方式，其中需要一个Python包wfastcgi来将进入IIS的请求移交到Python应用程序进行处理。\r\n## 部署前准备\r\n### 1、购买服务器\r\n在 linux 上部署时，一般有两种选择。centos系统使用较多，新人可以选择有桌面环境的ubuntu系统。学生优惠9.9 元/月购买地址：[阿里云服务器学生专区](https://promotion.aliyun.com/ntms/act/campus2018.html \"阿里云服务器学生专区\")、[腾讯云服务器学生专区](https://cloud.tencent.com/act/campus \"腾讯云服务器学生专区\")。本文介绍的是Windows Server 2012 R2的部署。\r\n###  2、购买域名\r\n阿里云域名注册地址：[ 域名注册系统](https://wanwang.aliyun.com/domain/ \" 阿里云域名注册系统\")，根据需求购买即可\r\n### 3、解析域名到服务器\r\n域名解析前需要先将绑定到服务器：[绑定域名 ](https://help.aliyun.com/knowledge_detail/39881.html \" \")，随后解析域名：[解析域名](https://help.aliyun.com/knowledge_detail/39903.html?spm=5176.2000002.0.0.43df132dmnCiMy \" \")\r\n## 搭建服务器\r\n如何登录到Windows Server：[ 腾讯云登录服实例](https://cloud.tencent.com/document/product/213/5435)\r\n### 1、IIS安装和配置\r\n如何安装IIS：[腾讯云安装配置 IIS](https://cloud.tencent.com/document/product/213/2755)，配置完成后浏览器访问云服务器的公网IP查看 IIS 服务是否正常运行。\r\n\r\n![IIS运行成功](https://i.loli.net/2019/06/01/5cf22f0d13c4752075.png\r\n)\r\n### 2、安装Python\r\n如何安装Python：[安装Python教程](https://www.runoob.com/python3/python3-install.html \" Windows下安装Python\")，注意勾选添加到环境变量，最后在命令提示符中输入python并按Enter键，检验是否安装成功。\r\n### 3、配置虚拟环境\r\n使用虚拟环境便于包管理，而且避免版本冲突，方便迁移项目。python3.3版中加入了venv模块支持原生创建虚拟环境，并在3.4版本后加入了pip包，创立并激活虚拟环境后可直接使用，[官方文档](https://docs.python.org/3/library/venv.html)。\r\n\r\n**创建虚拟环境**\r\n\r\n以管理员身份运行cmd或power shell，在当前目录创建虚拟环境(Blog_ven为自定义的虚拟环境的名称)：\r\n```Python\r\n>python -m venv Blog_ven\r\n```\r\n或提前建立虚拟环境的文件夹C:\\virtualenv\\Blog_ven，指定文件夹创建虚拟环境\r\n```Python\r\n> cd C:\\virtualenv\\Blog_ven\r\n> python -m venv .\r\n```\r\n\r\n**激活虚拟环境**\r\n\r\n在上面的命令提示符中，进入虚拟环境Scripts文件夹下\r\n```Python\r\n> cd C:\\virtualenv\\Blog_ven\\Scripts\r\n#激活\r\n> activate.bat\r\n#退出\r\n> deactivate.bat\r\n```\r\n在激活虚拟环境之后，会在命令提示符前出现（Blog_ven），之后即可以进行pip包的安装，否则安装到的是全局环境下\r\n为确保我们不会遇到pip安装或安全问题,让我们升级更新Python的包安装程序，在上面的命令提示符与虚拟环境激活下，运行以下命令:\r\n```Python\r\npython -m pip install –upgrade pip\r\n```\r\n\r\n**迁移项目环境**\r\n\r\n当需要将本地测试虚拟环境env转移到另一台电脑比如服务器时，直接可将env1里的文件全部复制到env2里，虽简单但涉及修改文件路径。推荐使用requirements.txt方法迁移。\r\n进入本地原虚拟环境env1：\r\n```Python\r\n> cd C:\\virtualenv\\Blog_ven1\\\r\n> pip freeze > requirements.txt\r\n```\r\n此时包依赖信息将保存在C:\\virtualenv\\Blog_ven1\\requirements.txt文件中，注意在有些包安装前需要依赖其他包的需要手动调整一下顺序。复制requirements.txt到C:\\virtualenv\\Blog_ven2中\r\n进入目的服务器虚拟环境env：\r\n```Python\r\n>cd C:\\virtualenv\\Blog_ven2\\\r\n>pip install -r requirements.txt\r\n```\r\npip就会自动从网上下载并安装所有包，此时虚拟环境以及完全复制到服务器，在虚拟环境激活状态下，确保在服务器本地可运行django项目：\r\n```Python\r\n>cd C:\\demo.eosones.com\\Mybolg\r\n>python manage.py runserver 127.0.0.1:8000\r\n```\r\n### 4、安装wfastcgi模块\r\n为了将django项目能够部署到IIS上需要安装额外的一个Python包，激活虚拟环境状态下：\r\n```Python\r\n>pip install wfastcgi\r\n```\r\n安装完成后需要启动wfastcgi\r\n```Python\r\n>wfastcgi-enable\r\n```\r\n这里说明安装成功，并且得到虚拟环境python路径及虚拟环境下wfastcgi的安装路径，之后要用到这两个路径。（如需配置多个django项目，多个项目的wfastcgi的安装路径需不用，即单独项目单独虚拟环境即可）\r\n```Python\r\n#已经在配置提交路径“MACHINE/WEBROOT/APPHOST”向“MACHINE/WEBROOT/APPHOST”的“system.webServer/fastCgi”节应用了配置更改\r\n\" C:\\virtualenv\\Blog_ven\\Scripts\\python.exe|C:\\virtualenv\\Blog_ven\\lib\\site-packages\\wfastcgi.py\" can now be used as a FastCGI script processor\r\n```\r\n### 5、配置IIS和django网站\r\n我们在Django项目的根目录下创建一个web.config的文件，里面内容如下：（如需手动配置：[手动配置教程](https://www.cnblogs.com/xiaolecn/p/5111076.html )，[英语配置教程](https://www.mattwoodward.com/2016/07/23/running-a-django-application-on-windows-server-2012-with-iis/?unapproved=1578&moderation-hash=f04ac947bc7737e3a069a679baf0c95a#comment-1578 )）\r\n```\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n    <configuration>\r\n        <system.webServer>\r\n            <handlers>\r\n                <add name=\"Python FastCGI\" \r\n                     path=\"*\" \r\n                     verb=\"*\" \r\n                     modules=\"FastCgiModule\" \r\n                     scriptProcessor=\" C:\\virtualenv\\Blog_ven\\Scripts\\python.exe|C:\\virtualenv\\Blog_ven\\lib\\site-packages\\wfastcgi.py\" \r\n                     resourceType=\"Unspecified\" \r\n                     requireAccess=\"Script\"/>\r\n            </handlers>\r\n        </system.webServer>\r\n        <appSettings>\r\n            <add key=\"WSGI_HANDLER\" value=\"django.core.wsgi.get_wsgi_application()\" />\r\n            <add key=\"PYTHONPATH\" value=\"C:\\demo.eosones.com\\Mybolg\" />\r\n            <add key=\"DJANGO_SETTINGS_MODULE\" value=\"Mybolg.settings\" />\r\n        </appSettings>\r\n    </configuration>\r\n```\r\n这里对照着自己的网站，修改三处地方替换即可\r\n1. scriptProcessor用刚才得到的路径代替\r\n1. ``<add key=\"PYTHONPATH\" value=\"\">``这里的value要定位到当前的项目根目录（跟manage.py同目录）\r\n1. ``<add key=\"DJANGO_SETTINGS_MODULE\" value=\"\" />``这里写入app的名字   \r\n\r\n然后打开IIS管理器：打开“控制面板”在“管理工具”中打开“Internet Information Services(IIS)管理器”。选中左边栏网站右键添加网站，物理地址选中项目地址\r\n![添加网站](https://i.loli.net/2019/06/01/5cf22ea73f43a49471.png)\r\n### 6、配置静态文件\r\n此时网站已经可以访问，但CSS等静态文件没有访问到，首先对我们的django项目进行静态文件资源迁移，在项目的settings.py文件中添加：\r\n```Python\r\nSTATIC_ROOT = os.path.join(BASE_DIR, \'static\')\r\n```\r\n在项目根目录下输入如下命令\r\n```Python\r\n>python manage.py collectstatic\r\n```\r\n执行命令后会把全部用到的静态文件复制到STATIC_ROOT这个目录下，生产环境中还需设置 DEBUG = False，此时App中的 \'django.contrib.staticfiles\' 将会失效，出错时前端不再代码等报错信息。\r\n然后我们在static文件夹中添加一个web.config文件，remove name中的值必须与之前的web.config中的一致，文件内容如下：\r\n```\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<configuration>\r\n  <system.webServer>\r\n    <handlers>\r\n      <remove name=\"Python FastCGI\" />\r\n    </handlers>\r\n  </system.webServer>\r\n</configuration>\r\n```\r\n此时已经配置完成，为了能够通过域名访问站点，项目的settings.py文件中添加ALLOWED_HOSTS = [\'*\'] 或者ALLOWED_HOSTS = [ \'.example.com\', # Allow domain and subdomains]\r\n## 问题汇总（持续更新）\r\n>HTTP 错误 500.0 - Internal Server Error，c:\\sites\\myproject_env\\scripts\\python.exe - FastCGI 进程意外退出\r\n\r\n1. 注意路径中是否含有中文路径\r\n2. 测试中使用python虚拟环境包virtualenv时报错，切换到python自带的env后解决\r\n3. 在IIS管理器的应用池中，将默认标识``ApplicationPoolIdentity``改为最高权限的``LocalSystem``\r\n\r\n>HTTP 404错误\r\n\r\n1. 在IIS网站中添加处理程序映射的模块映射设置将请求限值的映射选项卡的复选框取消勾选\r\n\r\n>配置错误：不能在此路径中使用此配置节。如果在父级别上锁定了该节，便会出现这种情况。锁定是默认设置的\r\n\r\n1. 因为 IIS 7 采用了更安全的 web.config 管理机制，默认情况下会锁住配置项不允许更改。管理员运行命令行 ``%windir%\\system32\\inetsrv\\appcmd unlock config -section:system.webServer/handlers ``','/static/images/article/01_IIS.jpg','2019-06-01 14:28:53.437250','2019-06-19 11:59:07.666888',60,1,'01',1,2),(3,'Django搭建个人博客 | 使用Markdown语法书写文章整合','在技术博客文章详情页面中，最受程序员欢迎的便捷简约排版方式莫属Markdown，本文主要介绍Markdown格式在博文的前端显示及代码高亮，和Django后台admin中编辑博文时Markdown的实时预览。\r\n## 前端显示\r\n### 1、安装Markdown\r\nMarkdown是一种轻量级的标记语言，它允许人们“使用易读易写的纯文本格式编写文档，然后转换成有效的或者HTML文档。关于','在技术博客文章详情页面中，最受程序员欢迎的便捷简约排版方式莫属Markdown，本文主要介绍Markdown格式在博文的前端显示及代码高亮，和Django后台admin中编辑博文时Markdown的实时预览。\r\n## 前端显示\r\n### 1、安装Markdown\r\nMarkdown是一种轻量级的标记语言，它允许人们“使用易读易写的纯文本格式编写文档，然后转换成有效的或者HTML文档。关于[ Markdown语法](http://www.markdown.cn/ \" Markdown语法\")看这里。\r\nPython插件markdown默认支持标准的markdown语法，但标准语法里代码块需要每行前空4个空格才能识别。推荐使用 Python-markdown2 ，它是python-markdown的升级版，支持GFM式（GFM 是 Github 拓展的基于 Markdown 的一种纯文本的书写格式）的markdown书写格式。允许使用`` ``` ``包裹代码块。\r\n\r\n打开CMD，进入虚拟环境\r\n```python\r\npip install markdown\r\n```\r\n### 2、使用Markdown\r\n为了将Markdown语法书写的文章渲染为HTML文本，首先改写 Storm / views.py 的 文章处理类 ArticleDetailView：\r\n```python\r\n#Storm / views.py \r\n\r\nfrom Storm import models\r\nfrom django.shortcuts import render, get_object_or_404\r\nfrom django.views.generic import DetailView #从数据库获取模型的一条记录数据DetailView\r\nimport markdown #导入markdown\r\nfrom django.utils.text import slugify\r\nfrom markdown.extensions.toc import TocExtension\r\n\r\n#文章详情页类处理\r\nclass ArticleDetailView(DetailView):\r\n    model=models.Article\r\n    template_name = \'article.html\' \r\n    context_object_name = \'article\' \r\n\r\n    def get(self, request, *args, **kwargs):\r\n       # ···\r\n\r\n    def get_object(self, queryset=None):\r\n    # 覆写 get_object 方法的目的是因为需要对 article 的 body 值进行渲染\r\n    # 将markdown语法渲染成html样式\r\n    article.body = markdown.markdown(article.body,\r\n        extensions=[\r\n        # 包含 缩写、表格等常用扩展\r\n        \'markdown.extensions.extra\',\r\n        # 语法高亮扩展\r\n        \'markdown.extensions.codehilite\',\r\n        #允许我们自动生成目录\r\n         \'markdown.extensions.toc\',\r\n        ])\r\n    return article\r\n```\r\n代码中``markdown.markdown``语法接收两个参数：第一个参数是需要渲染的文章正文article.body；第二个参数载入了常用的语法扩展，``markdown.extensions.extra``中包括了缩写、表格、语法高亮、自动生成目录等扩展。\r\n然后，修改前端模板有关文章正文的部分：\r\n```python\r\n#templates/article.html\r\n\r\n# 在 article.body 后加上 |safe 过滤器\r\n<p>{{ article.body|safe }}</p>\r\n```\r\nsafe 是 Django 模板系统中的过滤器（Filter），Django出于安全的考虑，会将输出的HTML代码进行转义，这使得article.body中渲染的HTML文本无法正常显示。而|safe就类似给article.body贴了一个标签，表示这一段字符不需要进行转义了。\r\n启动服务器，在后台中新录入一条用markdown语法书写的文章，内容如下：\r\n```python\r\n# 国风·周南·关雎\r\n---\r\n**关关雎鸠，在河之洲。窈窕淑女，君子好逑。**\r\n\r\n参差荇菜，左右流之。窈窕淑女，寤寐求之。\r\n\r\n---\r\n+ 列表一\r\n+ 列表二\r\n    + 列表二-1\r\n    + 列表二-2\r\n---\r\n\r\n···\r\ndef detail(request, id):\r\n article = ArticlePost.objects.get(id=id)\r\n # 将markdown语法渲染成html样式\r\n article.body = markdown.markdown(article.body,\r\n  extensions=[\r\n      # 包含 缩写、表格等常用扩展\r\n     \'markdown.extensions.extra\',\r\n      # 语法高亮扩展\r\n      \'markdown.extensions.codehilite\',\r\n      #允许我们自动生成目录\r\n       \'markdown.extensions.toc\',\r\n  ])\r\n context = { \'article\': article }\r\n return render(request, \'article/detail.html\', context)\r\n···\r\n```\r\n此时可以解析出Markdown的原生格式了，但后续需要代码高亮及其格式的美化。\r\n\r\n![](https://i.loli.net/2019/06/10/5cfdc662e371026532.png)\r\n\r\n### 3、代码高亮\r\nPygments是一种通用语法高亮显示器，可以帮助我们自动生成美化代码块的样式文件。（插件highlight.js也比较常用）\r\n重新打开命令行窗口，进入虚拟环境安装Pygments：\r\n```python\r\npip install Pygments\r\n```\r\n安装完成后Pygments在后台为我们做了很多事，它把高亮的一些语法转为css样式，把代码分成了一个一个单词，在前端页面，直接右键查看源码就能看到了。需要注意的是为了让Pygments正确识别分割代码块，在后台编辑输入代码块时，建议在```包裹后加上代码种类，如下：\r\n```html\r\n···Python\r\n   代码块\r\n···\r\n```\r\n然后我们需要生成高亮样式，在命令行中进入static目录中的css文件中，输入Pygments指令后回车：\r\n```Python\r\npygmentize -S default -f html -a .codehilite > default.css\r\n```\r\n1. ``-a .codehilite``指所有css选择器都具有.codehilite这一优先选择器\r\n1. ``-S default``就是指定所需要的样式，Pygments还内置了很多其他的样式，[ 官网样式](https://github.com/richleland/pygments-css \"官网样式\")\r\n1. ``> default.css``将内容输出到default.css文件中\r\n这里有一点需要注意, 生成命令中的 -a 参数需要与真实页面中的 CSS Selector 相对应，即``.codehilite``这个字段在有些版本中应写为``.highlight``。如果后面的代码高亮无效，很可能是这里出了问题。\r\n此时在css目录中是否自动生成了一个叫default.css的文件，接下来我们在 content-base.html 中引用这个文件，同时引入bootstrapc框架会使排版格式更加美观。\r\n```html\r\n#templates/content-base.html\r\n  <head>\r\n    <link rel=\"stylesheet\" href=\"{% static \'css/bootstrap.min.css\' %}\">\r\n    <!-- 引入monikai.css -->\r\n    <link rel=\"stylesheet\" href=\"{% static \'css/default.css\' %}\">\r\n  </head>\r\n```\r\n完成以上步骤后先退出服务器然后重新 runserver，顺利的话看到如下：\r\n\r\n![](https://i.loli.net/2019/06/10/5cfdc63042d0353506.png)\r\n\r\n最后，还可以对markdown文本的整体样式进行自定义修改，为了不影响页面其他地方，最好在包裹文章的标签中加个class标识。\r\n```html\r\n#例如修改代码框\r\n\r\n.markdown pre {\r\n    padding: 1em;\r\n    border: none;\r\n    line-height: 1.45;\r\n    max-height: 35em;\r\n    position: relative;\r\n    background: url(/static/images/blueprint.png) #F6F6F6;\r\n}\r\n#...\r\n<p class=‘markdown’>{{ article.body|safe }}</p>\r\n```\r\n![](https://i.loli.net/2019/06/10/5cfdc60cc341621052.png)\r\n\r\n### 4、自动生成文章目录\r\n在使用markdown的步骤中，我们在 Storm / views.py 函数中的``markdown.extensions.extra``参数中加入了自动生成目录插件，在输入博文时，在需要加入标题的位置加入``[TOC]``标记即可，在前端文章中就能 看到``[TOC]``标记的地方被内容的目录替换了。\r\n上述方式的一个局限局限性就是只能通过 [TOC] 标记在文章内容中插入目录，如果我想在页面的其它地方，需修改：\r\n```python\r\n#Storm/views.py\r\n\r\nfrom Storm import models\r\nfrom django.shortcuts import render, get_object_or_404\r\nfrom django.views.generic import DetailView #从数据库获取模型的一条记录数据DetailView\r\nimport markdown #导入markdown\r\nfrom django.utils.text import slugify\r\nfrom markdown.extensions.toc import TocExtension\r\n\r\n#文章详情页类处理\r\nclass ArticleDetailView(DetailView):\r\n    model=models.Article\r\n    template_name = \'article.html\' \r\n    context_object_name = \'article\' \r\n\r\n    def get(self, request, *args, **kwargs):\r\n       # ···\r\n\r\n    def get_object(self, queryset=None):\r\n      # 覆写 get_object 方法的目的是因为需要对 article 的 body 值进行渲染，用model的方法\r\n      article = super(ArticleDetailView, self).get_object(queryset=None)\r\n      md = markdown.Markdown(extensions=[\r\n            \'markdown.extensions.extra\',\r\n            \'markdown.extensions.codehilite\',\r\n            #美化点击目录时的url显示模块\r\n            TocExtension(slugify=slugify),\r\n       ])\r\n       #md实例的convert方法将markdown转为html\r\n       article.body = md.convert(article.body)\r\n       #实例 md 就会多出一个 toc 属性\r\n       article.toc = md.toc\r\n       return article\r\n```\r\n注意文章 article 实例本身是没有 md 属性的，利用动态语言的特性我们给它动态添加了 md 属性。此时在前端模板的任何位置就可以进行渲染目录。\r\n```html\r\n <div>\r\n    <p>目录</p>\r\n    {{ article.toc|safe }}\r\n    <a href=\"javascript:void(0);\" class=\"top\">返回顶部</a>\r\n </div>\r\n```\r\n![](https://i.loli.net/2019/06/10/5cfdc5c7dc0ea95836.png)\r\n## Admin中编辑及预览\r\n在django中有很好的插件来让我们快速完成 django admin 后台中博文的编辑及实时预览—django-mdeditor\r\n### 1、安装配置\r\n打开CMD，进入虚拟环境\r\n```python\r\npip install django-mdeditor\r\n```\r\n在项目的settings.py的INSTALLED_APPS中添加’mdeditor’, \r\n```python\r\nINSTALLED_APPS = [\r\n    #...\r\n    \"mdeditor\",\r\n    #...\r\n]\r\n```\r\n\r\n配置好上传目录media文件夹\r\n```python\r\n#Myblog/settings.py\r\n\r\n# 媒体文件专属参数设置（需要加url识别才能访问）\r\nMEDIA_URL = \"/media/\" # 媒体文件别名(相对路径) 和 绝对路径\r\nMEDIA_ROOT = (\r\n    os.path.join(BASE_DIR, \'media\')\r\n)\r\n```\r\n最后将mdeditor添加到项目的url中：\r\n```python\r\n#Myblog/urls.py\r\n\r\nurlpatterns = [\r\n    #...\r\n    re_path(r\'mdeditor/\', include(\'mdeditor.urls\')),\r\n]\r\n```\r\n在我们的 Storm/models.py 下的文章模型中重写 body 字段\r\n```python\r\nfrom mdeditor.fields import MDTextField\r\n\r\n# 文章\r\nclass Article(models.Model):\r\n    #...\r\n    # 文章内容\r\n    body = MDTextField(verbose_name=\'文章内容\')\r\n    #...\r\n```\r\n注意在 Storm/admin.py 中配置以便后台显示 ，然后迁移数据库\r\n```python\r\npython manage.py makemigrations\r\npython manage.py migrate\r\n```\r\n### 2、查看效果\r\n运行项目，进入后台admin，进入博文的编辑页面，编辑Markdown及实时预览。\r\n[![](https://i.loli.net/2019/06/10/5cfdc5597e36b16511.png)](https://i.loli.net/2019/06/10/5cfdc5597e36b16511.png)\r\n最后的问题就是如何做到Django admin中的预览效果与前端一致，因为我们的样式配置不同，Django插件mdeditor的Markdown样式位置一般在虚拟环境下的 Lib\\site-packages\\mdeditor\\static\\mdeditor\\css 中的editormd.css里，可以修改成前端的样式文件，或者将前端引入这个样式，并在文章包裹的标签中加入``class=\"markdown-body\"``\r\n\r\n<small>参考：[追梦任务 | Markdown 自动生成文章目录](https://www.zmrenwu.com/courses/django-blog-tutorial/materials/10/?comment_page=4#comment-area \"\") | [Django搭建个人博客：使用Markdown语法书写文章](https://blog.csdn.net/weixin_43217710/article/details/82777029 \"\")</small>','/static/images/article/02_Markdown.jpg','2019-06-10 10:32:19.617545','2019-06-19 11:50:49.926060',20,1,'02',1,2),(4,'Django搭建个人博客 | 使用allauth插件管理用户登录与注册','django-allauth是最受欢迎的管理用户登录与注册的第三方Django安装包，可以大大简化我们用户注册，登录及账户管理，其核心功能包括用户注册、忘记密码、登录(微信，微博等第三方登录；邮箱验证)、登录后密码重置、邮箱发送密码重置链接、退出等。\r\n## 安装与设置\r\n运行CMD，打开虚拟环境\r\n```\r\npip install django-allauth\r\n```','django-allauth是最受欢迎的管理用户登录与注册的第三方Django安装包，可以大大简化我们用户注册，登录及账户管理，其核心功能包括用户注册、忘记密码、登录(微信，微博等第三方登录；邮箱验证)、登录后密码重置、邮箱发送密码重置链接、退出等。\r\n## 安装与设置\r\n运行CMD，打开虚拟环境\r\n```\r\npip install django-allauth\r\n```\r\n安装好后设置Myblog / settings.py，将allauth相关APP加入到INSTALLED_APP里去。对于第三方的providers，根据需要添加。[ 官网Providers文档 ](https://django-allauth.readthedocs.io/en/latest/providers.html \" 第三方providers\")\r\n```python\r\nINSTALLED_APPS = [\r\n    ...,\r\n    #django-allauth必须安装的app\r\n    \'django.contrib.sites\',\r\n    \'allauth\',\r\n    \'allauth.account\',\r\n    \'allauth.socialaccount\',\r\n    #第三方账号相关，根据需求添加\r\n    \'allauth.socialaccount.providers.weibo\',\r\n    \'allauth.socialaccount.providers.github\',\r\n]\r\n```\r\n同时还需要一些设置\r\n```python\r\n # django-allauth相关设置\r\nAUTHENTICATION_BACKENDS = (\r\n      # django admin所使用的用户登录与django-allauth无关 \r\n      \'django.contrib.auth.backends.ModelBackend\',\r\n      # allauth 身份验证 \r\n      \'allauth.account.auth_backends.AuthenticationBackend\',\r\n)\r\n\r\n#app django.contrib.sites需要的设置\r\nSITE_ID = 1\r\n# 指定要使用的登录方法(用户名、电子邮件地址两者之一)\r\nACCOUNT_AUTHENTICATION_METHOD = \'username_email\'\r\n# 要求用户注册时必须填写email\r\nACCOUNT_EMAIL_REQUIRED = True\r\n```\r\n配置邮箱：allauth 在注册用户时，会给用户填写的邮箱发送一封激活邮件，在重置密码时也可通过邮箱进行重置。如果你没有邮件服务器，可以设置成自己的QQ或163邮箱，localhost环境下一样可以使用。[ 如何获取邮箱授权码 ](https://mp.weixin.qq.com/s?__biz=MjM5OTMyODA4Nw==&mid=2247483732&idx=1&sn=b022e3c3b789c09ae1d856cd49ed0764&chksm=a73c616c904be87a84821da1a3f79d3d548da67c36a011ef1c914203694444c4f003b265520e&scene=21#wechat_redirect\" 如何获取邮箱授权码 \")\r\n```python\r\n# smtp 服务器地址\r\nEMAIL_HOST = \"smtp.qq.com\"\r\n# 默认端口25，若请求超时可尝试465\r\nEMAIL_PORT = 25\r\n# 用户名\r\nEMAIL_HOST_USER = \"374542101@qq.com\"\r\n# 邮箱代理授权码（不是邮箱密码）\r\nEMAIL_HOST_PASSWORD = \"password\" \r\n# 是否使用了SSL 或者TLS（两者选其一）\r\n# EMAIL_USE_TLS = True  \r\nEMAIL_USE_SSL = True\r\n# 发送人\r\nEMAIL_FROM = \"374542101@qq.com\" # \r\n# 默认显示的发送人，（邮箱地址必须与发送人一致），不设置的话django默认使用的webmaster@localhost\r\nDEFAULT_FROM_EMAIL = \"EOSONES 博客 <374542101@qq.com>\" \r\n```\r\n修改时区\r\n```python\r\nLANGUAGE_CODE = \'zh-hans\'\r\nTIME_ZONE = \'Asia/Shanghai\'\r\nUSE_I18N = True\r\nUSE_L10N = True\r\nUSE_TZ = False\r\n```\r\n将 allauth 添加加到总项目的 urls.py 中\r\n```python\r\n# Myblog/urls.py\r\nfrom django.conf.urls import re_path,include\r\n\r\nurlpatterns = [\r\n    ...,\r\n    #django-allauth插件\r\n    re_path(r\'^accounts/\', include(\'allauth.urls\')),\r\n]\r\n```\r\ndjango-allauth 常见设置选项\r\n```python\r\n# 要求用户注册时必须填写email\r\nACCOUNT_EMAIL_REQUIRED = True \r\n# 注册中邮件验证方法: \"强制(mandatory)\"、 \"可选(optional)\" 或 \"否(none)\" 之一\r\n(注册成功后，会发送一封验证邮件，用户必须验证邮箱后，才能登陆)\r\nACCOUNT_EMAIL_VERIFICATION (=\"optional\") \r\n# 作用于第三方账号的注册\r\nSOCIALACCOUNT_EMAIL_VERIFICATION = \'optional\' / \'mandatory\' / \'none\'\r\n# 邮件发送后的冷却时间(以秒为单位)\r\nACCOUNT_EMAIL_CONFIRMATION_COOLDOWN (=180) \r\n# 邮箱确认邮件的截止日期(天数)\r\nACCOUNT_EMAIL_CONFIRMATION_EXPIRE_DAYS (=3) \r\n\r\n# 指定要使用的登录方法(用户名、电子邮件地址或两者之一)\r\nACCOUNT_AUTHENTICATION_METHOD (=\"username\" | \"email\" | \"username_email\") \r\n# 登录尝试失败的次数\r\nACCOUNT_LOGIN_ATTEMPTS_LIMIT (=5) \r\n# 从上次失败的登录尝试，用户被禁止尝试登录的持续时间\r\nACCOUNT_LOGIN_ATTEMPTS_TIMEOUT (=300) \r\n# 更改为True，用户一旦确认他们的电子邮件地址，就会自动登录\r\nACCOUNT_LOGIN_ON_EMAIL_CONFIRMATION (=False) \r\n\r\n# 更改或设置密码后是否自动退出\r\nACCOUNT_LOGOUT_ON_PASSWORD_CHANGE (=False) \r\n# 更改为True，用户将在重置密码后自动登录\r\nACCOUNT_LOGIN_ON_PASSWORD_RESET (=False) \r\n# 控制会话的生命周期，可选项还有: \"False\" 和 \"True\"\r\nACCOUNT_SESSION_REMEMBER (=None) \r\n\r\n# 用户注册时是否需要输入邮箱两遍\r\nACCOUNT_SIGNUP_EMAIL_ENTER_TWICE (=False) \r\n# 用户注册时是否需要用户输入两遍密码\r\nACCOUNT_SIGNUP_PASSWORD_ENTER_TWICE (=True) \r\n# 用户不能使用的用户名列表\r\nACCOUNT_USERNAME_BLACKLIST (=[]) \r\n# 加强电子邮件地址的唯一性\r\nACCOUNT_UNIQUE_EMAIL (=True) \r\n# 用户名允许的最小长度的整数\r\nACCOUNT_USERNAME_MIN_LENGTH (=1) \r\n# 使用从社交账号提供者检索的字段(如用户名、邮件)来绕过注册表单\r\nSOCIALACCOUNT_AUTO_SIGNUP (=True) \r\n\r\n# 设置登录后跳转链接\r\nLOGIN_REDIRECT_URL (=\"/\") \r\n# 设置退出登录后跳转链接\r\nACCOUNT_LOGOUT_REDIRECT_URL (=\"/\")\r\n# 用户登出是否需要确认确认(True表示直接退出，不用确认；False表示需要确认)\r\nACCOUNT_LOGOUT_ON_GET (=True)\r\n```\r\n## 测试效果\r\n首先生成数据库\r\n```python\r\npython manage.py makemigrations\r\npython manage.py migrate\r\n```\r\n登录 admin，将 example.com 改为我们博客的域名，在开发环境下，我们用127.0.0.1:8000，并设置好 site 名字（邮箱中显示）再退出登录。现在你就可以访问以下链接查看allauth的效果了。由于我们已经设置好了邮箱，所以涉及邮箱验证和密码重置部分都可以正常进行的。注册：``http://127.0.0.1:8000/accounts/signup/``登录：``http://127.0.0.1:8000/accounts/login/``\r\n\r\ndjango-allauth表单会自带验证，检查用户名和email是否已经注册，同时检查密码强度是否够以及用户输入的两次密码是不是一致。当注册成功后，用户会收到一封邮件来验证邮箱，如果``ACCOUNT_EMAIL_VERIFICATION = \'mandatory\' `` ，用户必须通过邮箱验证后才能登陆。如果你不需要邮箱验证，只需要设置 ``ACCOUNT_EMAIL_VERIFICATION = \'none\' `` 就可以了。\r\n### 1、内置的Urls\r\n```python\r\n/accounts/login/  #（URL名account_login): 登录\r\n/accounts/signup/   #(URL名account_signup): 注册\r\n/accounts/password/reset/  #(URL名: account_reset_password) ：重置密码\r\n/accounts/logout/   #(URL名account_logout): 退出登录\r\n/accounts/password/set/  # (URL名:account_set_password): 设置密码 \r\n/accounts/password/change/   #(URL名: account_change_password): 改变密码（需登录）\r\n/accounts/email/  #(URL名: account_email) 用户可以添加和移除email，并验证\r\n/accounts/social/connections/  #（URL名:socialaccount_connections): 管理第三方账户\r\n```\r\n## 扩展用户模型\r\ndjango-allauth 并没有提供展示和修改用户资料的功能，也没有对用户资料进行扩展，所以我们需要自定义用户模型来进行扩展。\r\n### 1、创建 app 及配置\r\n由于 django-allauth 已经占用了 account 这个 app，所以我们可以创建一个叫 Myaccount 的 app，并将其加入 settings.py 配置文件的 INSTALL_APPS 中，同时把 url 也加入到项目 settings.py 中。\r\n```\r\npython manage.py startapp Myaccount\r\n```\r\n```\r\n# Myblog/settings.py\r\nINSTALLED_APPS = [\r\n    ...,\r\n    \'Myaccount\',\r\n     #django-allauth必须安装的app\r\n    ...,\r\n]\r\n```\r\n```\r\n# Myblog/urls.py\r\nfrom django.conf.urls import re_path,include\r\n\r\nurlpatterns = [\r\n    ...,\r\n    #django-allauth插件\r\n    re_path(r\'^accounts/\', include(\'allauth.urls\')),\r\n    #django-allauth用户自定义信息扩展\r\n    re_path(r\'^accounts/\', include(\'Myaccount.urls\',namespace=\'accounts\')),\r\n]\r\n```\r\n因为我们希望用户在登录或注册成功后，自动跳转到个人信息页 \"/accounts/profile/\"，所以在前面的配置中加入了如下代码\r\n```\r\n# Myblog/settings.py\r\n\r\nLOGIN_REDIRECT_URL = \"/accounts/profile/\"\r\n```\r\n### 2、创建用户模型及表单\r\n&emsp;首先自定义的 User 模型继承了 AbstractUser ，AbstractUser 是 django 自带用户类，可扩展用户个人信息，AbstractUser 模块下有：password、username、first_name、last_name、email、last_loginl、is_superuserl、is_staffl、is_activel、date_joined 字段，自定义用户User扩展了 nickname、link 及头像 avatar 字段，此处重写了User的 save() 方法以便上传的头像以用户名为文件夹分类。\r\n```\r\n# Myaccount/models.py\r\n\r\nfrom django.db import models\r\n#from django.contrib.auth.models import User\r\nfrom django.contrib.auth.models import AbstractUser  \r\n\r\n#用pillow、django-imagekit模块设置图片，可以处理图片，生成指定大小的缩略图，前端显示src=\"{{ user.avatar.url }}\r\nfrom imagekit.models import ProcessedImageField\r\nfrom imagekit.processors import ResizeToFill\r\n\r\n#扩展Django自带的User模型字\r\nclass User(AbstractUser):\r\n    nickname = models.CharField(max_length=30, blank=True, null=True, verbose_name=\'昵称\')\r\n    # 扩展用户个人网站字段\r\n    link = models.URLField(\'个人网址\', blank=True, help_text=\'提示：网址必须填写以http开头的完整形式\')\r\n    # 扩展用户头像字段,upload_to后必须是相对路径,上传路径已设置为media，因此upto不需要media/avatar，数据库中avatar/...,前端用avatar.url为media/avatar/...\r\n    avatar = ProcessedImageField(upload_to=\'avatar\',default=\'avatar/default.png\',verbose_name=\'头像\',\r\n                                processors=[ResizeToFill(100, 100)], # 处理后的图像大小\r\n                                format=\'JPEG\', # 处理后的图片格式\r\n                                options={\'quality\': 95} # 处理后的图片质量\r\n                                )\r\n\r\n    #重写User的save()方法保存上传的头像目录\r\n    def save(self, *args, **kwargs):\r\n    # 当用户更改头像的时候，avatar.name = \'文件名\'，其他情况下avatar.name = \'upload_to/文件名\'\r\n    if len(self.avatar.name.split(\'/\')) == 1:\r\n      self.avatar.name = self.username + \'/\' + self.avatar.name\r\n    #调用父类的save()方法后，avatar.name就变成了\'upload_to/用户名/文件名\'\r\n    super(User, self).save()\r\n\r\n    # 定义网站管理后台表名\r\n    class Meta:\r\n      verbose_name = \'用户信息\' \r\n      verbose_name_plural = verbose_name #指定模型的复数形式是什么,如果不指定Django会自动在模型名称后加一个’s’\r\n      ordering = [\'-id\']\r\n      #admin后台显示名字关联到此表的字段的后天显示名字\r\n    def __str__(self):\r\n      return self.username\r\n```\r\n&emsp;为了让 Django 能够识别自定义的用户模型，需要在 settings.py 中需配置`` AUTH_USER_MODEL=\'Myaccount.User\' ``，注册的用户就会基于自定义User模型创建，并一同创建account中与自定义User关联的模型。\r\n```\r\n# Myaccount/forms.py\r\nfrom django import forms\r\nfrom .models import User\r\n\r\nclass ProfileForm(forms.Form):\r\n class Meta:\r\n  # 关联的数据库模型，这里是用户模型\r\n  model = User\r\n  # 前端显示、可以修改的字段（admin中）\r\n  fields = [\'nickname\'\'link\', \'avatar\']\r\n```\r\n### 3、创建视图并配置URLs\r\n&emsp;我们需要创建2个URLs和对应的视图来实现用户资料展示和用户资料编辑页面。\r\n```\r\n# Myaccount/urls.py\r\nfrom django.conf.urls import re_path\r\nfrom . import views\r\n\r\napp_name = \"Myaccount\"\r\n\r\nurlpatterns = [\r\n    re_path(r\'^profile/$\', views.profile, name=\'profile\'),\r\n    re_path(r\'^profile/update/$\', views.profile_update, name=\'profile_update\'),\r\n]\r\n```\r\n因为我们希望用户在登录或注册后自动跳转到/accounts/profile/, 需要在 settings.py 中需配置\r\n```\r\nLOGIN_REDIRECT_URL = \'/accounts/profile/\'\r\n```\r\n视图函数根据需求自定义，本博客前端用的是Ajax请求修改网站link与头像avatar供参考\r\n```\r\n#Myaccount/views.py\r\n\r\nfrom django.shortcuts import render\r\nfrom django.http import HttpResponse\r\n\r\nfrom Myaccount import models\r\n# Create your views here.\r\n\r\n#auth中用户权限有关的类。auth可以设置每个用户的权限。\r\nfrom django.contrib.auth.decorators import login_required\r\nfrom django.views.decorators.csrf import csrf_exempt\r\n\r\n# 使用login_required装饰器，用户只有登录了才能访问其用户资料\r\n@login_required\r\n#个人信息\r\ndef profile(request):\r\n    # AUTH_USER_MODEL 类型的对象，表示当前登录的用户。\r\n    user = request.user\r\n    return render(request, \'account/profile.html\', {\'user\': user})\r\n\r\nimport json\r\nimport base64\r\n@login_required # 使用login_required装饰器，用户只有登录了才能访问其用户资料\r\n@csrf_exempt #取消当前函数防跨站请求伪造功能，即便settings中设置了全局中间件。\r\ndef profile_update(request):\r\n    #request.is_ajax(): #判断请求头中是否含有X-Requested-With的值\r\n    if request.is_ajax():\r\n      key=request.POST.get(\'key\')#request.POST.get(\'\')不存在默认为空，request.POST[]不存在报错\r\n    if key==\'link\':\r\n      link=request.POST[\'link\']\r\n      username=request.POST[\'username\']\r\n      models.User.objects.filter(username=username).update(link=link)\r\n      link=models.User.objects.filter(username=username).first().link\r\n      linkJson={\'link\':link}\r\n      return HttpResponse(json.dumps(linkJson))\r\n    elif key==\'avatar\':\r\n      username=request.POST[\'username\']\r\n      #用ModelForm可代替手动编写代码存储上传文件\r\n      user_profile=models.User.objects.filter(username=username).first()\r\n      user_profile.avatar=request.FILES.get(\'avatar\')\r\n      user_profile.save()\r\n      url=user_profile.avatar.url\r\n      dataJson={\'url\':url}\r\n    return HttpResponse(json.dumps(dataJson))\r\n```\r\n### 4、设计前端模板\r\n前端根据需求自定义设计，本博中客个人信息只允许更改头像与个人网站，参考请到Github查看源码。\r\n\r\n![](https://i.loli.net/2019/06/10/5cfdce7904a9740358.png)\r\n需要注意前后端的交互信息，通过View中传来的当前用户模型User，可通过Django的模板语言显示用户名：``{{ user.username }}``，用户邮箱：``{{ user.link }}``、用户头像链接：``{{ user.avatar.url }}``、以及用户邮箱：``{{ user.emailaddress_set .0}}``（django-allauth在注册用户时创建的ACCOUNTS表，关联自定义模型User，包含用户的邮箱信息及各种方法）、Django-allauth判断邮箱是否验证：``{% if user.emailaddress_set .0.verified %} ``、Django判断用户是否登录：``{% if user.is_authenticated %}``等等。\r\n\r\n## 美化页面模板\r\ndjango-allauth自带的页面很简陋，我们需要进行美化。如果你是通过pip安装的django-allauth，模板位置一般在python安装位置或者虚拟环境下的blog_env\\Lib\\site-packages中，找到\\allauth\\templates下的整个account文件夹，或者从github上（[ allauth项目地址 ](https://github.com/pennersr/django-allauth/tree/master/allauth \" allauth项目地址\")）将allauth的/templates/accounts/文件夹整个拷贝到你的本地项目中的templates目录下，因为django-allauth总是会在templates/accounts/文件夹中寻找模板。\r\n### 1、美化base.html\r\n不管是注册，登录还是重置密码页面，html模板主要内容都是表单。我们将使用bootstrap迅速美化模板和表单。最快速的方式就是修改base.html（如果没有该文件，你需要创建一个)，加入boostrap样式和js。\r\n```\r\n<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n  <meta charset=\"utf-8\">\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n  <title>{% block head_title %} {% endblock %}</title>\r\n  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" >\r\n</head>\r\n<body>\r\n\r\n  <main>\r\n      <div class=\"container\">\r\n      {% block content %}\r\n      {% endblock %}\r\n    </div>\r\n  </main>\r\n\r\n  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\r\n  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\" integrity=\"sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS\" crossorigin=\"anonymous\"></script>\r\n\r\n</body>\r\n</html>\r\n```\r\n我们以注册页面为例，教你如何美化 django-allauth 的表单。注册页面默认的 signup.html 代码如下，我们先不做任何修改。\r\n```\r\n{% extends \"account/base.html\" %}\r\n\r\n{% load i18n %}\r\n\r\n{% block head_title %}{% trans \"Signup\" %}{% endblock %}\r\n\r\n{% block content %}\r\n<h1>{% trans \"Sign Up\" %}</h1>\r\n\r\n<p>{% blocktrans %}Already have an account? Then please <a href=\"{{ login_url }}\">sign in</a>.{% endblocktrans %}</p>\r\n\r\n<form class=\"signup\" id=\"signup_form\" method=\"post\" action=\"{% url \'account_signup\' %}\">\r\n  {% csrf_token %}\r\n  {{ form.as_p }}\r\n  {% if redirect_field_value %}\r\n  <input type=\"hidden\" name=\"{{ redirect_field_name }}\" value=\"{{ redirect_field_value }}\" />\r\n  {% endif %}\r\n  <button type=\"submit\">{% trans \"Sign Up\" %} &raquo;</button>\r\n</form>\r\n\r\n{% endblock %}\r\n\r\n```\r\n### 2、美化注册表单\r\n一个标准的 Boostrap 表单代码如下，每个输入字段 field 都是包围在div里的``class=\"form-group\"``，同时每个 input 的 css 都有 form-control 这个属性。而我们django的表单渲染 form.as_p 或则 form.as_table 显然满足不了我们的要求，因为我们没法将 css 类名加进去。\r\n```\r\n<form>\r\n  <div class=\"form-group\">\r\n    <label for=\"id_email\">Email address</label>\r\n    <input type=\"email\" class=\"form-control\" id=\"id_email\" name=\"email\">\r\n  </div>\r\n  <div class=\"form-group\">\r\n    <label for=\"id_password\">Password</label>\r\n    <input type=\"password\" class=\"form-control\" id=\"id_password\" name=\"password\">\r\n  </div>\r\n  <button type=\"submit\" class=\"btn btn-default\">Submit</button>\r\n</form>\r\n```\r\n当然可以使用自定义widge的属性来给各个字段添加css，或者直接使用django-crispy-forms表单，这两种相对耦合度较高，此处推荐使用插件django-widget-teaks，在前端模板中不仅可以为字段添加样式，还提供了强大的render_field方法，可以自定义某个字段的css和提示词placeholder。\r\n进入CMD，打开虚拟环境\r\n```\r\npip install django-widget-tweaks\r\n```\r\n安装成功后，需要把它加到 INSTALLED_APP 中，这时在模板中{% load widget_tweaks %}，你就可以给你想要的字段添加css了。以signup.html，我们给每个输入字段都加入了form-control属性。\r\n```\r\n{% extends \"account/base.html\" %}\r\n\r\n{% load i18n %}\r\n{% load widget_tweaks %}\r\n\r\n{% block head_title %}{% trans \"Signup\" %}{% endblock %}\r\n\r\n{% block content %}\r\n<h1>{% trans \"Sign Up\" %}</h1>\r\n\r\n<p>{% blocktrans %}Already have an account? Then please <a href=\"{{ login_url }}\">sign in</a>.{% endblocktrans %}</p>\r\n\r\n<form class=\"signup\" id=\"signup_form\" method=\"post\" action=\"{% url \'account_signup\' %}\">\r\n  {% csrf_token %}\r\n\r\n     {% for hidden in form.hidden_fields %}\r\n      {{ hidden }}\r\n    {% endfor %}\r\n\r\n    {% for field in form.visible_fields %}\r\n      <div class=\"form-group\">\r\n        <label for=\"{{ field.id_for_label }}\">{{ field.label }}</label>\r\n        {{ field|add_class:\'form-control\' }}\r\n        {% for error in field.errors %}\r\n          <span class=\"help-block\">{{ error }}</span>\r\n        {% endfor %}\r\n      </div>\r\n    {% endfor %}\r\n  \r\n\r\n  {% if redirect_field_value %}\r\n  <input type=\"hidden\" name=\"{{ redirect_field_name }}\" value=\"{{ redirect_field_value }}\" />\r\n  {% endif %}\r\n\r\n    <div class=\"form-group\">\r\n  <button type=\"submit\" class=\"btn btn-success\"\">{% trans \"Sign Up\" %}</button>\r\n    </div>\r\n</form>\r\n\r\n{% endblock %}\r\n\r\n```\r\n根据页面自定义功能，美化表单后，添加到页面中。本博客设计如下图所示，参考前端代码请到 Github 查看。（第三方登录方式添加到INSTALLED_APP中后，便会出现在Login模板中，第三方列表模板位置在插件包中的allauth\\templates\\socialaccount\\snippets\\provider_list.html 中，可进行自定义美化）。安照此方法，可依次将需要的模板进行美化。\r\n\r\n![](https://i.loli.net/2019/06/10/5cfdce45beb8641461.png)\r\n### 3、修改邮件信息\r\n注册修改密码的过程中，都会收到邮件信息，在我们复制到templates\\account\\mail文件中的txt文件即是我们邮件中的提示信息，根据需求自定义修改\r\n## 第三方账号登录\r\n### 1、Github\r\n1、首先在Github中申请 OAuth [Github OAuth注册页面](https://github.com/settings/applications/new)，要注意将回调地址callback URL设置为 http://127.0.0.1:8000/accounts/github/login/callback/，设置完成后可在账号的 Settings / Developer settings / OAuth Apps 中查找更新，上线需要将``127.0.0.1:8000``更新为我们的博客域名\r\n\r\n![](https://i.loli.net/2019/06/10/5cfdce1a0f9fa85306.png)\r\n2、进入admin后台，更新站点，将``example.com``改为我们博客的域名，在开发环境下，我们用``127.0.0.1:8000``，然后点击 SOCIAL ACCOUNTS 下的 Social application，增加一个application，如下图所示\r\n\r\n![](https://i.loli.net/2019/06/10/5cfdcde093bd122010.png)\r\n\r\nProvider选Github，这里的Provider就是我们在INSTALLED_APP里增加的第三方socialaccount.provider，client id 和 secret key 我们在github注册应用里获得了，将 sites 加入到右边 选中的 sites。\r\n完成以上设置后，注销，然后回到登录页面，选中 Github 登录，授权应用即可，成功登录后，邮箱里也会收到一份激活邮件，这是因为 django-allauth 会自动为我们添加一个本地账号，根据你的 social account 用户名和 email 。\r\n### 2、微信\r\n1、 首先注册[微信开放平台](https://open.weixin.qq.com/cgi-bin/index?t=home/index&lang=zh_CN&token=5a76c183e832b9522b6d5dacc996c5d85e5e1db5)账号，登录后在管理中心—网站应用—创建网站应用，填写网站相关信息进行申请，一般会在7个工作日内完成审核。\r\n\r\n![](https://i.loli.net/2019/06/10/5cfdcd97d1b1e85915.png)\r\n需注意的是，注册信息需要公章，目前没有发现个人注册的方法，卒。\r\n\r\n<small>参考：[大江狗 | django-allauth教程](https://blog.csdn.net/weixin_42134789/article/details/80656272)</small>','/static/images/article/03_allauth.jpg','2019-06-10 11:21:52.086584','2019-06-19 11:50:41.068809',27,1,'04',1,2),(5,'Django搭建个人博客 | 使用jQuery插件Cropper实现上传图片的裁剪','在本博客的用户个人资料中允许用户上传头像的过程中进行裁剪上传，对于不熟悉前端的人来说有很多优秀的前端图片裁剪插件可以使我们快速完成功能，本文使用的是功能全面的jQuery插件Cropper，结合本文进行简单的应用介绍。查看全部参数设置推荐阅读[Cropper的基本使用](https://segmentfault.com/a/1190000012344970)。\r\n## 安装配置','在本博客的用户个人资料中允许用户上传头像的过程中进行裁剪上传，对于不熟悉前端的人来说有很多优秀的前端图片裁剪插件可以使我们快速完成功能，本文使用的是功能全面的jQuery插件Cropper，结合本文进行简单的应用介绍。查看全部参数设置推荐阅读[Cropper的基本使用](https://segmentfault.com/a/1190000012344970)。\r\n## 安装配置\r\n### 1、下载地址\r\n1. 官方示例：[官方示例](https://fengyuanchen.github.io/cropper/)\r\n1. jQuery：[GitHub项目地址](https://github.com/fengyuanchen/cropper)\r\n1. JS：[GitHub项目地址](https://github.com/fengyuanchen/cropperjs)\r\n### 2、基本使用\r\n首先要引入必要的js和css文件，上线可使用min压缩版\r\n```\r\n<link href=\"/Myblog/static/css/cropper.css\" rel=\"stylesheet\">\r\n<script src=\"/Myblog/static/js/cropper.js\"></script>\r\n```\r\n可以将图片或canvas直接包裹到一个块级元素中\r\n```\r\n<!-- Wrap the image or canvas with a block element -->\r\n<div class=\"container\">\r\n    <img src=\"picture.jpg\">\r\n</div>\r\n```\r\n在JS中调用该图片剪裁插件，即可在图片上出现裁剪框\r\n```\r\n<script>\r\n$(\'.container > img\')\').cropper({\r\n        aspectRatio: 1 / 1,  #长宽比\r\n        viewMode:1,   #视图模式，可以使用0,1,2,3，具体查看demo示例\r\n        crop: function (e) {\r\n            // Output the result data for cropping image.\r\n        }\r\n    });\r\n</script>\r\n```\r\n需要注意的是剪裁区域的尺寸继承自图片的父容器（包裹容器），所以要确保包裹图片的是一个可见的块级元素。输出的剪裁数据基于原始的图片尺寸，可以使用这些数据直接剪裁图片。\r\n## 应用项目\r\n首先，根据需求，我们需要的是点击头像即可打开图片，选中图片后出现在模态框中的图片即可进行裁剪，确认提交后通过Ajax传给后端保存到服务器，将地址保存到用户表的avatar字段。\r\n\r\n<div style=\"align: center\">\r\n<img src=\"https://i.loli.net/2019/06/12/5d00de1dab5d765168.gif\"/>\r\n</div>\r\n\r\n### 1、隐藏上传文件按钮\r\n```\r\n /*首先画个圆形*/\r\n.circle {\r\n    width: 100px;\r\n    height: 100px;\r\n    border-radius: 50%;\r\n    -moz-border-radius: 50%;\r\n    -webkit-border-radius: 50%;\r\n    /*水平居中*/\r\n    margin: 25px auto 25px auto;\r\n    /*作用于子标签*/\r\n    overflow: hidden;\r\n    position: relative;\r\n    text-align: center;\r\n}\r\n /*上传文件样式*/\r\n.uploadhead {\r\n    position: absolute;\r\n    bottom: 0;\r\n    width: 100px;\r\n    height: 35px;\r\n    background-color: #000;\r\n    opacity: 0.7;\r\n    color: #fff;\r\n    font-size: 14px;\r\n    line-height: 30px;\r\n    display: none;\r\n}\r\n/*经过头像显示上传文字*/\r\n.circle:hover .uploadhead {\r\n    display: block;\r\n    color: #fff;\r\n}\r\n/*隐藏Input上传按钮*/\r\n.uploadhead input {\r\n    position: absolute;\r\n    top: 0;\r\n    opacity: 0;\r\n}\r\n...\r\n<div class=\"circle\">\r\n    <img id=\"avatar\" src=\"{{user.avatar.url}}\">\r\n    <a href=\"javascript:\" class=\"uploadhead\">\r\n       <input type=\"file\" name=\"file\" onchange=\"preview(this)\">上传头像\r\n    </a>\r\n</div>\r\n```\r\n### 2、触发事件\r\n在这之前我们先引入需要用到的Bootstrap模态框，注意提前引入Bootstrap框架的相关文件。\r\n```\r\n<!-- 裁剪图片Modal -->\r\n<div class=\"modal fade\" id=\"changeModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\r\n    <div class=\"modal-dialog\" role=\"document\">\r\n        <div class=\"modal-content\">\r\n            <div class=\"modal-header\">\r\n                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\r\n                <h4 class=\"modal-title\" id=\"myModalLabel\">请选择合适的区域作为头像</h4>\r\n            </div>\r\n            <div class=\"modal-body\">\r\n                <div class=\"img-container\">\r\n                    <img id=\"uploadPreview\" src=\"\">\r\n                </div>\r\n                <div id=\"error_text\" style=\"display:none\"></div>\r\n            </div>\r\n            <div class=\"modal-footer\">\r\n                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">取消</button>\r\n                <button id=\'sendPhoto\' type=\"button\" class=\"btn btn-primary\">上传头像</button>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n```\r\n注意我们在上传头像中的给Input标签绑定的是onchange()事件，每次选择图片后才会触发该事件，之后才开模态对话框。在preview函数中，首先我们判断文件格式，之后打开model显示错误信息，或者初始化cropper的相关设置，最后在model关闭的回调函数进行清空cropper及相关设置。\r\n```js\r\nfunction preview(obj) {\r\n    var _alertMsg = document.getElementById(\'error_text\');\r\n    var _myModalLabel = document.getElementById(\"myModalLabel\");\r\n\r\n    //此事件在模态框被隐藏（并且同时在 CSS 过渡效果完成）之后被触发。\r\n    $(\'#changeModal\').modal(\'show\').on(\'hidden.bs.modal\', function(e) { \r\n        //关闭模态对话框后清空file input的值\r\n        $(obj).val(\'\');\r\n        //隐藏错误提示\r\n        _alertMsg.style.display = \'none\';\r\n        //清空图片信息\r\n        document.getElementById(\"uploadPreview\").src = \'\';\r\n        $(\"#uploadPreview\").cropper(\'reset\').cropper(\'replace\', \'\');\r\n        //摧毁cropper\r\n        $(\"#uploadPreview\").cropper(\"destroy\");\r\n        //解绑changeModal的所有事件\r\n        $(\'#changeModal\').off(\'shown.bs.modal\');\r\n        $(\'#changeModal\').off(\'hidden.bs.modal\');\r\n    });\r\n\r\n    var val = obj.value;\r\n    //设定可上传的格式\r\n    var upLoadType = \'.jpg,.gif,.bmp,.png\';\r\n    //从字符串中抽出最后一次出现.之后的字符，并且转换成小写\r\n    var fileExt = val.substr(val.lastIndexOf(\".\")).toLowerCase();\r\n    //查找后缀名是否符合条件，如果符合返回>=0，如果不符合则返回负数;\r\n    var result = upLoadType.indexOf(fileExt);\r\n    //如果只有一个文件则只需要访问这个FileList对象中的第一个元素.\r\n    var oFile = obj.files[0];\r\n    //文件不存在直接返回或者不符合格式\r\n    if (obj.files.length === 0 || result < 0) {\r\n        _alertMsg.innerHTML = \"请输入正确格式:\" + upLoadType;\r\n        _alertMsg.style.display = \'inline-block\';\r\n        _myModalLabel.innerHTML = \"上传出现错误\";\r\n        //隐藏图片容器\r\n        document.getElementById(\"uploadPreview\").parentElement.style.display = \'none\';\r\n        return;\r\n    };\r\n    if (oFile.size / 1024 > 100) {\r\n        _alertMsg.innerHTML = \"请上传100k内的文件\";\r\n        _alertMsg.style.display = \'inline-block\';\r\n        _myModalLabel.innerHTML = \"上传出现错误\";\r\n        //隐藏图片容器\r\n        document.getElementById(\"uploadPreview\").parentElement.style.display = \'none\';\r\n        return;\r\n    };\r\n\r\n    //model显示并在CSS过渡完成回调\r\n    $(\'#changeModal\').on(\'shown.bs.modal\', function() {\r\n        //转为基于file API的Blob对象\r\n        var blobURL;\r\n        //URL对象是硬盘（SD卡等）指向文件的一个路径\r\n        var URL = window.URL || window.webkitURL;\r\n        //获得一个http格式的url路径\r\n        blobURL = URL.createObjectURL(oFile);\r\n        document.getElementById(\"uploadPreview\").parentElement.style.display = \'block\';\r\n        document.getElementById(\"uploadPreview\").src = blobURL;\r\n\r\n        //绑定cropper插件\r\n        $(\"#uploadPreview\").cropper({\r\n            aspectRatio: 1, //1比1\r\n            viewMode: 3,\r\n            zoomOnWheel: false, //禁止缩放原图\r\n            zoomOnTouch: false, //禁止缩放原图\r\n            ready: function(data) {\r\n                // Output the result data for cropping image.\r\n                // And then\r\n            }\r\n        });\r\n        //重置cropper设置并替换生成的cropper图片url\r\n        $(\"#uploadPreview\").cropper(\'reset\').cropper(\'replace\', blobURL);\r\n        _myModalLabel.innerHTML = \"请选择合适的区域作为头像\";\r\n    });\r\n};\r\n```\r\n最后，裁剪图片后，通过model中的确认上传按钮中绑定的点击事件用Ajax将数据发送后台。\r\n```js\r\n$(\'#sendPhoto\').on(\'click\', function() {\r\n    var username = document.getElementById(\'username\').innerHTML.trim();\r\n    // cropper可以得到两种裁剪后图片的数据（即blob和dataURL）,dataURL过于长，此处用toBlob\r\n    var photo = $(\"#uploadPreview\").cropper(\'getCroppedCanvas\', {\r\n        width: 100,\r\n        height: 100,\r\n    }).toBlob(function(blob) {\r\n        //因为上传的是文件不是string类型，因此用到H5的FormData方法\r\n        //组装formdata\r\n        var fd = new FormData();\r\n        fd.append(\'username\', username);\r\n        //fd.append(\"fileName\", \"avatar\"); fileName为自定义，名字随机生成或者写死，看需求\r\n        fd.append(\"avatar\", blob); //fileData为自定义,blob包含图片的各种信息\r\n        fd.append(\"key\",\"avatar\");\r\n        //ajax上传，ajax的形式随意，JQ的写法也没有问题\r\n        //需要注意的是服务端需要设定，允许跨域请求。数据接收的方式和<input type=\"file\"/> 上传的文件没有区别\r\n        $.ajax({\r\n            url: \'/accounts/profile/update/\',\r\n            type: \'post\',\r\n            data: fd,\r\n            processData: false, //不设置Content-Type请求头\r\n            contentType: false, //不处理发送的数据\r\n            success: function(data) {\r\n                var avaterurl = JSON.parse(data).url;\r\n                $(\"#avatar\").attr(\"src\", avaterurl);\r\n                $(\'#changeModal\').modal(\'hide\');\r\n            },error: function() { console.log(\"保存失败\"); }\r\n        });\r\n    });\r\n});\r\n```\r\n### 3、视图函数\r\n首先配置更新用户信息的url\r\n```Python\r\n#Myaccount/urls.py\r\n\r\nfrom django.conf.urls import re_path\r\nfrom . import views\r\n\r\napp_name = \"Myaccount\"\r\n\r\nurlpatterns = [\r\n    re_path(r\'^profile/$\', views.profile, name=\'profile\'),\r\n    re_path(r\'^profile/update/$\', views.profile_update, name=\'profile_update\'),\r\n]\r\n```\r\n视图函数处理用户通过Ajax提交的个人网站与用户头像信息\r\n```Python\r\n#Myaccount/views.py\r\n\r\nfrom django.shortcuts import render\r\nfrom django.http import HttpResponse\r\n\r\nfrom Myaccount import models\r\n\r\n#auth中用户权限有关的类。auth可以设置每个用户的权限。\r\nfrom django.contrib.auth.decorators import login_required\r\nfrom django.views.decorators.csrf import csrf_exempt\r\n\r\n# 使用login_required装饰器，用户只有登录了才能访问其用户资料\r\n@login_required\r\n#个人信息\r\ndef profile(request):\r\n    # AUTH_USER_MODEL 类型的对象，表示当前登录的用户。\r\n    user = request.user\r\n    return render(request, \'account/profile.html\', {\'user\': user})\r\n\r\nimport os\r\nimport json\r\nimport base64\r\nfrom django.shortcuts import get_object_or_404\r\n@csrf_exempt #取消当前函数防跨站请求伪造功能，即便settings中设置了全局中间件。\r\ndef profile_update(request):\r\n    #request.is_ajax(): #判断请求头中是否含有X-Requested-With的值\r\n    if request.is_ajax():\r\n       key=request.POST.get(\'key\')#request.POST.get(\'\')不存在默认为空，request.POST[]不存在报错\r\n      username=request.POST[\'username\']\r\n      user_profile=get_object_or_404(models.User,username=username)\r\n\r\n      if key==\'link\':\r\n        link=request.POST[\'link\']\r\n        models.User.objects.filter(username=username).update(link=link)\r\n        link=models.User.objects.filter(username=username).first().link\r\n        linkJson={\'link\':link}\r\n        return HttpResponse(json.dumps(linkJson))\r\n\r\n      elif key==\'avatar\':\r\n        upload_image=request.FILES.get(\'avatar\')\r\n        image_name=user_profile.save_avatar(upload_image)\r\n        user_profile.avatar=os.path.join(\'avatar\',user_profile.username,image_name)\r\n        user_profile.save()\r\n        url=user_profile.avatar.url\r\n        dataJson={\'url\':url}\r\n        return HttpResponse(json.dumps(dataJson))\r\n```\r\n其中，由于未知原因部署后无法用Form、ModelForm等直接保存上传的图片文件，所以此处在User model中写了一个手动储存方法参考。\r\n```Python\r\nfrom django.db import models\r\n#from django.contrib.auth.models import User\r\n#AbstractUser类可自由定制需要的model\r\nfrom django.contrib.auth.models import AbstractUser  \r\n#用pillow、django-imagekit模块设置图片，可以处理图片，生成指定大小的缩略图\r\nfrom imagekit.models import ProcessedImageField\r\nfrom imagekit.processors import ResizeToFill\r\n\r\n#扩展Django自带的User模型字\r\n# 继承 AbstractUser ，django 自带用户类，可扩展用户个人信息，AbstractUser 模块下有：password,username、first_name、last_name、email、last_login,is_superuser,is_staff,is_active,date_joined\r\nclass User(AbstractUser):\r\n    #nickname = models.CharField(max_length=30, blank=True, null=True, verbose_name=\'昵称\')\r\n    # 扩展用户个人网站字段\r\n    link = models.URLField(\'个人网址\', blank=True, help_text=\'提示：网址必须填写以http开头的完整形式\')\r\n    # 扩展用户头像字段,upload_to后必须是相对路径,上传路径已设置为media，保存的是图片地址，前端user.avatar.url获取\r\n    avatar = ProcessedImageField(upload_to=\'avatar\',default=\'avatar/default.png\',verbose_name=\'头像\',\r\n                                processors=[ResizeToFill(100, 100)], # 处理后的图像大小\r\n                                format=\'JPEG\', # 处理后的图片格式\r\n                                options={\'quality\': 95} # 处理后的图片质量\r\n                                )\r\n\r\n     #定义手动保存图（IIS下User.save()保存失败）\r\n    def save_avatar(self,upload_image):\r\n        import os\r\n        import uuid\r\n        from django.conf import settings\r\n        #创建与用户名的文件夹\r\n        upload_path=os.path.join(settings.MEDIA_ROOT,\'avatar\',self.username)\r\n        if not upload_path:\r\n          try:\r\n            os.makedirs(new_path)\r\n          except:\r\n            pass\r\n        # 生成一个随机字符串\r\n        uuid_str_name = uuid.uuid4().hex+\'.jpg\'\r\n        #保存\r\n        with open(os.path.join(upload_path,uuid_str_name), \'wb+\') as file:\r\n        for chunk in upload_image.chunks():\r\n            file.write(chunk)\r\n        return uuid_str_name\r\n\r\n    #显示用户的邮箱是否验证过，并提醒他们去验证邮箱\r\n    def account_verified(self):\r\n        if self.user.is_authenticated: #django的auth系统功能，只能利用django自己的登陆方法才能判断用户是否登录\r\n          result = EmailAddress.objects.filter(email=self.user.email)\r\n        if len(result):\r\n          return result[0].verified\r\n        return False\r\n\r\n    # 定义网站管理后台表名\r\n    class Meta:\r\n        verbose_name = \'用户信息\' \r\n        verbose_name_plural = verbose_name #指定模型的复数形式是什么,如果不指定Django会自动在模型名称后加一个’s’\r\n        ordering = [\'-id\']\r\n        #admin后台显示名字关联到此表的字段的后天显示名字\r\n    def __str__(self):\r\n        return self.username\r\n```\r\n至此基本完成了用户头像的上传交互，代码中有许多不足望大佬指出，一起交流学习。','/static/images/article/04.jpg','2019-06-12 19:11:59.790859','2019-06-19 11:50:31.474864',15,1,'05',1,2),(6,'Django搭建个人博客 | 博客文章页查询筛选及分页','在整个博客的搭建中，文章相关的功能是最关键的，比如文章相关数据模型的设计、不同分类下文章的筛选显示、以及对显示功能完善的分页功能。本文针对本博客的文章主要功能通过这几方面进行介绍，参考全部代码请到Github查看。\r\n## 设计文章相关模型\r\n### 1、功能分析\r\n在数据库设计之前，我们首先要确定网站功能，结合本站，最主要的是我们的博文表，名字可以直接叫做 article，其中包含博文','在整个博客的搭建中，文章相关的功能是最关键的，比如文章相关数据模型的设计、不同分类下文章的筛选显示、以及对显示功能完善的分页功能。本文针对本博客的文章主要功能通过这几方面进行介绍，参考全部代码请到Github查看。\r\n## 设计文章相关模型\r\n### 1、功能分析\r\n在数据库设计之前，我们首先要确定网站功能，结合本站，最主要的是我们的博文表，名字可以直接叫做 article，其中包含博文的标题、内容、发表时间、修改时间、分类、标签、阅读量、喜欢量、作者、关键词等。博文表直接关联的有分类表（一对多）、标签表（多对多）和文章关键词表 (多对多)，分类表是隶属在导航栏下，到此我们可以确定出这些最基本的数据表，博客（Article）、分类（Category）、标签（Tag）与文章关键词 (Keyword)、导航(Bigcategory)。\r\n\r\n![](https://i.loli.net/2019/06/14/5d03b1905c2d767385.png)\r\n\r\n### 2、编写 Storm 应用模型\r\n首先打开项目根目录，创建 Storm APP\r\n```python\r\npython manage.py startapp Storm\r\n```\r\n在 Myblog -> storm -> models.py 中首先设计导航表 (Bigcategory)与分类表（Category）。\r\n```Python\r\nfrom django.db import models\r\nfrom django.conf import settings  #引入定义字段SEO设置（提前设置）与自定义User（参考管理用户登录与注册博文）\r\nfrom django.shortcuts import reverse #查找URL\r\nimport re\r\n\r\n# 网站导航菜单栏表\r\nclass BigCategory(models.Model):\r\n    # 导航名称\r\n    name = models.CharField(\'导航大分类\', max_length=20)\r\n    # 用作文章的访问路径，每篇文章有独一无二的标识\r\n    slug = models.SlugField(unique=True) #此字符串字段可以建立唯一索引\r\n    # 分类页描述\r\n    description = models.TextField(\'描述\', max_length=240, default=settings.SITE_DESCRIPTION,help_text=\'用来作为SEO中description,长度参考SEO标准\')\r\n    # 分类页Keywords\r\n    keywords = models.TextField(\'关键字\', max_length=240, default=settings.SITE_KEYWORDS,help_text=\'用来作为SEO中keywords,长度参考SEO标准\')\r\n	\r\n    class Meta: #元信息\r\n        # admin中显示的表名称\r\n        verbose_name = \'一级导航\'\r\n        verbose_name_plural = verbose_name #复数形式相同\r\n\r\n    def __str__(self):\r\n        return self.name\r\n\r\n# 导航菜单分类下的下拉菜单分类\r\nclass Category(models.Model):\r\n    # 分类名字\r\n    name = models.CharField(\'文章分类\', max_length=20)\r\n    # 用作分类路径，独一无二\r\n    slug = models.SlugField(unique=True)\r\n    # 分类栏目页描述\r\n    description = models.TextField(\'描述\', max_length=240, default=settings.SITE_DESCRIPTION,help_text=\'用来作为SEO中description,长度参考SEO标准\')\r\n    # 导航菜单一对多二级菜单,django2.0后定义外键和一对一关系的时候需要加on_delete选项，此参数为了避免两个表里的数据不一致问题\r\n    bigcategory = models.ForeignKey(BigCategory,related_name=\"Category\", on_delete=models.CASCADE,verbose_name=\'大分类\')\r\n\r\n    class Meta:#元信息\r\n        # admin中显示的表名称\r\n        verbose_name = \'二级导航\'\r\n        verbose_name_plural = verbose_name\r\n        # 默认排序\r\n        ordering = [\'name\']\r\n\r\n    def __str__(self):\r\n        return self.name\r\n\r\n    #返回当前的url（一级分类+二级分类）\r\n    def get_absolute_url(self):\r\n        return reverse(\'blog:category\', kwargs={\'slug\': self.slug, \'bigslug\': self.bigcategory.slug}) #寻找路由为blog:category的url\r\n    #返回当前二级分类下所有发表的文章列表\r\n    def get_article_list(self):\r\n        return Article.objects.filter(category=self)\r\n```\r\n标签（Tag）与关键字（Keyword）表的创建：\r\n```\r\n# 文章标签\r\nclass Tag(models.Model):\r\n    name = models.CharField(\'文章标签\', max_length=20)\r\n    slug = models.SlugField(unique=True)\r\n    description = models.TextField(\'描述\', max_length=240, default=settings.SITE_DESCRIPTION,help_text=\'用来作为SEO中description,长度参考SEO标准\')\r\n\r\n    class Meta:\r\n        verbose_name = \'标签\'\r\n        verbose_name_plural = verbose_name\r\n        ordering = [\'id\']\r\n\r\n    def __str__(self):\r\n        return self.name\r\n\r\n    def get_absolute_url(self):\r\n        return reverse(\'blog:tag\', kwargs={\'tag\': self.name})\r\n    def get_article_list(self):\r\n    #返回当前标签下所有发表的文章列表\r\n    return Article.objects.filter(tags=self)\r\n\r\n# 文章关键词，用来作为 SEO 中 keywords\r\nclass Keyword(models.Model):\r\n    name = models.CharField(\'文章关键词\', max_length=20)\r\n\r\n    class Meta:\r\n    verbose_name = \'关键词\'\r\n    verbose_name_plural = verbose_name\r\n    ordering = [\'name\']\r\n\r\n    def __str__(self):\r\n        return self.name\r\n```\r\n博客（Article）表的创建：\r\n```\r\nfrom mdeditor.fields import MDTextField #admin markdown编辑器插件\r\nimport markdown #导入markdown\r\n# 文章\r\nclass Article(models.Model):\r\n    # 文章默认缩略图\r\n    IMG_LINK = \'/static/images/article/default.jpg\'\r\n    # 文章信息(作者一对多注册用户，这样用户也可以有发文权限)\r\n    author = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE, verbose_name=\'作者\')\r\n    title = models.CharField(max_length=150, verbose_name=\'文章标题\')\r\n    summary = models.TextField(\'文章摘要\', max_length=230, default=\'文章摘要等同于网页description内容，请务必填写...\')\r\n    # 文章内容（普通字段models.TextField(verbose_name=\'文章内容\')）\r\n    body = MDTextField(verbose_name=\'文章内容\')\r\n    #图片链接\r\n    img_link = models.CharField(\'图片地址\', default=IMG_LINK, max_length=255)\r\n    #自动添加创建时间\r\n    create_date = models.DateTimeField(verbose_name=\'创建时间\', auto_now_add=True)\r\n    #自动添加修改时间\r\n    update_date = models.DateTimeField(verbose_name=\'修改时间\', auto_now=True)\r\n    #浏览点赞整数字段\r\n    views = models.IntegerField(\'阅览量\', default=0)\r\n    loves = models.IntegerField(\'喜爱量\', default=0)\r\n    # 文章唯一标识符\r\n    slug = models.SlugField(unique=True)\r\n    #分类一对多文章 #related_name反向查询\r\n    category = models.ForeignKey(Category,on_delete=models.CASCADE, verbose_name=\'文章分类\')\r\n    #标签多对多文章\r\n    tags = models.ManyToManyField(Tag, verbose_name=\'标签\')\r\n    #文章关键词多对多文章\r\n    keywords = models.ManyToManyField(Keyword, verbose_name=\'文章关键词\',help_text=\'文章关键词，用来作为SEO中keywords，最好使用长尾词，3-4个足够\')\r\n\r\n    class Meta:\r\n        verbose_name = \'博文\'\r\n        verbose_name_plural = verbose_name\r\n        ordering = [\'-create_date\']\r\n\r\n    def __str__(self):\r\n        return self.title[:20]\r\n    #返回当前文章的url\r\n    def get_absolute_url(self):\r\n        return reverse(\'blog:article\', kwargs={\'slug\': self.slug})\r\n    #将内容markdown\r\n    def body_to_markdown(self):\r\n        return markdown.markdown(self.body, extensions=[\r\n        # 包含 缩写、表格等常用扩展\r\n        \'markdown.extensions.extra\',\r\n        # 语法高亮扩展\r\n        \'markdown.extensions.codehilite\',\r\n        # 自动生成目录扩展\r\n        \'markdown.extensions.toc\',\r\n    ])\r\n\r\n    #点赞+1方法\r\n    def update_loves(self):\r\n        self.loves += 1\r\n        self.save(update_fields=[\'loves\']) #更新字段\r\n\r\n    #浏览+1方法\r\n    def update_views(self):\r\n        self.views += 1\r\n        self.save(update_fields=[\'views\']) #更新字段\r\n\r\n    #前篇方法：当前小于文章并倒序排列的第一个\r\n    def get_pre(self):\r\n        return Article.objects.filter(id__lt=self.id).order_by(\'-id\').first()\r\n    #后篇方法：当前大于文章并正序排列的第一个\r\n    def get_next(self):\r\n        return Article.objects.filter(id__gt=self.id).order_by(\'id\').first()\r\n```\r\n其中模型中定义的一些方便给前端传递数据的方法，可以使用Django的自定义templatetags功能，前端引用模板语言可以达到同样效果并使用更自由。\r\n## 查询文章与分页视图\r\n在此之前先配置url\r\n```python\r\n#Myblog/urls.py\r\n\r\nfrom django.conf.urls import re_path,include\r\n\r\nurlpatterns = [\r\n    ...\r\n    # storm博客应用\r\n    re_path(r\'^\',include(\'Storm.urls\', namespace=\'blog\')), \r\n    ...\r\n]\r\n```\r\n```python\r\n#Myblog/Storm/urls.py\r\n\r\nfrom django.urls import path\r\nfrom django.conf.urls import re_path\r\nfrom Storm import views\r\n\r\napp_name=\'Storm\'\r\n\r\nurlpatterns = [\r\n   ...\r\n    #一级二级菜单分类文章列表\r\n    #django 2.x中用re_path兼容1.x中的url中的方法（如正则表达式）\r\n    re_path(r\'category/(?P<bigslug>.*?)/(?P<slug>.*?)/\',views.CtegoryView.as_view(),name=\'category\'),#?分隔实际的URL和参数,?p数据库里面唯一索引 & URL中指定的参数间的分隔符\r\n    re_path(r\'category/(?P<bigslug>.*?)/\',views.CtegoryView.as_view(),name=\'category\'),\r\n    # 标签搜索文章列表\r\n    re_path(r\'tags/(?P<tagslug>.*?)/\', views.CtegoryView.as_view(),name=\'tag\'),\r\n    ...\r\n]\r\n```\r\n网站前端功能中，可以进行筛选文章列表显示的途径有：通过一级导航、二级分类、标签以及自定义一级导航下的最新与最热筛选，我们通过url传参进行视图分别的处理。\r\n一般的，视图函数从数据库中获取文章列表数据：\r\n```python\r\ndef index(request):\r\n    # ...\r\n\r\ndef archives(request, year, month):\r\n    # ...\r\n\r\ndef category(request, pk):\r\n    # ...\r\n```\r\n在Django中专门提供了各种功能的处理类来使我们快捷的处理数据，其中ListView视图帮我们内部做这些查询等操作，只需将 model 指定为 Article，告诉 Django 我要获取的模型是 Article。template_name 指定这个视图渲染的模板。context_object_name 指定获取的模型列表数据保存的变量名。这个变量会被传递给模板。 paginate_by 通过指定属性即可开启分页功能。\r\n```Python\r\nfrom django.shortcuts import render,get_object_or_404\r\nfrom Storm import models\r\n#从数据库中获取某个模型列表数据基类ListView\r\nfrom django.views.generic import ListView\r\n#Django自带的分页模块\r\nfrom django.core.paginator import Paginator\r\n#分类查找文章列表视图类\r\nclass CtegoryView(ListView):\r\n    model=models.Article\r\n    template_name = \'articleList.html\' \r\n    context_object_name = \'articleList\' \r\n    paginate_by = 8 \r\n```\r\n由于针对不同url进行文章筛选的方式不同，所以我们通过覆写了父类的 get_queryset 方法获取定制文章列表数据，通过覆写def get_context_data方法来获取定制的分页效果，其中调用了自定义方法 pagination_data 获得显示分页导航条需要的数据。\r\n```Python\r\n#分类查询文章与视图类\r\nclass CtegoryView(ListView):\r\n    model=models.Article\r\n    template_name = \'articleList.html\' \r\n    context_object_name = \'articleList\' \r\n    paginate_by = 8 #指定 paginate_by 属性来开启分页功能\r\n    #覆写了父类的 get_queryset 方法获取定制数据\r\n    #类视图中,从 URL 捕获的命名组参数值保存在实例的 kwargs 属性（是一个字典）里，非命名组参数值保存在实例的 args 属性（是一个列表）里\r\n    def get_queryset(self):\r\n        #get_queryset方法获得全部文章列表\r\n        queryset = super(CtegoryView, self).get_queryset()\r\n\r\n        # 导航菜单\r\n        big_slug = self.kwargs.get(\'bigslug\', \'\')\r\n\r\n        # 二级菜单\r\n        slug = self.kwargs.get(\'slug\', \'\')\r\n\r\n        # 标签\r\n        tag_slug = self.kwargs.get(\'tagslug\', \'\')\r\n\r\n        if big_slug:\r\n        big = get_object_or_404(models.BigCategory, slug=big_slug)\r\n        queryset = queryset.filter(category__bigcategory=big)\r\n        if slug:\r\n            if slug==\'newest\':\r\n                queryset = queryset.filter(category__bigcategory=big).order_by(\'-create_date\')\r\n            elif slug==\'hottest\':\r\n                queryset = queryset.filter(category__bigcategory=big).order_by(\'-loves\')\r\n            else :\r\n                slu = get_object_or_404(models.Category, slug=slug)\r\n                queryset = queryset.filter(category=slu)\r\n        if tag_slug:\r\n            tlu = get_object_or_404(models.Tag, slug=tag_slug)\r\n            queryset = queryset.filter(tags=tlu)\r\n        return queryset\r\n\r\n\r\n    #在视图函数中将模板变量传递给模板是通过给 render 函数的 context 参数传递一个字典实现的\r\n    def get_context_data(self, **kwargs):\r\n        # 首先获得父类生成的传递给模板的字典。\r\n        context = super().get_context_data(**kwargs)\r\n        paginator = context.get(\'paginator\')\r\n        page = context.get(\'page_obj\')\r\n        is_paginated = context.get(\'is_paginated\')\r\n        # 调用自己写的 pagination_data 方法获得显示分页导航条需要的数据，见下方。\r\n        pagination_data = self.pagination_data(paginator, page, is_paginated)\r\n        # 将分页导航条的模板变量更新到 context 中，注意 pagination_data 方法返回的也是一个字典。\r\n        context.update(pagination_data)\r\n    return context\r\n\r\n    def pagination_data(self, paginator, page, is_paginated):\r\n        if not is_paginated:# 如果没有分页，则无需显示分页导航条，不用任何分页导航条的数据，因此返回一个空的字典\r\n            return {}\r\n        # 当前页左边连续的页码号，初始值为空\r\n        left = []\r\n        # 当前页右边连续的页码号，初始值为空\r\n        right = []\r\n        # 标示第 1 页页码后是否需要显示省略号\r\n        left_has_more = False\r\n        # 标示最后一页页码前是否需要显示省略号\r\n        right_has_more = False\r\n        # 标示是否需要显示第 1 页的页码号。\r\n        first = False\r\n        # 标示是否需要显示最后一页的页码号\r\n        last = False\r\n\r\n        # 获得用户当前请求的页码号\r\n        page_number = page.number\r\n        # 获得分页后的总页数\r\n        total_pages = paginator.num_pages\r\n        # 获得整个分页页码列表，比如分了四页，那么就是 [1, 2, 3, 4]\r\n        page_range = paginator.page_range\r\n        #请求的是第一页的数据\r\n        if page_number == 1:\r\n            #获取了当前页码后连续两个页码\r\n            right = page_range[page_number:(page_number + 2) if (page_number + 2) < paginator.num_pages else paginator.num_pages]\r\n            # 如果最右边的页码号比最后一页的页码号减去 1 还要小，\r\n            # 说明最右边的页码号和最后一页的页码号之间还有其它页码，因此需要显示省略号，通过 right_has_more 来指示。\r\n            if right[-1] < total_pages - 1:\r\n                right_has_more = True\r\n            # 如果最右边的页码号比最后一页的页码号小，说明当前页右边的连续页码号中不包含最后一页的页码\r\n            # 所以需要显示最后一页的页码号，通过 last 来指示\r\n            if right[-1] < total_pages:\r\n                last = True\r\n\r\n        # 如果用户请求的是最后一页的数据，\r\n        elif page_number == total_pages:\r\n            #获取了当前页码前连续两个页码\r\n            left = page_range[(page_number - 3) if (page_number - 3) > 0 else 0:page_number - 1]\r\n            # 如果最左边的页码号比第 2 页页码号还大，\r\n            # 说明最左边的页码号和第 1 页的页码号之间还有其它页码，因此需要显示省略号，通过 left_has_more 来指示。\r\n            if left[0] > 2:\r\n                left_has_more = True\r\n            # 如果最左边的页码号比第 1 页的页码号大，说明当前页左边的连续页码号中不包含第一页的页码，\r\n            # 所以需要显示第一页的页码号，通过 first 来指示\r\n            if left[0] > 1:\r\n                first = True\r\n        else:\r\n            # 用户请求的既不是最后一页，也不是第 1 页，则需要获取当前页左右两边的连续页码号，\r\n            # 这里只获取了当前页码前后连续两个页码，你可以更改这个数字以获取更多页码。\r\n            left = page_range[(page_number - 3) if (page_number - 3) > 0 else 0:page_number - 1]\r\n            right = page_range[page_number:(page_number + 2) if (page_number + 2) < paginator.num_pages else paginator.num_pages]\r\n            # 是否需要显示最后一页和最后一页前的省略号\r\n            if right[-1] < total_pages - 1:\r\n                right_has_more = True\r\n            if right[-1] < total_pages:\r\n                last = True\r\n\r\n            # 是否需要显示第 1 页和第 1 页后的省略号\r\n            if left[0] > 2:\r\n                left_has_more = True\r\n            if left[0] > 1:\r\n                first = True\r\n\r\n        data = {\r\n            \'left\': left,\r\n            \'right\': right,\r\n            \'left_has_more\': left_has_more,\r\n            \'right_has_more\': right_has_more,\r\n            \'first\': first,\r\n            \'last\': last,\r\n        }\r\n        return data\r\n```\r\n## 设计模板\r\n### 1、获取文章\r\n通过视图类处理后的文章数据 articleList 在前端中用Django的模板语言可以直接引用，前端模板根据需求进行自定义。\r\n```python\r\n{% for article in articleList %}\r\n{{article.category.name}}\r\n{{article.title}} \r\n...\r\n{{article.create_date | date:\"Y-m-j\"}}<\r\n{{article.loves}}\r\n{% endfor %}\r\n```\r\n### 2、获取分页\r\n分页传来的数据中，除了我们自定义的 data 数据，还自带了``paginator``：Paginator 的实例，``page_obj ``：当前请求页面分页对象，``is_paginated``：是否开启分页，其中``page_obj``具有当前页属性``page_obj.number``、判断是否含有上一页：``page_obj.has_previous``，是否含有下一页：``page_obj.has_next ``。注意我们在这里用了Bootstrap的分页模板，需要在开头引入相关文件。\r\n\r\n![](https://i.loli.net/2019/06/15/5d03c4ca2d59f52740.png)\r\n```python\r\n{% if is_paginated %}\r\n<div class=\"PageList\">\r\n    <nav aria-label=\"Page navigation\">\r\n        <ul class=\"pagination pagination-sm\">\r\n\r\n            <li class=\"{% if not page_obj.has_previous %} disabled {% endif %}\">\r\n                <a href=\"{% if page_obj.has_previous %} ?page={{ page_obj.previous_page_number }} {% endif %}\" aria-label=\"Previous\">\r\n                    <span aria-hidden=\"true\">&laquo;</span>\r\n                </a>\r\n            </li>\r\n\r\n            {% if first %}\r\n            <li>\r\n                <a href=\"?page=1\">1</a>\r\n            </li>\r\n            {% endif %}\r\n            {% if left %}\r\n            {% if left_has_more %}\r\n            <li>\r\n                <span>...</span>\r\n            </li>\r\n            {% endif %}\r\n            {% for i in left %}\r\n            <li>\r\n                <a href=\"?page={{ i }}\">{{ i }}</a>\r\n            </li>\r\n            {% endfor %}\r\n            {% endif %}\r\n            <li class=\"active\"><a href=\"?page={{ page_obj.number }}\">{{ page_obj.number }}</a></li>\r\n            {% if right %}\r\n            {% for i in right %}\r\n            <li>\r\n                <a href=\"?page={{ i }}\">{{ i }}</a>\r\n            </li>\r\n            {% endfor %}\r\n            {% if right_has_more %}\r\n            <li>\r\n                <span>...</span>\r\n            </li>\r\n            {% endif %}\r\n            {% endif %}\r\n            {% if last %}\r\n            <li>\r\n                <a href=\"?page={{ paginator.num_pages }}\">{{ paginator.num_pages }}</a>\r\n            </li>\r\n            {% endif %}\r\n            <li class=\"{% if not page_obj.has_next %} disabled {% endif %}\">\r\n                <a href=\"{% if page_obj.has_next %} ?page={{ page_obj.next_page_number }} {% endif %}\" aria-label=\"Next\">\r\n                    <span aria-hidden=\"true\">&raquo;</span>\r\n                </a>\r\n            </li>\r\n        </ul>\r\n    </nav>\r\n</div>\r\n```\r\n<small>参考：[追梦任务 | Django Pagination分页功能](https://www.zmrenwu.com/courses/django-blog-tutorial/materials/20/ \"\") </small>','/static/images/article/default.jpg','2019-06-14 22:43:28.492520','2019-06-19 11:50:22.643817',10,0,'06',1,2),(7,'Django搭建个人博客 | 博客项目源码','本博客前端使用Bootstrap框架设计，后端使用Python-3.7，基于Django-2.1搭建，采用服务器Windows Server 2012，通过IIS部署。\r\n## 如何从零搭建博客\r\nDjango 是使用 Python 编写的一个开源 Web 框架，可以用它来快速搭建一个高性能的网站。如果你是从零开始，而且没有任何相关的语言基础，推荐首先阅读 [w3cschool | Django教程]','本博客前端使用Bootstrap框架设计，后端使用Python-3.7，基于Django-2.1搭建，采用服务器Windows Server 2012，通过IIS部署。\r\n## 如何从零搭建博客\r\nDjango 是使用 Python 编写的一个开源 Web 框架，可以用它来快速搭建一个高性能的网站。如果你是从零开始，而且没有任何相关的语言基础，推荐首先阅读 [w3cschool | Django教程](https://www.w3cschool.cn/django/?)学习Django基础知识，如果你只是从零接触Python而已，直接上手项目是公认的学习一门语言的好方法，其中[追梦人物的博客教程](https://www.zmrenwu.com/courses/django-blog-tutorial/)将会教你搭建一个完整的个人博客。学习Django的过程从要养成查看源码与[官方文档](https://docs.djangoproject.com/en/2.2/)的习惯，90%的问题都可以在这里解决。但跨行自学从来不是一件轻松的事情，不仅效率很低，而且解决问题很慢收益且很小，自学一门语言的时间精力有限，如果你做事不是结果导向型，如何把握好兴趣使然的深度与工作必须的效率两者之间的权重问题是关键。\r\n\r\n## 项目源码\r\n博客地址：[EOSONES](http://www.eosones.com/)\r\n博客项目源码：[Github](https://github.com/CRIME-Z/MyblogProject)\r\n\r\n## 项目目录\r\n首先安利一个快速生成如下目录结构的插件 [mddir](https://www.npmjs.com/package/mddir)，使用方式也很简单：\r\n首先通过npm安装\r\n```python\r\n>> npm install mddir -g  #-g局部安装\r\n```\r\ncd 到你想生成目录的工程结构，直接运行mddir命令\r\n```python\r\n>> cd X:\\myblog\r\n>> mddir \r\n```\r\n打开工程根目录下出现的名字为directoryList.md的文件，其中就是我们的文件夹目录结构。\r\n```\r\n|-- Myblog #项目工程\r\n   |-- db.sqlite3\r\n   |-- manage.py  #命令行工具，与该 Django 项目进行交互。\r\n   |-- Apps #博客APP功能归纳文件夹\r\n   |   |-- Comment #博客评论系统APP\r\n   |   |   |-- admin.py \r\n   |   |   |-- apps.py\r\n   |   |   |-- models.py \r\n   |   |   |-- tests.py \r\n   |   |   |-- urls.py \r\n   |   |   |-- views.py \r\n   |   |   |-- __init__.py\r\n   |   |   |-- migrations \r\n   |   |   |-- templatetags \r\n   |   |   |   |-- comment_tags.py\r\n   |   |   |   |-- __init__.py\r\n   |   |   |   |-- __pycache__\r\n   |   |   |-- __pycache__\r\n   |   |-- Myaccount #用户信息APP\r\n   |   |   |-- admin.py\r\n   |   |   |-- apps.py\r\n   |   |   |-- forms.py\r\n   |   |   |-- models.py\r\n   |   |   |-- tests.py\r\n   |   |   |-- urls.py\r\n   |   |   |-- views.py\r\n   |   |   |-- __init__.py\r\n   |   |   |-- migrations\r\n   |   |   |-- templatetags\r\n   |   |   |   |-- User_tags.py\r\n   |   |   |   |-- __init__.py\r\n   |   |   |   |-- __pycache__\r\n   |   |   |-- __pycache__\r\n   |   |-- Storm #博客系统app\r\n   |   |   |-- admin.py #Django提供的后台管理\r\n   |   |   |-- apps.py #配置当前app\r\n   |   |   |-- feeds.py #扩展博客系统的RSS订阅\r\n   |   |   |-- models.py #创建博客系统数据库表\r\n   |   |   |-- sitemaps.py #配置网站地图\r\n   |   |   |-- tests.py #单元测试\r\n   |   |   |-- urls.py #博客系统分配的urls\r\n   |   |   |-- views.py #博客系统业务逻辑代码\r\n   |   |   |-- __init__.py\r\n   |   |   |-- migrations #记录数据库操作记录（自动）\r\n   |   |   |-- templatetags #提供自定义过滤器或模板语言，方便传递数据到前端\r\n   |   |   |   |-- blog_tags.py\r\n   |   |   |   |-- __init__.py\r\n   |   |   |   |-- __pycache__\r\n   |   |   |-- __pycache__\r\n   |-- media #媒体文件夹\r\n   |   |-- avatar #头像上传\r\n   |   |-- editor #编辑器上传的图片\r\n   |-- Middleware #自定义的统计网站在线人数中间件\r\n   |   |-- auth.py\r\n   |   |-- __pycache__\r\n   |-- Myblog #项目的容器（对整个程序进行配置）\r\n   |   |-- settings.py #该 Django 项目的设置/配置\r\n   |   |-- urls.py #该 Django 项目的 URL 声明，一份由 Django 驱动的网站\"目录\"。\r\n   |   |-- wsgi.py #一个 WSGI 兼容的 Web 服务器的入口，以便运行你的项目。（依靠WSGI规则封装Socket的模块，可配置Python默认或uwsgi模块）\r\n   |   |-- __init__.py #一个空文件，告诉 Python 该目录是一个 Python 包\r\n   |   |-- __pycache__\r\n   |-- static #项目的静态文件夹\r\n   |   |-- admin #上线收集的admin静态文件\r\n   |   |-- css\r\n   |   |-- fonts\r\n   |   |-- images #博客图片地址\r\n   |   |-- js\r\n   |   |-- mdeditor #上线收集的mdeditor编辑器静态文件\r\n   |-- templates #项目模板\r\n       |-- accounts-base.html #用户信息继承页\r\n       |-- article.html #\r\n       |-- articleList.html #\r\n       |-- content-base.html #文章继承页\r\n       |-- eosones.html #主站\r\n       |-- homepage.html #\r\n       |-- project.html #\r\n       |-- sponsor.html #\r\n       |-- account #修改的allauth插件自带模板\r\n```','/static/images/article/07.jpg','2019-06-15 16:15:14.098096','2019-06-19 11:50:07.727834',10,0,'07',1,2);
/*!40000 ALTER TABLE `Storm_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_article_keywords`
--

DROP TABLE IF EXISTS `Storm_article_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_article_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Storm_article_keywords_article_id_keyword_id_3e6895a0_uniq` (`article_id`,`keyword_id`),
  KEY `Storm_article_keywords_keyword_id_8639c147_fk_Storm_keyword_id` (`keyword_id`),
  CONSTRAINT `Storm_article_keywords_article_id_83eb2a0e_fk_Storm_article_id` FOREIGN KEY (`article_id`) REFERENCES `Storm_article` (`id`),
  CONSTRAINT `Storm_article_keywords_keyword_id_8639c147_fk_Storm_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `Storm_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_article_keywords`
--

LOCK TABLES `Storm_article_keywords` WRITE;
/*!40000 ALTER TABLE `Storm_article_keywords` DISABLE KEYS */;
INSERT INTO `Storm_article_keywords` VALUES (2,2,2),(3,3,3),(4,4,4),(5,4,5),(6,5,6),(7,5,7),(8,6,8),(9,6,9),(10,6,10),(11,7,11),(12,7,12),(13,7,13);
/*!40000 ALTER TABLE `Storm_article_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_article_tags`
--

DROP TABLE IF EXISTS `Storm_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Storm_article_tags_article_id_tag_id_4febcda3_uniq` (`article_id`,`tag_id`),
  KEY `Storm_article_tags_tag_id_78517d6e_fk_Storm_tag_id` (`tag_id`),
  CONSTRAINT `Storm_article_tags_article_id_b9d35e53_fk_Storm_article_id` FOREIGN KEY (`article_id`) REFERENCES `Storm_article` (`id`),
  CONSTRAINT `Storm_article_tags_tag_id_78517d6e_fk_Storm_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `Storm_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_article_tags`
--

LOCK TABLES `Storm_article_tags` WRITE;
/*!40000 ALTER TABLE `Storm_article_tags` DISABLE KEYS */;
INSERT INTO `Storm_article_tags` VALUES (2,2,1),(3,2,3),(4,3,1),(5,3,3),(6,4,1),(7,4,3),(8,5,1),(9,5,3),(10,6,1),(11,6,3),(12,7,1),(13,7,3);
/*!40000 ALTER TABLE `Storm_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_bigcategory`
--

DROP TABLE IF EXISTS `Storm_bigcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_bigcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `keywords` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_bigcategory`
--

LOCK TABLES `Storm_bigcategory` WRITE;
/*!40000 ALTER TABLE `Storm_bigcategory` DISABLE KEYS */;
INSERT INTO `Storm_bigcategory` VALUES (1,'技术','technique','EOSONES的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','EOSONES,网络,IT,技术,博客,Python'),(2,'生活','life','EOSONES的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好','EOSONES,网络,IT,技术,博客,Python');
/*!40000 ALTER TABLE `Storm_bigcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_carousel`
--

DROP TABLE IF EXISTS `Storm_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(80) NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_carousel`
--

LOCK TABLES `Storm_carousel` WRITE;
/*!40000 ALTER TABLE `Storm_carousel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Storm_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_category`
--

DROP TABLE IF EXISTS `Storm_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `bigcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `Storm_category_bigcategory_id_219595e1_fk_Storm_bigcategory_id` (`bigcategory_id`),
  CONSTRAINT `Storm_category_bigcategory_id_219595e1_fk_Storm_bigcategory_id` FOREIGN KEY (`bigcategory_id`) REFERENCES `Storm_bigcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_category`
--

LOCK TABLES `Storm_category` WRITE;
/*!40000 ALTER TABLE `Storm_category` DISABLE KEYS */;
INSERT INTO `Storm_category` VALUES (1,'Python','Python','EOSONES的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好',1),(2,'Django','Django','EOSONES的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好',1),(3,'随笔','notes','EOSONES的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好',2);
/*!40000 ALTER TABLE `Storm_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_comment`
--

DROP TABLE IF EXISTS `Storm_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_comment`
--

LOCK TABLES `Storm_comment` WRITE;
/*!40000 ALTER TABLE `Storm_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Storm_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_friendlink`
--

DROP TABLE IF EXISTS `Storm_friendlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_friendlink`
--

LOCK TABLES `Storm_friendlink` WRITE;
/*!40000 ALTER TABLE `Storm_friendlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `Storm_friendlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_keyword`
--

DROP TABLE IF EXISTS `Storm_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_keyword`
--

LOCK TABLES `Storm_keyword` WRITE;
/*!40000 ALTER TABLE `Storm_keyword` DISABLE KEYS */;
INSERT INTO `Storm_keyword` VALUES (2,'IIS部署Django'),(3,'Markdown文章'),(4,'Django-allauth插件'),(5,'用户登录与注册'),(6,'图片裁剪'),(7,'Cropper图片裁剪插件'),(8,'文章分页'),(9,'ListView处理类'),(10,'博客文章模型设计'),(11,'EOSONES个人博客'),(12,'博客源码Github地址'),(13,'mddir');
/*!40000 ALTER TABLE `Storm_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storm_tag`
--

DROP TABLE IF EXISTS `Storm_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Storm_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storm_tag`
--

LOCK TABLES `Storm_tag` WRITE;
/*!40000 ALTER TABLE `Storm_tag` DISABLE KEYS */;
INSERT INTO `Storm_tag` VALUES (1,'python','python','EOSONES的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好'),(3,'django','django','EOSONES的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好');
/*!40000 ALTER TABLE `Storm_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_Myaccount_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_Myaccount_user_id` FOREIGN KEY (`user_id`) REFERENCES `Myaccount_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'374542101@qq.com',1,1,1);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add content type',2,'add_contenttype'),(6,'Can change content type',2,'change_contenttype'),(7,'Can delete content type',2,'delete_contenttype'),(8,'Can view content type',2,'view_contenttype'),(9,'Can add session',3,'add_session'),(10,'Can change session',3,'change_session'),(11,'Can delete session',3,'delete_session'),(12,'Can view session',3,'view_session'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add group',5,'add_group'),(18,'Can change group',5,'change_group'),(19,'Can delete group',5,'delete_group'),(20,'Can view group',5,'view_group'),(21,'Can add site',6,'add_site'),(22,'Can change site',6,'change_site'),(23,'Can delete site',6,'delete_site'),(24,'Can view site',6,'view_site'),(25,'Can add email address',7,'add_emailaddress'),(26,'Can change email address',7,'change_emailaddress'),(27,'Can delete email address',7,'delete_emailaddress'),(28,'Can view email address',7,'view_emailaddress'),(29,'Can add email confirmation',8,'add_emailconfirmation'),(30,'Can change email confirmation',8,'change_emailconfirmation'),(31,'Can delete email confirmation',8,'delete_emailconfirmation'),(32,'Can view email confirmation',8,'view_emailconfirmation'),(33,'Can add social account',9,'add_socialaccount'),(34,'Can change social account',9,'change_socialaccount'),(35,'Can delete social account',9,'delete_socialaccount'),(36,'Can view social account',9,'view_socialaccount'),(37,'Can add social application',10,'add_socialapp'),(38,'Can change social application',10,'change_socialapp'),(39,'Can delete social application',10,'delete_socialapp'),(40,'Can view social application',10,'view_socialapp'),(41,'Can add social application token',11,'add_socialtoken'),(42,'Can change social application token',11,'change_socialtoken'),(43,'Can delete social application token',11,'delete_socialtoken'),(44,'Can view social application token',11,'view_socialtoken'),(45,'Can add 用户信息',12,'add_user'),(46,'Can change 用户信息',12,'change_user'),(47,'Can delete 用户信息',12,'delete_user'),(48,'Can view 用户信息',12,'view_user'),(49,'Can add 一级导航',13,'add_bigcategory'),(50,'Can change 一级导航',13,'change_bigcategory'),(51,'Can delete 一级导航',13,'delete_bigcategory'),(52,'Can view 一级导航',13,'view_bigcategory'),(53,'Can add 二级导航',14,'add_category'),(54,'Can change 二级导航',14,'change_category'),(55,'Can delete 二级导航',14,'delete_category'),(56,'Can view 二级导航',14,'view_category'),(57,'Can add 标签',15,'add_tag'),(58,'Can change 标签',15,'change_tag'),(59,'Can delete 标签',15,'delete_tag'),(60,'Can view 标签',15,'view_tag'),(61,'Can add 关键词',16,'add_keyword'),(62,'Can change 关键词',16,'change_keyword'),(63,'Can delete 关键词',16,'delete_keyword'),(64,'Can view 关键词',16,'view_keyword'),(65,'Can add comment',17,'add_comment'),(66,'Can change comment',17,'change_comment'),(67,'Can delete comment',17,'delete_comment'),(68,'Can view comment',17,'view_comment'),(69,'Can add 博文',18,'add_article'),(70,'Can change 博文',18,'change_article'),(71,'Can delete 博文',18,'delete_article'),(72,'Can view 博文',18,'view_article'),(73,'Can add 公告',19,'add_activate'),(74,'Can change 公告',19,'change_activate'),(75,'Can delete 公告',19,'delete_activate'),(76,'Can view 公告',19,'view_activate'),(77,'Can add 图片轮播',20,'add_carousel'),(78,'Can change 图片轮播',20,'change_carousel'),(79,'Can delete 图片轮播',20,'delete_carousel'),(80,'Can view 图片轮播',20,'view_carousel'),(81,'Can add 友情链接',21,'add_friendlink'),(82,'Can change 友情链接',21,'change_friendlink'),(83,'Can delete 友情链接',21,'delete_friendlink'),(84,'Can view 友情链接',21,'view_friendlink'),(85,'Can add 文章评论',22,'add_comment'),(86,'Can change 文章评论',22,'change_comment'),(87,'Can delete 文章评论',22,'delete_comment'),(88,'Can view 文章评论',22,'view_comment'),(89,'Can add user like',23,'add_userlike'),(90,'Can change user like',23,'change_userlike'),(91,'Can delete user like',23,'delete_userlike'),(92,'Can view user like',23,'view_userlike');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_Myaccount_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_Myaccount_user_id` FOREIGN KEY (`user_id`) REFERENCES `Myaccount_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-31 18:24:03.934414','1','技术',1,'[{\"added\": {}}]',13,1),(2,'2019-05-31 18:24:51.624628','2','生活',1,'[{\"added\": {}}]',13,1),(3,'2019-05-31 18:25:31.146116','1','Python',1,'[{\"added\": {}}]',14,1),(4,'2019-05-31 18:25:53.320917','2','Django',1,'[{\"added\": {}}]',14,1),(5,'2019-05-31 18:26:26.664682','1','Python',1,'[{\"added\": {}}]',15,1),(6,'2019-05-31 18:27:24.243769','3','随笔',1,'[{\"added\": {}}]',14,1),(7,'2019-05-31 18:27:45.979119','1','www.eosones.com',2,'[{\"changed\": {\"fields\": [\"domain\", \"name\"]}}]',6,1),(8,'2019-05-31 18:30:08.378534','2','JavaScript',1,'[{\"added\": {}}]',15,1),(9,'2019-05-31 18:30:35.994761','1','测试',1,'[{\"added\": {}}]',16,1),(10,'2019-05-31 18:30:51.862907','1','测试',1,'[{\"added\": {}}]',18,1),(11,'2019-06-01 14:26:02.863902','2','JavaScript',3,'',15,1),(12,'2019-06-01 14:26:18.615956','3','django',1,'[{\"added\": {}}]',15,1),(13,'2019-06-01 14:26:25.031030','1','python',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',15,1),(14,'2019-06-01 14:26:48.451103','1','测试',3,'',16,1),(15,'2019-06-01 14:27:13.247162','2','IIS部署Django',1,'[{\"added\": {}}]',16,1),(16,'2019-06-01 14:27:33.157444','1','测试',3,'',18,1),(17,'2019-06-01 14:28:53.450926','2','Django从零搭建个人博客 | 通过I',1,'[{\"added\": {}}]',18,1),(18,'2019-06-01 14:43:47.552849','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"summary\"]}}]',18,1),(19,'2019-06-01 14:48:59.974839','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(20,'2019-06-01 14:49:32.092833','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(21,'2019-06-01 14:49:56.848835','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(22,'2019-06-01 14:50:24.429412','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(23,'2019-06-01 14:51:11.895096','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(24,'2019-06-01 14:51:32.473412','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(25,'2019-06-01 14:52:56.838452','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(26,'2019-06-01 14:54:20.026943','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(27,'2019-06-01 14:54:38.336501','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(28,'2019-06-01 14:56:39.382408','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(29,'2019-06-01 15:01:02.908840','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(30,'2019-06-01 15:05:54.300409','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(31,'2019-06-01 15:08:30.514408','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(32,'2019-06-01 15:11:15.624858','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(33,'2019-06-01 15:11:55.888946','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(34,'2019-06-01 15:22:00.765655','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(35,'2019-06-01 15:23:34.269651','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(36,'2019-06-01 15:42:15.528725','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(37,'2019-06-01 15:51:40.958011','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(38,'2019-06-01 15:52:34.008803','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(39,'2019-06-01 15:54:28.050789','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(40,'2019-06-04 12:01:29.371332','1','374542101@qq.com (CRIME)',2,'[{\"changed\": {\"fields\": [\"verified\"]}}]',7,1),(41,'2019-06-04 12:01:37.293335','1','374542101@qq.com (CRIME)',2,'[{\"changed\": {\"fields\": [\"verified\"]}}]',7,1),(42,'2019-06-05 11:29:56.598773','1','GithubAccount',1,'[{\"added\": {}}]',10,1),(43,'2019-06-06 11:15:52.883887','1','www.eosones.com',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',6,1),(44,'2019-06-06 11:31:51.568435','2','374542100@qq.com (TEXT)',3,'',7,1),(45,'2019-06-06 11:58:34.638400','2','127.0.0.1:8000',1,'[{\"added\": {}}]',6,1),(46,'2019-06-06 12:48:19.305913','6','374542105@qq.com (text7)',3,'',7,1),(47,'2019-06-06 12:48:19.321535','5','374542104@qq.com (text3)',3,'',7,1),(48,'2019-06-06 12:48:19.337230','4','374542103@qq.com (text2)',3,'',7,1),(49,'2019-06-06 12:48:19.337230','3','374542102@qq.com (TEXT1)',3,'',7,1),(50,'2019-06-06 14:55:34.039221','2','127.0.0.1:8000',3,'',6,1),(51,'2019-06-06 19:22:19.384395','8','TEXT5',3,'',12,1),(52,'2019-06-06 19:22:19.400145','7','tasfsd',3,'',12,1),(53,'2019-06-06 19:22:19.400145','6','text7',3,'',12,1),(54,'2019-06-06 19:22:19.415684','5','text3',3,'',12,1),(55,'2019-06-06 19:22:19.415684','4','text2',3,'',12,1),(56,'2019-06-06 19:22:19.431299','3','TEXT1',3,'',12,1),(57,'2019-06-06 19:22:19.431299','2','TEXT',3,'',12,1),(58,'2019-06-06 19:22:30.868769','1','374542101@qq.com (CRIME)',2,'[{\"changed\": {\"fields\": [\"verified\"]}}]',7,1),(59,'2019-06-06 19:36:52.394967','9','TEXT5',3,'',12,1),(60,'2019-06-07 13:28:21.541479','1','GithubAccount',2,'[]',10,1),(61,'2019-06-08 15:06:19.973184','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(62,'2019-06-09 20:53:19.030707','2','weixin',1,'[{\"added\": {}}]',10,1),(63,'2019-06-09 20:53:28.780954','2','weixin',2,'[]',10,1),(64,'2019-06-10 10:31:35.382028','3','Markdown文章',1,'[{\"added\": {}}]',16,1),(65,'2019-06-10 10:32:19.633189','3','Django从零搭建个人博客 | 使用M',1,'[{\"added\": {}}]',18,1),(66,'2019-06-10 10:38:48.471508','3','Django从零搭建个人博客 | 使用M',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(67,'2019-06-10 10:39:24.003408','3','Django从零搭建个人博客 | 使用M',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(68,'2019-06-10 10:43:17.423421','3','Django从零搭建个人博客 | 使用M',2,'[{\"changed\": {\"fields\": [\"summary\"]}}]',18,1),(69,'2019-06-10 10:54:52.023984','3','Django从零搭建个人博客 | 使用M',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(70,'2019-06-10 10:56:37.917439','3','Django从零搭建个人博客 | 使用M',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(71,'2019-06-10 10:58:09.794779','3','Django从零搭建个人博客 | 使用M',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(72,'2019-06-10 11:18:59.293622','4','Django-allauth插件',1,'[{\"added\": {}}]',16,1),(73,'2019-06-10 11:19:08.997000','5','用户登录与注册',1,'[{\"added\": {}}]',16,1),(74,'2019-06-10 11:21:52.102216','4','Django从零搭建个人博客 | 使用a',1,'[{\"added\": {}}]',18,1),(75,'2019-06-10 11:22:00.680461','4','Django从零搭建个人博客 | 使用a',2,'[{\"changed\": {\"fields\": [\"keywords\"]}}]',18,1),(76,'2019-06-10 11:22:18.586590','4','Django从零搭建个人博客 | 使用a',2,'[{\"changed\": {\"fields\": [\"summary\"]}}]',18,1),(77,'2019-06-10 11:29:29.789729','4','Django从零搭建个人博客 | 使用a',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(78,'2019-06-10 11:49:26.127490','10','2655301607@qq.com (TEXT5)',3,'',7,1),(79,'2019-06-10 15:00:33.576260','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1),(80,'2019-06-10 15:01:29.858917','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1),(81,'2019-06-10 15:09:43.871567','3','Django从零搭建个人博客 | 使用M',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1),(82,'2019-06-10 15:11:15.043564','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1),(83,'2019-06-10 15:11:25.840442','3','Django从零搭建个人博客 | 使用M',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1),(84,'2019-06-10 15:12:32.809180','4','Django从零搭建个人博客 | 使用a',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1),(85,'2019-06-10 16:48:57.228305','10','TEXT5',3,'',12,1),(86,'2019-06-10 22:06:41.428461','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(87,'2019-06-11 22:25:27.912676','2','Django从零搭建个人博客 | 通过I',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(88,'2019-06-12 19:10:02.679239','6','图片裁剪',1,'[{\"added\": {}}]',16,1),(89,'2019-06-12 19:10:21.601485','7','Cropper图片裁剪插件',1,'[{\"added\": {}}]',16,1),(90,'2019-06-12 19:11:59.806487','5','Django从零搭建个人博客 | 使用j',1,'[{\"added\": {}}]',18,1),(91,'2019-06-12 19:12:58.151353','5','Django从零搭建个人博客 | 使用j',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(92,'2019-06-12 19:15:05.294417','5','Django从零搭建个人博客 | 使用j',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(93,'2019-06-12 19:15:47.076480','5','Django从零搭建个人博客 | 使用j',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(94,'2019-06-12 19:16:16.608291','5','Django从零搭建个人博客 | 使用j',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(95,'2019-06-12 19:18:07.235416','5','Django从零搭建个人博客 | 使用j',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(96,'2019-06-12 19:19:00.955206','5','Django从零搭建个人博客 | 使用j',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(97,'2019-06-12 19:20:41.982042','5','Django从零搭建个人博客 | 使用j',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(98,'2019-06-12 19:21:37.388289','5','Django从零搭建个人博客 | 使用j',2,'[]',18,1),(99,'2019-06-12 21:11:16.472024','5','Django从零搭建个人博客 | 使用j',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1),(100,'2019-06-14 22:41:31.039150','8','文章分页',1,'[{\"added\": {}}]',16,1),(101,'2019-06-14 22:42:13.070536','9','ListView处理类',1,'[{\"added\": {}}]',16,1),(102,'2019-06-14 22:42:27.570507','10','博客文章模型设计',1,'[{\"added\": {}}]',16,1),(103,'2019-06-14 22:43:28.507901','6','Django搭建个人博客 | 博客文章相',1,'[{\"added\": {}}]',18,1),(104,'2019-06-14 22:43:48.617273','5','Django搭建个人博客 | 使用jQu',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(105,'2019-06-14 22:43:56.617511','4','Django搭建个人博客 | 使用all',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(106,'2019-06-14 22:44:02.664154','3','Django搭建个人博客 | 使用Mar',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(107,'2019-06-14 22:44:09.007899','2','Django搭建个人博客 | 通过IIS',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(108,'2019-06-15 00:01:45.679812','6','Django搭建个人博客 | 博客文章相',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(109,'2019-06-15 09:21:34.190007','6','Django搭建个人博客 | 文章筛选显',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(110,'2019-06-15 09:28:01.983617','6','Django搭建个人博客 | 文章列表页',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(111,'2019-06-15 13:01:36.842930','6','Django搭建个人博客 | 文章列表页',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(112,'2019-06-15 16:13:18.156394','11','EOSONES个人博客',1,'[{\"added\": {}}]',16,1),(113,'2019-06-15 16:13:47.876040','12','博客源码Github地址',1,'[{\"added\": {}}]',16,1),(114,'2019-06-15 16:14:03.861157','13','mddir',1,'[{\"added\": {}}]',16,1),(115,'2019-06-15 16:15:14.098096','7','Django搭建个人博客 | 博客项目归',1,'[{\"added\": {}}]',18,1),(116,'2019-06-15 16:15:24.020352','7','Django搭建个人博客 | 博客项目归',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(117,'2019-06-15 16:19:28.123597','7','Django搭建个人博客 | 博客项目归',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1),(118,'2019-06-15 21:16:12.783941','6','Django搭建个人博客 | 博客文章页',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(119,'2019-06-15 21:16:22.690572','7','Django搭建个人博客 | 博客项目归',2,'[]',18,1),(120,'2019-06-16 20:56:00.931456','7','Django搭建个人博客 | 博客项目源',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',18,1),(121,'2019-06-16 21:03:57.317001','2','Django搭建个人博客 | 通过IIS',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(122,'2019-06-16 21:04:41.270122','2','Django搭建个人博客 | 通过IIS',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(123,'2019-06-16 21:05:05.488918','2','Django搭建个人博客 | 通过IIS',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',18,1),(124,'2019-06-19 11:50:07.731677','7','Django搭建个人博客 | 博客项目源',2,'[{\"changed\": {\"fields\": [\"views\"]}}]',18,1),(125,'2019-06-19 11:50:22.650447','6','Django搭建个人博客 | 博客文章页',2,'[{\"changed\": {\"fields\": [\"views\"]}}]',18,1),(126,'2019-06-19 11:50:31.479042','5','Django搭建个人博客 | 使用jQu',2,'[{\"changed\": {\"fields\": [\"views\"]}}]',18,1),(127,'2019-06-19 11:50:41.073489','4','Django搭建个人博客 | 使用all',2,'[{\"changed\": {\"fields\": [\"views\"]}}]',18,1),(128,'2019-06-19 11:50:49.930232','3','Django搭建个人博客 | 使用Mar',2,'[{\"changed\": {\"fields\": [\"views\"]}}]',18,1),(129,'2019-06-19 11:50:57.139066','2','Django搭建个人博客 | 通过IIS',2,'[{\"changed\": {\"fields\": [\"views\"]}}]',18,1),(130,'2019-06-19 11:59:07.671662','2','Django搭建个人博客 | 通过IIS',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'account','emailaddress'),(8,'account','emailconfirmation'),(1,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(22,'Comment','comment'),(23,'Comment','userlike'),(2,'contenttypes','contenttype'),(12,'Myaccount','user'),(3,'sessions','session'),(6,'sites','site'),(9,'socialaccount','socialaccount'),(10,'socialaccount','socialapp'),(11,'socialaccount','socialtoken'),(19,'Storm','activate'),(18,'Storm','article'),(13,'Storm','bigcategory'),(20,'Storm','carousel'),(14,'Storm','category'),(17,'Storm','comment'),(21,'Storm','friendlink'),(16,'Storm','keyword'),(15,'Storm','tag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-28 23:23:21.220644'),(2,'contenttypes','0002_remove_content_type_name','2019-05-28 23:23:21.385670'),(3,'auth','0001_initial','2019-05-28 23:23:21.954968'),(4,'auth','0002_alter_permission_name_max_length','2019-05-28 23:23:22.085826'),(5,'auth','0003_alter_user_email_max_length','2019-05-28 23:23:22.099649'),(6,'auth','0004_alter_user_username_opts','2019-05-28 23:23:22.113173'),(7,'auth','0005_alter_user_last_login_null','2019-05-28 23:23:22.125871'),(8,'auth','0006_require_contenttypes_0002','2019-05-28 23:23:22.132716'),(9,'auth','0007_alter_validators_add_error_messages','2019-05-28 23:23:22.154201'),(10,'auth','0008_alter_user_username_max_length','2019-05-28 23:23:22.173718'),(11,'auth','0009_alter_user_last_name_max_length','2019-05-28 23:23:22.189356'),(12,'Myaccount','0001_initial','2019-05-28 23:23:22.769640'),(13,'admin','0001_initial','2019-05-28 23:23:23.010641'),(14,'admin','0002_logentry_remove_auto_add','2019-05-28 23:23:23.027246'),(15,'admin','0003_logentry_add_action_flag_choices','2019-05-28 23:23:23.043846'),(16,'sessions','0001_initial','2019-05-28 23:23:23.117093'),(17,'sites','0001_initial','2019-05-28 23:23:23.174697'),(18,'sites','0002_alter_domain_unique','2019-05-28 23:23:23.211819'),(19,'socialaccount','0001_initial','2019-05-28 23:23:24.041886'),(20,'socialaccount','0002_token_max_lengths','2019-05-28 23:23:24.138645'),(21,'socialaccount','0003_extra_data_default_dict','2019-05-28 23:23:24.157119'),(22,'Storm','0001_initial','2019-05-28 23:29:44.122956'),(23,'Comment','0001_initial','2019-05-28 23:30:08.449684'),(24,'account','0001_initial','2019-05-28 23:34:41.748529'),(25,'account','0002_email_max_length','2019-06-05 11:59:36.177385'),(26,'Storm','0002_auto_20190606_1217','2019-06-06 12:18:13.634688'),(27,'Storm','0003_auto_20190610_1020','2019-06-10 10:20:10.739011'),(28,'Storm','0004_auto_20190610_1506','2019-06-10 15:06:35.741734');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0vipfaog5sqafl0ripk2djquvw3igrkz','M2I3M2Y1MzhhZTJhMDdjNmZmNDFmYWZlYzFjMWY0MThlYmQ3NzY3OTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRmFhYzV2TXhnZWJGIl19','2019-06-23 21:02:27.386633'),('12n4hz8wlg1jf0bdzo885j855sen3rba','NDkzY2M3Mjc4MzQwOWIzMDhkNWJiYmQ0MjUxODQzZGI1NjIxYmYwYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiTnRFejlEN0lmZXBUIl19','2019-06-23 20:58:06.788071'),('1fwv5jeboubgk3si0ib8v14l039jxtgv','ZTI4ZGQwYWRiM2E0MTAyNGY1ZWI0NTEzYWM5N2QyOGVmMDg2ODZlZjp7ImlzX3JlYWRfNSI6MTU2MDQ4ODgzMC43OTU2MzQ3fQ==','2019-06-28 13:07:10.826899'),('1x06p7makythbkgnc75y6w5wj69xqrix','MDI0NWU1OThkNTU5MTExNGM2Y2U3OWYyNzU3MDIzYjY0ZTg0NTA3ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiSVFLUDJvZ0FvQk1lIl19','2019-06-23 20:58:03.866122'),('2ivq0mnik5ice4rez3lyzkdcxyqhjvuh','MTdjZWU3Y2Y2MWI0Yzk4ZWNiOWQ5MzMzMmM4NGMwMGMyODc5ODk3Zjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZk9XcGZTY1JLbTJBIl0sImlzX3JlYWRfNCI6MTU2MDE0OTgzNy45NzYzNjU4LCJpc19yZWFkXzIiOjE1NjAxNDc4MjEuMTA2MTYxNCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjU5YzRmMzk4MTNkNDA2MTBiNWFiZDZlNzhjOGUyMjQ4MzdjYTM4MzMifQ==','2019-06-24 14:59:30.088882'),('2jhije3uhob26a4t30s571bnkwpvyl6m','ZTRjNmE2MWUzNDgxNWRjYmM0MjE2ZmNjZmQ1MGNiM2NhZWIyZGE3ZDp7ImlzX3JlYWRfNCI6MTU2MDMxNzQ5MS4yNjg5Mjk3fQ==','2019-06-26 13:31:31.315812'),('2ll4se57kalb4yzjl773t18jtrbo2gez','M2QxYzQ3MDY0NTVhNDQ5ZmIwZGVjNjUyMmE2MTU1MDZkNjNjOTg1Nzp7ImlzX3JlYWRfMiI6MTU2MDU5MjgzNy40NzYwODQyfQ==','2019-06-29 18:00:37.507329'),('2veinislgdrd5jzoc7cxophmhfjpi4eu','Nzc3NjRhNDMzMmE5MGJiZGZkYzE3OWE5MjJmMzg3Yjc3ZmU3NmNkNjp7ImlzX3JlYWRfMSI6MTU1OTMwMDQ0NS4zNDYxOTk4LCJpc19yZWFkXzIiOjE1NjAwNTc3OTYuNDA4MDE2Miwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJJU1FlaFdSeXNjaVUiXSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjU5YzRmMzk4MTNkNDA2MTBiNWFiZDZlNzhjOGUyMjQ4MzdjYTM4MzMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2019-06-24 23:56:04.522106'),('300g09tv8riahxdskclsk441ixem5jgy','N2Y5MzkwYTk0NzNkZjIxZGQyYzM3MWJiYzZmZGI1MTUwNWE3ZGQxYTp7ImlzX3JlYWRfMiI6MTU2MDQ4ODY3OC41Mzk3ODY4LCJpc19yZWFkXzUiOjE1NjA0ODg3NzAuNjUyOTM5fQ==','2019-06-28 13:06:10.715199'),('39i2sywkmy9l5ueir6yq5xky98cse46z','NTdjNzU2MmUwMDdlZTUxODZlYjc3MDEzNzY2MWE2YzBlNGQ0ZDMzZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiTEpxRmVCSkN6NjNGIl19','2019-06-21 08:57:34.474502'),('3khi005ez6j6x8v7kpf2m9fbd5k8nq9f','NTVhNDU4NDFiZmRmOGQ3ODBmNzYzNDJhZTgyZjNkNGY2YWRhMGMwMjp7ImlzX3JlYWRfMiI6MTU1OTg4OTg5MC44ODI4MTY2fQ==','2019-06-21 14:44:50.898513'),('3umy3hxnqt46dseflv6327mqnxk46fm9','ZWFkMTg1NDhmMDBkOGQ2N2M3N2IyMmM2Mjk3MmEyYjdkNDE3N2E3MTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRlUwc2h3b1hZYzNsIl19','2019-06-23 20:58:02.553737'),('499ks0szkbblbajch851w401gd3hrggv','ZmFjZTkxOTQzMWFiMjdjZjc3ZGI1NjU1MTk0MmNmYmQ2NjVjZDM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-25 10:57:02.831098'),('49tq16dhvlvdfqsnmmlwwxipwmbarnjd','ZmI3NjE0OWY0ZGE3ZmJmM2MyNDUxNjBjY2JjZDBmYWI2NTY0NDk3OTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiajZNYlJpbzNNSVEwIl19','2019-06-23 20:58:06.475800'),('4axrfcez2ax1y8b7zfu8n53iq14l8ct7','YTJlZjM3ZjA3YzQ0NjIzZmYwOTdkNjM4NmQxNmRjNThjZDk0YTFhODp7ImlzX3JlYWRfMyI6MTU2MDEzODMyOC40MDQxODI3fQ==','2019-06-24 11:45:28.435561'),('4m3yd35vtd4wkdla6jxcqz0398pr029f','ZWEyNGVmMjAwZGNmYmJhYThhMDgwMTQ3MDk3ZTA1ZjAxY2NjYmE2Yjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiVlFGcTBnQVpVcEJaIl19','2019-06-29 19:13:41.260864'),('4ukr0wqtb5wwpbnnk54a28vxzuhunuuh','Y2FjN2Y4ZGM3YmFlZTA1YjNmNTVjMjBiMGY1ZTk1M2VlYzAxYmViYTp7ImlzX3JlYWRfNiI6MTU2MDU2NDA1Ny4zNTUxNTg4fQ==','2019-06-29 10:00:57.386296'),('4ym0wgpb7lsfzzyavgvel64ws2xuqzdq','OGY2YjM0MTNhYWM3MGZmMjhlNDA2NzVjNDE5NTJmNzAwZjEyMzE4Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiM3psOE5ad3B0T1VKIl19','2019-06-23 21:02:27.667848'),('5h18wwt3excfjzy3l6hqqboyu627txqk','NDllNTgzNTViOTQyNDFiNWYwMTk4MTUwZjc3NTdmMmZkYTY1NzEyMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwib0I1RUlYTWN0cnNaIl19','2019-06-23 20:57:56.194059'),('5ivkyc54eqz7aiwlh8a5ja5jxkh8kmw0','ODljNmU4MzFmMmU5ZjBlZGNmNzk4Y2ZkMzVmN2I0NzE4MDBhZGQ0Mzp7ImlzX3JlYWRfNCI6MTU2MDE3MjU1OC42ODM4MDksIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-24 21:31:09.234134'),('5mnunm7sdbfdb5frpqwv4v8jz07yjiam','NmUwOTIwNDFjZGNiZTM2YmVkNTQzYTUyYjk4OTI5MDcxZjcyMWQ1YTp7ImlzX3JlYWRfMSI6MTU1OTMyMDY5Mi4xNzA2MDE4fQ==','2019-06-15 00:38:12.192081'),('5t9gdnj2o8d426uawapkfs1l3w66f0jr','OTg3ODQ1MWFhZDBiNjU3NmQxMGI0OTViMmQ0Mzg0YWZkZGQyZDliYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiSnA2ekpDa0hGeGlFIl0sImlzX3JlYWRfMiI6MTU1OTk2NjQwNS4wMjk0MzQ3fQ==','2019-06-22 12:00:05.060963'),('5ycnevxlxwhx9z9a6xvn3hpan8lwxdu3','ZmZlYTFlMmRmM2Q3NjU5NzJhMzIyZGM1NWFlN2ZkNzZjZWE0MDBkMzp7ImlzX3JlYWRfMiI6MTU1OTM4Njg2MS43NTA2OTUsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTljNGYzOTgxM2Q0MDYxMGI1YWJkNmU3OGM4ZTIyNDgzN2NhMzgzMyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2019-06-15 19:04:10.938189'),('60r4ivoenw460n5x5npdok9wcs0sveda','NjBlOGMyNzBlNDM3ODdlOGRjZTcwNTQ2OTkxOWZlNzRjNjcwNTY4ZDp7ImlzX3JlYWRfMiI6MTU2MDYxMTMzMS4yNDYwNTIzfQ==','2019-06-29 23:08:51.355561'),('65shcg661xefhn3o0ucy6viea5xy99kz','ZmYxZGRmM2I2NzdhMDM2ZTNiMGM3M2U3ZGUyMDMwNTk4YTI1YzhkOTp7ImlzX3JlYWRfMiI6MTU2MDIyMjUzMC43MDcyMDQ2fQ==','2019-06-25 11:08:50.738436'),('6lp0d966unuv11yso4q4n2po68eo7mxg','OTU3MDVjYjZlYjE0NmQ3NDI0ZjMxYTY2ZGM1MzkyYWY0MmVlMjI5Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwicjMwUElyMGdLQ0c0Il19','2019-06-23 20:58:13.913257'),('6t8de9k7g4krp9ev136ic60wg9pxhgm2','ZjExOGU3ZmY5NDU1MjZmYTQ5NjQyMTE3NGQ4OTQzZmVjODI5Y2U5OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIn0=','2019-06-14 17:02:13.846075'),('76cz6b1bqpe1fdh7wd22r2m0xu12adp9','MTJiYzU4MGQ0ZjlhNzc0ZDZlMzFlYzQ0MDY3OGE4ZTk0NDBiZTlkZDp7ImlzX3JlYWRfMiI6MTU1OTQxNzcxOS4xOTUyMjR9','2019-06-16 03:35:19.210834'),('78ssh2s211nwxjwzvnkdsaw54rvusvnh','MjFiYmE5ZjkwMTg2YmU1NzIyNDdkZGFlYWQ1NGE0MDZkOWYxMWJjZTp7ImlzX3JlYWRfNyI6MTU2MDg0NDY2MS44NTI4Njc4fQ==','2019-07-02 15:57:41.874396'),('7fsr4zq3vqyevksidwdi0s9f1iuttiu7','MDFjZDhkNDc2YzEyZTc1ODYxMjllMDlhYzZkMThjZDk2NDFiZTg1NTp7ImlzX3JlYWRfMSI6MTU1OTI5OTg1NS45ODE0MTg2fQ==','2019-06-14 18:50:56.003841'),('8d3pxil2m7p3y1h5sfiex4kfl3fdsoaq','ZGRmMjEzY2E0ZjU1YzFjZDdhMTA3Y2M4YTY1YmM4NWY5NGZjOGZjYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7Im5leHQiOiIvYWNjb3VudHMvcHJvZmlsZS8iLCJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIlBranl5cDZ6dTBONiJdfQ==','2019-06-25 18:28:21.718249'),('8kkkd440b1hqn3iowqoff6nnyjpy2uhs','ZmFjZTkxOTQzMWFiMjdjZjc3ZGI1NjU1MTk0MmNmYmQ2NjVjZDM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-25 11:11:36.287717'),('8kxv8kjrnhauxfbndgm1qc0knkreqrph','NWRkYjQ1ODIzZDA0ZDI3M2E0MDBhNWU3ZTRlYzE3YjYxYWFmZDcyMzp7ImlzX3JlYWRfNSI6MTU2MDUxNDI0Mi44NTIwNTc3LCJpc19yZWFkXzIiOjE1NjA1MTQ0MDQuMjk1NjMyNn0=','2019-06-28 20:13:24.326884'),('8tq00oe8zkjloimcidwcwutfmi61ekta','NDk0Nzc3NTZlMWNiMTY1MzY4MGJiMDA0NGQyYTIxMzVhM2NjNmEzMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7Im5leHQiOiIvYWNjb3VudHMvcHJvZmlsZS8iLCJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIkFPUXFZcExvckdvZCJdfQ==','2019-06-24 20:10:58.591849'),('8v8n562dpo7zhmlmsdmuq0os46f4znhx','MmUwNDkwMWM2ZGYxNWQyZDExMWZjZDc2N2I5YzRjZTI2YmZiMjYzOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7Im5leHQiOiIvYWNjb3VudHMvcHJvZmlsZS8iLCJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIjFwczZJdEVIcmdJUSJdfQ==','2019-06-26 01:05:01.417845'),('8zurfdwzfsvw237ywe44yxwartl8rrf7','MjA1ODg3NWY5N2JjMzdkOGM1OGFmMjhhOWU0MDc3ZDllYmRkNmFkMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQXM2aVdWU2FYeE9QIl19','2019-06-23 20:57:54.490887'),('948jhyhussmjegddhas0qfquh1yt745x','MGZlY2JkNDgxZTlhZWJmMzNiYTk5YjQ4NTRiZTU5NmJmOWRiZTUzNjp7ImlzX3JlYWRfMyI6MTU2MDU5NzA0Mi41MzUyODE3fQ==','2019-06-29 19:10:42.597845'),('99z2yey6oo3j9154nowqp4k4gz366hre','YWNjNWRhMTM2MDM5YTMxMjZiOTBmZmNjYTE1MzE5ODk3ZDcxNTM5ODp7ImlzX3JlYWRfNCI6MTU2MDM1Njk5MS44Njg0NzgzfQ==','2019-06-27 00:29:51.884116'),('9hblmvmddrq9wxryfjlvqgnfm7racrr9','ZjExOGU3ZmY5NDU1MjZmYTQ5NjQyMTE3NGQ4OTQzZmVjODI5Y2U5OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIn0=','2019-07-01 15:58:15.602665'),('9k0gtotsa6pqfdeuiqhot4bc2o6t94fo','N2E0ZDdlNTgwY2I0ODVmM2ViZTRlMDU5ODdiYzBjOTE1MjYzYmVmZTp7ImlzX3JlYWRfMSI6MTU1OTI5OTA5NC4zMDM0MTU1fQ==','2019-06-14 18:38:14.325811'),('9xirhu1jt1cdqqafzc7tlzy0ngvy9ym6','YWU2MzU3ZmFkZmIxNDdiMGEyMmRkZDgzZjY3MDRmZGU1OTVjMzFlNDp7ImlzX3JlYWRfNCI6MTU2MDE1MzY3NS41OTc3NjcsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQzN0cVAzc1hPWVRlIl19','2019-06-24 16:02:58.740145'),('9zvgg252avchx1y7nl4ymzo7xa17po4m','NDc4ZjNjMzc4NjE5MjkwNzBmNmFiNDMzNmUyMTZhNjVlMTMxY2Q4OTp7ImlzX3JlYWRfNSI6MTU2MDU5NzAxMi44MzA5Njl9','2019-06-29 19:10:12.862224'),('a0hfbmxea5baq1g0e86unwiqwjbhuv0h','ZmFjZTkxOTQzMWFiMjdjZjc3ZGI1NjU1MTk0MmNmYmQ2NjVjZDM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-15 20:54:52.892590'),('a60gpr4rml1m212zdli2h2ija5lhudl7','OWNkMzlmZGVkYmZiYjZmZWUwMDJhODRiYmJhNTE2NjY4YTdlMzNhZTp7ImlzX3JlYWRfNSI6MTU2MDUzODM3MS43NzEwNzE3fQ==','2019-06-29 02:52:51.817954'),('ah5bdh9zk73faunb017onw0i03j0rvbl','OTNiZWZmYjhhNjY2MjBlMjFiZGM2MWIwOWMwNTMzYjk0MDdkZmMyNDp7ImlzX3JlYWRfNSI6MTU2MDM2NjgzMi41MjQ1MDE2fQ==','2019-06-27 03:13:52.649510'),('akjs7xq1nhn8dfl5cd80j3qiwjk48dyh','YzAxNGJjOWE1MmQ0YzFkOGY2YTllMzE1Yjg0YTg1MTlhMmNiOWI3Mjp7ImlzX3JlYWRfMiI6MTU2MDY4MDg5OC43MDA4NDV9','2019-06-30 18:28:18.731880'),('axnytax7alteru8z7jlekej8mjeo0p79','NGQ4NWU3YzQ3MTkxYmU4NzFjNTBiYTdiYWM0NjE2MzQ1OGM5MWVjMzp7ImlzX3JlYWRfMiI6MTU2MDA5MTc4OS40NjY4MDI0LCJpc19yZWFkXzMiOjE1NjAxMzkyNTEuMzc3NzQ2M30=','2019-06-24 12:00:51.408987'),('b4f4g88a7k46u6a4vzpmmazehw8mfg4e','N2JlZWI0MzcwYTVlM2QxNmVjNmQyOWZiZjdiMGU0NDkwMGQ2MTRjYjp7ImlzX3JlYWRfNSI6MTU2MDU2NDA4OC4wNTkzNDAyfQ==','2019-06-29 10:01:28.090594'),('bdr4jgo1fcnjmxob2gg3d6zosnfvoprc','ZjAyMzQ3YmFlNmQyOGIyMDZkOTYwOWNlYTJhMzcwNmQzZGIwMWZhYjp7ImlzX3JlYWRfMiI6MTU2MDIzNTgyMy4zMTc0NDcyfQ==','2019-06-25 14:50:23.473955'),('bn9gkmmgoiu7y5plu9ju2ef5d798hmph','ZmFjZTkxOTQzMWFiMjdjZjc3ZGI1NjU1MTk0MmNmYmQ2NjVjZDM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-15 19:42:29.727110'),('bvjqu9nlloyp0i8x2nm7wipxug4howmj','MWU3ZDQ1YWQ0NDhhMTg5YWYwOTA4MWIxNmFlZDZkN2Q2NDBjMTEwNTp7ImlzX3JlYWRfNCI6MTU2MDM1NjkzMS4yNzM1NjU4fQ==','2019-06-27 00:28:51.304823'),('cdxa2hnfzs4dhr0infzw32ujkz3fkqdc','ZmZmZTQ1MDA5MDFlZWNlZmJiZmZiYWIxM2Y4YWZhNDM4ZDY2ZDliNDp7ImlzX3JlYWRfMiI6MTU1OTM3NjQ0My4xNzIyMzk4fQ==','2019-06-15 16:07:23.187749'),('cmtyo3kh2sev2nf1653nm1gnanqa2ahb','MGI2YzVlOTkyNTZhMTJmNThmNzQ4MTViMzU4OTE3OTBkYWJiZjBlMzp7ImlzX3JlYWRfMyI6MTU2MDMxNjUyNS42MzcyNTF9','2019-06-26 13:15:25.668499'),('cqbyrc4s60b3dg9dwi00ig3pl5zu5yy1','MTc5Y2NmNWVlOTdiOTUzOGM2MDNjNzY4YmU4M2I0NjhkZjMwNDY5Yzp7ImlzX3JlYWRfMiI6MTU2MDA0MjU2NS4xMTgwNzE4fQ==','2019-06-23 09:09:25.290056'),('csk5aiiiqrvqxrth2gwirkcimcwm9q7l','ZDQyN2I2NmM2NmZkMmM3NmM3MWFjNmI4ZWYzZmE4NGZiOTU3OGYwOTp7ImlzX3JlYWRfMyI6MTU2MDEzODUyMC4xNTc4Njk2fQ==','2019-06-24 11:48:40.189216'),('cuuozaawjcjn68z2touw74u3d7jme2jq','OGRhM2ViMDdmZmNiZTQ5MDA5MTRjZWM5YmNjNjg3NzQ5OGJmYWU4MTp7ImlzX3JlYWRfMiI6MTU1OTUwMDM4Ny40NjU3MzMzfQ==','2019-06-17 02:33:07.481360'),('dqlldvacxf7zwser13xufjd1ora0oovp','NGM3ODAyNzE2OWFmYzE5MTc0ZjIwYTQxODIwYTA2OWU5OTNiYmFiMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwianpPZnZnOEo1cHIwIl19','2019-06-23 20:58:04.381793'),('dzcolay3krhzvnyleewnxhjdj6277lvl','MzQ4YTIyNmQxYzFmNWRjZDIwNWI1NDFlZTE4NzBlM2QxNzY1NTQxZjp7ImlzX3JlYWRfNiI6MTU2MDU5NzEzNi4zODI1OTM2fQ==','2019-06-29 19:12:16.413844'),('e5o2cdttgu7qm3v00yinj1vbtebuxbuj','ZmFjZTkxOTQzMWFiMjdjZjc3ZGI1NjU1MTk0MmNmYmQ2NjVjZDM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-25 21:48:12.975349'),('ealkr8hdy9m17h8th4guzq8mywblnfmz','Zjk1ZGE4MjE4MGI0NWExOTEwMGE5YWRiOTI1MDQxM2Q2ZTQ3YjE4OTp7ImlzX3JlYWRfNyI6MTU2MDU5NzIwNS4yOTE0Nzk4fQ==','2019-06-29 19:13:25.307108'),('ekgub84u25gobib47j2j9xxyfqwyy6hb','NTI3ODI1NDE3YTQwNzAxZmJjZTEwNzIzOWI5M2E1MWVmYTEzYjcyMTp7ImlzX3JlYWRfNSI6MTU2MDQ5NjY2OS4yNjAyNjQsImlzX3JlYWRfMyI6MTU2MDQ5NjY4Ni4yOTI0MDc4LCJpc19yZWFkXzIiOjE1NjA0OTY2OTAuMjI5ODA4Nn0=','2019-06-28 15:18:10.261061'),('elvdwsbr87x8vcywapjtridi2rai4fv1','ZWQwMGQ2ZTA2NWFjOWY3Y2M4NGE4MTljY2NjNGNmYTk1ZDc1Yzk4Yzp7ImlzX3JlYWRfNCI6MTU2MDE1MzY0NS42NTk0NTg0fQ==','2019-06-24 16:00:45.690708'),('ert2dozvzr13x0m7d5h3pbr51ibtmcp6','ZTU1ZmZkMjg4NmQ3NTQ4MTA3MWFlYjZlNmE4NWM5MGFiMGVjMjllNjp7ImlzX3JlYWRfNSI6MTU2MDUxMjY2Ni43NzM2ODcxfQ==','2019-06-28 19:44:26.898930'),('ezywii0ealieqah3tmmjhg7c4gb5nah8','ZmFjZTkxOTQzMWFiMjdjZjc3ZGI1NjU1MTk0MmNmYmQ2NjVjZDM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-26 14:26:43.606337'),('fgbiy38dtiud0sj4swrdnpfc2dv10jxw','NWRjNWE3NjFiOTUxNDdiOTI3ODk4ZmE1MmE5MDgzYmFkZGQxYjg1Mjp7ImlzX3JlYWRfMiI6MTU2MDUxMzQzOC45MTU3Mn0=','2019-06-28 19:57:18.946735'),('gl0kcs5vhhxbjyerkqh46uane2ivokba','Y2ExYjdiNmI0M2MxMjc4YWI2ZTAwMGQ0NGQ1M2NlODYwNGNjZmEwODp7ImlzX3JlYWRfMiI6MTU1OTUwMDI2OS40MTUwODR9','2019-06-17 02:31:09.430957'),('gp67d2xrpyue4gfoll4swimaxovd3hcv','ODY5ODg2MTI5ZDUwMTNlY2Q1OGY3YTM5NGQzZmIzNjEwOTg5NTkzYjp7ImlzX3JlYWRfNiI6MTU2MDUzODM4Ny44NjU0NjIzfQ==','2019-06-29 02:53:07.896595'),('gypnimzyd7qfxsfr1d0ido0zbg1kpo55','OTdhOGNiY2RkMzg0YTE1OWQ0NGVlYjRmM2E4NjYwYTMyNTFjYjNkNjp7ImlzX3JlYWRfNCI6MTU2MDU2NDI0MS43NTI3NTA2fQ==','2019-06-29 10:04:01.784238'),('hcc80wqsq8qb2199zgevnktndeajds0g','NmIyZGVmZDhhMTA0YzI5NTJkMmYyYjI2NTc5MDlhYjYyOGQwM2I2Yzp7ImlzX3JlYWRfMiI6MTU2MDQ4ODczOS4yNDUyNTYyfQ==','2019-06-28 13:05:39.260859'),('hfomuprehudf73dyxxgsrhwlf3bwufhr','YzEzYTVkYTY5MWQzNjE5M2Y1YTEyYjgyMDYyMzRhNzk1MzNkNmUwZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiUkh1SlpWZ2M5aE85Il19','2019-06-23 21:02:27.917849'),('i1q8gpa5agtvfvcnopl84g1360k4npy4','NjE2ZjVhOTg2YjcxNjA1NDAwZGVlYTNiZGQ3NjhjNTgwZTk4MDM2ZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiaEFqa0w3Rm9lRlh0Il19','2019-06-30 23:13:06.133307'),('i5p7u0o3ddgzo4nezzfffg0ycocyostd','MzhiYTljY2I0MmY0ZjM1MWYzOWVhOWU3M2JiYTFiNzQxNTYyZjI4YTp7ImlzX3JlYWRfNCI6MTU2MDU5NzA4Ny41MzY5NjYzfQ==','2019-06-29 19:11:27.568216'),('i76kkcaqif3vj98gj6i0fkqk6nhmyyc1','ZjExOGU3ZmY5NDU1MjZmYTQ5NjQyMTE3NGQ4OTQzZmVjODI5Y2U5OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIn0=','2019-06-24 15:08:54.667271'),('i91yg0xtx2c3ku1zp2dhrnxq8oml36iz','NWU1YTZjMjZjY2UyMWIwMTMwMTRjZjhiYjMzYzRjNzU5YmRjZGI2Njp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwicDJkenR6amN3YUx2Il19','2019-06-23 20:57:55.600522'),('i9gaeezdyy20kr18355s9nakvyuq2dt8','MDI1OWNlZDQ5YWUxMzE0M2Y1YThjNmVjM2ZmNGVjZjk0NjM4OTVkNzp7ImlzX3JlYWRfMiI6MTU1OTg5Mjc2MC42MDc5MDAxfQ==','2019-06-21 15:32:40.639158'),('iaoie559kkfhzkgxe1hdy8tkyvl77a1l','ZmE4YmZiYTVmZmE5NGQ1ZDI4ZTMyNDg0ZWE0YzI2NzU0MGVjM2FjMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwidzdLSzJBd3lrQjdoIl19','2019-06-30 18:28:15.106744'),('intpdw0f7bsz2s11u4e90qpzgofx9z6v','YmNkYzU3ODJmMDNiNjA0MGMyZTdlNTJmZjhiY2MwYmQzNzUxM2QzZDp7ImlzX3JlYWRfNyI6MTU2MDY5MDc1My4zNTMxMzIyLCJpc19yZWFkXzIiOjE1NjA2OTA3ODIuMzg1NDI1OH0=','2019-06-30 21:13:02.416554'),('j1lex43ls25ngkbk8jcte74pplcppr0u','MGUyMTIzZTc5OGJlNGRjZDBmNDVlYmU1ZDkzMmM0YWI5ZDM1MGUxYjp7ImlzX3JlYWRfMiI6MTU1OTQwMzY3Mi4wODgxMjF9','2019-06-15 23:41:12.197737'),('j1nno0mgh2xlce89cgzwcivrl0j6d434','YTVjNmFmYWUxMjBiYWY2MzVhMWY1Mzc4ZGI3ZGY4NzAwYjVjMmY4MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRDF6TUF5cGxqRUQ3Il19','2019-06-23 20:58:46.429844'),('j9cr9q0qalris5jjbefswkzq8f60v1bj','ZjZmOTA4YmQyMmVjZTFiNmEwMWI0ZjUxZGEyMWEyMzI3MDMxMjY2ODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwid3ZISEc0b0l1RWRGIl19','2019-06-29 19:13:40.542074'),('jgkfhf7h72tx0kp974jmlwx2dmbz9z8w','NjJiNTA0MTYwNGViODVkNDlmOTM1MzBmNzM2YjE2MTg2ZmFhOWIwZjp7ImlzX3JlYWRfMiI6MTU1OTg5MjcwMi4wNzU4OTY1fQ==','2019-06-21 15:31:42.091530'),('jhlbo9lbrc1cfoc3uyxzq1lfd6zeh34q','NWJhYzM5NzZhNjE5ZDgxZDkxODA1NzU0NmVhYWU0N2JhMGRiM2YxNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWTl2VnRTRGE5dG1HIl19','2019-06-23 20:58:44.320287'),('jlfuzzrti5nr1ysxuac6fzmaykbpsf39','ZjJjYTBjM2I0NTM0NzUxODUzNjFlMDg4ODk3NDk3YmE3NjE2YjE5Yzp7ImlzX3JlYWRfMyI6MTU2MDIzNjA2Ni4wNDI0MTI4fQ==','2019-06-25 14:54:26.089296'),('kbpks88mqq3g4tbuzwy95rd2lazngxd2','NGZmYzUxNjIwODFhNGRkMmIzOGQ1ODJjM2MyMzcxMmFkNGViMDRhNTp7ImlzX3JlYWRfNCI6MTU2MDIzNjQzNi4xNDkxNzF9','2019-06-25 15:00:36.289803'),('l0ol1g2m45euv3rup4ctfpfdmvskri4t','YTUyNGIwNTFhMzljMGUxOTkwNDk1OWIwODY4YWJlZTJmN2FkNGU2ZDp7ImlzX3JlYWRfMSI6MTU1OTMyMDY5Mi4yMzY5OTcxfQ==','2019-06-15 00:38:12.257508'),('l9bir4j7om4g2k4gnbz5oadd3c6ysze6','MmI5ODdlMWQ5ZTNkYWI5YmI5MTY4ZTNmYjY5ZDZlNjA4YjI4NDc4YTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7Im5leHQiOiIvYWNjb3VudHMvcHJvZmlsZS8iLCJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIjRvenY2c1ZKVXdvYyJdfQ==','2019-06-25 18:25:23.483874'),('lb3erc2gvuog1j29nbu03la4adroo7pw','NWExOWRjOTMyZjUzYWU4YWI0Y2NmOWJhYWRkMjVjYzZmZTQ3MTcxZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiVFBpUHlhcmFHVWhZIl19','2019-06-23 21:02:28.058473'),('lpjo9jemuo2uw6odan0eszyoahg5j8nr','NzY1YmYzNzI0OGJjNWM0MTJlZWRjM2Y5Y2M0YTNiM2ZmNTQzYjg4NDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiUEdQVEJQbWFrd0ZHIl19','2019-06-23 20:57:55.959663'),('lxpqsi778bcpje6b4cetita9qkv6qx5n','OWJjODZiYjljNzMxNWVjMzEyMmMxMDA1MzllYTlhYTJhODUxMzMyNTp7ImlzX3JlYWRfNCI6MTU2MDUxODE2NS40MDUwNjg5fQ==','2019-06-28 21:16:05.436320'),('m4ug5xm8hjs48qn8kaq3xchzgogvfrmv','YjJjZjlmM2U5MjAyYTlhYTlhZDhiZWJhM2ZlYTg3YWQzNjczNDk3ZDp7ImlzX3JlYWRfMiI6MTU2MDU5NzA5OS4wODQyODc0fQ==','2019-06-29 19:11:39.115533'),('m7ikg04vy2o4mv0f3ey3m3k7ie56mkjb','ZmFjZTkxOTQzMWFiMjdjZjc3ZGI1NjU1MTk0MmNmYmQ2NjVjZDM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-25 18:11:20.579585'),('m7jmbbdd72joxoyi60kwb0okx2ibpugk','NjUxM2Y3ODM0MjdkYWE0NWQzMGIzNTE3NzM5ZTc3YWRhMjY4MTBjNTp7ImlzX3JlYWRfNSI6MTU2MDY4MDkyNi4xMDc3MzY4fQ==','2019-06-30 18:28:46.154725'),('m7obg7tet13q232ax5afauis4h9yulf4','MmZkYWJlMzhkZjQ3YTE5NDlmMWQ4ZjhjZDM5NDVkMjI0ODljMzZlYTp7ImlzX3JlYWRfMiI6MTU1OTk1NTM2MC4wMjcyNjQ2fQ==','2019-06-22 08:56:00.152267'),('mi6maj8cvbwtk0fqg4i0fn4cg8756ih0','MWFiMGUzYzViZTY4Y2E2MTY0ZmFjN2I5YTM0OGQ2MWVkMjU5MDY0MTp7ImlzX3JlYWRfNCI6MTU2MDMyNTc1MS4xMTY5Mjk4fQ==','2019-06-26 15:49:11.163803'),('mj04o1z0dq86xe1qi9565602kizzie8a','MTU4NDYxMDgyYzJhMGI3ZmFlOTU4MGE4MzZlOTU5Y2MzNzc5YmI0Nzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiNW1SV2hiRHhGU0tUIl19','2019-06-23 20:58:04.069251'),('ml5x36zjus03wqsjd43y3if05z7tjq9d','YWVlYjczM2YyODVmMmYxMTI3MTkyYjZhNjA0YWRkMTlhYWJiMDUxYTp7ImlzX3JlYWRfMiI6MTU1OTYwODI3OS40ODkwMzIzfQ==','2019-06-18 08:31:19.598413'),('mptpa0qf4tedq3eacra3whze3dcohicb','NjIzZTM3YTIyYmIwNWQ0ODkzNTE2NGU1ZjdhNThhYjgxOTAxM2I2Yzp7ImlzX3JlYWRfMiI6MTU2MDY0Mjc5MS41NTM2NTYzfQ==','2019-06-30 07:53:11.631778'),('mq3s56dl67ybm1639e5wb4fgrp3tr6dh','M2NkMjgxYzdjMWNiZWRjMmIwYTNlNmNmNjlmMzhhM2JiNmZiYmQ0Njp7ImlzX3JlYWRfNCI6MTU2MDMxNzUyMy45NDE2NDYzfQ==','2019-06-26 13:32:03.973124'),('nhelyziweuk96dq0w2qqo75f6vm2m0gs','NDQwMTNmYTU0YmMxOTg1YjQ5M2E1YWRkODM5YWI0ZGU5ZWRlMDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjoxMjA5NjAwfQ==','2019-06-14 17:28:31.003335'),('nx3ugoyk32n6lrcd3s1afrxxubj87hom','ZjQzYWVhMWFhOWE0ODk1ZjEzZjYyNDI5ZGFmNzk4MjI3ZDhjZDM0Yzp7ImlzX3JlYWRfNyI6MTU2MDY4MDg5My43MzE3MDF9','2019-06-30 18:28:13.762955'),('oyeknsscul5wzh5uetuoyqt9icml4khp','YThhNDY2ZDZmZGNjZWRkZDVkNDRmYjdmYTBjMzgxMzllY2MzNzQ2MDp7ImlzX3JlYWRfNSI6MTU2MDQ4ODg0Ni4zNTg4NTAyfQ==','2019-06-28 13:07:26.390004'),('q1rh7hitcqhto3cix8fo8256d5u48gr4','ZThiNDQ0ODdjZjFiNmU4NDc3ZDVjMjRhOTcwMmJkMzBkZTgyNDc4Zjp7ImlzX3JlYWRfMSI6MTU1OTI5OTg1Ni43NDg5NTc5fQ==','2019-06-14 18:50:56.861268'),('qdoa7v5lutybrz8aniuncyng2cjja29s','OTU2MjI0MTU4ZWJkNzBmZWI1NjdmNGY5YTU3OTQ3ODQ3YzJhNmZlYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwibjZIemtNVWRlT0ZDIl19','2019-06-23 21:02:28.480361'),('qtbm1cek3w7330s0v430q4glgnnj7k0k','ZTk3MDFkMWM0MTQzYThmOGI1NDlhMWNlODA5MDQ2OGIyNjQyYjJjODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7Im5leHQiOiIvYWNjb3VudHMvcHJvZmlsZS8iLCJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sInZEVkJzMFJybVFtTiJdfQ==','2019-06-26 01:05:04.261464'),('qy8qqcec32jdc74llv64085h9gr4lknp','MmRhMTc1MzAzNjM4OGRjMGVhNmEzNWQxNjU0ZWZkYjg4NjhmNTFkNjp7ImlzX3JlYWRfNCI6MTU2MDUxOTMxMi4wNTEwNzE0fQ==','2019-06-28 21:35:12.066694'),('r6oktm6ykzjh2ds39ww9ehaz9i91u5mw','MjFiYWY1MmFkMWE0NjU4YWI5Mzk1Mjc1ZDI3ZDZkYWVmOTRmOTVmNzp7ImlzX3JlYWRfMyI6MTU2MDU2NDA2OS41NzQyNjF9','2019-06-29 10:01:09.605624'),('reb9txv7q44ih43qo8iuhj1l70mdrymv','M2ZjMmE4MTUyZjIxNDhiMjJiZjFhODA5MjkyYzJiZmI1ODgyMmIyNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiYThLWXpoenlkT2lVIl19','2019-06-30 18:28:45.170203'),('s5hm8pojwgprw64t0k9ocm2ntxj3wgxj','NWMwNmRmOGJiMWEyMmYwOGJjYTZjYzU4MDljNzk0ODIwNmIzNDI3YTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiVXJadnJMNVhUV2pKIl19','2019-06-23 20:58:03.381735'),('s6o1w6tqnmoaayhddctojuhr5y00k9xi','OGMzY2ZmMTBjM2Y0OWUzNjc5MzNhZGE2ZDE5YTJkZTE4MzllMDdiNjp7ImlzX3JlYWRfMiI6MTU2MDYwNjU3NC41ODYyNzV9','2019-06-29 21:49:34.664660'),('s6yrsrmkdxjt4s2vg43iy7jfg57qospx','YzMxMjg4ZDQ3MDMxOGI4MzhkZWYyNTEwNmM1YTE4ZDA5MDIyZWZjZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwibm44dnlTY2JTUDIwIl19','2019-06-23 21:02:28.245975'),('sc35vij8b72dyn4pkmodq5eifvvi9a7h','NWU4MGM2OTAzNGJkMjgyNWJhYjdkNGMwYTJiNzZhZDFjN2ZkZmZiOTp7ImlzX3JlYWRfMSI6MTU1OTI5OTE1MC4xODcxMjk1fQ==','2019-06-14 18:39:10.209590'),('sh69a6qv1cph5y7q63cu15h434aakrty','NTk3NTU1OGU4NzJkYzk0YjAyYTg4ZWEyMjBjZmYzOWUwMWRkZjUyMDp7ImlzX3JlYWRfMyI6MTU2MDkxMzU2Mi40OTc3MjE3LCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTljNGYzOTgxM2Q0MDYxMGI1YWJkNmU3OGM4ZTIyNDgzN2NhMzgzMyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2019-07-03 11:14:31.963524'),('sh95mzf47kdv1l4488mjkgi41ljo4rez','NGU2NzIwNzY2MmVkNTFjZWI1M2MwZDI1MmI4ZDFmZDE2MWRmMjc5Zjp7ImlzX3JlYWRfNiI6MTU2MDY4MDg5Ny43NjMwODl9','2019-06-30 18:28:17.809956'),('sqde8cjbt0hapiywjkaqws9p8v5vuyv9','NDViNWVlY2ViNTUwM2RkYjUzNGI3ODNiZWI3NjdkNjFiMTgyZTc4Zjp7ImlzX3JlYWRfNyI6MTU2MDU5NzEyNC4wMDcxMTM3fQ==','2019-06-29 19:12:04.038365'),('t1t1yxdyj550m1ntd9m458ma0guc8jso','YWI1MzU0MzcwNTE2M2Q0OWEzMzA2NjA0OThlOTcwNGViZWVlYmY2Yjp7ImlzX3JlYWRfMiI6MTU2MDIxOTE4Mi4zOTE2NzI0fQ==','2019-06-25 10:13:02.438488'),('tj0jxjm5kxz42ipdqitvpx2c089m1wia','NzgyYTFhNDI4ZTFjNWFlNGJkYzFlNGM5NTQ4NTg3Y2FkNTc1MWU3Mzp7ImlzX3JlYWRfNyI6MTU2MDY5MDgxMy40OTU2ODkyfQ==','2019-06-30 21:13:33.511416'),('tuvkoo3d2c7hhgwbqz4d1zo83vh4ant1','Yzk5Njc0N2NiZDJhOWI5MDY4ZWRiY2QxMDkyODdlNGRhY2U4MjhlZDp7ImlzX3JlYWRfNCI6MTU2MDY4MDkyNS42MDc3MjI1fQ==','2019-06-30 18:28:45.638968'),('ucv3g2136k4hrvy5drpfnzwo1vyt3luv','YWM5YjIwZTAwMzAyMmVmMGM1NDI4ZjkyZjhjODgyZTY2Yzg0NTFkYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWEZMWXZxMFNudE14Il19','2019-06-23 21:02:27.089752'),('ue8wpw4v22bk3wgwmx888on2lwgcux1r','MTYwYzAxMmUwYzdlM2YzMmU1ODlhNzI0ODgzZjRmZjIwYmYwMmFkNjp7ImlzX3JlYWRfMyI6MTU2MDE0MTQ1Ni4zMDgzODI3LCJpc19yZWFkXzQiOjE1NjAxNDE1MzguODI0MjQ2fQ==','2019-06-24 12:38:58.870885'),('ujhm4ufjptyfo91zqsittsmlji1rx5va','YTJhYjI1NDgwN2VlZDk4NDgxMmNjNjMzNTI1MTY2MGQ2MWViY2QwMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiYTg1aXJ1eFptTmFaIl19','2019-06-23 21:02:28.699339'),('ujozp3epzy8r2m4tza4ebvajtwa5oa97','MzY5OWRmMjAyZDQ5Y2IxMGZmODU1MTUyNDVkZjU4NTI4N2E0NGMzMDp7ImlzX3JlYWRfMyI6MTU2MDEzODMyOC43MDEwNTQ2fQ==','2019-06-24 11:45:28.747935'),('ulv3f4y3gwnfjvrg6lp4vefn20ti15om','NjI2ZmY3YzU0ZjgxYjBhZjBhN2E0MGNjMjliYTllODk0ZWFiODcwZTp7ImlzX3JlYWRfMiI6MTU2MDMxNjQ2Ni40NjM4NTU1fQ==','2019-06-26 13:14:26.495104'),('uoffra8febaocawzb0vizq1xxjeuf312','NTNmNTg2MjVkMzYwZGM5ZjE0ZTRkOTFmYWQzYjcyYmQyZDU5YTg5MTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiNzhRbkJZMWZITHByIl19','2019-06-23 20:58:45.851812'),('uv7ykzm3ou6uzhn457u580txbiorz5ql','NTUzNTc1MGE3NThlMzMzMmQwMjc5OTAxNDUyM2ZmYzIzNGI3Y2UyMTp7ImlzX3JlYWRfMyI6MTU2MDY4MDkxOC4wMTM3MjQ2fQ==','2019-06-30 18:28:38.045251'),('uwhs0e7cnfue4l72y2t261s5um1gtxxs','Mjk5Y2IzMTA2ZmM3ZmM2YzY5MDU2MWVkZDA1MzI2ZmI3NzZmYTA2Zjp7ImlzX3JlYWRfNCI6MTU2MDE0MTg5OC4wOTcyMzc2LCJpc19yZWFkXzMiOjE1NjAxNDI0NjQuOTI4MTU3fQ==','2019-06-24 12:54:24.975011'),('vdgybm4y1qcz7nrb2cls6deotyu8mf9k','ZmRjOGRiOTQ3MGQ3OThhZTFlMDM4MGMyNDYzZmJjNjRlMjUyZmU4MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTljNGYzOTgxM2Q0MDYxMGI1YWJkNmU3OGM4ZTIyNDgzN2NhMzgzMyJ9','2019-06-20 12:47:57.899670'),('vx58idh4j66e9bytd2pt5wrb56wqeifz','ZmFjZTkxOTQzMWFiMjdjZjc3ZGI1NjU1MTk0MmNmYmQ2NjVjZDM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-06-24 18:18:44.427701'),('w1c1x3cw1vsg076l8o8dle23dona3x3c','NGQ2NGM0NGQ0MDZkMjFiNzEyNjNlYzRkMjcwOTQxNTEyNTNjMWRkNzp7ImlzX3JlYWRfNSI6MTU2MDUxODA1MC41MTAwMjk2LCJpc19yZWFkXzQiOjE1NjA1MTgxMDUuNjk5NjQ4Nn0=','2019-06-28 21:15:05.731298'),('xc83kjmtkigwnwpxbl6v7wqq0ql3ba2z','ZDlkZjg0NjQyMjRmMmNmMGNmNzI2YzM5MTAxYjkyM2EyZDI2MzdhOTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjgifQ==','2019-06-20 16:37:31.388002'),('xk7ob2j48tq2kc9nofar8s1gyahvltuh','Mzc2YjAxYWU1YmM0NGM5Njk2NmU3MGVkODdiMmU4ZWUxMmU5NmY3Njp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRTNoaWx0Wk5WZHQxIl19','2019-06-23 21:02:28.996008'),('xmmq9ifcqlp5k4fb3cfl4q0u2r6a7sil','NDQwMTNmYTU0YmMxOTg1YjQ5M2E1YWRkODM5YWI0ZGU5ZWRlMDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWM0ZjM5ODEzZDQwNjEwYjVhYmQ2ZTc4YzhlMjI0ODM3Y2EzODMzIiwiX3Nlc3Npb25fZXhwaXJ5IjoxMjA5NjAwfQ==','2019-06-27 16:18:29.007305'),('xw8z5o9axo4vc3t4br5vtj2dmn4zpzp6','NzhkMGZkNzcyODAyMThjZjFmMDI2NDRmZTI2NWYxYzQyMjk1MzAxZjp7ImlzX3JlYWRfNCI6MTU2MDE1MzcwNy4wMjAwODg0fQ==','2019-06-24 16:01:47.051386'),('xwo4gay9tjnaqnbo14hhxy7he98b7f6x','NmVjNzZiYmQxNDAxZGNmNjRmYjA5NWYwNDI4NWNkMWFkZDRlZjkzZjp7ImlzX3JlYWRfMiI6MTU2MDU5MjgzNy4zMTk4MjgzfQ==','2019-06-29 18:00:37.351076'),('y845p2vfdrzumwohiunwks9kbgl0gcc5','ZTFiYzJkY2JjYTVmZjlmZTNmMzFiYWRhNzhiZjUxYWJkM2UxNWRjMDp7ImlzX3JlYWRfNCI6MTU2MDM1NjkzMS43MTEwODE1fQ==','2019-06-27 00:28:51.726702'),('zm0ypjddopw9efhfy47ucs7c04rh5it2','M2U1ZGNmMGY3ZThkNWJjODU2YTg4Y2JhNTU5YWIwMDJjZDJlMjg1Nzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRHRCMTFCZFlTMHZtIl19','2019-06-23 21:02:27.527338'),('zuy22h7g6mf9m0nvc5qj9b7mu6v2x4re','NDg0NmQ4OWIwYjZmZGNlMDJmNTc2NmU0NmNjNTk5OWYwMjIzNjUzNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWWx3c28yT1NvNW52Il19','2019-06-23 20:58:03.616111'),('zxv12zy3zmki1z6wr6l026gkn0t45dx9','NWNkMmNlYzY5M2VmNWU2NWZkMDFiNzU5OGQxMzQ5YmE5ZjJkOTc1MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7Im5leHQiOiIvYWNjb3VudHMvcHJvZmlsZS8iLCJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sInRrcXI2RXZQamI2ZCJdfQ==','2019-06-24 20:10:42.341329');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'www.eosones.com','EOSONES');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_social_user_id_8146e70c_fk_Myaccount` (`user_id`),
  CONSTRAINT `socialaccount_social_user_id_8146e70c_fk_Myaccount` FOREIGN KEY (`user_id`) REFERENCES `Myaccount_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'github','GithubAccount','0223ef92dde0c6dfbecf','84262b17c03ad0b2b5a3d851c40469fb4c31ac0d',''),(2,'weixin','weixin','wx19101bc91a42e052','991ab1b02db4f40ab5e451a91c4d994c','');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-19 13:11:33
