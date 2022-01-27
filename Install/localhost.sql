-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-01-27 06:16:00
-- 服务器版本： 5.7.34
-- PHP 版本： 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `schoolcms`
--
CREATE DATABASE IF NOT EXISTS `schoolcms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `schoolcms`;

-- --------------------------------------------------------

--
-- 表的结构 `sc_admin`
--

CREATE TABLE `sc_admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '管理员id',
  `username` char(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `login_pwd` char(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `login_salt` char(6) NOT NULL DEFAULT '' COMMENT '登录密码配合加密字符串',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `login_total` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录次数',
  `login_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属角色组',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_admin`
--

INSERT INTO `sc_admin` (`id`, `username`, `login_pwd`, `login_salt`, `mobile`, `gender`, `login_total`, `login_time`, `role_id`, `add_time`, `upd_time`) VALUES
(1, 'admin', '39453298ccaf5774029a9f03d96ecdbe', '515391', '', 0, 261, 1642751732, 1, 1481350313, '2022-01-21 07:55:32'),
(3, 'testtest', '7b2cf5343898484ee47727dfaedc1e02', '991606', '', 0, 26, 1491992579, 13, 1483947758, '2017-04-12 10:22:59');

-- --------------------------------------------------------

--
-- 表的结构 `sc_article`
--

CREATE TABLE `sc_article` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(7) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `article_class_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章分类',
  `jump_url` char(255) NOT NULL DEFAULT '' COMMENT '跳转url地址',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `content` text COMMENT '内容',
  `image` text COMMENT '图片数据（一维数组序列化）',
  `image_count` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章图片数量',
  `access_count` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '访问次数',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sc_article`
--

INSERT INTO `sc_article` (`id`, `title`, `title_color`, `article_class_id`, `jump_url`, `is_enable`, `content`, `image`, `image_count`, `access_count`, `add_time`, `upd_time`) VALUES
(1, '我们翻了20多年的文献专利，就为了搞清楚VR从爆火到爆冷的秘', '', 7, '', 0, '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><img src=\"/Public/Upload/Article/image/2017/02/24/1487908153341367.jpg\" title=\"1487908153341367.jpg\" alt=\"11-1.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">看到大家在朋友圈各种晒虚拟现实（VR）的酷炫体验，感觉VR“忽如一夜春风来”似的进入大众视野。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">但是仔细一想，我好像只能将VR和游戏、电影联系起来，鬼知道“高大上”的VR技术到底经历了什么。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">VR电影不用说了，传说中的那种片子看不到，能看到的都是《西游伏妖篇》这种伪3D。去找个VR游戏室体验一把黑科技吧，结果头晕眼花吐苦胆，真是悲从中来不可断绝。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>这VR技术到底什么时候才能走进家门？我的脑海中闪过了技术生命周期理论、各种专利数据、国内外各种大牛生产的文献……</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">于是驱鼠杀奔CNKI官方网站，调出了库里存在的文献，惊讶地发现有许多文献都发霉长毛了，原因是它已经历了30多年的风雨。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>文献已人老珠黄，那么专利情况如何呢？</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>经过反复在国家知识产权局官网上查找VR的专利数据，你猜怎样？最古老的专利已经尘封了21年。21年前，电脑还是486\\586的天下，这跑满了21年的VR技术还会有多少应用价值呢？</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">2014-2016年短短3年时间，国家专利局公布了2585项专利，在这漫长的21年里，达到了一个新的高度。此前，1996-2013年的18年时间一共才公布了934项专利。这是一个产业爆发的信号啊。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>此信号跟市场/公众反馈是一样的吗？我们可从热搜关键词中查验一下VR的搜索热度。<br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>于是，我们收集了三组数据，定量的分析VR技术发展的生命历程，并尝试对其未来发展进行预测，结论如下：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>1)&nbsp;中国人对VR技术的认识经历了从基础研究到科技产品研发，时间长达30来年。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">&nbsp;&nbsp;<br/>2)&nbsp;1996年至2014年期间我国的VR技术处于起步阶段，2015年以来的这两年，虽然有突飞性发展，但依然不够成熟。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>3)&nbsp;许多媒体说VR技术已经开始在教育、体育锻炼、游戏和医疗等领域布局和应用，但要市场真正接受，至少是从2019年起。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>这是怎么发现的呢？来看几组数据。</p><p class=\"text-sm-title\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-size: 18px; font-weight: 700; color: rgb(164, 29, 29); font-family: Arial, 微软雅黑, \"><br/></p><p class=\"text-big-title\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-size: 20px; font-weight: 700; color: rgb(164, 29, 29); font-family: Arial, 微软雅黑, \">第一组数据：VR文献，一只“倒扣的碗”的寓意</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>首先，我们查的是文献，文献数量的变化往往能反映出研究热点的变化。文献数量开始减少暗示着相关的理论研究比较成熟，开始转向实际应用。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>结果发现“虚拟现实”文献数量的变化竟像一个“倒扣的碗”！这个轨迹刻画了理论研究文献经历了高峰后逐步的下滑，往往暗示着实际应用的酝酿开始。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/>具体操作是这样的：我们分别以“虚拟现实”、“虚拟现实技术”和“虚拟现实系统”三个关键词在CNKI中进行文献查找，发现自1993年第一篇有关VR的文献在国内发表以来，历年有关VR的文献数量持续增加，并在2008年登上它的“珠穆朗玛峰”，随后开始走“下山之路”。</p><p><br/></p><p>原文来源 虎嗅网：https://www.huxiu.com/article/182456.html</p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2017/02/24/1487908153341367.jpg\";}', 1, 173, 1484965691, 1642608302),
(3, '互联网人就算不去阿里，也在要去阿里的路上', '#FF0000', 7, '', 0, '<p class=\"text-big-title\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-size: 20px; font-weight: 700; color: rgb(164, 29, 29); font-family: Arial, 微软雅黑, \"><img src=\"/Public/Upload/Article/image/2017/02/24/1487908588560079.jpg\" alt=\"1487908588560079.jpg\"/></p><p class=\"text-big-title\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-size: 20px; font-weight: 700; color: rgb(164, 29, 29); font-family: Arial, 微软雅黑, \">1</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">阿里巴巴园区旁边的五常中心小学，二十多年前还是余杭县五常公社东风生产大队所属的农村小学。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">2013年阿里巴巴从滨江区搬迁到这里，附近五常街道和仓前街道的房价开始坐上火箭，这个小学也摇身一变成了马云母校杭州师范大学的附属小学。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">阿里巴巴高层的孩子通常住在杭州城内各个名校的学区房里。但是因为五常小学离公司近，小学成绩又不是很要紧，所以还有相当一部分阿里老员工把孩子送到了五常小学就读。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">传说这些“橙二代”在学校里面已经有拼爹的苗头了：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><blockquote style=\"box-sizing: border-box; padding: 25px 30px; margin: 0px; border: none; background-color: rgb(245, 245, 245); line-height: 23px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">“小子，我爸是P8，你爸是P几啊？”</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">“我爸妈都是中供铁军，你家是刚从北京新来的吧？”</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">“我妈是HRD，你知道什么是价值观第一吗？价值观第一就是我妈第一。”</p></blockquote><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">这时候回迁户家的孩子看着他们吹牛逼，就像《血色浪漫》和《阳关灿烂的日子》里胡同串子出身的顽主，眼瞅着大院子弟穿将校昵骑永久自行车拍婆子，只有流口水的份儿。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">现在这群小子还能流口水。等到马云投资138亿元的云谷学校建起来了，他们连口水也没得流了。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">这个云谷学校一年学费20万起，师生比例1比5，预计未来招生规模3000人，从幼儿园到高中十五年一贯制。阿里巴巴的合伙人将在全球范围延揽人才在该校任教，争取办成“浙江第一，全国一流，世界知名”的国际化学校。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">想入学该校，买学区房、拼成绩都不管用了。不仅有专门的考试还要筛查家长的背景。今年第一期入学的指标60人，已经被“橙二代”们包了个饺子。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><span style=\"box-sizing: border-box; font-weight: 700;\">按照阿里巴巴目前的人员结构，只要大家别都抢着生二胎，P7以上的员工的孩子，应该都有机会往云谷学校里挤一挤的。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">马云是这样寄语云谷学校的，</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><blockquote style=\"box-sizing: border-box; padding: 25px 30px; margin: 0px; border: none; background-color: rgb(245, 245, 245); line-height: 23px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">“云谷培养的孩子，一定要用全球化的眼光看问题……是中国未来的希望所在。”</p></blockquote><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">我相信有马总这样的关心，云谷学校的同学们一定能不负重托，担起DT时代勇攀科学人文高峰的重任，到时候争取跟北京的八一学校比一比，也发射一颗科研小卫星。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p class=\"text-big-title\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-size: 20px; font-weight: 700; color: rgb(164, 29, 29); font-family: Arial, 微软雅黑, \">2</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">为了你的下一代，互联网人就算不去阿里，也在要去阿里的路上。一张P7的工卡，顶半套学区房。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">网络安全大神吴翰清四年前离开阿里创业，做了两年把公司拆了分别卖给百度和阿里，他回了阿里，另一拨人去了百度。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">如今肯定是在阿里的人活得舒坦，不然公司今天来个90后副总裁，明天来个90后总经理，后天还要操心老板被境管的谣言，怎么能安心做技术呢？<br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">16年资本寒冬的到来，回大公司上班又变成了一种时髦，和两年前成群结队离职说要“改变世界，颠覆行业”一样时髦。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">吴翰清（道哥）月初写了一篇《我回阿里的29个月》在程序员的朋友圈里刷了屏，他说，</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><blockquote style=\"box-sizing: border-box; padding: 25px 30px; margin: 0px; border: none; background-color: rgb(245, 245, 245); line-height: 23px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">“四年前我会狂妄地说要颠覆世界，现在看来世界根本不需要被颠覆。”</p></blockquote><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">春江水暖鸭先知，除了这些归巢的老阿里之外，嗅觉敏锐的还有媒体人。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">今年招兵买马之后，从前删帖催稿都忙不过来的阿里公关，现在也可以学百度陪着媒体人出国游山玩水了。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">当然媒体人成群结队去阿里这件事不是从去年开始的，18年前加入阿里的金建杭官至总裁，14年前加入的王帅也跻身合伙人，现在每天在微博上写打油诗，秀两个女儿的照片，趿着拖鞋在豪宅的花园里趴趴走。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">12年前加入的陶然现在是滴滴打车的副总裁，7年前加入的陈亮和21世纪经济报道的三位同事，颜乔、杨磊、顾建兵，都成了集团公关总监。但是时不我待，<span style=\"box-sizing: border-box; font-weight: 700;\">2012年之后，通过去大公司做公关这扇财务自由的大门就对媒体人关上了。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">王以超就没有赶上好时候，2013年才离开媒体去了京东。虽然从资历上来说，王以超和阿里巴巴合伙人王帅是同一年出生，他就职的《财经》和《财新》也不知道比王帅当年的《齐鲁晚报》、《济南时报》高到哪里去了。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">但是说什么都没用了，下水晚了十年，老板从马云换成了刘强东，财务自由变成了跳槽自由。王以超老师8年换了8个工作。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">如今王以超的微博认证还是36氪副总裁，在行上的认证还是Uber中国公关副总监，但是在朋友圈里他已经宣布自自己“上上上上，上优信二手车，做做做做，做公关总经理”去了。<br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">很多好事之徒总喜欢拿他来还开涮，比如在“即刻”上增加一个王以超又跳槽的提醒，或者在朋友圈发布一个王以超一年以内会离职的盘口。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">但是谁都不能否认，王以超有一个好心态。这么多次离职，虽然还没来得及实现财务自由，但是跟前东家都是和平分手，没有一次撕逼的。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p class=\"text-big-title\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-size: 20px; font-weight: 700; color: rgb(164, 29, 29); font-family: Arial, 微软雅黑, \">3</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">有些人的心态就没有那么好了。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">最近刷屏的两篇文章，《我那么努力！有两套房，却不得不离职，到底哪里出了问题》和《就算老公一毛钱股份都没拿到，在我心里，他依然是最牛逼的创业者》。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">前者是一个华为的高级工程师，在35岁的年纪背上了深圳的两套房贷，又遭遇了华为劝退，年收入从50万遽然降为20万，只好割肉卖掉一套学区房还债。接下来为了养育两个孩子，自己原本全职在家的太太也可能要重新出来找工作了。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">后者是一位互联网公司的运营，老公参与了一家游戏公司的创办，七年过去了只拿到了普通程序员的工资，期间有一次100万的分红用于结婚和买车，现在她在家全职带孩子，两万元的月收入要付9000元的房租和8000元的房贷，想要通过公司的股份套现缓解经济危机，结果发现老公根本不是公司的股东。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">这其中的是是非非很难讲清楚，很多剧情现在又出现了反转。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">但是其中确定的，是两个普通出身的家庭，身处过去十年二十年中国增长最迅猛的行业，本来以为自己的收入可以维持有车有房、太太全职在家、孩子接受更好教育的中产阶级生活，结果在2016年底2017年初的这个冬天，梦想被现实撞得粉碎。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">在垮掉之前，一个工程师自己动手，另一个工程师是老婆动手，用写一篇微信公众号文章宣泄不满，结果发现他们自己真的一点都不孤独。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">听说最近西二旗和中关村的程序员相亲，已经指明会写文章的姑娘优先。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">互联网人是好日子过久了，总以为12K的起薪是对程序员的羞辱，以为工资三年翻一番，职位五年跳三级是理所应当，以为一个大公司的中层加上几个90后泥腿子拿到几百万天使投资是正常现象。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">在1992年之前，中国哪一段历史可以说服你，寒门可以出贵子，阶层的流动可以一代以内完成？</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">2008年的金融危机后，哪一国的现状可以证明，中产阶级可以一人工作全家不饿，有房有车有医保，教育养老一劳永逸？</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">知乎上还有一票打抱不平的程序员摩拳擦掌，要为无产阶级兄弟讨回公道。但是写文章的华为员工已经承认了，作为一个农村出来的孩子，能够留在深圳还有一套自己的房子已经很不错了，之前又要生二胎又要学区房，是自己想多了。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">是的，我们这些童年享受了廉价的教育、医疗和住房，成年后通过高考跻身大城市，毕业后通过进入新兴行业获得收入增长的一代人都想多了。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">实际上就连“我是农民的儿子”这句话，从前也只有犯了错的省部级领导干部才有资格说。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, 微软雅黑, \">如今一个落魄工程师在朋友圈写文章就敢随便用，这自媒体恐怕也要管一管了？</p><p><br/></p><p>原文来源 虎嗅网：https://www.huxiu.com/article/182469.html</p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2017/02/24/1487908588560079.jpg\";}', 1, 34, 1484985139, 1642608292),
(4, '奥斯卡“最佳影片”在中国的23年历程：从亡命天涯到爱乐之城', '', 7, '', 0, '<p><img src=\"/Public/Upload/Article/image/2017/02/24/1487909338925964.jpg\" title=\"1487909338925964.jpg\" alt=\"33.jpg\"/></p><p>奥斯卡“最佳影片”在中国的23年历程：从《亡命天涯》到《爱乐之城》</p><p>文/陈镔</p><p><br/></p><p>2017年奥斯卡颁奖在即，今年提名奥斯卡最佳影片的9部作品已经有三部登陆中国的大银幕——2月14日在中国内地起映的《爱乐之城》截至21日累积票房已达1.82亿，2016年末开画的《血战钢锯岭》和2017年初开画的《降临》分别拿下4.26亿和1.09亿。目前《爱乐之城》、《降临》和《血战钢锯岭》的全球票房也在提名的9部影片当中位列三甲，其中《爱乐之城》随着内地成绩的节节走高，有望冲击4亿美元的全球总票房大关，若如金球奖一样最终在奥斯卡颁奖礼上大丰收，则无疑将成为名利双收的最大赢家。</p><p>&nbsp;</p><p>事实上，奥斯卡奖和内地市场的联系正变得日益紧密：一方面，提名当年最佳影片的作品愈来愈频繁地被引进到国内，观众的欣赏水平也在与国际接轨；另外，资本层面上的连接在近年来持续加强，多部佳作的背后显现中国公司的身影，开拓出中美影视合作的新支流。</p><p>&nbsp;</p><p>下面，让我们从提名奥斯卡“最佳影片”的一系列作品入手，探寻奥斯卡奖“登陆”中国的缘起和未来。</p><p>&nbsp;</p><p>《亡命天涯》开启好莱坞中国征途，“最佳影片”连续11年被引进</p><p>&nbsp;</p><p>奥斯卡奖的正式名称为“美国电影艺术与科学学院奖”，第一届颁奖礼在1929年举行，迄今已有近90年的历史。</p><p>&nbsp;</p><p>在每年颁出的所有奖项中，“最佳影片”被认为代表了该年度电影工业的最高水准，其中尤以好莱坞出品的英语片为主；但由于价值观的差异和文化政策的限制，早期的奥斯卡“最佳影片”基本都被隔绝在外。</p><p>&nbsp;</p><p>直到1994年，在经历长期的市场低迷后，电影主管部门终于决定打开国门，启动了“十部进口大片”的新政。</p><p><br/></p><p><br/></p><p>据传在挑选第一部登陆的影片时，斩获奥斯卡“最佳影片”的《辛德勒的名单》和全球席卷逾9亿美元的《侏罗纪公园》在竞争中被刷下（均由史蒂文·斯皮尔伯格执导），最终胜出的是由哈里森·福特主演的《亡命天涯》。而该片也是1994年提名“最佳影片”的5强之一，由此成为奥斯卡与内地市场的首次官方接触。</p><p>&nbsp;</p><p>时隔一年，《阿甘正传》携“最佳影片”等6项大奖在全国公映，票房为1960万人民币。到了1998年，《泰坦尼克号》在时任国家领导人的亲自指示下得以驶入内地，不仅以3.6亿的成绩一举刷新影史记录，更成为世纪之交重大的文化事件之一。随后上映的《拯救大兵瑞恩》也拿下8230万，位居年度排行榜次席；该片与《伊丽莎白》和《美丽人生》均入选次年奥斯卡“最佳影片”的终选名单，创下中国市场单届奥斯卡引进数量的新高。</p><p>&nbsp;</p><p>进入新千年，奥斯卡登陆的步伐趋于稳健：从同期获得“最佳影片”的《角斗士》和“最佳外语片”的《卧虎藏龙》，到连续3年引进的《指环王》三部曲；虽然中间又经历两年的断档，但从2007年至今每年都至少有一部“最佳影片”提名作品进入内地院线。</p><p>&nbsp;</p><p>从2010年开始，奥斯卡“最佳影片”的入选名额扩大10部（两年后又调整为9部），同时伴随着国内市场容量的急剧膨胀，出现连续4年引进三部“最佳影片”的热潮，其中《阿凡达》、《盗梦空间》、《少年派的奇幻漂流》等片都是叫好又叫座。</p><p>&nbsp;</p><p>截至2016年，共有33部提名奥斯卡“最佳影片”的作品被引进内地，再加上今年已经上映的《爱乐之城》、《降临》和《血战钢锯岭》等3部影片，累计总票房接近58亿人民币。</p><p>&nbsp;</p><p>剧情片数量占优，科幻类型最受中国市场亲睐</p><p>&nbsp;</p><p>奥斯卡奖历来注重表彰人文上的艺术成就，因而剧情片的提名数量一直领先于其他类型，这一比例也在引进的奥斯卡最佳影片中得到体现：截至目前，共有11部提名或获奖的剧情片亮相内地银幕，接近总数的1/3。</p><p>&nbsp;</p><p>不过在市场反响上，虽然剧情片的口碑基本都处于中上水平，但票房号召力明显不足，单片平均仅有1572万的收成，在所有类型中居于末位。其中表现最好的是2015年上映的《模仿游戏》，但其时距离颁奖礼已过数月，又深处竞争火热的暑期档，5256万的成绩已殊为不易。另外诸如《国王的演讲》、《艺术家》、《钢琴师》和《女王》等均未能过千万，年代较久远的《伊丽莎白》和《美丽人生》甚至没有票房统计，剧情片的弱势可见一斑。</p><p>&nbsp;</p><p>最为符合国内观众口味的无疑是科幻片：从斩获13.4亿人民币的《阿凡达》，到《火星救援》、《盗梦空间》和《地心引力》等卖座大片，唯有今年刚上映的《降临》是近期引进的科幻片里的票房最低。这五部提名“最佳影片”的科幻片累计接近30亿元，可谓在中国市场名利双收的产品典范。</p><p>&nbsp;</p><p>唯一能在单片成绩上相抗衡的是冒险题材的《少年派的奇幻漂流》和《荒野猎人》，两片分别在11月和3月的淡季登场，合计拿下9.5亿元的票房，成绩相当傲人。</p><p>&nbsp;</p><p>另外，战争片和爱情片的数量都是4部，累计票房分别为6.48亿和6.17亿，可谓伯仲之间：前者由年初热卖逾4亿的《血战钢锯岭》打头阵，同由史蒂文·斯皮尔伯格执导的《战马》和《拯救大兵瑞恩》分列之后，排名最末的是拉塞尔·克劳主演的《怒海争锋》。爱情片则由《泰坦尼克号》和《爱乐之城》领衔，两片时隔近20年且同时斩获14项提名，浪漫经典永流传；另外两部则是带有歌舞元素的《悲惨世界》和《红磨坊》（后者引进时定名《梦断花都》）。随着《爱乐之城》持续热映，爱情片的排名还将继续上升。</p><p>&nbsp;</p><p>值得一提的是，提名“最佳影片”的动画片《飞屋环游记》和《玩具总动员3》均来自迪斯尼旗下的皮克斯工作室，而《指环王》三部曲则构成奇幻片的方阵，这两个类型的数量和票房都相对靠后。</p><p>&nbsp;</p><p>最后是引进5部但累计未过亿的动作片：由于《亡命天涯》、《卧虎藏龙》和《角斗士》的上映年份较早，彼时市场容量比较有限；而近年引进的《第九区》和《被解救的姜戈》也仅有1272万和1789万的收成，后者还爆出镜头删减问题而被迫“二次上映”，让痞导昆丁·塔伦蒂诺的内地首演不幸成为哑炮。</p><p>&nbsp;</p><p>中国资本迈入好莱坞，奥斯卡佳作陷“罗生门”</p><p>&nbsp;</p><p>说到中国资本与奥斯卡奖的关联，首先映入脑海的案例可能是“TCL中国剧院”：该剧院落成于1927年，曾在上世纪40年代作为奥斯卡奖的颁奖地点，同时也举办了多部好莱坞经典影片的首映式。在2013年，国内知名厂商TCL和中国剧院签订冠名协议，由此这座洛杉矶的地标建筑便在名称之外和中国产生了实质的连接。</p><p><br/></p><p><br/></p><p>TCL中国剧院的星光大道上已经留下了很多中国明星的手印</p><p><br/></p><p>近年随着内地市场在全球版图中的权重稳步上升，中国资本介入好莱坞的步伐由浅入深逐渐加码：前有万达收购AMC院线和传奇影业，随后阿里影业参投派拉蒙作品、复星入股Studio 8、万达牵手索尼影业等纷至沓来，显现中国影响力正从渠道端渗透到创作层面。</p><p>&nbsp;</p><p>而今年提名奥斯卡“最佳影片”的《爱乐之城》和《血战钢锯岭》背后均有中国资本的身影：2015年，电广传媒和狮门影业敲定3年15亿美元的合作事宜，而《爱乐之城》正是由狮门旗下的顶峰娱乐出品；《血战钢锯岭》的中国地区发行公司熙颐影业和联合出品方麒麟影业更是陷入了“中国版本署名权”的纠纷争议中，目前双方已经在中美两地影院都提起了法律诉讼，具体案情仍未明朗。</p><p>&nbsp;</p><p>可以期待，在未来的奥斯卡最佳影片中，中国元素将不仅仅停留在剧情的转捩点上（《地心引力》《火星救援》《降临》），而是深入到影视创作的更多面向中，让奥斯卡的多元传统与古老的东方文化交相辉映。</p><p><br/></p><p>原文来源 虎嗅网：https://www.huxiu.com/article/182474.html</p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2017/02/24/1487909338925964.jpg\";}', 1, 45, 1484989903, 1642608281),
(5, '如果你愿意，梁朝伟和我们来陪你', '', 7, '', 0, '<p><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://player.youku.com/player.php/sid/XMTgyMTkwNjA0OA==/v.swf\" width=\"420\" height=\"280\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p><p>由王家卫监制、张嘉佳执导的贺岁爱情喜剧《摆渡人》将于2016年12月23日全国上映。近日，影片发布“摆渡人前世今生”特辑，导演张嘉佳及梁朝伟、金城武、陈奕迅、Angelababy、张榕容、杜鹃、熊黛林等主演讲述自己心中的“摆渡人”，更谈及电影《摆渡人》拍摄的缘由。同时，影片发布海量剧照，二十大角色扮相同时曝光。</p><p><br/></p><p>视频来源 优酷网：http://v.youku.com/v_show/id_XMTgyMTkwNjA0OA==.html</p>', 'a:0:{}', 0, 25, 1485064767, 1642608270),
(6, '金吉拉猫，英文名为chinchilla，属于新品种的猫', '', 7, '', 0, '<p><video class=\"edui-upload-video  vjs-default-skin       video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/Public/Upload/Article/video/2017/02/24/1487910089973766.mp4\" data-setup=\"{}\"></video></p><p>金吉拉猫是经过多年精心繁育而成的一个特色猫种。事实上，公认的金吉拉猫的祖先已难以考证，因为它是由很多种猫种繁育出来的，但是该猫种的起源却被详细地记录了下来。所以“金吉拉”这个名字不知道是于Chinnie而来的还是为该品种与名叫Chinchilla的南美栗鼠（即俗称的龙猫）有某些相同之处而来。</p><p><img src=\"/Public/Upload/Article/image/2017/02/24/1487910526632699.jpg\" title=\"1487910526632699.jpg\" alt=\"333.jpg\"/></p><p>历史上最成功的一只是Decies女士的出生于1895年的Ch Fulmer Zaida的金吉拉猫。它于6岁到10岁(1901-1905)之间连续获得了17个猫展的总冠军!现在的最高记录保持者是 Crockmore女士的雪云，它在1948-1955年间一共获得了18个冠军、5个后备冠军和1个第三名。</p><p><br/></p><p>金吉拉是最早纯人工育种，经过多年精心繁育而成的一个特色猫种。如今的金吉拉具有银色虎斑和烟色猫种的特点（尽管外表看来并不明显）。</p><p><br/></p><p>事实上，公认的金吉拉猫的祖先已难以考证，因为它是由很多种猫种繁育出来的。但是该猫种的起源却被详细地记录了下来。所有的线索都表明该猫种的繁育其实是由一只生于1882年的名叫Chinnie的母猫发展起来的。</p><p>所以“金吉拉”这个名字不知道是源于Chinnie而来的还是为该品种与名叫Chinchilla的南美栗鼠（即俗称的龙猫）有某些相同之处而来。</p><p><br/></p><p>经过繁育者们不懈的努力，金吉拉猫于1894年首次被作为一个独立的品种出现在英国水晶宫猫展上。</p><p><br/></p><p>原文来源 百度百科：http://baike.baidu.com/link?url=w6iQOS2ks0BWJvinCYkVRMgyiI16vMliqNY7Lip30jwfs1qJwkTQDBWlgU9oVbvJLURGeMAyg3isK4VJbEWVaOY7MsDeu17zKc2sADhWEeyg5UMKwJC6dalCQ2e0WwZX</p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2017/02/24/1487910526632699.jpg\";}', 1, 23, 1485073500, 1642608250),
(7, '微软执行副总裁沈向洋：对AlphaGo除了敬仰还是敬仰，但“脑科学+AI”最有意义', '', 7, '', 0, '<p><img src=\"/Public/Upload/Article/image/2017/02/24/1487910896781989.jpg\" title=\"1487910896781989.jpg\" alt=\"444.jpg\"/></p><p>在微软总部西雅图传闻中的34号楼，几家媒体已经开始在会议室落座等待。与其说是等待，不如说是翘首以盼。因为即将接受采访的这个人刚刚入选了美国工程院院士，工程界最高的荣誉之一。他就是微软全球执行副总裁沈向洋，微软核心管理层唯一的大陆华人，职位仅次于CEO ，也是美国科技行业职位最高的华人。</p><p><br/></p><p>除此之外，媒体更愿意让他能够分享一些对人工智能的思考与看法，去年（2016年）9月份微软新成立的“人工智能与研究事业部”由沈向洋全权负责。当然，还有一个八卦心（也可以说是好奇心）：对于陆奇离开微软，加入百度的看法，毕竟当时陆奇进入微软还是因为沈向洋的介绍。</p><p><br/></p><p>果然，沈向洋如期而到。据说，采访当天早上沈向洋才从外地匆匆忙忙赶回西雅图，但看到媒体的沈向洋完全没有倦容，很是兴奋的给大家介绍微软园区的情况。他总是能够知道媒体想要什么，不经意间透露一些料。</p><p><br/></p><p>“他更懂得识人”</p><p><br/></p><p>据说，在微软总部园区有一个停车场最靠近电梯，只有4个车位，其中有一个是萨提亚纳德拉的，还有一个就是沈向洋的，足以证明其在微软的位置。</p><p><br/></p><p>从1996年毕业于卡内基梅隆大学，然后进入微软研究院；再到2013年成为微软全球执行副总裁，职位仅次于CEO；再到2016年全面负责微软全球人工智能战略；2017年被选入美国工程院院士，沈向洋的每一步都成为了一个传奇。</p><p><br/></p><p>虽身居高位，但沈向洋从来没有架子。来自微软的员工透露，沈向洋非常随和，而且非常幽默，敢于自黑，在路上相遇总是喜欢主动和人打招呼。同时，在工作上沈向洋非常认真，在此次媒体采访之前，他还特意要了所有媒体的资料和介绍，做好了功课。</p><p><br/></p><p>在他负责微软人工智能与研究事业部之后不久，微软便在语音识别上取得了历史性突破。微软的对话语音识别技术在产业标准Switchboard语音识别基准测试中实现了出错率低至6.3%的突破，这意味着微软的语音识别系统的语音识别能力已经与人类专业高手持平。此前，更多是IBM在语音识别领域取得领先的地位。</p><p><br/></p><p>带领团队取得这一突破性进步的正是微软首席语音科学家黄学东，当问起为何微软能够取得这样的突破时，黄学东更愿意把功劳归为沈向洋。黄学东只提到了一句话“他更会识人”。</p><p><br/></p><p>微软员工透露，沈向洋用人举贤有不避亲，即使是空降到新团队也会把得力亲兵带过去一起干，同时也深入新团队了解情况，和一线码农一对一谈队伍，抓问题。</p><p><br/></p><p>对于陆奇离开微软，加入百度，沈向洋表示，“我只能祝福，非常感谢陆奇过去八年在微软做出的巨大贡献，我也非常相信陆奇在新的岗位上会再创辉煌。” 最初陆奇加入微软时，正是沈向洋向当时微软CEO鲍尔默进行的推荐。</p><p><br/></p><p>沈向洋当选为美国工程院院士正是因其“在计算机视觉和图形学的突出贡献，以及在业内的研发领导力。”</p><p><br/></p><p>AlphaGo让人敬仰，但未见商业化能力</p><p><br/></p><p>人工智能已经成为一个热词，每个公司CEO如果不谈那么一下人工智能都称不上是一个科技企业了。科技巨头纷纷投入人工智能当中，谷歌、IBM、微软以及英特尔等等。“人工智能实际上已经成为了一种文化。谷歌会说他们就是一家人工智能公司，就连Salesforce也会提到说要做人工智能，启动了一个叫’爱因斯坦’的项目。”沈向洋表示。</p><p><br/></p><p>谷歌因其AlphaGo大胜韩国世界围棋冠军李世石而被人所知；IBM的人工智能助手沃森被认为是其发展一百多年历史当中最具创新力第一次举措，也代表着人类进入人与机器相互融合阶段；微软则单独成立了人工智能与研究院……</p><p><br/></p><p>对于人工智能的发展，最让沈向洋兴奋的两点：一个是人工智能能力的增强；另外一个就是人机交互界面的彻底颠覆。</p><p><br/></p><p>“人工智能能力在不断增强，尤其在语音与计算机视觉方面。我认为，五年之内计算机视觉一定会超过人类；而十年之内，计算机视觉识别也一定会比人类更强。”沈向洋认为。</p><p><br/></p><p>正如上文提到的，微软语音识别技术出错率低已至6.3%，已经与人类专业高手持平。</p><p><br/></p><p>“最让我激动的还有就是所谓人机交互界面的彻底颠覆。”沈向洋表示，“无论人工智能到底怎么定义，这么多年以来，计算机科学的发展自始至终都在做一件事情——人机交互。包括手机、笔记本的发展都是如此。我们一直在研究如何与计算机同存共进。”</p><p><br/></p><p>沈向洋认为“用户图形界面”的概念正在被颠覆，语音用处越来越多，未来视频类技术也会随着跟上。而这也是微软一直在提的概念：对话式人工智能。比如其小娜、小冰。</p><p><br/></p><p>相比谷歌的AlphaGo在围棋方面大战人类，沈向洋更看重人工智能在商业领域的突破。</p><p><br/></p><p>“我对AlphaGo除了敬仰还是敬仰，真的非常了不起，的的确确打破了很多人对人工智能的想象。”沈向洋坦言，“但是AlphaGo虽然很了不起，我们却看不到它能真正应用到商业领域的地方。我个人认为，近三到五年，人工智能的突破还是在商业领域的应用。”</p><p><br/></p><p>具体来说是人工智能在传统商业领域，比如销售市场、客户支持、人力资源等领域的应用。</p><p><br/></p><p>沈向洋以市场销售为例。过去销售一件商品可能需要打很多拜访电话，有一个非常长的潜在客户名单。在面对这么多客户名字、公司的时候，需要判断在有限的时间里应该先联系谁，后联系谁。但是有了越来越多的数据可以参考和分析之后，可以利用人工智能技术让效率提升五倍、十倍。</p><p><br/></p><p>“脑科学+AI”将是最有意义的方向</p><p><br/></p><p>“AlphaGo已经证明了在围棋这个场景，机器比人厉害。但是未来，人工智能不需要证明它的计算能力和算法高于人，而是在无法理解的领域有所突破，也不光光是情感。”沈向洋表示。</p><p><br/></p><p>相比计算能力，沈向洋一直在强调人工智能的“情感”能力。他认为，虽然情感到底是什么至今都没有定论，但情感肯定不是计算，也不是计算出来的。之所以认为人类是智能的，就是因为人类有大脑。但对于大脑的神经科学的研究进展还非常缓慢，因此，沈向洋认为接下来“脑科学+AI”一定会成为科研角度最激动人心的方向。</p><p><br/></p><p>“如果我的学生说他想念博士的话，我会鼓励他们往这个方向去思考，这一定是接下来三十年最有意义的方向。”沈向洋提到。</p><p><br/></p><p>其实，微软的人工智能助理小冰已经带有“情感”的成分。这一“情感”成分来自大量的社交网站数据。小冰从诞生到现在已经有31个月，拥有4000万用户，在不断与其对话过程中，小冰也在不断深入学习，沈向洋认为小冰其实是数据驱动的方式在学习人类的情感。</p><p><br/></p><p>但是，当人工智能发展到拥有语言能力，语音能力，视觉能力以及理解能力的时候，人类是否会开始畏惧人工智能的发展呢？</p><p><br/></p><p>沈向洋直言：“我觉得畏惧也没有用。在任何一个技术浪潮到来的时候，我们都会非常谨慎。比如核能的例子，我们需要监管核能，因为一不小心就可能出大事。人工智能其实也产生过很多问题，包括伦理和偏见的问题。”</p><p><br/></p><p>因此，微软在公司内部成立了一个人工智能伦理委员会，不断学习和探讨这方面的问题。</p><p><br/></p><p>微软人工智能普及化</p><p><br/></p><p>在人工智能方面，微软一直强调“人工智能普及化”。这一概念是萨提亚在2016年Ignite大会上提出来的，并且描述了人工智能普及化的蓝图。</p><p><br/></p><p>微软这一概念更多的是针对开发者。微软上线了基于微软智能云的微软认知服务，在这个服务上微软开放了25个API，对于开发者来说可以介入语音、视觉、自然语言或者搜索等各种功能。据沈向洋透露，上线后很短时间内，微软已经累计了接近一百万个开发者。</p><p><br/></p><p>“我们相信，只有让这些开发者真正利用上最新的人工智能技术，才能通过他们让人工智能普及起来。”沈向洋表示。</p><p><br/></p><p>微软希望能够让更多人用到人工智能，享受到人工智能带来的技术、商业和用户体验上的提升。</p><p><br/></p><p>原文来源 虎嗅网：https://www.huxiu.com/article/182491.html</p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2017/02/24/1487910896781989.jpg\";}', 1, 25, 1487819252, 1642608231),
(8, '今天来揭秘主播的生活，我跟几位主播聊了聊她们当网红的感受', '', 7, '', 0, '<p><img src=\"/Public/Upload/Article/image/2017/02/24/1487911239364471.jpg\" alt=\"1487911239364471.jpg\"/></p><p>我跟6位主播聊了聊她们当网红的感受</p><p>前不久，有人说共享单车是人性的照妖镜，其实哪个领域不是呢？有人的地方就有江湖，江湖大了，就什么人都有。</p><p><br/></p><p>直播可以算是如今互联网最活跃的江湖了，超过300万的主播每天面对3亿多网民进行着各种各样的直播。</p><p><br/></p><p>这些主播里有明星、大V，也有学校中想出名的女生、夜场想赚钱的公关、工厂寂寞的女工、模特、COSER、礼仪、会打游戏会逗观众的资深玩家、有一技之长爱显摆的青年……他们有的凭借直播年入千万，有的却连饭都吃不起。</p><p><br/></p><p>今天，我找到了6位主播，他们都在直播间待了半年以上，如今已经可以把主播当成一个全职职业来谋生。在职业主播的眼里，直播界有哪些人性和现象呢，一起来听他们说说。</p><p><br/></p><p><img src=\"/Public/Upload/Article/image/2017/02/24/1487911239217867.jpg\" alt=\"1487911239217867.jpg\"/></p><p>注：文中所有主播昵称均为化名，图文无关</p><p>&nbsp;</p><p>慕容筱白——微博粉丝72万，直播半年，观看人数23000</p><p><br/></p><p>全中国长得好看的女的多了去了，真能当上网红的能有几个？网红也要讲究智商，你看见的傻白甜都是故意在卖蠢。</p><p><br/></p><p>做网红不要太聪明，太聪明你说出去的话总会有喷子想要反驳，而你卖卖蠢、犯犯傻，人们会觉得“这个姑娘真是可爱”，卖蠢、啥都不想，最容易把钱赚。</p><p><br/></p><p>要说当网红的“后遗症”，那就是以前到一个好看的景点都是拍风景，现在到一个好看的景点都想着先拍自己——哪个角度好看、怎么显得腿长、如何把摆拍拍出抓拍的效果……</p><p><br/></p><p>别以为有了美颜相机就能随时美若天仙，那些所谓的抓拍都是一次次快门累积出来的，废片/成片比上一百是常有的事，比姜文拍电影还费劲。</p><p><br/></p><p>虽然网友嘴上说着不喜欢网红脸，但身体很诚实，所以化妆遮瑕、收下巴是必须的。</p><p><br/></p><p>还有，装淑女真的很累，明明想说一句“妈卖批”但就是不能讲，只能说“今天去XXX看到了很多小萌物，好开心呀~”</p><p><br/></p><p><img src=\"/Public/Upload/Article/image/2017/02/24/1487911239850305.jpg\" alt=\"1487911239850305.jpg\"/></p><p>我是你刘姐——签约某公会，直播粉丝30万，观看人数15000</p><p>&nbsp;</p><p>其实直播套路大家都明白：公会从平台那里低价拿礼物开刷，带动观众刷礼物，观众的礼物平台、公会、主播分成。</p><p>&nbsp;</p><p>直播一年多我换过3个平台，大平台还不错，结算什么的比较及时，最怕那些小平台，两个月结算一次，明明结算比例公告和合同里写的很清楚，最后给钱的时候就能少出不少。</p><p>&nbsp;</p><p>直播的时候，为了吸引流量，鼓励我们露肉卖胸，等到算钱的时候跟我说我违规了，所以那几场直播的收入不能结算。违规了你不查封我直播间，让观众打赏着爽完了然后你不给钱？</p><p>&nbsp;</p><p>还有平台直接莫名其妙的“违规处理”，管你开没开播，不高兴就直接封号。这边你在家里睡觉呢，手机短信就告诉你封号了，之前的打赏也被扣除，至于什么时候违了什么规，你猜谁说了算？</p><p>&nbsp;</p><p>入行这么久，天天都能听见主播讨薪，一般公会欠薪的情况很少发生，大平台也几乎没有主播喊欠钱。所以珍爱直播，远离小平台。</p><p><br/></p><p>原文来源 虎嗅网：https://www.huxiu.com/article/182367.html</p>', 'a:3:{i:0;s:60:\"/Public/Upload/Article/image/2017/02/24/1487911239364471.jpg\";i:1;s:60:\"/Public/Upload/Article/image/2017/02/24/1487911239217867.jpg\";i:2;s:60:\"/Public/Upload/Article/image/2017/02/24/1487911239850305.jpg\";}', 3, 49, 1487819408, 1642607883),
(9, '自定义跳转到第三方站点的一篇文章，由于简单所以复杂', '#CC00CC', 7, 'http://gong.gg/', 0, '<p>自定义跳转到第三方站点的一篇文章，由于简单所以复杂是</p><p>自定义跳转到第三方站点的一篇文章，由于简单所以复杂s是是是是</p>', 'a:0:{}', 0, 39, 1487920130, 1642608206),
(10, '第一观察 | 回答世界之问，习近平四个比喻发人深省', '', 7, '', 1, '<center><img id=\"14489643\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642604499848260.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">五年前，1月17日，习近平主席在瑞士达沃斯出席世界经济论坛2017年年会，面对“世界怎么了、我们怎么办”的世界之问，纵论经济全球化走向，为迷茫困顿中的人们带来信心和力量。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">这一次，也是1月17日，习近平主席出席2022年世界经济论坛视频会议并发表演讲，面对“如何战胜疫情？如何建设疫后世界？”的又一世界之问，呼吁各方坚定信心、勇毅前行，为共创后疫情时代美好世界指明方向。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">从习近平主席演讲中提到的“大船”之喻、“大江”之喻、“蛋糕”之喻、“虎年”之喻中，我们感受着在“深刻而宏阔的时代之变”面前，中国领导人的历史和哲学思索，远见、自信与担当。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><strong><span style=\"color:#333399\">（一）“大船”之喻——“在全球性危机的惊涛骇浪里，各国不是乘坐在190多条小船上，而是乘坐在一条命运与共的大船上。小船经不起风浪，巨舰才能顶住惊涛骇浪”</span></strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“我们同在一条船上”——2018年11月，出席在太平洋探索者号邮轮上举行的亚太经合组织工商领导人峰会，习近平主席曾以“船”为喻，呼吁各方“同舟共济”，共同应对风险挑战。</p><center><img id=\"14489645\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642604499545933.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:#333399;font-family:楷体\">新华社记者 丁林 摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">今天，习近平主席再次用到“船”的比喻。这次，他谈到的是“小船”和“大船”的关系。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">经历了持续延宕的新冠肺炎疫情，人类比以往更加感受到何为“同舟共济”。在一个“黑天鹅”和“灰犀牛”频频造访的世界，在各种可以预见的狂风暴雨和难以想象的惊涛骇浪面前，“小船”只会风雨飘摇，“巨舰”才能破浪前行。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">然而，并不是所有人都有这样的历史自觉。在疫情等全球性挑战面前，相互掣肘、无端“甩锅”者有之，贻误战机、干扰大局者有之，煽动仇恨偏见、进行围堵打压甚至对抗者有之……凡此种种，都无助于战胜共同面临的危机。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“大船”之喻，正是人类命运共同体之喻。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">众人划桨开大船。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">于潮平海阔之时拉紧彼此，是瞭望者的历史远见；</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">于风狂雨骤之时把握方向，是领航者的历史担当。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><strong><span style=\"color:#333399\">（二）“大江”之喻——“经济全球化是时代潮流。大江奔腾向海，总会遇到逆流，但任何逆流都阻挡不了大江东去。动力助其前行，阻力促其强大”</span></strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“青山遮不住，毕竟东流去。”</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">中国古人在对自然界的观察中，体悟着世界运行的规律和人生的哲理。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">世界大势，浩浩汤汤。“在历史前进的逻辑中前进、在时代发展的潮流中发展”，前提是正确认识、科学把握历史规律。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">在世界经济复苏面临诸多制约因素和不确定性加剧的形势下，“大江”之喻，显示出习近平主席对经济全球化大势的深刻把握。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">五年前在达沃斯，习近平主席纵论经济全球化，曾以“大海”比喻世界经济——</p><center><img id=\"14489649\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642604499179084.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:#333399;font-family:楷体\">新华社记者 徐金泉 摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“世界经济的大海，你要还是不要，都在那儿，是回避不了的”“让世界经济的大海退回到一个一个孤立的小湖泊、小河流，是不可能的，也是不符合历史潮流的”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“大海”，展示着经济全球化的广度与深度；</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“大江”，彰显着经济全球化的韧性与势能。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">登高壮观天地间，大江茫茫去不还。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">纵然有逆流、险滩，但“动力助其前行，阻力促其强大”，经济全球化方向从未改变、也不会改变。关键是要朝着正确方向，坚持拆墙而不筑墙、开放而不隔绝、融合而不脱钩，让世界经济活力充分迸发出来。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">习近平主席郑重宣示——</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“不论国际形势发生什么变化，中国都将高举改革开放的旗帜”“欢迎各种资本在中国合法依规经营，为中国发展发挥积极作用”“进一步融入区域和世界经济，努力实现互利共赢”……</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">开放的中国，一直坚定地站在历史正确的一边。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><strong><span style=\"color:#333399\">（三）“蛋糕”之喻——“先把‘蛋糕’做大，然后通过合理的制度安排把‘蛋糕’分好，水涨船高、各得其所，让发展成果更多更公平惠及全体人民”</span></strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“共同富裕”正在成为国内外谈及中国经济和社会发展时的一个热词。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">在中国发展新的历史起点上，要推动人的全面发展、全体人民共同富裕取得更为明显的实质性进展，将采取何种方式？</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“蛋糕”之喻，形象地指明了中国实现共同富裕的路径，有助于国内外各界准确理解中国共同富裕内涵。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">五年前在达沃斯、日内瓦，习近平主席论及世界经济，也用了“蛋糕”的比喻——</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“当世界经济处于下行期的时候，全球经济‘蛋糕’不容易做大，甚至变小了”“既要做大蛋糕，更要分好蛋糕，着力解决公平公正问题”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">彼时，针对经济全球化中出现的问题，以“蛋糕”之喻分析原因，指明的是均衡发展的路径；今天，围绕中国推进共同富裕，以“蛋糕”为喻，蕴涵的是高质量发展的深意。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">在习近平主席的宏阔视野中，中国与世界，人心相通，命运相连——</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">指向“人类命运共同体”的“大船”之喻，指向人类前进正确方向的“大江”之喻，指向“以人民为中心”的“蛋糕”之喻，最终都是一个主题：人的全面发展。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">要实现人的全面发展，就要走高质量发展之路——</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">谈及各方关心的中国经济走势，习近平主席在演讲中表示，“我们对中国经济发展前途充满信心”。在国内外经济环境变化带来巨大压力的形势下，对中国经济的信心，归根结底是对中国走高质量发展之路的信心。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">要实现人的全面发展，就要促进人与自然和谐共生——</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“发展经济不能对资源和生态环境竭泽而渔，生态环境保护也不是舍弃经济发展而缘木求鱼”。这是充满中国传统文化智慧的辩证法。加强污染防治、推动系统治理、实现碳达峰碳中和……推进生态文明建设的行动，归根结底是为了更好地建设人类文明。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">要实现人的全面发展，就不能让一个人、一个国家掉队——</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">世界仍不太平，许多人还生活在贫困饥饿之中，疫情更使其雪上加霜。习近平主席在演讲中再提全球发展倡议，指出“不论遇到什么困难，我们都要坚持以人民为中心的发展思想”，展现出马克思主义政治家深厚的人民情怀和人类情怀。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><strong><span style=\"color:#333399\">（四）“虎年”之喻——“面对当前人类面临的严峻挑战，我们要如虎添翼、虎虎生威，勇敢战胜前进道路上各种险阻，全力扫除新冠肺炎疫情阴霾，全力促进经济社会恢复发展，让希望的阳光照亮人类”</span></strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">今天的人类，正在经历前所未有的时代之变；今天的世界，进入了新的动荡变革期。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">变局、乱局面前，勇气和力量至关重要。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">再过两周，中国农历虎年新春就要到来。在中国文化中，虎象征着勇敢和力量。习近平主席以“虎”为喻，把中国传统文化和世界形势变化结合起来，为全人类克服种种艰难险阻提供了宝贵的中华文明滋养。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“世界总是在矛盾运动中发展的，没有矛盾就没有世界。纵观历史，人类正是在战胜一次次考验中成长、在克服一场场危机中发展。”历史发展有其规律，但人在其中不是完全消极被动的。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“虎年”之喻，体现出新时代中国共产党人在深刻把握历史大势和历史规律的同时，所具有的勇于战胜一切艰难险阻、推动人类文明进步的历史主动精神。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">五年前，在达沃斯，习近平主席说：“遇到了困难，不要埋怨自己，不要指责他人，不要放弃信心，不要逃避责任，而是要一起来战胜困难。历史是勇敢者创造的。”</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">今天，出席“云上”会议，习近平主席以“生龙活虎”“龙腾虎跃”“如虎添翼”“虎虎生威”，鼓舞和激励全世界坚定信心、勇毅前行。巨变中的世界，如今人类最需要的就是这份信心。</p><p><span style=\"margin-right: 15px; color: rgb(136, 136, 136); font-family: \">来源：新华网</span><span style=\"margin-right: 15px; color: rgb(136, 136, 136); font-family: \"><img src=\"/Public/Upload/Article/image/2022/01/19/1642592484576426.jpg\" alt=\"1642592484576426.jpg\" width=\"0\" height=\"0\" title=\"1642592484576426.jpg\"/></span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/19/1642592484576426.jpg\";}', 1, 33, 1642564121, 1642604858);
INSERT INTO `sc_article` (`id`, `title`, `title_color`, `article_class_id`, `jump_url`, `is_enable`, `content`, `image`, `image_count`, `access_count`, `add_time`, `upd_time`) VALUES
(11, '让希望的阳光照亮全人类——习近平主席在2022年世界经济论坛视频会议的演讲解读', '', 7, '', 1, '<center><img id=\"14490512\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605072590308.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><strong>让希望的阳光照亮全人类——习近平主席在2022年世界经济论坛视频会议的演讲解读</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">新华社记者伍岳、成欣、朱超</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“面对当前人类面临的严峻挑战，我们要如虎添翼、虎虎生威，勇敢战胜前进道路上各种险阻，全力扫除新冠肺炎疫情阴霾，全力促进经济社会恢复发展，让希望的阳光照亮人类！”</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">1月17日，国家主席习近平出席2022年世界经济论坛视频会议并发表重要演讲，这是习近平主席今年出席的第一场重要多边外交活动。近半小时的演讲中，习近平主席把握历史大势，破解时代之问，提出了团结战胜疫情的正确方向、推动世界经济稳定复苏的治本之策、弥合发展鸿沟的现实路径、国家之间正确的相处之道，为国际社会注入强大信心，带来强劲力量。</p><center><img id=\"14490516\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605072998177.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">1月17日，国家主席习近平在北京出席2022年世界经济论坛视频会议并发表题为《坚定信心　勇毅前行　共创后疫情时代美好世界》的演讲。新华社记者 黄敬文 摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><strong>“小船经不起风浪，巨舰才能顶住惊涛骇浪”</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><br/></p><center><p><video class=\"cm-video\" controls=\"\" preload=\"none\" width=\"100%\" height=\"auto\" src=\"https://vodpub1.v.news.cn/original/20220118/2c84c0fcb4974f8eb2b18ac12bbc8dd0.mp4\" style=\"background-color: rgb(51, 51, 51);\"></video></p></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><br/></p><p><span style=\"color:navy\"></span></p><center><img id=\"14490517\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605072324177.jpg\"/></center><p style=\"line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em;\"><span style=\"color:navy\">人们在位于上海的第四届进博会上参观（2021年11月5日摄）。新华社记者 李响 摄</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: \"></span></p><p><br/></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“当今世界正在经历百年未有之大变局。这场变局不限于一时一事、一国一域，而是深刻而宏阔的时代之变”“各国不是乘坐在190多条小船上，而是乘坐在一条命运与共的大船上”……</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">演讲中，习近平主席掷地有声的话语，呼应着本次会议“世界形势”这一主题，生动阐释了人类命运共同体理念。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">新冠肺炎疫情暴发至今已有两年之久，目前疫情仍在延宕反复，矛盾与挑战更为凸显。如何战胜疫情？如何建设疫后世界？这是各国人民共同关心的重大问题，也是大家必须回答的紧迫课题。</p><center><img id=\"14490521\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605073691347.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">2022年1月1日拍摄的上海陆家嘴朝霞（无人机照片）。新华社发（杨帆 摄）</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">面对时代之问，习近平主席给出中国方案——</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">携手合作，聚力战胜疫情；化解各类风险，促进世界经济稳定复苏；跨越发展鸿沟，重振全球发展事业；摒弃冷战思维，实现和平共处、互利共赢。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“在百年变局与世纪疫情相互交织叠加的时代背景下，习近平主席的四点主张既立足现实，又着眼未来，从短期、中期和长期三个维度给出了务实而富有远见的回答。”中国社科院世界经济与政治研究所研究员徐秀军说。</p><center><img id=\"14490522\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605073428820.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">2021年10月14日，工作人员在柬埔寨金边国际机场运输中国政府援助柬埔寨的科兴新冠疫苗。新华社发（批隆摄）</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">徐秀军说，习近平主席站在全人类共同利益的高度思考当今世界挑战和未来世界走向，聚焦各国人民共同关心的重大问题，为世界走出困难、战胜挑战指明方向。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">坚定信心、同舟共济，是战胜疫情的唯一正确道路——习近平主席指出，中国已向120多个国家和国际组织提供超过20亿剂疫苗，将再向非洲国家提供10亿剂疫苗，其中6亿剂为无偿援助，还将无偿向东盟国家提供1.5亿剂疫苗。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">经济全球化是时代潮流——习近平主席强调，世界各国要坚持真正的多边主义，坚持拆墙而不筑墙、开放而不隔绝、融合而不脱钩，推动构建开放型世界经济。“任何逆流都阻挡不了大江东去”“动力助其前行，阻力促其强大”。</p><p><span style=\"color:navy\"></span></p><center><img id=\"14490523\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605073158954.jpg\"/></center><p style=\"line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em;\"><span style=\"color:navy\">2021年9月4日，在位于北京的国家会议中心中国服务贸易发展成就展上，观众参观中国轨道交通出口装备模型。新华社记者 陈钟昊 摄</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: \"></span></p><p><br/></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">发展是各国面临的共同课题——习近平主席承诺，中国愿同各方携手合作，共同推进全球发展倡议落地，努力不让任何一个国家掉队。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">和平发展、合作共赢才是人间正道——习近平主席强调，要坚持对话而不对抗、包容而不排他，反对一切形式的单边主义、保护主义，反对一切形式的霸权主义和强权政治。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“言必信，行必果。”中国国际问题研究院常务副院长阮宗泽说，中国推动国际抗疫合作，推动构建开放型世界经济，推动全球共同发展，推动和平共处、互利共赢，在人类面临危机的时刻，展现出负责任大国的责任与担当。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><strong>“我们对中国经济发展前途充满信心”</strong></p><center><img id=\"14490524\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605074966539.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">这是2021年8月20日在白俄罗斯首都明斯克郊区拍摄的中白工业园。在两国政府的大力支持下，中白工业园经过几年的大力开发建设，正逐步发展成一个基础设施完善、具备全面招商引资条件的现代化园区。新华社发（中白工业园供图）</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“坚定不移推动高质量发展”“坚定不移推进改革开放”“坚定不移推进生态文明建设”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">演讲中，习近平主席向世界介绍了中国发展的历史性成就和当前发展的良好势头，用三个“坚定不移”明确宣示中国未来发展走向，彰显中国同世界共享机遇、共创未来的坚定决心。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">专家表示，习近平主席的权威阐述向世界展现了中国发展的光明前景，进一步增进外界对中国未来的理解和信心。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">一个基本判断——“中国经济韧性强、潜力足、长期向好的基本面没有改变”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">就在2022年世界经济论坛视频会议召开的同一天，中国国家统计局宣布：2021年，中国经济总量达1143670亿元，同比增长8.1%！</p><center><img id=\"14490525\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605075108412.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">江苏连云港港集装箱码头一派繁忙（2021年12月1日摄，无人机照片）。国家统计局1月17日发布数据，2021年，中国国内生产总值（GDP）为1143670亿元，按不变价格计算，比上年增长8.1%。新华社发（司伟摄）</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“疫情背景下，国际社会对中国经济的关注不断提升，各方期待中国在推动世界经济复苏方面发挥更加重要的作用。”北京大学国际关系学院教授查道炯表示，面对错综复杂的国内外环境，2021年中国经济持续稳健恢复、稳中向好，实现了“十四五”良好开局，彰显了强大的韧性与活力。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">一个重要宣示——“不论国际形势发生什么变化，中国都将高举改革开放的旗帜”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">在保护主义抬头的国际背景下，习近平主席明确表示，中国“将建设统一开放、竞争有序的市场体系，确保所有企业在法律面前地位平等、在市场面前机会平等”“欢迎各种资本在中国合法依规经营”“区域全面经济伙伴关系协定已于今年1月1日正式生效，中国将忠实履行义务，深化同协定各方经贸联系”……</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">中国国际问题研究院副研究员苏晓晖表示，习近平主席的演讲展现了中国愿与各国分享发展机遇的诚意和推动经济全球化健康发展的坚定决心。“在当前单边主义、保护主义抬头情况下，中国以实际行动维护多边主义和自由贸易，展现了开放自信、重信守诺的大国形象。”</p><center><img id=\"14490526\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605078960124.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">在位于江苏省苏州市吴江区盛泽镇的一家智能车间，机器人在车间内自动作业（2021年5月14日摄）。国家统计局1月17日发布数据，2021年，中国国内生产总值（GDP）为1143670亿元，按不变价格计算，比上年增长8.1%。新华社记者 李博 摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">一个庄严承诺——“积极开展应对气候变化国际合作，共同推进经济社会发展全面绿色转型”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">演讲中，习近平主席阐释了中国坚定不移推进生态文明建设的理念，强调实现碳达峰碳中和是中国高质量发展的内在要求，中国将践信守诺、坚定推进，中国还将积极开展应对气候变化的国际合作。</p><center><img id=\"14490527\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605079460503.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">2021年12月3日，“澜沧号”动车组列车驶离老挝万象站。当日，中国昆明站内的复兴号“绿巨人”、老挝万象站内的“澜沧号”动车组列车缓缓开动，开启一段跨越山河、相互奔赴的旅程。这标志着连接昆明和万象、采用中国标准的中老铁路全线开通运营。新华社发（凯乔摄）</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">已发布《2030年前碳达峰行动方案》，已建成全球规模最大的碳市场和清洁发电体系，可再生能源装机容量超10亿千瓦，1亿千瓦大型风电光伏基地已有序开工建设……</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">查道炯表示，中国说到做到，坚定不移推进生态文明建设，这一点具有高度的前瞻性，既是对世界负责，也是对子孙后代负责。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><strong>“在历史前进的逻辑中前进、在时代发展的潮流中发展”</strong></p><center><img id=\"14490528\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605080573455.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">2022年1月1日，海关工作人员（右）发放海南首份RCEP原产地证书。新华社记者 郭程 摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“人类正是在战胜一次次考验中成长、在克服一场场危机中发展”“要善于从历史长周期比较分析中进行思考，又要善于从细微处洞察事物的变化”“在危机中育新机、于变局中开新局”……演讲中，习近平主席从历史和哲学的高度分享了一个东方大国对危与机的辩证理解。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“放眼人类发展史，疫情大流行这样的困难和挑战并非前所未有，人类最终总是能够战胜困难浴火重生，取得更大的发展。”阮宗泽说，“习近平主席以大历史观分析当前危机，为国际社会战胜疫情、世界经济稳定复苏带来了希望、增添了信心、注入了动力，这一点至关重要。”</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">此次演讲，是继2017年和2021年之后，习近平主席再次站上素有“世界经济风向标”之称的达沃斯世界经济论坛讲台。专家表示，习近平主席的每一次重要讲话都能为世界拨开迷雾、指引方向，回应国际社会对和平发展、合作共赢的强烈期盼。</p><center><img id=\"14490529\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605080809429.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">这是2021年7月1日拍摄的投产发电中的白鹤滩水电站。新华社记者 江文耀 摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">五年前，围绕“世界怎么了、我们怎么办”的时代之问，习近平主席阐明了中国如何看待和推进全球化的时代潮流。论坛主席施瓦布赞赏习近平主席的演讲“为我们带来了阳光”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">一年前，习近平主席阐述了中国主张维护和践行什么样的多边主义，为多重危机叠加的全球局势提出系统方案。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“习近平主席在演讲中深刻阐释如何开辟后疫情时代美好世界的人间正道，具有重要的历史意义。”阮宗泽说。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \">“三次重要讲话一脉相承、主题重大，具有很强的现实针对性，总是在关键时刻解答世界之问、时代之问，总能在危急关头给人以指引，予人以力量，为我们这个世界带来希望的阳光。”苏晓晖说。</p><center><img id=\"14490530\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605081265201.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"color:navy\">这是2021年5月27日在匈牙利考波什堡拍摄的100兆瓦光伏电站。当日，由中国通用技术集团所属中国机械进出口（集团）有限公司投资兴建的匈牙利考波什堡100兆瓦光伏电站项目在考波什堡市举行投运启动仪式。新华社发（弗尔季·奥蒂洛摄）</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: \"><span style=\"margin-right: 15px; color: rgb(136, 136, 136); font-family: \">来源：新华社</span><span style=\"color: rgb(136, 136, 136); font-family: \">&nbsp;</span><span style=\"margin-right: 15px; color: rgb(136, 136, 136); font-family: \">作者：伍岳、成欣、朱超<img src=\"/Public/Upload/Article/image/2022/01/19/1642605186754470.jpg\" title=\"1642605186754470.jpg\" alt=\"1642605186754470.jpg\" width=\"0\" height=\"0\"/></span></p><p><br/></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/19/1642605186754470.jpg\";}', 1, 18, 1642605100, 1642605218),
(12, '六中全会精神在军营丨东部战区总医院：暖心服务提升医疗保障水平', '', 7, '', 1, '<p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 18px;\"><strong style=\"box-sizing: border-box;\">东部战区总医院结合工作实际学习贯彻全会精神</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 18px;\"><strong style=\"box-sizing: border-box;\">暖心服务提升医疗保障水平</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">解放军报讯 梅笑、杨子江报道：新年伊始，东部战区总医院给体系部队官兵送上暖心服务：为训练任务繁重的一线官兵发放健康手册，为官兵及家属开通医疗救治绿色通道，为驻地偏远官兵挂专家号提供便利……这是该院结合工作实际，学习贯彻党的十九届六中全会精神的实际举措。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">“全会决议指出，全面推进健康中国建设，坚持预防为主的方针，深化医药卫生体制改革，引导医疗卫生工作重心下移、资源下沉。作为军队医院，必须始终坚持姓军为兵原则，全心全意为官兵搞好服务保障。”该院领导介绍，为推动全会精神学习走深走实，他们精心筹划、主动作为，引导医务人员将全会精神学习成果转化为服务官兵的具体行动，依托派驻门诊部开展暖心服务活动，紧扣基层一线保障需求，提升为兵服务质效。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">元旦过后，《军人及军队相关人员医疗待遇保障暂行规定》正式施行，该院以此为契机，组织医务人员为就诊官兵宣讲解读政策要点、办理流程、注意事项，同时升级医疗信息系统，对接地方医保机构，为罕见病、疑难病、危重病患者开辟绿色通道，让军人和军队相关人员真正享受到政策红利。该院门诊部主任翁志强介绍，医院在原有军人诊区基础上，在每个楼层设置了专用窗口和诊室，确保军人及军队相关人员依法优先、快捷就医。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">全会精神鼓士气，为兵服务显真情。连日来，该院医务人员积极参与为兵服务系列活动：专家医疗队送医送药到基层、建立军属优待区域协作机制、搭建心理关怀平台……一系列务实举措，受到官兵好评。</span></p><p><br/></p><center><img id=\"14490781\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605395382103.jpg\"/></center><center><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: \">&nbsp; &nbsp; &nbsp; &nbsp;来源：中国军网-解放军报作者：梅笑、杨子江责任编辑：杨凡凡</span></center><p><img src=\"/Public/Upload/Article/image/2022/01/19/1642605450286063.jpg\" title=\"1642605450286063.jpg\" alt=\"1642605450286063.jpg\" width=\"0\" height=\"0\"/></p><p><br/></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/19/1642605450286063.jpg\";}', 1, 5, 1642605472, 1642605934),
(13, '爱心送到边关！她坚持7年为守卫边疆的官兵邮寄物资', '', 7, '', 1, '<p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><strong style=\"box-sizing: border-box;\">“想让守卫边疆的官兵知道，远方的亲人都在牵挂他们”——</strong></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><strong style=\"font-size: 1rem; box-sizing: border-box;\">&nbsp; 寄往詹娘舍哨所的第二十八个包裹</strong></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">&nbsp; &nbsp;■王士刚 王春辉 田 雨</span></p><center><img id=\"14490755\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605566195526.jpg\"/></center><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp; 照片由王士刚摄</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">元旦过后，豫南气温骤降，寒风凛冽。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">“包裹尽快发走，不然哨所官兵过年前就收不到年货了。”“中，您放心！”1月8日一大早，在河南省漯河市源汇区建设路一家快递公司网点，一名身材娇小的女职工正向网点负责人叮嘱。说话间，一个硕大的纸箱已检验、打包完毕，准备寄往西藏詹娘舍哨所。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">她叫李丹，是源汇区马路街道办事处的一名普通职工，已经连续7年为詹娘舍哨所官兵邮寄包裹了。今天，是她寄出的第28个包裹。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">“快过年了，给哨所官兵寄些家乡土特产。”不善言辞的李丹一说起“边防”，瞬间打开了话匣子，“边防哨所条件艰苦，我只想尽自己的绵薄之力，表达对哨所官兵的崇敬之情。”</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">2015年的一天，李丹从新闻中看到詹娘舍哨所官兵在风雪中巡逻的艰难场景，深受震撼。随后，她多方了解电视镜头里的哨所和那群边防官兵。“詹娘舍”，藏语意为“鹰都飞不过去的地方”。这座挺立于海拔4600多米高山之巅的哨所，四周均为悬崖峭壁，一年中封山期超过半年，素有“雪山孤岛”“云中哨所”和“霹雳哨所”之称。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">“没想到祖国的边境线上竟有这样一个哨所，驻守的都是年轻小伙子，他们把最美的青春献给了雪域高原。”李丹深情地告诉笔者，“虽然地理空间上我们相隔千里，但是我想让守卫边疆的官兵知道，远方的亲人都在牵挂着他们。我决心为这些最可爱的人做点力所能及的事。”</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">从那一刻起，李丹与詹娘舍哨所结下了不解之缘。每年春节、八一建军节、国庆节等重要节日，她都匿名给哨所官兵邮寄一些承载着爱心的物资。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">海拔高，官兵容易患高原病，她就寄去一大箱保健药品，还配上医嘱；紫外线强，官兵皮肤易被灼伤，她便购买各种护肤品寄去；逢年过节，她挑选家乡特色食品，打包成箱寄往哨所……</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">爱心源源不断送到边关，哨所的官兵们也在寻找着这位素未谋面的大姐姐。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">2018年2月8日是农历小年，21时左右，李丹的微信上忽然有人申请添加好友。添加好友后，对方直接发起了视频通话邀请。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">“接通视频，我发现对方竟然是詹娘舍哨所官兵。”回忆当时情景，李丹难掩激动。寒暄几句后，一阵嘹亮的歌声透过手机传了过来：“参军前的那晚上，兴奋又紧张……”哨所官兵围坐在一起，为她演唱了歌曲《当兵前的那晚上》。随后，哨所官兵一一向她打招呼，并送上了新春的祝福。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">不知不觉间，为哨所官兵邮寄包裹的举动，李丹已坚持了7年。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">李丹的事迹被媒体报道后，源汇区人武部和她所在的街道党工委以她的名义成立了“李丹拥军服务队”。从此，一个“李丹”变成了更多的“李丹”。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">“我们要将这份爱心继续传递下去，聚力谱写新时代双拥工作新篇章。”源汇区人武部政委孔海峰告诉笔者。</span></p><center><img id=\"14490761\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642605566698165.jpg\"/></center><p><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: \">来源：中国军网-解放军报作者：王士刚 王春辉 田 雨责任编辑：杨凡凡<img src=\"/Public/Upload/Article/image/2022/01/19/1642605597843097.jpg\" alt=\"1642605597843097.jpg\" width=\"0\" height=\"0\" title=\"1642605597843097.jpg\"/></span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/19/1642605597843097.jpg\";}', 1, 7, 1642605610, 1642606266),
(14, '助力乡村振兴，武警江西总队为帮扶村扶持40余个特色产业', '', 7, '', 1, '<p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\"><strong style=\"box-sizing: border-box;\">武警江西总队为帮扶村扶持40余个特色产业——</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\"><strong style=\"box-sizing: border-box;\">“一村一品”行动助力乡村振兴</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">■解放军报特约通讯员 刘 强</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">元旦刚过，江西省赣州市赣县区大田乡大坳村的豆芽加工厂就开工了。村民们在生产线上忙碌着，为即将发往各地的产品进行最后的检查封装。一旁，驻村帮扶的武警江西总队官兵帮助村民全程直播。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“感谢武警官兵，帮我们找到了打开致富大门的钥匙。”大坳村党支部书记陈宗鸿说，2015年以来，该总队为村里援建了豆芽加工厂，吸纳15户贫困户就业，村民的日子越过越红火。截至2019年底，该总队帮扶的20个贫困村全部脱贫。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“脱贫摘帽不是最终目标，振兴乡村经济，让老区人民过上更好的日子，是我们的追求。”为进一步巩固拓展脱贫攻坚成果，该总队工作组充分挖掘大坳村丰富的野生油茶资源，邀请地方专家、企业多方论证，为村里建起茶油加工厂，打造特色产业。如今，加工厂已与国家油茶产品质量监督检验中心达成合作意向，成为该中心油茶科研基地，茶油产销之路更加畅通。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">根据不同村庄的位置、环境、人口、传统产业差异，该总队为每个帮扶村量身打造增收计划并争取形成特色产业，发挥集群优势。他们在南昌市安义县马源村，帮助村民引进百果园种植项目，带动村民持续增收；在赣州市定南县长富村，援建光伏发电产业，扩大村民经济来源；在安义县吊钟村，发展香菇种植产业，“以购代捐”签订定向采购协议……在“一村一品”行动的带动下，40余个特色产业成为老区人民稳定增收、振兴乡村的重要支撑。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“现在自来水通到了家家户户，日子越来越有奔头！”宜春市温汤镇田心村脱贫后，随着产业规模不断扩大，村里原有的蓄水设备难以满足生产生活用水需求。该总队经过现地考察，决定为村里援建蓄水池、增设加压泵，铺设长达万余米的输配水管道，建成了“池相连、管相通”的高效输水系统，解决了影响经济持续发展的难题。下一步，他们还计划扶持田心村开发“桃花园”特色旅游项目，发展金柚、金菊种植等特色产业。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“总队定点帮扶的20个乡村，脱贫前人均年收入只有2000余元，现在基本都达到了1万元。”该总队领导介绍，军地支部结对子、医疗服务进村、助力文化建设等一系列帮扶举措，为乡村振兴注入强劲动力，老区人民的致富路越走越宽。</span></p><center><img id=\"14490765\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642606112534468.jpg\"/></center><p><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; font-size: 14.08px; background-color: rgb(255, 255, 255);\">来源：中国军网-解放军报作者：刘 强责任编辑：尚晓敏&nbsp;&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/19/1642606151213086.gif\" title=\"1642606151213086.gif\" alt=\"1642606151213086.gif\" width=\"0\" height=\"0\"/></span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/19/1642606151213086.gif\";}', 1, 1, 1642606193, 1642606193),
(15, '陆军部分院校和部队依托军工集团跟研跟产培训文职人员见闻', '', 7, '', 1, '<p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; text-align: center;\"><span style=\"font-size: 16px;\"><strong style=\"box-sizing: border-box;\">从“请进来”到“走出去”</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; text-align: center;\"><span style=\"font-size: 16px;\"><strong style=\"box-sizing: border-box;\">——陆军部分院校和部队依托军工集团跟研跟产培训文职人员闻思录</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; text-align: center;\"><span style=\"font-size: 14px;\">■王永奎 解放军报记者 钱晓虎</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">隆冬时节，陆军装甲兵学院正进行一场某新型装甲装备战场抢修保障演练。伴着战车隆隆的轰鸣声，某系讲师、文职人员赵梓旭带领学员们穿越硝烟，成功排除一个个装备故障，受到导演组好评。走下演练场，赵梓旭深有感慨：“通过到军工集团跟研跟产培训，我不仅提升了能力素质，研战抓教也更有底气。”</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">针对陆军武器装备更新迭代快、新型力量装备保障人才缺乏等实际，前不久，陆军部分院校和部队依托军工集团，开办跟研跟产培训班。他们组织参训文职人员深入新型装备科研一线、生产一线，推动能力素质转型与装备更新迭代无缝对接，实现了装备保障需求端与人才保障供给端的结合。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">记者注意到，此次培训，参训文职人员从源头学习、从原理研究，不仅较好解决了保障维修技能短板等问题，还进一步拓宽了创新思维、发散思维，充分调动了干事创业的积极性和创造力。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">参加培训的陆军炮兵防空兵学院文职人员王孜深有感触地告诉记者：“此次培训将课堂‘搬’到生产一线，系统阐释新装备的内在原理和发展趋势，我更加明确了为战育人的主攻方向。”</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">王孜表示，如今能够把所学知识运用于工作实践，要特别感谢某厂工程师李娟。培训期间，李娟带着参训文职人员进入车间现场见学，大家受益匪浅。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“只有理论与实践并重，才能更好服务练兵备战。”参训文职人员不仅深层次了解了陆军主战装备建设的内涵和外延，而且通过对知识的重塑重构，赶上了新型装备发展的步子。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“如何规范跟研跟产培训的教学路子，我们也是‘摸着石头过河’。”陆军机关有关人员介绍，在培训实践中，他们突出研、产、训3个维度，打造精通装备全流程的科研创新、生产组装、维护保养等专业化人才。在培训方式上，他们主要采取启发式、研讨式、互动式、开放式等教学方法，开展理论辨析、实操观摩、车间跟训等教学配合活动，有效拓展了参训文职人员的思路思维；在培训内容上，他们立足现有先进装备，确保培训方向与装备发展方向一致、与部队岗位需求一致。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“要让大家全方位体验装备从研发到出厂的整个过程。”记者注意到，参训文职人员大多是思想素质过硬、专业技术扎实、发展潜力较大的专业骨干。他们深入武器装备研发生产一线，从研发、制造、装配、试验全流程，以及设计理论、工作原理、软件系统、机械构造、操作使用、维护保养全要素学起训起，能较好掌握装备研发生产知识链路，实现知识结构在本专业本岗位的覆盖，对装备内在机理的认知更加全面深入。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">对于这种系统深入的培训模式，清华大学博士毕业的文职人员尚世锋感到非常解渴：“读博期间尽管参与了很多装备项目，但我对部队装备研发生产全套流程缺乏深层次认识，实践中很难把教学科研做得精准透彻。此次培训中的所见、所闻、所学，为我扫除了知识盲点，现在我工作起来更加得心应手。”</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">把培训课堂“搬”到武器装备研发生产一线，把文职人员“推”到武器装备研发生产源头，无疑是走开军地共育人才路子、推开全方位培养文职人员队伍的创新实践。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">陆军某部领导感到，跟研跟产培训班的开办，实现了陆军装备保障体系由“厂家派人走进来”的被动模式，向“军队派人走出去”自主保障模式的转变，还帮助参训文职人员提升了综合科研保障能力，强化了前沿思维、创新思维、逆向思维。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“军工集团倡导的创新思维和学习理念，不断刷新着我对创新装备保障的再认知、再理解。”陆军某训练基地文职人员于宗祥说，参加跟研跟产培训过程中，他既拓宽了专业视野，又切身感受到了国家战略科技力量的加快壮大，从而更加坚定了投身强军兴军实践的信念。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">培训结束不是终点，而是另一个全新起点。“参加首批跟研跟产培训的文职人员，是一批‘酵母型’‘种子型’人才。”记者在跟踪采访中了解到，参训文职人员返回岗位后，把从“点”上学来的经验变成所在单位“面”上的做法，有效发挥了“以点带线、以点带面”的辐射作用。“我对装备体系有了更加系统全面的认识，头脑中时刻装着一张工作原理结构图，干工作、带队伍时感觉思路清晰，完成任务的信心更足了。”陆军某部文职人员孙波说。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\"><strong style=\"box-sizing: border-box;\">短 评</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\"><strong style=\"box-sizing: border-box;\">对接战场：近些，再近些</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">■赛宗宝</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">强军之道，要在得人。未来战场的竞争，说到底也是人才的竞争。文职人员是强军兴军的一支重要新锐力量，如何聚焦练兵备战提升他们的专业能力，努力实现精准化培养和科学化使用，事关军事人才培养的质效，事关战斗力的提高。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">习主席在中央军委人才工作会议上强调，坚持军队培养为主、多种方式相结合，形成具有我军特色的人才培养和使用模式，提高备战打仗人才供给能力和水平。这为我们创新人才培养思路提供了基本遵循。培育高质量军队人才，要在充分发挥好军队院校培养主渠道基础上，大胆打破自我封闭、自我循环，促进人才需求侧和供给侧精准对接，努力让培训工作离战场近些，再近些。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">客观而言，随着国防和军队现代化建设稳步推进，装备科技含量愈来愈高、更新迭代频率越来越快。陆军部分院校和部队着眼人员能力素质提升与装备建设同步发展，优化文职人员培养模式，把培训课堂“搬”到武器装备研发生产一线，把文职人员“推”到武器装备研发生产源头，探索全方位多维度的文职人才培养格局，能为加快建设新型陆军、加紧备战打仗提供有力人才支撑。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">从主观方面说，广大文职人员满怀报国热情，积极投身军营广阔天地，渴望立足本职岗位建功立业。如果说水兵喜欢仗剑大洋，骑兵喜欢驰骋草原，那么对于“孔雀蓝”而言，他们向往的事业舞台，就包括装备科研生产一线。对接未来战场需求、强化一线加钢淬火，能够为他们逐梦军旅插上腾飞的翅膀，有利于尽快缩短他们的成才周期，进一步提高院校和部队人才培养效益，最终实现人员和武器的最佳结合，提升他们对战斗力的贡献率。这样的探索和创新，我们乐于见到。</span></p><center><img id=\"14490822\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642606330634569.jpg\"/></center><p><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; font-size: 14.08px; background-color: rgb(255, 255, 255);\">来源：中国军网-解放军报作者：王永奎&nbsp; 钱晓虎责任编辑：尚晓敏&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/19/1642606398745823.gif\" title=\"1642606398745823.gif\" alt=\"1642606398745823.gif\" width=\"0\" height=\"0\"/></span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/19/1642606398745823.gif\";}', 1, 12, 1642606411, 1642606411),
(16, '德黑兰大学学者：加强多边主义 北京冬奥会是“典范”', '', 10, '', 1, '<p><span style=\"color:navy\"><center><span style=\"font-family:楷体\"><img id=\"14491864\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/19/1642607148231702.jpg\"/></span></center><p style=\"line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-align: center;\"><span style=\"font-family:楷体\">德黑兰大学中文系教授，亚洲研究中心主任好麦特</span></p></span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">中国日报网1月19日电 1月18日下午，以“一起向未来”为主题的中国同上合组织及欧亚国家青年精英交流对话会在北京举行。德黑兰大学中文系教授，亚洲研究中心主任好麦特指出，当今的世界不是一个平凡的世界，各种各样的危机让大部分国家都考虑以“共同”的方式去面临这些情况，并在一个多边框架内解决各自的问题。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">好麦特称，全球人民如今比任何时候都清楚，一个国家的发展会如何影响到他们国家的经济情况。当今的世界比任何时间都像一艘船，各国要共同驾驶这艘大船驶向更加美好的彼岸。不幸的是，在我们需要加强全球协调与合作，携手应对各种全球性挑战，并共同推进人类进步事业的环境下，一些国家还是通过一些单边性的做法，向地球村的其他家庭施压，造成民众生活困难。当今的世界比任何时候都需要对话、互动以及包容。为实现这些需求，无疑是要有一个替代选项。中国提出的“多边主义”或“世界命运共同体”等倡议，都植根于东方哲学。现在，东方文明古国有责任为受单边主义缠绕的世界提供一些包容性、和谐性以及团结性的新倡议。这方面无疑的是需要东方文明古国之间积极磋商与交流，我把它叫“东东对话”。在这个框架内，“东东对话”是“东西对话”以及解决一些全球性问题的最好方案。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">好麦特表示，众多国家支持北京冬奥会，联合国的大部分会员国反对一些国家压迫性制裁行径等，这都表明全世界都厌倦了几个国家的单边主义以及对他人的限制性行为。现在，必须明确地说“制裁时代”已经过去了，“互尊互敬的时代”到来了。真正的多边主义倡导相互尊重、平等协商、加强合作，各国应该在这个基础上建立新的国际关系框架。实现这么一全灿烂未来的典范例子就是冬奥会。在冬奥会期间，冬奥村将成为各国运动员的“家”，在这个环境里，世界各国人民的奥运激情和梦想被点燃，全球代表一起向上，一起努力，一起交流。</p><p><span style=\"color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">来源：中国日报网</span>&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/19/1642607182228012.jpg\" title=\"1642607182228012.jpg\" alt=\"1642607182228012.jpg\" width=\"0\" height=\"0\"/></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/19/1642607182228012.jpg\";}', 1, 11, 1642607210, 1642607210);
INSERT INTO `sc_article` (`id`, `title`, `title_color`, `article_class_id`, `jump_url`, `is_enable`, `content`, `image`, `image_count`, `access_count`, `add_time`, `upd_time`) VALUES
(17, '全景新闻丨“飞临”探秘冬奥场馆：“冰丝带”上最快的冰', '', 10, '', 1, '<p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">中国经济网北京1月18日（中国经济网记者 董家朋）国家速滑馆位于北京市朝阳区近奥林匹克公园林萃路2号，是2022年北京冬奥会和冬残奥会中唯一新建的冰上竞赛场馆，国家速滑馆与国家体育场、国家游泳中心共同组成北京“双奥之城”的标志性建筑。国家速滑馆场馆设计高度33米，主场馆建筑面积约8万平方米，能容纳约1.2万名观众，是速度滑冰项目的比赛地，届时将有14块金牌在这里诞生。</p><center><img id=\"14491819\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642653575465424.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center;\"><span style=\"color:navy;font-family:楷体\">国家速滑馆西侧 中国经济网 席田亮/摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">国家速滑馆的22条“丝带”状曲面玻璃幕墙的外观设计让国家速滑馆获得了“冰丝带”之称。这一设计理念是取自冰与速度相结合的创意——这些“丝带”状曲面玻璃幕墙就像运动员滑过的痕迹，象征速度和激情。22条“冰丝带”又象征着北京2022年冬奥会。场馆建有单层双向正交马鞍形索网屋面，这个屋面是目前世界上的体育馆场馆中，规模最大的单层双向正交马鞍形索网屋面，长跨约200米，短跨约130米，实现了国产高钒封闭索在国内大型场馆中的首次大规模应用。场馆建有高工艺曲面幕墙系统，由3360块曲面玻璃单元拼装而成，22条丝带本身也是幕墙钢结构的重要部分，能起到遮阳、节能的作用。3360块玻璃拼接出外观自由流畅的椭圆形曲面，经过建筑师的几何逻辑优化，不论是向内的曲面还是向外的曲面，都采用了同一个曲率半径，曲面玻璃板块不超过50%。</p><center><img id=\"14491828\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642653576205034.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center;\"><span style=\"color:navy;font-family:楷体\">国家速滑馆玻璃幕墙 中国经济网 席田亮/摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">为了打造“最快的冰”，国家速滑馆采用二氧化碳跨临界直冷制冰技术，可以制作出1.2万平方米的亚洲最大全冰面，冰面温度为零下6℃至10.5℃，冰面厚度为2.5厘米。与传统制冰方式相比，二氧化碳直冷制冰系统具备优良的制冷性能，自带环保属性。二氧化碳直接被传送到场地制冷盘管中进行热交换，传热性能好，整个制冰系统换热效率更高。而且，二氧化碳制冷可以保证冰面温度恒定，冰面质量更优，不会出现各个部位温度不一样的情况。</p><center><img id=\"14491830\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642653576845098.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center;\"><span style=\"color:navy;font-family:楷体\">国家速滑馆赛场 中国经济网 席田亮/摄</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">速度滑冰是滑冰运动中历史最为悠久，开展最为广泛的项目。1763年2月4日，首次15公里速度滑冰赛在英国举行。1889年，首次速度滑冰世界冠军赛在荷兰阿姆斯特丹举行。男子速滑与女子速滑分别于1924年、1960年被列为冬奥会比赛项目。本届冬奥会上，速度滑冰项目分为男子项目与女子项目，包含了500米、1000米、1500米、5000米、10000米、团队追逐和集体出发等子项，共计14项。</p><p><span style=\"margin-right: 15px; color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">来源：中国经济网</span><span style=\"color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">&nbsp;</span><span style=\"margin-right: 15px; color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">作者：董家朋&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/20/1642653649598482.jpg\" title=\"1642653649598482.jpg\" alt=\"1642653649598482.jpg\" width=\"0\" height=\"0\"/></span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642653649598482.jpg\";}', 1, 8, 1642653667, 1642653667),
(18, '国际锐评｜达沃斯的中国声音解答了世界的时代之问', '', 16, '', 1, '<p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">“习主席的演讲对推动国际合作具有里程碑意义。他向我们展示了中国与世界在未来几年如何走向更加美好的未来。”这是世界经济论坛（又称“达沃斯论坛”）创始人兼执行主席克劳斯·施瓦布的评价。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">17日，中国国家主席习近平在北京出席2022年世界经济论坛视频会议并发表演讲。在新年首场多边外交活动中，习主席从历史大势出发，就应对当前全球突出挑战提出四点倡议、宣布三项行动，向世界清晰展示了中国推动全球合作的决心与努力。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><br/></p><center><img id=\"14490130\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642653899808393.png\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><br/></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">这是习主席第三次在达沃斯论坛上发出中国声音。此前，习主席分别于2017年和2021年，就正确看待经济全球化、坚持真正的多边主义重点阐述了中国主张和中国方案，一系列精彩论述至今令人记忆犹新。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">当前，时代之变和世纪疫情相互叠加，世界进入新的动荡变革期。如何战胜疫情？如何建设疫后世界？全球都在思考探寻。在本次论坛上，习主席分享了中国人从历史中获得的宝贵启示，呼吁“要在历史前进的逻辑中前进、在时代发展的潮流中发展”，展现出一位大国领导人的长远眼光与历史担当。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">“携手合作，聚力战胜疫情”“化解各类风险，促进世界经济稳定复苏”“跨越发展鸿沟，重振全球发展事业”“摒弃冷战思维，实现和平共处、互利共赢”——习主席此次提出的四点倡议，既来自历史经验的总结，又有很强的现实针对性，为国际社会摆脱当下困境指明了方向。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">以抗疫为例，各国现在仍饱受疫情反复与病毒变异的困扰。习近平指出，坚定信心、同舟共济，是战胜疫情的唯一正确道路；世界各国要加强国际抗疫合作，加快建设人类卫生健康共同体，确保疫苗公平分配，弥合国际“免疫鸿沟”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">中国有态度，也有行动。与某些西方国家奉行疫苗民族主义不同，中国已向120多个国家和国际组织提供超过20亿剂疫苗，并宣布再向非洲和东盟国家提供数亿剂疫苗援助。菲律宾金砖国家政策研究会创始人赫尔曼·劳雷尔指出，中国率先宣布将新冠疫苗作为全球公共产品，帮助这些国家共同应对疫情挑战，表明中国正致力于推动构建人类命运共同体、推动创造更美好未来。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><br/></p><center><img id=\"14490132\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642653914887864.png\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><br/></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">过去一年，世界经济在艰难中复苏，但前景仍面临很大不确定性。世界银行日前将2022年全球经济增长率下调至4.1%。在此次演讲中，习主席再次强调要坚持经济全球化方向、坚持真正的多边主义，呼吁各方推动全球治理体系变革、加强宏观政策协调，表示愿同各方共同推进全球发展倡议落地、努力不让任何一个国家掉队……在沙特阿拉伯智库科研与知识交流中心研究员阿卜杜拉·瓦迪伊看来，习主席提出坚持真正的多边主义、推动构建开放型世界经济，代表了世界发展的方向和趋势。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">针对一些势力在世界挑动对立和对抗，习近平强调，搞保护主义、单边主义，谁也保护不了，最终只会损人害己；不同国家、不同文明要在彼此尊重中共同发展、在求同存异中合作共赢。英国48家集团俱乐部主席斯蒂芬·佩里说，习主席阐述了中国反对霸权霸凌、倡导合作共赢的立场，赢得各方赞同。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">外界注意到，就在习主席演讲当天，中国经济2021年“成绩单”公布——经济总量达114.4万亿元，对世界经济增长贡献率预计达到25%左右。坚定不移推动高质量发展、坚定不移推进改革开放、坚定不移推进生态文明建设——习主席在演讲中的这一宣示，将使中国持续引领世界经济增长、成为世界发展的“稳定之锚”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">“各国不是乘坐在190多条小船上，而是乘坐在一条命运与共的大船上。”面对“世界怎么了，我们怎么办”的时代之问，中国声音过去5年三度在达沃斯论坛上引发共鸣，凝聚起战胜困难和挑战的强大力量。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">再过十来天，中国将迎来农历虎年。站在新的起点，中国力量将助力世界虎虎生威，勇敢战胜前进道路上各种险阻，一起向未来！</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">（国际锐评评论员）</p><p><span style=\"color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">来源：央视新闻客户端</span>&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/20/1642653945329774.jpg\" title=\"1642653945329774.jpg\" alt=\"1642653945329774.jpg\" width=\"0\" height=\"0\"/></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642653945329774.jpg\";}', 1, 3, 1642653965, 1642653965),
(19, '新华国际时评丨世界瞩目中国经济“韧实力”', '', 16, '', 1, '<p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><img src=\"/Public/Upload/Article/image/2022/01/20/1642654099423150.jpg\" title=\"1642654099423150.jpg\" alt=\"309c2370489d2350c5342b.jpg\"/></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">新华社北京1月18日电&nbsp; “中国经济增长创近十年来纪录”“外贸数据体现中国经济韧性”……2021年中国经济“成绩单”17日出炉，其亮眼表现引发世界瞩目。国际舆论和外国学者认为，在全球新冠疫情起伏反复的背景下，中国经济展现出“韧实力”。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">中国国家统计局17日发布数据显示，2021年中国经济持续稳定恢复，经济发展和疫情防控保持全球领先地位，主要指标实现预期目标。中国国内生产总值突破110万亿元人民币，比上年增长8.1%，中国经济总量连续第二年超过100万亿元。以美元计价，我国货物贸易进出口规模首次突破6万亿美元，创下历史新高。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">从增长之稳，世界感知中国经济承压前行之韧。俄罗斯圣彼得堡国立大学教授列克修蒂娜认为，疫情冲击下，中国经济展现出很强的抗压能力。中国始终是世界经济增长的驱动力，以高增长率引领世界经济复苏。新加坡时政评论员翁德生表示，面对一系列挑战，中国经济坚韧向上，2021年增速领先全球主要经济体，成为疫情冲击下世界经济重要引擎。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">从外贸之增，世界感受中国经济平稳运行之韧。2021年，中国全年货物进出口总额39.1万亿元，规模再创历史新高。《华尔街日报》说，新冠疫情暴发两年来，中国外贸不断创造惊喜，成为中国经济平稳运行的重要担当。日本经济学家金坚敏表示，中国商品出口对稳定全球供应链、抑制全球通胀起到良好效果。泰国开泰银行高级副总裁蔡伟才说，中国去年进口增幅显著，再次显示中国开放市场、与各国分享经济繁荣成果的努力。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">从外资之汇，世界看到中国经济长期向好之韧。中国商务部此前发布数据显示，2021年中国实际使用外资金额同比增长14.9%，再创历史新高，中国高技术产业实际使用外资同比增长17.1%。国际咨询机构普雷钦研究公司日前公布的数据显示，2021年风险资本投资者向中国5300多家初创企业投资约1290亿美元，刷新2018年创下的纪录。欧亚集团总裁伊恩·布雷默指出，大多数西方企业高管计划未来十年拓展中国业务，“市场所在的地方，就是企业希望在的地方”。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">令世人瞩目的是，中国创新动能持续提升，在高质量发展道路上迈出坚实步伐。2021年，中国高技术制造业增加值增长18.2%，新能源汽车、工业机器人、集成电路产量等表现抢眼。世界知识产权组织（WIPO）发布的2021年全球创新指数（GII）报告中，中国已攀升至第12。未来的中国经济，创新驱动发展必将更加强劲，也将为世界带来更多合作机遇。瑞典教育大臣安娜·埃克斯特伦日前就表示，看好瑞中科技创新合作未来发展。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">目前，全球经济复苏势头不稳，老矛盾和新风险交织积累，给中国经济发展造成一定压力。但看大局、观大势，中国经济韧性强、潜力足、长期向好的基本面没有改变，中国将坚定不移推进高质量发展，中国改革开放永远在路上。人们坚信，中国完全有能力克服困难，有办法防范风险，为全球经济发展作出更多新贡献。</span></p><p><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-size: 14px;\">来源：新华社作者：乔继红责任编辑：黄敏</span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642654099423150.jpg\";}', 1, 11, 1642654117, 1642654257),
(20, '从党史中汲取推进民族复兴的坚定自信', '', 17, '', 1, '<p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">习近平总书记在中央政治局民主生活会上指出：“在新的赶考之路上，我们能否继续交出优异答卷，关键在于有没有坚定的历史自信。”我们党的历史自信源于党和人民共同的不懈奋斗，体现在一代代中国共产党人领导人民创造的伟大成就及宝贵经验上。以史为鉴，坚定党的历史自信，为的是坚定中国人民和中华民族未来自信。踏上新的赶考路，我们必须持之以恒推进总结、学习、教育、宣传党的奋斗史，进一步增强中国特色社会主义道路自信、理论自信、制度自信和文化自信，为实现中华民族伟大复兴提供史鉴支撑和精神力量。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">从党史中增强道路自信，让中国道路护航中华民族伟大复兴。近代以来，为改变中华民族积贫积弱、任人宰割的命运，无数仁人志士前赴后继，探索救国救民的道路，但都以失败告终。在国内外革命形势召唤下，中国共产党应运而生。中国共产党无愧为伟大光荣正确的党。百年来，为挽救民族危亡，一代代中国共产党人坚定理想信念，牢记“为中国人民谋幸福、为中华民族谋复兴”的初心使命，团结带领中国人民奋力开创新民主主义革命道路、社会主义建设道路和中国特色社会主义道路，使具有500年历史的社会主义主张在世界上人口最多的国家成功开辟出具有高度现实性和可行性的正确道路，使中华民族迎来了从站起来、富起来到强起来的伟大飞跃，从根本上改变了中国人民的前途命运。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">只有社会主义才能救中国，只有中国特色社会主义才能发展中国。中国特色社会主义道路是当代中国大踏步赶上时代、引领时代发展的康庄大道，是实现社会主义现代化、创造人民美好生活的必由之路。在当代中国，坚定不移走自己的路，建设中国特色社会主义是党的全部理论和实践的立足点，也是实现中华民族伟大复兴的正确道路。今天，立足新发展阶段、贯彻新发展理念、构建新发展格局，我们必须坚定共产主义理想和中国特色社会主义信念，牢记“中国共产党是什么、要干什么”这个根本问题，在接续推进党的自我革命和伟大社会革命的历史进程中不断创新，坚持和发展中国特色社会主义道路，为实现中华民族伟大复兴奠定坚实基础。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">从党史中增强理论自信，让中国理论引领中华民族伟大复兴。中国共产党为什么能，中国特色社会主义为什么好，归根到底是因为马克思主义行！我们党从诞生之日起，就把马克思列宁主义确立为自己的指导思想，从中“看到了解决中国问题的出路”。马克思主义没有负中国共产党，中国共产党也没有负马克思主义。百年来，党坚持把马克思主义基本原理同中国具体实际和时代特征相结合，不断推动马克思主义中国化进程，先后产生毛泽东思想、中国特色社会主义理论体系，引领着中国革命、建设和改革事业从胜利走向胜利。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">实践没有止境，理论创新也没有止境。党的十八大以来，以习近平同志为核心的党中央在全面深化改革实践中，以全新视野深化对共产党执政规律、社会主义建设规律、人类社会发展规律的认识，科学回答“新时代坚持和发展什么样的中国特色社会主义、怎样坚持和发展中国特色社会主义”的重大课题，为丰富和发展马克思主义作出原创性贡献，实现了马克思主义中国化的新飞跃。当前，统筹中华民族伟大复兴战略全局和世界百年未有之大变局，更加需要我们坚持唯物史观和正确党史观，运用马克思主义立场观点方法观察时代、把握时代和引领时代，并在实践基础上不断推进理论创新，引领全国人民朝着实现民族复兴的光明前景坚定前行。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">从党史中增强制度自信，让中国制度保障中华民族伟大复兴。天下大治，古往今来无数治国者孜孜以求的理想，也是中国共产党带领中国人民矢志不渝的追寻。我们党从创立以来，在勇敢担当民族独立、民族解放、民族复兴艰巨任务的同时，也对制度建设、治国理政不懈探索。如1956年，党领导人民“三大改造”建立社会主义制度，建立独立的比较完整的工业体系和国民经济体系，创造相对落后的国家跨越式发展的奇迹，以及集中力量办大事等独特制度优势，为日后发展打下必要基础。改革开放以来，我们党深刻总结社会主义建设经验，逐步形成和完善中国特色社会主义制度，为谱写经济持续快速发展和社会长期稳定“两大奇迹”的新篇章保驾护航，充分体现了中国特色社会主义制度优势。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">在波澜壮阔的中国革命、建设和改革进程中，党领导人民不断探索，闯出了一条适合中国国情的制度体系。党的十八大以来，以习近平同志为核心的党中央深入把握国家治理和制度建设规律，推进实践创新、理论创新和制度创新，在经济、政治、文化、社会等各领域形成一整套相互衔接的制度体系。实践证明，中国特色社会主义制度是符合中国国情具有显著优势的好制度。踏上新征程，我们要秉持“江山就是人民，人民就是江山”的执政理念，在坚持和巩固已经建立起来并经过实践检验的根本制度、基本制度、重要制度的前提下，继续深化各领域各方面体制机制改革，为实现中华民族伟大复兴提供制度保证。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">从党史中增强文化自信，让中国文化助力中华民族伟大复兴。历史经验昭示我们，我国革命、建设和改革发展的指导思想只能是马克思主义，但要使人民群众在思想上、在情感上自觉接受马克思主义，还需要将马克思主义同中国历史传统、文化理念相结合，不断推进马克思主义本土化、大众化。中国优秀传统文化是中华民族历经磨难而不衰的精神支柱，我们党是中华优秀传统文化的忠实传承者和弘扬者，历来重视和运用精神文化引领前进方向、凝聚奋斗力量。例如，2020年初面对新冠肺炎疫情这一突如其来的危机大考，党坚持把人民生命安全和身体健康摆在第一位，广大医务人员、社区志愿者、人民解放军义无反顾、迎难而上，全国人民风雨同舟、守望相助，抗疫斗争取得重大战略成果。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">百年来，我们党披荆斩棘、一往无前，开启实现民族复兴的光明前景，一个重要原因就是党历来坚持把马克思主义基本原理同中国具体实际相结合、同中华优秀传统文化相结合，从优秀传统文化中汲取智慧和力量，不断赋予其新的时代内涵，构成了我们战胜一切艰难险阻的有力支撑。可以说，党的百年奋斗历程展示了一条不断继承中华优秀传统文化、创造革命文化、培育社会主义先进文化的文化自信之路。今天，我国改革发展站在了新的历史起点上，我们必须坚定历史自信，坚定中华优秀传统文化自信、革命文化自信和社会主义先进文化自信，使之成为助力中华民族伟大复兴的恒久力量。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">作者：王锁明（南京大学马克思主义学院）</span></p><p><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; font-size: 14.08px; background-color: rgb(255, 255, 255);\">来源：光明网</span><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; font-size: 14.08px; background-color: rgb(255, 255, 255);\">作者：王锁明</span><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; font-size: 14.08px; background-color: rgb(255, 255, 255);\">责任编辑：李佳琦</span>&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/20/1642654372329845.jpg\" title=\"1642654372329845.jpg\" alt=\"1642654372329845.jpg\" width=\"0\" height=\"0\"/></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642654372329845.jpg\";}', 1, 2, 1642654384, 1642654384),
(21, '理论学起来：从“八个明确”到“十个明确”', '', 17, '', 1, '<p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">新的一年怎么进步，理论学起来。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">党的十九届六中全会通过的《中共中央关于党的百年奋斗重大成就和历史经验的决议》在党的十九大报告“八个明确”的基础上，用“十个明确”对习近平新时代中国特色社会主义思想的核心内容作了进一步概括。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: \"><span style=\"font-size: 14px;\">从“八个明确”到“十个明确”，哪里不一样？赶紧来看看！</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); text-align: center;\"><span style=\"font-size: 14px;\">【点击图片查看】</span></p><center><a title=\"\" href=\"https://9.u.mgd5.com/c/gqoa/al2n/index.html\" target=\"_blank\" style=\"box-sizing: border-box; color: rgb(85, 85, 85); text-decoration-line: none;\"><img id=\"14478972\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642654492894486.jpg\"/></a></center><p><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: \">来源：人民网-理论频道</span><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: \"></span><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: \">责任编辑：于海洋</span><img src=\"/Public/Upload/Article/image/2022/01/20/1642654534254565.jpg\" title=\"1642654534254565.jpg\" alt=\"1642654534254565.jpg\" width=\"0\" height=\"0\"/></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642654534254565.jpg\";}', 1, 6, 1642654543, 1642654628),
(22, '寒夜狙击！第79集团军某旅特战小队实战化演练见闻', '', 18, '', 1, '<p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\"><strong style=\"box-sizing: border-box;\">寒夜狙击</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\"><strong style=\"box-sizing: border-box;\">——第79集团军某旅特战小队实战化演练见闻</strong></span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">■孙 瑜 李东哲 解放军报特约记者 海 洋</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">深冬，辽西大地寒风呼啸，第79集团军某旅一场实战化演练在寒夜中拉开战幕。借助夜色掩护，身穿伪装衣的特战队员们向指定目标快速接近。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“前方发现蓝方小股警戒力量，各组隐蔽！”收到侦察组传回的“敌情”通报，红方指挥员、特战小队小队长王润东迅速下达指令。特战队员们闻令而动，迅速做好战斗准备。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">狙击手陈帅带着副手吴明鑫低姿匍匐前进至一处高地，打开瞄准镜，紧紧盯住来回巡逻的蓝方执勤人员。陈帅根据现场风向风速等相关参数，迅速计算修正值。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“砰，砰……”几声枪响，蓝方执勤人员被“击毙”。陈帅和吴明鑫迅速起身转移阵地。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">靠近目标点，突然枪声大作，担任尖刀组的特战队员遭蓝方埋伏。一时间，“战场”险象环生。王润东迅速组织队员疏散隐蔽，综合研判形势。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“佯攻组攻占左侧无名高地，正面牵制蓝方主力，突击组跟我来！”经过认真观察，王润东断定西北方向河堤处为蓝方防御阵地薄弱点，且河面冰层厚实，可快速通过实施突然袭击。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">事实证明，王润东的判断完全正确。接下来的战斗中，他们正面压制、侧翼迂回，各组之间密切配合，以雷霆之势击败蓝方。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">“大力推进战训耦合，就要多设难局、危局、险局，敢于把官兵置于复杂多变的战场环境下锤炼。”该旅领导介绍，把环境设真、把敌情设险、把态势设活，才能练强指挥能力，练好战斗本领，练硬战斗作风。此次演练，不仅战术背景设置模拟实战，蓝方的围追堵截也不留情面，实打实锤炼特战小队在严寒条件下独立遂行作战任务的能力。</span></p><center><img id=\"14490777\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642654741503423.jpg\"/></center><p><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; font-size: 14.08px; background-color: rgb(255, 255, 255);\">来源：中国军网-解放军报作者：孙 瑜 李东哲 海 洋责任编辑：杨凡凡&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/20/1642654802895299.jpg\" title=\"1642654802895299.jpg\" alt=\"1642654802895299.jpg\" width=\"0\" height=\"0\"/></span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642654802895299.jpg\";}', 1, 4, 1642654816, 1642654816),
(23, '直击演训场丨闻令而动！西藏山南军分区开展山地战斗演练', '', 18, '', 1, '<p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center;\"><strong>莽莽山野摆战场</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center;\"><strong>——西藏山南军分区山地战斗演练掠影</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center;\">■赵飞棋 张照杰 解放军报特约记者 李国涛 摄影报道</p><center><img id=\"14489145\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642654876921454.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center; font-size: 10pt;\"><span style=\"\">一声令下，快速登车。</span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">1月6日清晨，随着两枚信号弹划破天际，西藏山南军分区一场山地战斗演练拉开帷幕。参演官兵闻令而动，奔赴战位。顷刻间，铁流滚滚，尘烟四起，高原腹地呈现出一幅火热练兵图景。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">迢迢天路，一辆辆战车时而快速机动，时而疏散隐蔽。到达预定地域后，官兵们迅速抢占阵地，紧张投入战斗准备。侦察分队放飞无人机实施战场侦察，将信息实时传至指挥所。指挥员分析研判“敌”情后，下令使用某型速射迫击炮对目标实施压制。随即，一枚枚炮弹呼啸出膛，目标区域硝烟弥漫、火光冲天。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">很快，战斗进入白热化。无人机通过信息终端，引导炮兵分队对目标进行精准打击；突击车配合步兵分队多路推进，快速向“敌”前沿机动……官兵士气高昂，勇往直前，成功将胜利的旗帜插到“敌”阵地。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">“本次演练，火力主战原则得到体现，但各分队衔接协同还不够紧密……”硝烟散去，官兵在演训场展开复盘研讨，对演练中存在的问题集智攻关，提升训练针对性和实效性。</p><p><span style=\"\"><center><img id=\"14489133\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642654878351658.jpg\" width=\"706\" height=\"916\"/></center></span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center;\"><span style=\"\">战车向预定地域机动。</span></p><center><img id=\"14489142\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642654878822495.jpg\" width=\"706\" height=\"870\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center; font-size: 10pt;\"><span style=\"\">突击车与步兵分队协同进攻。</span></p><center><img id=\"14489144\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642654879885926.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center;\"><span style=\"\">对“敌”目标实施打击。</span></p><center><img id=\"14489149\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642654880768247.jpg\"/></center><p><span style=\"margin-right: 15px; color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">来源：中国军网-解放军报</span><span style=\"color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">&nbsp;</span><span style=\"margin-right: 15px; color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">作者：赵飞棋 张照杰等&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/20/1642654968439291.jpg\" title=\"1642654968439291.jpg\" alt=\"1642654968439291.jpg\" width=\"0\" height=\"0\"/></span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642654968439291.jpg\";}', 1, 1, 1642654981, 1642654981);
INSERT INTO `sc_article` (`id`, `title`, `title_color`, `article_class_id`, `jump_url`, `is_enable`, `content`, `image`, `image_count`, `access_count`, `add_time`, `upd_time`) VALUES
(24, '2022年1月17日外交部发言人赵立坚主持例行记者会', '', 24, '', 1, '<p><strong style=\"white-space: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><center><img id=\"14490719\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642655121448958.jpg\"/></center><p style=\"line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em;\">总台央视记者：14日，伊朗外长阿卜杜拉希扬用中文发推特，表示很高兴新年伊始开启就任以来首次访华之旅。他同王毅国务委员兼外长就全面合作计划等广泛议题交换意见并达成重要共识，愿两国关系在步入第二个50年之际龙腾虎跃，并预祝北京冬奥会为疫情下的世界带来虎虎生机。发言人能否介绍相关情况？</p></strong><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：首先我们给阿卜杜拉希扬外长用中文发推特点赞。1月14日，王毅国务委员兼外长在江苏无锡同伊朗外长阿卜杜拉希扬举行会谈，双方共同宣布启动两国全面合作计划落实工作，一致同意加强能源、基础设施、产能、科技、医疗卫生合作，拓展农渔业、网络安全、三方合作，深化教育、电影、人才培训等人文交流，打造更多实实在在的合作成果。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">王毅国务委员表示，过去一年，中伊双方在两国元首指引下，以建交50周年为契机，加强团结协作，深化政治互信，两国关系取得新成果。中方愿不断充实中伊全面战略伙伴关系内涵，开启两国关系发展下一个50年的新时期。中方将继续全力向伊方提供疫苗，助力伊方彻底战胜疫情。同时，中方坚决反对对伊朗的非法单边制裁，反对借人权等议题进行政治操弄，反对粗暴干涉伊朗等地区国家的内政。中方将坚定支持全面协议恢复履约谈判进程，继续建设性参与后续谈判，希望各方克服困难相向而行，坚持推进政治外交解决进程。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">阿卜杜拉希扬高度评价伊中两国去年庆祝建交50周年并签署全面合作计划，感谢中方为伊方抗疫提供有力支持。他表示，伊方将坚定奉行一个中国政策，高度赞赏并将积极参与共建“一带一路”，坚定致力于推进伊中合作，支持中方成功举办北京冬奥会，共同反对霸凌行径和单边制裁。</p><center><img id=\"14490721\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642655122709110.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>新华社记者：日前，国际奥委会北京冬奥会协调委员会主席小萨马兰奇接受采访时，对北京冬奥会“绿色办奥”理念给予充分肯定，认为北京冬奥会将成为“最绿色”的奥运会。发言人对此有何评论？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：正如小萨马兰奇主席所言，本届冬奥会最大的特色之一就是“绿色环保”。北京冬奥会三大赛区26个场馆将历史性地首次实现100%绿色电能供应。这意味着每年可节约490万吨标准煤，减排1280万吨二氧化碳。可以说，中国完全实现了“绿色办奥”的理念。中国“绿色办奥”不仅是为了兑现自身“双碳”承诺，更是在向世界提供如何处理好人与自然、发展与保护关系的中国方案、中国智慧、中国贡献。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">在这我也想问在座的各位记者一个问题，北京冬奥会场馆使用的“绿色电能”来自哪里呢？（现场有记者回答:来自张北）说对了，来自河北省张北。俗话说，“张北一场风，从春刮到冬”。我们建立了张北可再生能源示范项目，把张北的风转化为清洁电力，并入冀北电网，再输向北京、延庆、张家口三个赛区。这些电力不仅点亮一座座奥运场馆，也点亮北京的万家灯火。这个故事叫，“张北的风点亮北京的灯”。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">北京“绿色冬奥”的魅力不止于此，还体现在中方办奥“可持续·向未来”的诚挚愿景上。这里我再举一个例子。各位记者朋友如果前往北京延庆区张山营冬奥森林公园参观，就会发现很多树木都有自己专属的二维码或者是“身份证”，扫描后就会发现，它们其实是延庆赛区建设时移植而来。我们以迁地保护作为一种生态补偿，这不仅为冬奥赛区守住了那片青山，也为“绿色办奥”理念增添又一生动注脚。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">还有不到20天的时间，北京冬奥会即将拉开帷幕，绿色冬奥的美丽画卷正徐徐铺展，还有更多精彩将逐一揭晓。我和大家一样，也对本届冬奥会充满期待。</p><center><img id=\"14490723\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642655122394602.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>《人民日报》记者：近日，新加坡前外交官马凯硕表示，一位英国企业高管称英方在华为内部安插情报人员进行“全面检查”，确认华为没有任何威胁。但几个月后，英国迫于美国压力“投降”。截至目前，英国官方没有对此发表评论。请问中方有何评论？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：我也注意到相关报道。和大家一样，我也想听一听英国有关方面作何解释。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">我还注意到，英国媒体近期评论称，英国“封杀”华为的决定将导致英国的5G建设目标大大推迟。英不管部国务大臣、时任数字化、文化、媒体和体育大臣奥利弗·道登表示，禁用华为设备将使英国5G建设滞后2到3年。英国牛津研究院调查显示，限制华为这样的关键设备供应商进入英国5G基础设施建设市场，将导致未来10年英国相关网络部署成本提高9%到29%。英方一些人和势力出于政治私利趋附某国，泛化国家安全概念，打压中方特定企业，却让本国民众承担无缘5G高科技的苦果。这完全是损人不利己。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>德国电视一台记者：德国“巴伐利亚”号护卫舰刚刚驶离太平洋，中方如何评估该军舰的行动？为何未准许其在上海停靠？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：我们注意到了德国有关军舰到南海进行所谓巡弋。中方已经多次就此作出表态。我们希望德国的有关做法能够有利于地区和平与稳定，而不是到本地区来博取眼球。</p><center><img id=\"14490725\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642655123565154.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>深圳卫视记者：据报道，1月15日，汤加海域发生火山爆发，造成严重损失。中方是否向汤方提供了灾后援助？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：中方十分关注汤加火山爆发引发的灾情，对灾害造成严重损失向汤加政府和人民表示深切同情和诚挚慰问。中国红十字会已经决定向汤方提供10万美元紧急人道主义现汇援助。中方将根据灾情和汤方需要进一步提供力所能及的帮助。我们相信汤加政府和人民一定能够早日战胜灾害，重建美好家园。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>总台央广记者：据报道，14日，俄罗斯外长拉夫罗夫举行大型年度记者会，就中俄高层交往和战略协作等回答记者提问。拉夫罗夫高度评价中俄关系，称俄中建立了独一无二的全方位合作机制，这在俄与其他国家关系中都是不具备的。拉夫罗夫还表示，俄中以友好姿态同各国在联合国安理会及其下属机构开展合作，共同捍卫了国际法和国际公平正义。在伊核问题、阿富汗、中亚等诸多国际和地区问题上，俄中也立场相近。中方对此有何评论？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：我们注意到拉夫罗夫外长对中俄关系作出的积极表态，对此高度评价。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">我们多次表示，中俄关系上不封顶，两国战略合作不设禁区。两国建立了元首年度交往、总理定期会晤、立法机构合作等高层交往机制，5个副总理级政府间合作委员会高效运行，两办主任磋商、战略安全磋商、执法安全合作机制等合作内涵持续丰富，几十个合作分委会工作不断取得新成果。正如拉夫罗夫外长所说，这种全方位合作机制的确立是“独一无二”的。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">作为联合国安理会常任理事国和负责任大国，中俄两国始终坚定维护以联合国为核心的国际体系、以国际法为基础的国际秩序，致力于推动完善全球治理，促进国际地区热点问题政治解决，为纷繁复杂的国际形势注入了宝贵的稳定性和正能量。双方一向认为，国际上的事应由各国共同商量着办，要开放不要封闭、要合作不要对抗、要共赢不要独占，这是人心所向、大势所趋。中方愿同包括俄方在内的国际社会一道，坚定践行真正的多边主义，持续推动国际关系民主化，为推动建设新型国际关系、构建人类命运共同体作出更大贡献。</p><center><img id=\"14490727\" title=\"\" src=\"/Public/Upload/Article/catchimage/2022/01/20/1642655123133874.jpg\"/></center><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>彭博社记者：有报道称，来自朝鲜的一辆货运列车于周末驶抵中国丹东并于今日返回朝鲜，外交部能否证实？这是否意味着中朝正继续推进边境重新开放？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：受疫情影响，中朝铁路货运暂停了一段时间。经过双方友好协商，丹东至新义州铁路口岸货运已经重启。双方将在确保防疫安全的基础上做好这项工作，助力中朝正常贸易往来。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>路透社记者：韩国军方称，朝鲜周一发射了两枚疑似短程弹道导弹，外交部对此有何评论？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：中方注意到有关报道以及近期朝鲜半岛形势各方面动向。半岛形势走到今天，事出有因。我们呼吁有关方着眼半岛和平稳定大局，坚持对话协商的正确方向，共同致力于推进半岛问题政治解决进程。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>法新社记者：国际社会对俄罗斯在俄乌边境陈兵并可能入侵乌克兰表示了高度担忧。鉴于中国一贯奉行不干涉内政原则，中国是否也对试图以武力改变乌克兰主权地位的行为表示关切？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：正如你刚才所说，中方在乌克兰问题上的立场是一贯的、明确的，我们的立场没有变化。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">我们坚持共同、综合、合作、可持续的全球安全观，倡导平衡、公正对待相关国家的安全关切和安全倡议，通过对话协商解决分歧。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><strong>德国电视一台记者：期待北京冬奥会的外国人现在正关注中国的疫情形势。据了解，中国日前也出现了几起聚集性病例，说明奥密克戎来势汹汹。我采访的一些德国运动员表示，他们担心能否安全地赴华出席北京冬奥会。你认为形势会如何发展？</strong></p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">赵立坚：首先，感谢你对中国抗击疫情的关注。我相信在座的各位记者中，大多数在中国呆的时间都比较长，也都经历了中国如何抗击此次疫情的全过程。大家可以看到，也可以比较，因为有约翰·霍普金斯大学提供的数据，我们也有很多其他数据来源。中国发生的新冠肺炎确诊病例数和美国等其他国家的病例数，不比不知道，一比吓一跳。可以说，中国已经完全取得了抗击新冠肺炎疫情的战略性胜利。当然，目前我们面临全球新一轮的疫情高峰，尤其是奥密克戎带来的“海啸”。如你所说，中国也出现了零星、个别的病例，比如天津。天津已经采取了全面、有效的措施。我们的专家已经作出评估，相信天津的疫情很快就能得到控制。大家也肯定关注到，北京海淀区也出现了一例奥密克戎阳性病例。经过目前的调查和全面的筛查，据我所掌握的情况，目前还仍是一例。大家都感到很奇怪，为什么这次奥密克戎病例只有一例，但确实这个就是事实。我完全相信，有中国共产党的领导，有中国政府和中国人民实施的全面、有效的“动态清零”的抗疫政策，本次北京冬奥会在防疫方面是完全可以让大家放心的。</p><p style=\"white-space: normal; line-height: 1.8em; margin-top: 0.7em; margin-bottom: 0.7em; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">所以，我也希望你们能通过自己的笔和镜头，把在中国所见报道回国内，希望你们把中国发生的情况如实地告诉你们的运动员和民众。我们经常说，北京冬奥会将是一届简约、安全、精彩的奥运盛会，我们首先要做到的就是安全。</p><p><span style=\"color: rgb(136, 136, 136); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.8px;\">来源：外交部网站</span>&nbsp;&nbsp;<img src=\"/Public/Upload/Article/image/2022/01/20/1642655162677036.jpg\" title=\"1642655162677036.jpg\" alt=\"1642655162677036.jpg\" width=\"0\" height=\"0\"/></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642655162677036.jpg\";}', 1, 1, 1642655172, 1642655172),
(25, '外交部：中方热烈欢迎波兰总统出席北京冬奥会开幕式', '', 24, '', 1, '<p style=\"text-align:center\"><img src=\"/Public/Upload/Article/image/2022/01/20/1642655293307235.jpg\" title=\"1642655293307235.jpg\" alt=\"1642655293307235.jpg\" width=\"640\" height=\"360\"/></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 16px;\">新华社北京1月19日电（记者董雪）针对有报道称波兰总统杜达将出席北京冬奥会开幕式，外交部发言人赵立坚19日表示，中方热烈欢迎杜达总统来华出席北京冬奥会开幕式，这充分表达了国际社会“一起向未来”的共同心愿。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 16px;\">赵立坚是在当日例行记者会上回答有关提问时作上述表态的。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 16px;\">赵立坚说，北京冬奥会的帷幕即将拉开。中国有信心同各方一道，践行“更团结”的奥林匹克精神，向世界呈现一届简约、安全、精彩的冬奥盛会。</span></p><p style=\"font-size: 1rem; white-space: normal; box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif;\"><span style=\"font-size: 16px;\">他表示，根据奥运规则，各国领导人出席奥运会由本国奥委会邀请、在国际奥委会系统注册。“目前已有不少国家元首、政府首脑、王室成员注册出席北京冬奥会。我们对他们表示欢迎。”</span></p><p><span style=\"box-sizing: border-box; display: inline-block; margin-right: 10px; color: rgb(136, 136, 136); font-family: &quot;Segoe UI&quot;, &quot;Lucida Grande&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, FreeSans, Arimo, &quot;Droid Sans&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Arial, sans-serif; font-size: 14.08px; background-color: rgb(255, 255, 255);\">来源：新华社作者：董雪责任编辑：于海洋</span></p>', 'a:1:{i:0;s:60:\"/Public/Upload/Article/image/2022/01/20/1642655293307235.jpg\";}', 1, 9, 1642655320, 1642655320),
(26, 'XXX', '', 25, '', 1, '<p style=\"text-align: center; text-indent: 0em;\"><img src=\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸.jpg\" alt=\"WPS图片-修改尺寸.jpg\"/></p><p style=\"text-indent: 2em;\">XXX是一名优秀的.........................................................................................................................................................................................................................................................................................................................<span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span></p>', 'a:1:{i:0;s:66:\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸.jpg\";}', 1, 13, 1642656193, 1642658700),
(27, 'XXX', '', 25, '', 1, '<p style=\"text-align: center;\"><img src=\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸1.jpg\" alt=\"WPS图片-修改尺寸1.jpg\" width=\"640\" height=\"960\" title=\"src=http___5b0988e595225.cdn.sohucs.com_q_70,c_zoom,w_640_images_20180801_64466a2131a64e5787c8d764158163a7.jpeg&amp;refer=http___5b0988e595225.cdn.sohucs.jpg\"/></p><p style=\"text-indent: 2em;\"><span style=\"text-indent: 32px;\">XXX是一名优秀的.........................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span></p>', 'a:1:{i:0;s:67:\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸1.jpg\";}', 1, 7, 1642657370, 1642658722),
(28, 'XXX', '', 25, '', 1, '<p style=\"text-align: center;\"><img src=\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸2.jpg\" alt=\"WPS图片-修改尺寸2.jpg\" width=\"640\" height=\"960\" title=\"src=http___www.cqfzb.org_Files_papers_20171219231501422.jpg&amp;refer=http___www.cqfzb.jpg\"/></p><p style=\"text-indent: 2em;\"><span style=\"text-indent: 32px;\">XXX是一名优秀的.........................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span></p>', 'a:1:{i:0;s:67:\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸2.jpg\";}', 1, 6, 1642657424, 1642658747),
(29, 'XXX', '', 25, '', 1, '<p style=\"text-align: center;\"><img src=\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸6.jpg\" alt=\"WPS图片-修改尺寸6.jpg\" width=\"640\" height=\"960\" title=\"src=http___5b0988e595225.cdn.sohucs.com_images_20180801_4e0723e6ed1842b086dd721cc565d26d.jpeg&amp;refer=http___5b0988e595225.cdn.sohucs.jpg\"/></p><p style=\"text-indent: 2em;\"><span style=\"text-indent: 32px;\">XXX是一名优秀的.........................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span></p>', 'a:1:{i:0;s:67:\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸6.jpg\";}', 1, 7, 1642657458, 1642658772),
(30, 'XXX', '', 25, '', 1, '<p style=\"text-align: center;\"><img src=\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸3.jpg\" alt=\"WPS图片-修改尺寸3.jpg\" width=\"640\" height=\"960\" title=\"src=http___5b0988e595225.cdn.sohucs.com_q_70,c_zoom,w_640_images_20180801_3ccf070147c4401f8e251ebe68cb2f4f.jpeg&amp;refer=http___5b0988e595225.cdn.sohucs.jpg\"/></p><p style=\"text-indent: 2em;\"><span style=\"text-indent: 32px;\">XXX是一名优秀的.........................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span></p>', 'a:1:{i:0;s:67:\"/Public/Upload/Article/image/2017/02/24/WPS图片-修改尺寸3.jpg\";}', 1, 4, 1642657506, 1642658788),
(31, 'XXX', '', 25, '', 1, '<p style=\"text-align: center;\"><img src=\"/Public/Upload/Article/image/2017/02/24/src=http___files.js7tv.cn_www_images_2017-05_04_1493867151657478_big_raw.jpg&refer=http___files.js7tv.jpg\" alt=\"src=http___files.js7tv.cn_www_images_2017-05_04_1493867151657478_big_raw.jpg&amp;refer=http___files.js7tv.jpg\"/></p><p style=\"text-indent: 2em;\"><span style=\"text-indent: 32px;\">XXX是一名优秀的.........................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span><span style=\"text-indent: 32px;\">.......................................................................................................................................................................................................................................................................................................................</span></p>', 'a:1:{i:0;s:145:\"/Public/Upload/Article/image/2017/02/24/src=http___files.js7tv.cn_www_images_2017-05_04_1493867151657478_big_raw.jpg&refer=http___files.js7tv.jpg\";}', 1, 6, 1642657538, 1642658794);

-- --------------------------------------------------------

--
-- 表的结构 `sc_article_class`
--

CREATE TABLE `sc_article_class` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室类别' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_article_class`
--

INSERT INTO `sc_article_class` (`id`, `pid`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(7, 0, '要事要闻', 1, 0, 0, '2016-12-25 06:41:23'),
(10, 0, '时事政治', 1, 0, 0, '2016-12-25 06:42:31'),
(16, 0, '热点评论', 1, 0, 1482840545, '2016-12-27 12:09:05'),
(17, 0, '学习理论', 1, 0, 1482840557, '2016-12-27 12:09:17'),
(18, 0, '备战打战', 1, 0, 1482840577, '2016-12-27 12:09:37'),
(24, 0, '外交发言', 1, 0, 1483951541, '2017-01-09 08:45:41'),
(25, 0, '优秀官兵', 1, 0, 1642606817, '2022-01-19 15:40:17');

-- --------------------------------------------------------

--
-- 表的结构 `sc_class`
--

CREATE TABLE `sc_class` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级类别' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_class`
--

INSERT INTO `sc_class` (`id`, `pid`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(7, 0, '一年级', 1, 0, 0, '2016-12-25 06:41:23'),
(10, 0, '二年级', 1, 0, 0, '2016-12-25 06:42:31'),
(16, 10, '三年级', 1, 0, 1482840545, '2016-12-27 12:09:05'),
(17, 7, '一班', 1, 0, 1482840557, '2016-12-27 12:09:17'),
(18, 7, '二班', 1, 0, 1482840577, '2016-12-27 12:09:37'),
(19, 10, '天才班', 1, 0, 1482922284, '2016-12-28 10:51:24'),
(20, 10, '优秀班', 1, 0, 1482922305, '2016-12-28 10:51:45'),
(21, 10, '普通班', 1, 0, 1482922320, '2016-12-28 10:52:00'),
(22, 7, 'NickName', 1, 0, 1483927006, '2017-01-09 01:56:46'),
(23, 0, '好班级', 1, 0, 1483927617, '2017-01-09 02:06:57'),
(24, 16, '1班', 1, 0, 1483951541, '2017-01-09 08:45:41'),
(25, 0, '九年级', 1, 0, 1491922990, '2017-04-11 15:03:10'),
(26, 25, '三班', 1, 0, 1491922998, '2017-04-11 15:03:18');

-- --------------------------------------------------------

--
-- 表的结构 `sc_config`
--

CREATE TABLE `sc_config` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '基本设置id',
  `value` text COMMENT '值',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `error_tips` char(150) NOT NULL DEFAULT '' COMMENT '错误提示',
  `type` char(30) NOT NULL DEFAULT '' COMMENT '类型（admin后台, home前台）',
  `only_tag` char(60) NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `upd_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='基本配置参数' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sc_config`
--

INSERT INTO `sc_config` (`id`, `value`, `name`, `describe`, `error_tips`, `type`, `only_tag`, `upd_time`) VALUES
(15, '10', '分页数量', '分页显示数量', '分页不能超过3位数', 'admin', 'admin_page_number', 1494470659),
(3, '20', '成绩等级', '差', '差,较差,中,良,优，不能超过3位数', 'admin', 'admin_fraction_weak', 1494470660),
(4, '40', '成绩等级', '较差', '', 'admin', 'admin_fraction_poor', 1494470660),
(5, '60', '成绩等级', '中', '', 'admin', 'admin_fraction_commonly', 1494470660),
(6, '80', '成绩等级', '良', '', 'admin', 'admin_fraction_good', 1494470660),
(7, '100', '成绩等级', '优', '', 'admin', 'admin_fraction_excellent', 1494470660),
(8, '7', '学期', '当前学期类id', '请选择学期', 'admin', 'admin_semester_id', 1494470660),
(11, '0', 'Excel编码', 'excel模块编码选择', '请选择编码', 'admin', 'admin_excel_charset', 1494470660),
(16, '测试网站', '站点标题', '浏览器标题，一般不超过80个字符', '站点标题不能为空', 'home', 'home_seo_site_title', 1642567185),
(17, '', '站点关键字', '一般不超过100个字符，多个关键字以半圆角逗号 [ , ] 隔开', '站点关键字不能为空', 'home', 'home_seo_site_keywords', 1642567185),
(18, '', '站点描述', '站点描述，一般不超过200个字符', '站点描述不能为空', 'home', 'home_seo_site_description', 1642567185),
(19, '', 'ICP证书号', 'ICP域名备案号', '', 'home', 'home_site_icp', 1642567177),
(20, '', '底部统计代码', '支持html，可用于添加流量统计代码', '', 'home', 'home_statistics_code', 0),
(21, '1', '站点状态', '可暂时将站点关闭，其他人无法访问，但不影响管理员访问后台', '请选择站点状态', 'home', 'home_site_state', 1642567177),
(22, '升级中...', '关闭原因', '支持html，当网站处于关闭状态时，关闭原因将显示在前台', '', 'home', 'home_site_close_reason', 1642567177),
(23, 'Asia/Shanghai', '默认时区', '默认 亚洲/上海 [标准时+8]', '请选择默认时区', 'common', 'common_timezone', 1642567177),
(24, '', '底部代码', '支持html，可用于添加流量统计代码', '', 'home', 'home_footer_info', 1642567177),
(28, '测试网站', '站点名称', '', '站点名称不能为空', 'home', 'home_site_name', 1642567177),
(29, '0', '链接模式', '详情ThinkPHP官网3.2版本文档 [http://www.thinkphp.cn/]', '请选择url模式', 'home', 'home_seo_url_model', 1642567185),
(25, '2048000', '图片最大限制', '单位B [上传图片还受到服务器空间PHP配置最大上传 20M 限制]', '请填写图片上传最大限制', 'home', 'home_max_limit_image', 1642567177),
(26, '51200000', '文件最大限制', '单位B [上传文件还受到服务器空间PHP配置最大上传 20M 限制]', '请填写文件上传最大限制', 'home', 'home_max_limit_file', 1642567177),
(27, '102400000', '视频最大限制', '单位B [上传视频还受到服务器空间PHP配置最大上传 20M 限制]', '请填写视频上传最大限制', 'home', 'home_max_limit_video', 1642567177),
(30, 'html', '伪静态后缀', '链接后面的后缀别名', '小写字母，不能超过8个字符', 'home', 'home_seo_url_html_suffix', 1642567185),
(31, '1', '文章标题方案', '文章浏览器标题方案', '请选择文章标题方案', 'home', 'home_seo_article_browser', 1642567185),
(32, '1', '频道标题方案', '频道浏览器标题方案', '请选择频道标题方案', 'home', 'home_seo_channel_browser', 1642567185),
(33, '/Public/Upload/Home/image/home_logo.png', '站点logo', '尺寸最大180x38像数，支持 [jpg, png, gif]', '请上传网站logo', 'home', 'home_site_logo', 1642567177),
(34, '1200', '页面最大宽度', '页面最大宽度，单位px，0则100%', '请填写页面最大宽度值', 'home', 'home_content_max_width', 1642567177),
(35, '56.22', '图片比例', '为了站点自适应结构美观，图片尺寸需要统一比例[计算规则 比例值除以100再乘以图片宽度] 得到高度，[0不限制]', '图片比例值格式有误 0~100 之间，小数点后面最大两位', 'common', 'common_image_proportion', 1494470660),
(36, '', '是否开启注册', '关闭注册后，前台站点将无法注册，可选择 [ 短信, 邮箱 ]', '请选择是否开启注册状态', 'home', 'home_user_reg_state', 1642567177),
(37, '0', '是否开启登录', '关闭后，前台站点将无法登录', '请选择是否开启登录状态', 'home', 'home_user_login_state', 1642567177),
(38, '1', '获取验证码-开启图片验证码', '防止短信轰炸', '请选择是否开启强制图片验证码', 'home', 'home_img_verify_state', 1642567177),
(39, '30', '获取验证码时间间隔', '防止频繁获取验证码，一般在 30~120 秒之间，单位 [秒]', '请填写获取验证码时间间隔', 'home', 'common_verify_time_interval', 1642567177),
(40, '用户注册，验证码：#code#，10分钟内有效。如非本人操作请忽略本短信！', '用户注册-短信模板', '验证码变量标识符 [ #code# ]，详情云片官网 [https://www.yunpian.com/]', '请填写用户注册短信模板内容', 'home', 'home_sms_user_reg', 1490755448),
(41, '美啦网', '短信签名', '发送短信包含的签名', '短信签名 3~8 个的中英文字符', 'home', 'common_sms_sign', 1490168548),
(42, '17171d4ff3510ae8f532a70401e41067', '短信密钥', 'APIKEY接口请求密钥', '请填写APIKEY密钥', 'home', 'common_sms_apikey', 1490168548),
(43, '密码找回，验证码：#code#，10分钟内有效。打死也不要告诉别人哦！', '密码找回-短信模板', '验证码变量标识符 [ #code# ]，详情云片官网 [https://www.yunpian.com/]', '请填写密码找回短信模板内容', 'home', 'home_sms_user_forget_pwd', 1490755448),
(44, '600', '验证码有效时间', '验证码过期时间，一般10分钟左右，单位 [秒]', '请填写验证码有效时间', 'home', 'common_verify_expire_time', 1642567177),
(45, 'smtp.163.com', 'SMTP服务器', '设置SMTP服务器的地址，如 smtp.163.com', '请填写SMTP服务器', 'common', 'common_email_smtp_host', 1489131056),
(46, '25', 'SMTP端口', '设置SMTP服务器的端口，默认为 25', '请填写SMTP端口号', 'common', 'common_email_smtp_port', 1489131056),
(47, 'weiletao88@163.com', '发信人邮件地址', '发信人邮件地址，使用SMTP协议发送的邮件地址，如 schoolcms@163.com', '请填写发信人邮件地址', 'common', 'common_email_smtp_account', 1489131056),
(48, 'weiletao88@163.com', 'SMTP身份验证用户名', '如 schoolcms', '请填写SMTP身份验证用户名', 'common', 'common_email_smtp_name', 1489131056),
(49, 'weiletao?', 'SMTP身份验证密码', 'schoolcms@163.com邮件的密码，如 123456', '请填写SMTP身份验证密码', 'common', 'common_email_smtp_pwd', 1489131056),
(50, 'SchoolCMS', '发件人显示名称', '如 schoolcom', '', 'common', 'common_email_smtp_send_name', 1489131056),
(51, '<p>用户注册，你的验证码是&nbsp;&nbsp;#code#</p><p><br/></p>', '用户注册-邮件模板', '验证码变量标识符 [ #code# ]', '', 'home', 'home_email_user_reg', 1490753353),
(52, '<p>密码找回，你的验证码是&nbsp;&nbsp;#code#</p>', '密码找回-邮件模板', '验证码变量标识符 [ #code# ]', '', 'home', 'home_email_user_forget_pwd', 1490753353),
(53, '<p>学生绑定，你的验证码是&nbsp;&nbsp;#code#</p>', '学生绑定-邮件模板', '验证码变量标识符 [ #code# ]', '', 'home', 'home_email_user_student_binding', 1490753353),
(54, '学生绑定，验证码：#code#，10分钟内有效。打死也不要告诉别人哦！', '学生绑定-短信模板', '验证码变量标识符 [ #code# ]，详情云片官网 [https://www.yunpian.com/]', '请填写学生绑定短信模板内容', 'home', 'home_sms_user_student_binding', 1490755448),
(55, '手机号码绑定，验证码：#code#，10分钟内有效。如非本人操作请忽略本短信！', '手机绑定-短信模板', '验证码变量标识符 [ #code# ]，详情云片官网 [https://www.yunpian.com/]', '请填写用手机绑定短信模板内容', 'home', 'home_sms_user_mobile_binding', 1490755448),
(56, '<p>邮箱绑定，你的验证码是&nbsp;&nbsp;#code#</p><p><br/></p>', '邮箱绑定-邮件模板', '验证码变量标识符 [ #code# ]', '', 'home', 'home_email_user_email_binding', 1490753353),
(57, 'Default', '默认模板', '前台默认模板', '请填写默认模板', 'common', 'common_default_theme', 1494812754);

-- --------------------------------------------------------

--
-- 表的结构 `sc_course`
--

CREATE TABLE `sc_course` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `semester_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学期id',
  `teacher_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '教师id',
  `class_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '班级id',
  `subject_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '科目id',
  `week_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '周天id',
  `interval_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '时段id',
  `room_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '教室id',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态（0不可用，1可用）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师课程' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_course`
--

INSERT INTO `sc_course` (`id`, `semester_id`, `teacher_id`, `class_id`, `subject_id`, `week_id`, `interval_id`, `room_id`, `state`, `add_time`, `upd_time`) VALUES
(11, 7, 4, 18, 17, 12, 14, 18, 1, 1484219105, '2017-01-14 10:00:16'),
(12, 7, 1, 17, 19, 12, 14, 17, 1, 1484367651, '2017-01-14 10:34:57'),
(13, 7, 2, 18, 20, 12, 14, 19, 1, 1484367695, '2017-01-14 04:21:35'),
(14, 7, 2, 19, 20, 14, 14, 17, 1, 1484367735, '2017-01-14 04:22:15');

-- --------------------------------------------------------

--
-- 表的结构 `sc_custom_view`
--

CREATE TABLE `sc_custom_view` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_header` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否包含头部（0否, 1是）',
  `is_footer` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否包含尾部（0否, 1是）',
  `is_full_screen` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否满屏（0否, 1是）',
  `image` text COMMENT '图片数据（一维数组序列化）',
  `image_count` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章图片数量',
  `access_count` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '访问次数',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义页面' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sc_custom_view`
--

INSERT INTO `sc_custom_view` (`id`, `title`, `content`, `is_enable`, `is_header`, `is_footer`, `is_full_screen`, `image`, `image_count`, `access_count`, `add_time`, `upd_time`) VALUES
(1, '测试自定义页面', '<p><span style=\"color: rgb(38, 38, 38); font-family: 微软雅黑, \"><img src=\"/Public/Upload/CustomView/image/2017/02/28/1488268978709400.jpg\" title=\"1488268978709400.jpg\" alt=\"333.jpg\"/></span></p><p><span style=\"color: rgb(38, 38, 38); font-family: 微软雅黑, \">秀，身材苗条！</span></p><p><span style=\"color: rgb(38, 38, 38); font-family: 微软雅黑, \"></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">在欧美的排版业界中，使用 Arial 的作品意即是「不使用 Helvetica 的作品」，会被认為是设计师对字体的使用没有概念或是太容易妥协，基本上我大致也是同意。</p><p style=\"box-sizing: border-box; margin-top: 1.6rem; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 1.6rem; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">因為 Helvetica 只有 Mac 上才有內建，Windows 用戶除非花錢買，不然是沒有 Helvetica 能用，所以使用 Arial 的設計師往往被看成是不願意對 Typography 花錢，專業素養不到家的人。除了在確保網頁相容性等絕對必需的情況外，幾乎可以說是不應該使用的字體。</p><p><span style=\"color: rgb(38, 38, 38); font-family: 微软雅黑, \"><br/></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">在欧美的排版业界中，使用 Arial 的作品意即是「不使用 Helvetica 的作品」，会被认為是设计师对字体的使用没有概念或是太容易妥协，基本上我大致也是同意。</p><p style=\"box-sizing: border-box; margin-top: 1.6rem; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">因為 Helvetica 只有 Mac 上才有內建，Windows 用戶除非花錢買，不然是沒有 Helvetica 能用，所以使用 Arial 的設計師往往被看成是不願意對 Typography 花錢，專業素養不到家的人。除了在確保網頁相容性等絕對必需的情況外，幾乎可以說是不應該使用的字體。</p><p><span style=\"color: rgb(38, 38, 38); font-family: 微软雅黑, \"><br/></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">在欧美的排版业界中，使用 Arial 的作品意即是「不使用 Helvetica 的作品」，会被认為是设计师对字体的使用没有概念或是太容易妥协，基本上我大致也是同意。</p><p style=\"box-sizing: border-box; margin-top: 1.6rem; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">因為 Helvetica 只有 Mac 上才有內建，Windows 用戶除非花錢買，不然是沒有 Helvetica 能用，所以使用 Arial 的設計師往往被看成是不願意對 Typography 花錢，專業素養不到家的人。除了在確保網頁相容性等絕對必需的情況外，幾乎可以說是不應該使用的字體。</p><p><span style=\"color: rgb(38, 38, 38); font-family: 微软雅黑, \"><br/></span></p><p><span style=\"color: rgb(38, 38, 38); font-family: 微软雅黑, \"><br/></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">在欧美的排版业界中，使用 Arial 的作品意即是「不使用 Helvetica 的作品」，会被认為是设计师对字体的使用没有概念或是太容易妥协，基本上我大致也是同意。</p><p style=\"box-sizing: border-box; margin-top: 1.6rem; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">因為 Helvetica 只有 Mac 上才有內建，Windows 用戶除非花錢買，不然是沒有 Helvetica 能用，所以使用 Arial 的設計師往往被看成是不願意對 Typography 花錢，專業素養不到家的人。除了在確保網頁相容性等絕對必需的情況外，幾乎可以說是不應該使用的字體。</p><p><span style=\"color: rgb(38, 38, 38); font-family: 微软雅黑, \"><br/></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">在欧美的排版业界中，使用 Arial 的作品意即是「不使用 Helvetica 的作品」，会被认為是设计师对字体的使用没有概念或是太容易妥协，基本上我大致也是同意。</p><p style=\"box-sizing: border-box; margin-top: 1.6rem; margin-bottom: 1.6rem; color: rgb(51, 51, 51); font-family: \">因為 Helvetica 只有 Mac 上才有內建，Windows 用戶除非花錢買，不然是沒有 Helvetica 能用，所以使用 Arial 的設計師往往被看成是不願意對 Typography 花錢，專業素養不到家的人。除了在確保網頁相容性等絕對必需的情況外，幾乎可以說是不應該使用的字體。</p><p><br/></p>', 1, 1, 1, 0, 'a:0:{}', 0, 530, 1484965691, 1488268982);

-- --------------------------------------------------------

--
-- 表的结构 `sc_fraction`
--

CREATE TABLE `sc_fraction` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '成绩id',
  `semester_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学期id',
  `student_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学生id',
  `subject_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '科目id',
  `score_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '成绩期号',
  `score` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分数',
  `comment` char(255) NOT NULL DEFAULT '' COMMENT '教师点评',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生成绩' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_fraction`
--

INSERT INTO `sc_fraction` (`id`, `semester_id`, `student_id`, `subject_id`, `score_id`, `score`, `comment`, `add_time`, `upd_time`) VALUES
(14, 7, 8, 19, 14, 88, '', 1483957162, '2017-01-09 10:19:22'),
(15, 7, 8, 19, 12, 98, 'sss', 1484041760, '2017-01-10 09:52:04'),
(16, 7, 8, 17, 14, 87, 'dd', 1484041823, '2017-01-10 09:50:23'),
(17, 7, 9, 17, 14, 77, '不错，比以前进步多了&lt;script&gt;alert(\'hello\');&lt;/script&gt;', 1484041940, '2017-01-10 09:52:20'),
(18, 7, 11, 20, 17, 78, '还不错的哦~', 1484056861, '2017-01-10 14:01:01'),
(19, 7, 10, 19, 14, 84, '', 1484057026, '2017-01-10 14:03:46'),
(20, 7, 12, 17, 14, 78, '哈哈哈很好的孩子', 1484393740, '2017-01-14 11:35:40'),
(21, 7, 9, 17, 12, 999, '', 1487858078, '2017-02-23 13:54:38'),
(22, 7, 20, 17, 12, 80, '很好', 1490277294, '2017-03-23 13:54:54'),
(23, 7, 20, 17, 14, 26, '', 1490351329, '2017-03-24 10:28:49'),
(24, 7, 20, 19, 12, 56, '', 1490351341, '2017-03-24 10:29:01'),
(25, 7, 20, 20, 12, 79, '', 1490351353, '2017-03-24 10:29:13'),
(26, 7, 8, 20, 14, 20, '', 1490351384, '2017-03-24 10:29:44'),
(27, 7, 8, 17, 12, 66, '', 1490351401, '2017-03-24 10:30:01'),
(28, 7, 8, 19, 17, 37, '', 1490351414, '2017-03-24 10:30:14'),
(29, 7, 10, 19, 20, 88, '', 1490351589, '2017-03-24 10:33:09'),
(30, 7, 12, 19, 14, 88, '哈哈哈哈', 1490511548, '2017-03-26 06:59:08'),
(31, 0, 9, 19, 12, 80, '小伙很好哦', 1491569100, '2017-04-07 13:51:10'),
(32, 0, 28, 20, 14, 60, '', 0, '2017-04-07 13:51:10'),
(33, 0, 12, 17, 12, 55, '', 0, '2017-04-07 13:51:10'),
(55, 7, 9, 19, 12, 80, '小伙很好哦', 1491569100, '2017-04-07 13:59:37'),
(56, 7, 28, 20, 14, 60, '', 0, '2017-04-07 13:59:37'),
(57, 7, 12, 17, 12, 55, '', 0, '2017-04-07 13:59:37'),
(58, 7, 57, 19, 20, 80, '', 1491981493, '2017-04-12 07:18:13'),
(59, 7, 38, 19, 20, 88, '', 1491981493, '2017-04-12 07:18:13');

-- --------------------------------------------------------

--
-- 表的结构 `sc_interval`
--

CREATE TABLE `sc_interval` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时段类别' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_interval`
--

INSERT INTO `sc_interval` (`id`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(14, '10:00-10:45', 1, 0, 0, '2016-12-25 09:19:00'),
(17, '11:00-11:45', 1, 0, 1482840012, '2016-12-27 12:00:12'),
(19, '13:00-13:45', 1, 0, 1482851842, '2016-12-27 15:17:22'),
(20, '14:00-14:45', 1, 0, 1482851855, '2016-12-27 15:17:35'),
(21, '15:00-15:45', 1, 0, 1482852585, '2016-12-27 15:29:45'),
(22, '16:00-16:45', 1, 0, 1482852593, '2016-12-27 15:29:53');

-- --------------------------------------------------------

--
-- 表的结构 `sc_layout`
--

CREATE TABLE `sc_layout` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `type` char(60) NOT NULL DEFAULT '' COMMENT '布局类型',
  `value` char(60) NOT NULL DEFAULT '' COMMENT '布局类型值',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `upd_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='布局管理' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sc_layout`
--

INSERT INTO `sc_layout` (`id`, `type`, `value`, `sort`, `upd_time`, `is_enable`) VALUES
(1, 'home_link', '', 255, 1487657767, 1),
(2, 'channel_link', '', 255, 1487657767, 1),
(3, 'detail_link', '', 255, 1487657767, 1),
(475, 'home', '84', 0, 1487728772, 1),
(494, 'channel', '100', 0, 1487741535, 1),
(501, 'detail', '100', 0, 1487747404, 1),
(504, 'channel', '100', 1, 1487747719, 1),
(505, 'home', '123', 2, 1487754569, 1),
(507, 'home', '100', 1, 1487758192, 1),
(509, 'detail', '100', 1, 1487835771, 1),
(512, 'home', '100', 3, 1494318051, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sc_layout_module`
--

CREATE TABLE `sc_layout_module` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `layout_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '布局id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模块名称',
  `right_title` char(255) NOT NULL DEFAULT '' COMMENT '右标题+链接（名称;链接）',
  `article_id` char(255) NOT NULL DEFAULT '' COMMENT '指定主题id（1,2,3）',
  `keyword` char(255) NOT NULL DEFAULT '' COMMENT '标题包含的关键字（win-unix;win|unix）',
  `show_number` int(10) UNSIGNED NOT NULL DEFAULT '10' COMMENT '显示条数',
  `abstract_number` int(10) UNSIGNED NOT NULL DEFAULT '80' COMMENT '摘要字数',
  `article_class_id` char(255) NOT NULL DEFAULT '' COMMENT '文章分类（序列化数据,一维数组）',
  `sort_type` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序方式',
  `add_time_interval` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发布时间段',
  `upd_time_interval` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间段',
  `title_style` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标题样式',
  `link_open_way` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '打开方式',
  `date_format` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '日期格式',
  `data_cache_time` int(10) UNSIGNED NOT NULL DEFAULT '60' COMMENT '数据缓存时间（单位分钟）',
  `summary` text COMMENT '自定义内容',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='布局模块' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sc_layout_module`
--

INSERT INTO `sc_layout_module` (`id`, `layout_id`, `name`, `right_title`, `article_id`, `keyword`, `show_number`, `abstract_number`, `article_class_id`, `sort_type`, `add_time_interval`, `upd_time_interval`, `title_style`, `link_open_way`, `date_format`, `data_cache_time`, `summary`, `add_time`, `upd_time`) VALUES
(788, 475, '', '', '', '', 8, 80, '7,10,16,17,18,24', 2, 0, 0, 310, 0, 0, 60, '', 1487728772, 1642653801),
(789, 475, '热门文章', '更多;http://gong.gg', '', '', 8, 80, '7,10,16,17,18,24', 2, 0, 0, 1, 0, 0, 60, '', 1487728772, 1642606930),
(827, 494, '热门文章', '更多;http://gong.gg', '', '', 10, 80, '7,10,16,17,18,24', 2, 0, 0, 1, 0, 1, 60, '', 1487741535, 1642607621),
(836, 501, '热门文章', '更多;http://gong.gg', '', '', 10, 80, '7,10,16,17,18,24', 2, 0, 0, 1, 0, 0, 60, '', 1487747404, 1642607516),
(840, 504, '美图', '', '', '', 6, 80, '7,10,16,17,18,24', 2, 0, 0, 12, 0, 0, 60, '', 1487747719, 1642607658),
(841, 505, '要事要闻', '更多;http://schoolcms.org/', '', '', 6, 80, '7', 0, 0, 0, 2, 0, 0, 60, '', 1487754570, 1642607974),
(842, 505, '时事政治', '更多;http://schoolcms.org/', '', '', 6, 80, '10', 0, 0, 0, 2, 0, 0, 60, '', 1487754571, 1642607990),
(843, 505, '热点评论', '更多;http://schoolcms.org/', '', '', 6, 80, '16', 0, 0, 0, 2, 0, 0, 60, '', 1487754572, 1642751754),
(844, 505, '学习理论', '更多;http://gong.gg', '', '', 6, 80, '17', 0, 0, 0, 2, 0, 0, 60, '', 1487754573, 1642751760),
(845, 505, '备战打战', '更多;http://gong.gg', '', '', 6, 80, '18', 0, 0, 0, 2, 0, 0, 60, '', 1487754582, 1642608037),
(846, 505, '外交发言', '更多;http://gong.gg', '', '', 6, 80, '24', 0, 0, 0, 2, 0, 0, 60, '', 1487754583, 1642608051),
(848, 507, '', '', '', '', 6, 160, '7,10,16,17,18,24', 2, 0, 0, 15, 0, 0, 60, '', 1487758192, 1642607334),
(851, 509, '图文', '更多;http://gong.gg', '', '', 10, 80, '7,10,16,17,18,24', 2, 0, 0, 6, 0, 0, 60, '', 1487835771, 1642607691),
(856, 512, '优秀官兵', '', '', '', 10, 80, '25', 0, 0, 0, 302, 0, 0, 60, '', 1494318051, 1642606837);

-- --------------------------------------------------------

--
-- 表的结构 `sc_link`
--

CREATE TABLE `sc_link` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` char(255) NOT NULL DEFAULT '' COMMENT 'url地址',
  `describe` char(60) NOT NULL DEFAULT '' COMMENT '数据类型（custom:自定义导航, article_class:文章分类, customview:自定义页面）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_new_window_open` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否新窗口打开（0否，1是）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sc_link`
--

INSERT INTO `sc_link` (`id`, `name`, `url`, `describe`, `sort`, `is_enable`, `is_new_window_open`, `add_time`, `upd_time`) VALUES
(1, 'SchoolCMS', 'http://schoolcms.org/', 'SchoolCMS学校教务管理系统', 1, 0, 1, 1486292373, '2022-01-19 03:30:43'),
(12, 'AmazeUI', 'http://amazeui.shopxo.net/', 'AmazeUI国内首个HTML5框架', 4, 1, 1, 1486353476, '2019-09-18 10:14:16'),
(13, '龚哥哥的博客', 'http://gong.gg/', '龚哥哥的博客', 2, 0, 1, 1486353528, '2022-01-19 03:30:44'),
(14, 'ThinkPHP', 'http://www.thinkphp.cn/', 'ThinkPHP', 3, 1, 1, 1487919160, '2017-02-24 06:53:31'),
(15, 'ShopXO免费开源商城', 'http://shopxo.net/', '国内领先企业级B2C开源电商系统！', 0, 0, 1, 1568801694, '2022-01-19 03:30:51'),
(16, '码云', 'https://gitee.com/gongfuxiang/schoolcms', '', 5, 1, 1, 1568801740, '2019-09-18 10:15:40'),
(17, 'Github', 'https://github.com/gongfuxiang/schoolcms', '', 6, 1, 1, 1568801766, '2019-09-18 10:16:06');

-- --------------------------------------------------------

--
-- 表的结构 `sc_mood`
--

CREATE TABLE `sc_mood` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` char(168) NOT NULL DEFAULT '' COMMENT '个人签名（最大字数168）',
  `visible` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '可见范围（0所有人可见, 1仅自己可见, 2好友可见, 3部分好友可见, 4部分好友不可见）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发表时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户说说';

--
-- 转存表中的数据 `sc_mood`
--

INSERT INTO `sc_mood` (`id`, `user_id`, `content`, `visible`, `add_time`) VALUES
(21, 15, '大家好，新来的，多多关照~', 0, 1491658779),
(26, 13, '嘻嘻嘻嘻是小狗', 0, 1491748949),
(28, 12, '不是所有的往事都是美好的，也不是所有的回忆都应该被留下。', 0, 1491879049);

-- --------------------------------------------------------

--
-- 表的结构 `sc_mood_comments`
--

CREATE TABLE `sc_mood_comments` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `mood_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '说说id',
  `reply_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '说说被回复的id',
  `content` char(255) NOT NULL DEFAULT '' COMMENT '评论内容（1~255个字符之间）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='说说评论';

--
-- 转存表中的数据 `sc_mood_comments`
--

INSERT INTO `sc_mood_comments` (`id`, `parent_id`, `user_id`, `mood_id`, `reply_id`, `content`, `add_time`) VALUES
(57, 0, 13, 21, 0, '洗洗', 1491809198),
(67, 0, 12, 26, 0, '你好，很高兴认识你', 1491809877),
(68, 0, 12, 26, 0, '你好，在没有嘛，', 1491809893),
(69, 67, 13, 26, 67, '你好，我也很高兴认识你哦。', 1491809913),
(70, 68, 13, 26, 68, '在呢，无处不在。', 1491809923);

-- --------------------------------------------------------

--
-- 表的结构 `sc_mood_praise`
--

CREATE TABLE `sc_mood_praise` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `mood_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '说说id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '赞说说的用户id',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='说说点赞';

--
-- 转存表中的数据 `sc_mood_praise`
--

INSERT INTO `sc_mood_praise` (`id`, `mood_id`, `user_id`, `add_time`) VALUES
(10, 23, 15, 1491718148),
(54, 21, 13, 1491818026),
(65, 28, 13, 1491879087),
(68, 28, 15, 1491879159),
(69, 21, 12, 1494325888);

-- --------------------------------------------------------

--
-- 表的结构 `sc_navigation`
--

CREATE TABLE `sc_navigation` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` char(255) NOT NULL DEFAULT '' COMMENT 'url地址',
  `value` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `data_type` char(30) NOT NULL DEFAULT '' COMMENT '数据类型（custom:自定义导航, article_class:文章分类, customview:自定义页面）',
  `nav_type` char(30) NOT NULL DEFAULT '' COMMENT '导航类型（header:顶部导航, footer:底部导航）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `is_new_window_open` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否新窗口打开（0否，1是）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导航' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sc_navigation`
--

INSERT INTO `sc_navigation` (`id`, `pid`, `name`, `url`, `value`, `data_type`, `nav_type`, `sort`, `is_show`, `is_new_window_open`, `add_time`, `upd_time`) VALUES
(2, 0, '要事要闻', '', 7, 'article_class', 'header', 0, 1, 0, 1486297310, '2022-01-18 09:37:43'),
(3, 0, '时事政治', '', 10, 'article_class', 'header', 0, 1, 0, 1486298744, '2022-01-19 03:25:14'),
(9, 0, '下拉菜单', '', 1, 'customview', 'header', 1, 1, 0, 1486352437, '2022-01-19 03:28:24'),
(10, 9, '自定义1', '', 1, 'customview', 'header', 0, 1, 0, 1486352476, '2022-01-19 03:28:26'),
(12, 0, '客户服务', 'http://schoolcms.org/', 0, 'custom', 'footer', 2, 1, 0, 1486353476, '2022-01-19 15:36:59'),
(14, 0, '龚哥哥的博客', 'http://gong.gg/', 0, 'custom', 'footer', 0, 0, 1, 1486525988, '2022-01-19 03:30:09'),
(15, 0, '联系我们', 'http://schoolcms.org/', 0, 'custom', 'footer', 0, 1, 0, 1486544708, '2017-02-08 09:05:08'),
(16, 0, '关于学生', '', 18, 'article_class', 'footer', 0, 0, 0, 1486544740, '2022-01-19 03:30:10'),
(17, 0, '第三页面跳转', 'http://schoolcms.org/', 0, 'custom', 'header', 10, 0, 1, 1487923617, '2022-01-19 03:24:49'),
(18, 0, '热点评论', '', 16, 'article_class', 'header', 0, 1, 0, 1642562732, '2022-01-19 03:25:32'),
(19, 0, '学习理论', '', 17, 'article_class', 'header', 0, 1, 0, 1642562754, '2022-01-19 03:25:54'),
(20, 0, '备战打战', '', 18, 'article_class', 'header', 0, 1, 0, 1642562767, '2022-01-19 03:26:07'),
(21, 0, '外交发言', '', 24, 'article_class', 'header', 0, 1, 0, 1642562778, '2022-01-19 03:26:18'),
(22, 9, '自定义2', '', 1, 'customview', 'header', 0, 1, 0, 1642562947, '2022-01-19 03:29:37');

-- --------------------------------------------------------

--
-- 表的结构 `sc_power`
--

CREATE TABLE `sc_power` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '权限id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '权限父级id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '权限名称',
  `control` char(30) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '方法名称',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `icon` char(60) NOT NULL DEFAULT '' COMMENT '图标class',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_power`
--

INSERT INTO `sc_power` (`id`, `pid`, `name`, `control`, `action`, `sort`, `is_show`, `icon`, `add_time`) VALUES
(1, 0, '权限控制', 'Power', 'Index', 1, 1, 'am-icon-recycle', 1481612301),
(4, 1, '角色管理', 'Power', 'Role', 11, 1, '', 1481639037),
(8, 0, '类别管理', 'Routine', 'Index', 20, 1, 'am-icon-yelp', 1481697671),
(10, 8, '班级分类', 'Class', 'Index', 20, 1, '', 1481727987),
(11, 8, '科目分类', 'Subject', 'Index', 30, 1, '', 1481728003),
(12, 8, '学期分类', 'Semester', 'Index', 0, 1, '', 1481728021),
(13, 1, '权限分配', 'Power', 'Index', 21, 1, '', 1482156143),
(15, 1, '权限添加/编辑', 'Power', 'PowerSave', 22, 0, '', 1482243750),
(16, 1, '权限删除', 'Power', 'PowerDelete', 23, 0, '', 1482243797),
(17, 1, '角色组添加/编辑页面', 'Power', 'RoleSaveInfo', 12, 0, '', 1482243855),
(18, 1, '角色组添加/编辑', 'Power', 'RoleSave', 13, 0, '', 1482243888),
(19, 1, '管理员添加/编辑页面', 'Admin', 'SaveInfo', 2, 0, '', 1482244637),
(20, 1, '管理员添加/编辑', 'Admin', 'Save', 3, 0, '', 1482244666),
(21, 1, '管理员删除', 'Admin', 'Delete', 4, 0, '', 1482244688),
(22, 1, '管理员列表', 'Admin', 'Index', 1, 1, '', 1482568868),
(23, 1, '角色删除', 'Power', 'RoleDelete', 14, 0, '', 1482569155),
(24, 8, '成绩分类', 'Score', 'Index', 40, 1, '', 1482638641),
(25, 8, '周分类', 'Week', 'Index', 50, 1, '', 1482638899),
(26, 8, '时段分类', 'Interval', 'Index', 60, 1, '', 1482638982),
(27, 8, '地区管理', 'Region', 'Index', 70, 1, '', 1482639024),
(28, 0, '学生管理', 'Student', 'Index', 2, 1, 'am-icon-mortar-board fs-12', 1482854151),
(29, 28, '学生列表', 'Student', 'Index', 1, 1, '', 1482854186),
(30, 0, '成绩管理', 'Fraction', 'Index', 3, 1, 'am-icon-line-chart fs-12', 1482854384),
(31, 30, '学生成绩', 'Fraction', 'Index', 1, 1, '', 1482854429),
(32, 28, '学生添加/编辑页面', 'Student', 'SaveInfo', 2, 0, '', 1482915262),
(33, 28, '学生添加/编辑', 'Student', 'Save', 3, 0, '', 1482915761),
(34, 28, '学生删除', 'Student', 'Delete', 4, 0, '', 1482915804),
(35, 30, '成绩录入页面', 'Fraction', 'SaveInfo', 2, 0, '', 1483096318),
(36, 30, '成绩删除', 'Fraction', 'Delete', 4, 0, '', 1483096348),
(37, 30, '成绩添加/编辑', 'Fraction', 'Save', 3, 0, '', 1483176255),
(38, 0, '教师管理', 'Teacher', 'Index', 4, 1, 'am-icon-legal', 1483283430),
(39, 38, '教师管理', 'Teacher', 'Index', 1, 1, '', 1483283546),
(40, 38, '课程安排', 'Course', 'Index', 20, 1, '', 1483283640),
(41, 0, '后台配置', 'Config', 'Index', 0, 1, 'am-icon-gear', 1483362358),
(42, 41, '配置保存', 'Config', 'Save', 1, 0, '', 1483432335),
(43, 8, '学期添加/编辑', 'Semester', 'Save', 1, 0, '', 1483456550),
(44, 8, '班级添加/编辑', 'Class', 'Save', 21, 0, '', 1483456605),
(45, 8, '科目添加/编辑', 'Subject', 'Save', 31, 0, '', 1483456640),
(46, 8, '成绩添加/编辑', 'Score', 'Save', 41, 0, '', 1483456687),
(47, 8, '周添加/编辑', 'Week', 'Save', 51, 0, '', 1483456721),
(48, 8, '时段添加/编辑', 'Interval', 'Save', 61, 0, '', 1483456748),
(49, 8, '地区添加/编辑', 'Region', 'Save', 71, 0, '', 1483456778),
(50, 8, '学期删除', 'Semester', 'Delete', 2, 0, '', 1483457140),
(51, 8, '班级删除', 'Class', 'Delete', 22, 0, '', 1483457222),
(52, 8, '科目删除', 'Subject', 'Delete', 32, 0, '', 1483457265),
(53, 8, '成绩删除', 'Score', 'Delete', 42, 0, '', 1483457291),
(54, 8, '周删除', 'Week', 'Delete', 52, 0, '', 1483457365),
(55, 8, '时段删除', 'Interval', 'Delete', 62, 0, '', 1483457405),
(56, 8, '地区删除', 'Region', 'Delete', 72, 0, '', 1483457442),
(57, 38, '教师添加/编辑页面', 'Teacher', 'SaveInfo', 2, 0, '', 1483616439),
(58, 38, '教师添加/编辑', 'Teacher', 'Save', 3, 0, '', 1483616492),
(59, 38, '教师删除', 'Teacher', 'Delete', 4, 0, '', 1483616569),
(60, 38, '课程添加/编辑页面', 'Course', 'SaveInfo', 21, 0, '', 1483790861),
(61, 38, '课程添加/编辑', 'Course', 'Save', 22, 0, '', 1483790940),
(62, 38, '课程删除', 'Course', 'Delete', 23, 0, '', 1483790962),
(63, 28, 'Excel导出', 'Student', 'ExcelExport', 5, 0, '', 1484058295),
(64, 30, 'Excel导出', 'Fraction', 'ExcelExport', 5, 0, '', 1484058375),
(65, 38, 'Excel导出', 'Teacher', 'ExcelExport', 5, 0, '', 1484058437),
(66, 38, 'Excel导出', 'Course', 'ExcelExport', 24, 0, '', 1484058488),
(67, 38, '课程状态更新', 'Course', 'StateUpdate', 25, 0, '', 1484231130),
(68, 8, '教室管理', 'Room', 'Index', 80, 1, '', 1484304475),
(69, 8, '教室添加/编辑', 'Room', 'Save', 81, 0, '', 1484304519),
(70, 8, '教室删除', 'Room', 'Delete', 82, 0, '', 1484304545),
(71, 8, '文章分类', 'ArticleClass', 'Index', 90, 1, '', 1484580289),
(72, 8, '文章分类编辑/添加', 'ArticleClass', 'Save', 91, 0, '', 1484580380),
(73, 8, '文章分类删除', 'ArticleClass', 'Delete', 92, 0, '', 1484580436),
(74, 0, '文章管理', 'Article', 'Index', 5, 1, 'am-icon-folder-open', 1484581913),
(75, 74, '文章管理', 'Article', 'Index', 0, 1, '', 1484581938),
(76, 74, '文章添加/编辑页面', 'Article', 'SaveInfo', 1, 0, '', 1484740785),
(77, 74, '文章添加/编辑', 'Article', 'Save', 2, 0, '', 1484740810),
(78, 74, '文章删除', 'Article', 'Delete', 3, 0, '', 1484740826),
(79, 74, 'Excel导出', 'Article', 'ExcelExport', 6, 0, '', 1484981822),
(80, 74, '文章状态更新', 'Article', 'StateUpdate', 7, 0, '', 1484982416),
(81, 0, '站点配置', 'Site', 'Index', 9, 1, 'am-icon-cogs', 1486182943),
(82, 102, '中间导航', 'NavHeader', 'Index', 0, 1, '', 1486183114),
(83, 102, '底部导航', 'NavFooter', 'Index', 11, 1, '', 1486183145),
(84, 102, '导航添加/编辑页面', 'NavHeader', 'SaveInfo', 1, 0, '', 1486183347),
(85, 102, '导航添加/编辑', 'NavHeader', 'Save', 2, 0, '', 1486183367),
(86, 102, '导航删除', 'NavHeader', 'Delete', 3, 0, '', 1486183410),
(87, 102, '导航状态更新', 'NavHeader', 'StateUpdate', 4, 0, '', 1486183462),
(88, 102, '导航添加/编辑页面', 'NavFooter', 'SaveInfo', 12, 0, '', 1486183538),
(89, 102, '导航添加/编辑', 'NavFooter', 'Save', 13, 0, '', 1486183800),
(90, 102, '导航删除', 'NavFooter', 'Delete', 14, 0, '', 1486192992),
(91, 102, '导航状态更新', 'NavFooter', 'StateUpdate', 15, 0, '', 1486193042),
(92, 102, '自定义页面', 'CustomView', 'Index', 21, 1, '', 1486193400),
(93, 102, '自定义页面添加/编辑页面', 'CustomView', 'SaveInfo', 22, 0, '', 1486193449),
(94, 102, '自定义页面添加/编辑', 'CustomView', 'Save', 23, 0, '', 1486193473),
(95, 102, '自定义页面删除', 'CustomView', 'Delete', 24, 0, '', 1486193516),
(96, 102, '自定义页面状态更新', 'CustomView', 'StateUpdate', 25, 0, '', 1486193582),
(97, 102, '友情链接', 'Link', 'Index', 31, 1, '', 1486194358),
(98, 102, '友情链接添加/编辑页面', 'Link', 'SaveInfo', 32, 0, '', 1486194392),
(99, 102, '友情链接添加/编辑', 'Link', 'Save', 33, 0, '', 1486194413),
(100, 102, '友情链接删除', 'Link', 'Delete', 34, 0, '', 1486194435),
(101, 102, '友情链接状态更新', 'Link', 'StateUpdate', 35, 0, '', 1486194479),
(102, 0, '网站管理', 'NavHeader', 'Index', 10, 1, 'am-icon-university fs-12', 1486561030),
(103, 81, '站点设置', 'Site', 'Index', 0, 1, '', 1486561470),
(104, 81, '短信设置', 'Sms', 'Index', 3, 1, '', 1486561615),
(105, 81, '站点设置添加/编辑', 'Site', 'Save', 1, 0, '', 1486561780),
(106, 81, 'SEO设置', 'Seo', 'Index', 51, 1, '', 1486561958),
(107, 81, '短信设置添加/编辑', 'Sms', 'Save', 4, 0, '', 1486562011),
(108, 81, 'SEO设置添加/编辑', 'Seo', 'Save', 52, 0, '', 1486562038),
(109, 102, '页面设置', 'View', 'Index', 41, 1, '', 1486562396),
(110, 102, '获取模块数据/保存', 'View', 'GetLayoutModuleData', 42, 0, '', 1486562436),
(111, 102, '布局添加/编辑', 'View', 'LayoutSave', 43, 0, '', 1486562480),
(112, 102, '模块添加', 'View', 'ModuleAdd', 47, 0, '', 1487341698),
(113, 102, '模块保存', 'View', 'ModuleSave', 48, 0, '', 1487341728),
(114, 102, '布局状态更新', 'View', 'StateUpdate', 44, 0, '', 1487563663),
(115, 102, '布局删除', 'View', 'LayoutDelete', 45, 0, '', 1487569443),
(116, 102, '模块删除', 'View', 'ModuleDelete', 49, 0, '', 1487569470),
(117, 102, '布局排序保存', 'View', 'LayoutSortSave', 46, 0, '', 1487578045),
(118, 0, '工具', 'Tool', 'Index', 30, 1, 'am-icon-coffee', 1488108044),
(119, 118, '缓存管理', 'Cache', 'Index', 1, 1, '', 1488108107),
(120, 118, '站点缓存更新', 'Cache', 'SiteUpdate', 2, 0, '', 1488108235),
(121, 118, '模板缓存更新', 'Cache', 'TemplateUpdate', 2, 0, '', 1488108390),
(122, 118, '模块缓存更新', 'Cache', 'ModuleUpdate', 3, 0, '', 1488108436),
(123, 81, '邮箱设置', 'Email', 'Index', 5, 1, '', 1488531116),
(124, 81, '邮箱添加/编辑', 'Email', 'Save', 6, 0, '', 1489056600),
(125, 81, '邮件发送测试', 'Email', 'EmailTest', 7, 0, '', 1489131159),
(126, 0, '用户管理', 'User', 'Index', 11, 1, 'am-icon-user', 1490794162),
(127, 126, '用户列表', 'User', 'Index', 0, 1, '', 1490794316),
(128, 126, '用户编辑/添加页面', 'User', 'SaveInfo', 1, 0, '', 1490794458),
(129, 126, '用户添加/编辑', 'User', 'Save', 2, 0, '', 1490794510),
(130, 126, '用户删除', 'User', 'Delete', 3, 0, '', 1490794585),
(131, 28, 'Excel导入', 'Student', 'ExcelImport', 6, 0, '', 1491468767),
(132, 30, 'Excel导入', 'Fraction', 'ExcelImport', 6, 0, '', 1491569358),
(133, 0, '冒泡管理', 'Bubble', 'Index', 12, 1, 'am-icon-slideshare', 1491818684),
(134, 133, '冒泡广场', 'Bubble', 'Index', 0, 1, '', 1491818817),
(135, 133, '说说删除', 'Bubble', 'MoodDelete', 1, 0, '', 1491992341),
(136, 133, '说说点赞删除', 'Bubble', 'MoodPraiseDelete', 2, 0, '', 1491992378),
(137, 133, '说说评论删除', 'Bubble', 'MoodCommentsDelete', 3, 0, '', 1491992409),
(138, 102, '主题管理', 'Theme', 'Index', 60, 1, '', 1494381693),
(139, 102, '主题管理添加/编辑', 'Theme', 'Save', 61, 0, '', 1494398194),
(140, 102, '主题上传安装', 'Theme', 'Upload', 62, 0, '', 1494405096),
(141, 102, '主题删除', 'Theme', 'Delete', 63, 0, '', 1494410655),
(142, 102, '布局导出', 'View', 'LayoutExport', 50, 0, '', 1494490765),
(143, 102, '布局导入', 'View', 'LayoutImport', 51, 0, '', 1494490833);

-- --------------------------------------------------------

--
-- 表的结构 `sc_region`
--

CREATE TABLE `sc_region` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_region`
--

INSERT INTO `sc_region` (`id`, `pid`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(7, 0, '谯家镇2', 1, 2, 0, '2016-12-25 06:41:23'),
(8, 7, '印山村2', 1, 0, 0, '2016-12-25 06:41:38'),
(9, 8, '康家坨', 1, 0, 0, '2016-12-25 06:41:54'),
(10, 0, '夹石镇', 0, 1, 0, '2016-12-25 06:42:31'),
(11, 10, '水进湾', 1, 0, 0, '2016-12-25 06:42:53'),
(12, 0, '小垫矮', 1, 0, 0, '2016-12-25 06:43:30'),
(14, 8, '麻池', 1, 0, 0, '2016-12-25 09:19:00'),
(15, 8, '并蛋鸭', 1, 0, 0, '2016-12-25 09:19:17'),
(17, 0, '试试水', 1, 0, 1482847113, '2016-12-27 13:58:33'),
(18, 7, '时代复分', 1, 0, 1482850246, '2016-12-27 14:50:46'),
(19, 9, '的方法发', 1, 0, 1482851116, '2016-12-27 15:05:16'),
(20, 17, 'sdfsd', 1, 0, 1484204770, '2017-01-12 07:06:10'),
(21, 0, '鲁竹坝', 1, 0, 1491923034, '2017-04-11 15:03:54'),
(22, 0, '熊家岩', 1, 0, 1491923042, '2017-04-11 15:04:02'),
(23, 0, '洞下槽', 1, 0, 1491923051, '2017-04-11 15:04:11'),
(24, 0, '蓼叶村', 1, 0, 1491923062, '2017-04-11 15:04:22'),
(25, 0, '张家槽', 1, 0, 1491923073, '2017-04-11 15:04:33');

-- --------------------------------------------------------

--
-- 表的结构 `sc_role`
--

CREATE TABLE `sc_role` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '角色组id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '角色名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色组' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_role`
--

INSERT INTO `sc_role` (`id`, `name`, `is_enable`, `add_time`, `upd_time`) VALUES
(1, '系统管理员', 1, 1481350313, '2017-01-08 09:06:24'),
(13, '超级管理员', 1, 1484402362, '2017-01-14 13:59:22');

-- --------------------------------------------------------

--
-- 表的结构 `sc_role_power`
--

CREATE TABLE `sc_role_power` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '关联id',
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '角色id',
  `power_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '权限id',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与权限管理' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_role_power`
--

INSERT INTO `sc_role_power` (`id`, `role_id`, `power_id`, `add_time`) VALUES
(1263, 13, 41, 1491992489),
(1264, 13, 42, 1491992489),
(1265, 13, 1, 1491992489),
(1266, 13, 22, 1491992489),
(1267, 13, 4, 1491992489),
(1268, 13, 28, 1491992489),
(1269, 13, 29, 1491992489),
(1270, 13, 32, 1491992489),
(1271, 13, 33, 1491992489),
(1272, 13, 34, 1491992489),
(1273, 13, 63, 1491992489),
(1274, 13, 131, 1491992489),
(1275, 13, 30, 1491992489),
(1276, 13, 31, 1491992489),
(1277, 13, 35, 1491992489),
(1278, 13, 37, 1491992489),
(1279, 13, 36, 1491992489),
(1280, 13, 64, 1491992489),
(1281, 13, 132, 1491992489),
(1282, 13, 38, 1491992489),
(1283, 13, 39, 1491992489),
(1284, 13, 57, 1491992489),
(1285, 13, 58, 1491992489),
(1286, 13, 59, 1491992489),
(1287, 13, 65, 1491992489),
(1288, 13, 40, 1491992489),
(1289, 13, 60, 1491992489),
(1290, 13, 61, 1491992489),
(1291, 13, 62, 1491992489),
(1292, 13, 66, 1491992489),
(1293, 13, 67, 1491992489),
(1294, 13, 74, 1491992489),
(1295, 13, 75, 1491992489),
(1296, 13, 76, 1491992489),
(1297, 13, 77, 1491992489),
(1298, 13, 78, 1491992489),
(1299, 13, 79, 1491992489),
(1300, 13, 80, 1491992489),
(1301, 13, 81, 1491992489),
(1302, 13, 103, 1491992489),
(1303, 13, 105, 1491992489),
(1304, 13, 104, 1491992489),
(1305, 13, 107, 1491992489),
(1306, 13, 123, 1491992489),
(1307, 13, 124, 1491992489),
(1308, 13, 125, 1491992489),
(1309, 13, 106, 1491992489),
(1310, 13, 108, 1491992489),
(1311, 13, 102, 1491992489),
(1312, 13, 82, 1491992489),
(1313, 13, 84, 1491992489),
(1314, 13, 85, 1491992489),
(1315, 13, 86, 1491992489),
(1316, 13, 87, 1491992489),
(1317, 13, 83, 1491992489),
(1318, 13, 88, 1491992489),
(1319, 13, 89, 1491992489),
(1320, 13, 90, 1491992489),
(1321, 13, 91, 1491992489),
(1322, 13, 92, 1491992489),
(1323, 13, 93, 1491992489),
(1324, 13, 94, 1491992489),
(1325, 13, 95, 1491992489),
(1326, 13, 96, 1491992489),
(1327, 13, 97, 1491992489),
(1328, 13, 98, 1491992489),
(1329, 13, 99, 1491992489),
(1330, 13, 100, 1491992489),
(1331, 13, 101, 1491992489),
(1332, 13, 109, 1491992489),
(1333, 13, 126, 1491992489),
(1334, 13, 127, 1491992489),
(1335, 13, 128, 1491992489),
(1336, 13, 129, 1491992489),
(1337, 13, 130, 1491992489),
(1338, 13, 133, 1491992489),
(1339, 13, 134, 1491992489),
(1340, 13, 135, 1491992489),
(1341, 13, 136, 1491992489),
(1342, 13, 137, 1491992489),
(1343, 13, 8, 1491992489),
(1344, 13, 12, 1491992489),
(1345, 13, 43, 1491992489),
(1346, 13, 50, 1491992489),
(1347, 13, 10, 1491992489),
(1348, 13, 44, 1491992489),
(1349, 13, 51, 1491992489),
(1350, 13, 11, 1491992489),
(1351, 13, 45, 1491992489),
(1352, 13, 52, 1491992489),
(1353, 13, 24, 1491992489),
(1354, 13, 46, 1491992489),
(1355, 13, 53, 1491992489),
(1356, 13, 25, 1491992489),
(1357, 13, 47, 1491992489),
(1358, 13, 54, 1491992489),
(1359, 13, 26, 1491992489),
(1360, 13, 48, 1491992489),
(1361, 13, 55, 1491992489),
(1362, 13, 27, 1491992489),
(1363, 13, 49, 1491992489),
(1364, 13, 56, 1491992489),
(1365, 13, 68, 1491992489),
(1366, 13, 69, 1491992489),
(1367, 13, 70, 1491992489),
(1368, 13, 71, 1491992489),
(1369, 13, 72, 1491992489),
(1370, 13, 73, 1491992489),
(1371, 13, 118, 1491992489),
(1372, 13, 119, 1491992489),
(1373, 13, 120, 1491992489),
(1374, 13, 121, 1491992489),
(1375, 13, 122, 1491992489);

-- --------------------------------------------------------

--
-- 表的结构 `sc_room`
--

CREATE TABLE `sc_room` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室类别' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_room`
--

INSERT INTO `sc_room` (`id`, `pid`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(7, 0, '东区', 1, 0, 0, '2016-12-25 06:41:23'),
(10, 0, '西北区', 1, 0, 0, '2016-12-25 06:42:31'),
(16, 0, '天才班专用教室1号', 1, 0, 1482840545, '2016-12-27 12:09:05'),
(17, 7, '教室一', 1, 0, 1482840557, '2016-12-27 12:09:17'),
(18, 7, '教室二', 1, 0, 1482840577, '2016-12-27 12:09:37'),
(19, 10, '教室一', 1, 0, 1482922284, '2016-12-28 10:51:24'),
(20, 10, '教室二', 1, 0, 1482922305, '2016-12-28 10:51:45'),
(21, 10, '教室三', 1, 0, 1482922320, '2016-12-28 10:52:00'),
(24, 0, 'VIP教室', 1, 0, 1483951541, '2017-01-09 08:45:41');

-- --------------------------------------------------------

--
-- 表的结构 `sc_score`
--

CREATE TABLE `sc_score` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成绩类别' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_score`
--

INSERT INTO `sc_score` (`id`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(12, '第一期', 1, 0, 0, '2016-12-25 06:43:30'),
(14, '第二期', 1, 0, 0, '2016-12-25 09:19:00'),
(17, '第三期', 1, 0, 1482840012, '2016-12-27 12:00:12'),
(19, '第四期', 1, 0, 1482851842, '2016-12-27 15:17:22'),
(20, '第五期', 1, 0, 1482851855, '2016-12-27 15:17:35');

-- --------------------------------------------------------

--
-- 表的结构 `sc_semester`
--

CREATE TABLE `sc_semester` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学期类别' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_semester`
--

INSERT INTO `sc_semester` (`id`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(7, '2016上学期', 1, 255, 0, '2016-12-25 06:41:23'),
(8, '2016下学期', 1, 0, 0, '2016-12-25 06:41:38'),
(18, '测试学期', 1, 0, 1483952728, '2017-01-09 09:05:28');

-- --------------------------------------------------------

--
-- 表的结构 `sc_student`
--

CREATE TABLE `sc_student` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '学生id',
  `number` char(15) NOT NULL DEFAULT '' COMMENT '学生编号-唯一（年份+8位自增id，不足以0前置补齐）',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `id_card` char(18) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `semester_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学期id',
  `class_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '班级id',
  `region_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '地区id',
  `address` char(150) NOT NULL DEFAULT '' COMMENT '详细地址',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '座机号码',
  `my_mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码-学生本人',
  `parent_mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码-家长',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱（最大长度60个字符）',
  `state` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学生状态（0待入学, 1在读, 2已毕业, 3弃学, 4已开除）',
  `tuition_state` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学费缴纳状态（0未缴费，1缴费）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_student`
--

INSERT INTO `sc_student` (`id`, `number`, `username`, `id_card`, `gender`, `birthday`, `semester_id`, `class_id`, `region_id`, `address`, `tel`, `my_mobile`, `parent_mobile`, `email`, `state`, `tuition_state`, `add_time`, `upd_time`) VALUES
(8, '201700000008', '留洋厄尔', '142613199904234622', 2, 917391600, 7, 22, 7, '尔尔', '03667879265', '17091959688', '17602128368', 'fuxiang.gong@qq.com', 0, 0, 1483932878, 1490164767),
(9, '201700000009', '张三', '533338198988888888', 2, 735948000, 7, 19, 8, '学校附近的888号', '17000000000', '', '17602128368', 'fuxiang.gong@qq.com', 1, 1, 1483936027, 1490239419),
(10, '201700000010', '武松打虎', '677771999999999992', 2, 633740400, 7, 23, 9, '', '17666666666', '', '17602128368', '', 1, 1, 1483936080, 1490351228),
(11, '201700000011', '小花', '211118199102111666', 1, 735948000, 7, 19, 11, '住校', '13199999999', '', '17602128368', '386392432@qq.com', 1, 1, 1483936138, 1490350032),
(12, '201700000012', '大哥哥', '399998198898998887', 2, 839368800, 7, 16, 14, '', '13222222222', '17091959688', '17602128368', 'fuxiang.gong@qq.com', 1, 1, 1483936199, 1490511285),
(13, '201700000013', '地地道道', '441801198810252656', 2, 1483830000, 8, 18, 9, '111', '15915110562', '', '17602128368', '', 3, 1, 1483948630, 1491641761),
(14, '201700000014', '测试学生', '522228199111111111', 2, 666547200, 8, 17, 9, '20号', '', '', '17602128368', '386392432@qq.com', 0, 0, 1488426236, 1488449382),
(19, '201700000014', 'ddddd', '522228199111111111', 0, 1264633200, 7, 17, 8, '1111', '', '', '17602128368', '', 0, 0, 1490179826, 0),
(20, '201700000013', '地地道道', '441801198810252656', 2, 1299279600, 7, 17, 7, '11', '', '', '17602128368', '', 1, 0, 1490180081, 1490180350),
(28, '201700000028', 'excel导入', '522228199602111888', 1, 666201600, 7, 18, 14, '44顺丰速递发', '', '', '17000000011', '', 0, 1, 0, 0),
(29, '201700000029', 'excel导入2', '522228199602111899', 1, 666201600, 7, 18, 14, '44顺丰速递发', '', '', '17000000011', '', 0, 1, 0, 0),
(30, '201700000030', 'excel导入3', '522228199602111877', 1, 666201600, 7, 18, 14, '44顺丰速递发', '', '', '17000000011', '', 0, 1, 0, 0),
(31, '201700000031', 'excel导入4', '522228199602111866', 1, 666201600, 7, 18, 14, '44顺丰速递发', '', '', '17000000011', '', 0, 1, 0, 0),
(32, '201700000032', 'excel导入5', '522228199602111855', 1, 666201600, 7, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(33, '201700000033', 'excel导入6', '522228199602111844', 1, 666201600, 7, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(34, '201700000034', 'excel导入77', '522228199602111833', 1, 666201600, 7, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 1491551457),
(35, '201700000035', 'excel导入77', '522228199602110000', 1, 666201600, 7, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(36, '201700000036', 'excel导入10', '522228199602111831', 1, 666201600, 7, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(37, '201700000037', 'excel导入11', '522228199602111830', 1, 666201600, 7, 18, 14, 'fff放飞关', '', '', '17000000011', '', 0, 0, 0, 0),
(38, '201700000038', '导入测试数据1', '522228199102111555', 2, 667152000, 7, 20, 9, '东方时代浮点数', '021-22222222', '17602128368', '17091959688', 'fuxiang.gong@qq.com', 0, 1, 0, 0),
(39, '201700000039', '导入测试数据2', '522228199102111551', 1, 667152000, 7, 20, 9, '东方时代浮点数', '021-22222222', '17602128368', '17091959688', 'fuxiang.gong@qq.com', 1, 1, 0, 0),
(40, '201700000040', '留洋厄尔', '142613199904234622', 2, 917366400, 8, 22, 7, '尔尔', '03667879265', '17091959688', '17602128368', 'fuxiang.gong@qq.com', 0, 0, 1483932878, 0),
(41, '201700000041', '张三', '533338198988888888', 2, 735926400, 8, 19, 8, '学校附近的888号', '17000000000', '', '17602128368', 'fuxiang.gong@qq.com', 1, 1, 1483936027, 0),
(42, '201700000042', '武松打虎', '677771999999999992', 2, 633715200, 8, 23, 9, '', '17666666666', '', '17602128368', '', 1, 1, 1483936080, 0),
(43, '201700000043', '小花', '211118199102111666', 1, 735926400, 8, 19, 11, '住校', '13199999999', '', '17602128368', '386392432@qq.com', 1, 1, 1483936138, 0),
(44, '201700000044', '大哥哥', '399998198898998887', 2, 839347200, 8, 16, 14, '', '13222222222', '17091959688', '17602128368', 'fuxiang.gong@qq.com', 1, 1, 1483936199, 0),
(45, '201700000045', 'excel导入', '522228199602111888', 1, 666201600, 8, 18, 14, '44顺丰速递发', '', '', '17000000011', '', 0, 1, 0, 0),
(46, '201700000046', 'excel导入2', '522228199602111899', 1, 666201600, 8, 18, 14, '44顺丰速递发', '', '', '17000000011', '', 0, 1, 0, 0),
(47, '201700000047', 'excel导入3', '522228199602111877', 1, 666201600, 8, 18, 14, '44顺丰速递发', '', '', '17000000011', '', 0, 1, 0, 0),
(48, '201700000048', 'excel导入4', '522228199602111866', 1, 666201600, 8, 18, 14, '44顺丰速递发', '', '', '17000000011', '', 0, 1, 0, 0),
(49, '201700000049', 'excel导入5', '522228199602111855', 1, 666201600, 8, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(50, '201700000050', 'excel导入6', '522228199602111844', 1, 666201600, 8, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(51, '201700000051', 'excel导入77', '522228199602111833', 1, 666201600, 8, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(52, '201700000052', 'excel导入77', '522228199602110000', 1, 666201600, 8, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(53, '201700000053', 'excel导入10', '522228199602111831', 1, 666201600, 8, 18, 14, '大范甘迪哥', '', '', '17000000011', '', 0, 0, 0, 0),
(54, '201700000054', 'excel导入11', '522228199602111830', 1, 666201600, 8, 18, 14, 'fff放飞关', '', '', '17000000011', '', 0, 0, 0, 0),
(55, '201700000055', '导入测试数据1', '522228199102111555', 2, 667152000, 8, 20, 9, '东方时代浮点数', '021-22222222', '17602128368', '17091959688', 'fuxiang.gong@qq.com', 0, 1, 0, 0),
(56, '201700000056', '导入测试数据2', '522228199102111551', 1, 667152000, 8, 20, 9, '东方时代浮点数', '021-22222222', '17602128368', '17091959688', 'fuxiang.gong@qq.com', 1, 1, 0, 0),
(57, '201700000057', '导入测试数据2', '522228199102111999', 2, 667152000, 7, 20, 9, 'sfSD发生的发收到', '021-22222222', '17602128368', '17091959688', 'fuxiang.gong@qq.com', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sc_subject`
--

CREATE TABLE `sc_subject` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目类别' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_subject`
--

INSERT INTO `sc_subject` (`id`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(17, '政治', 1, 0, 1482840012, '2016-12-27 12:00:12'),
(19, '化学', 1, 0, 1482851842, '2016-12-27 15:17:22'),
(20, '地理', 1, 0, 1482851855, '2016-12-27 15:17:35');

-- --------------------------------------------------------

--
-- 表的结构 `sc_teacher`
--

CREATE TABLE `sc_teacher` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '学生id',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `id_card` char(18) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `birthday` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '生日',
  `address` char(150) NOT NULL DEFAULT '' COMMENT '详细地址',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '联系方式（手机或座机）',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱（最大长度60个字符）',
  `state` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '教师状态（0待报道, 1在职, 2已离职, 3已退休, 4已开除）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_teacher`
--

INSERT INTO `sc_teacher` (`id`, `username`, `id_card`, `gender`, `birthday`, `address`, `tel`, `mobile`, `email`, `state`, `add_time`, `upd_time`) VALUES
(1, '张老师', '222228198888888888', 0, 318182400, '', '021-22222222', '17602128368', 'fuxiang.gong@qq.com', 0, 1483936487, 1489128497),
(2, '刘老师', '822228198999999999', 2, 2390400, '哈哈呵呵', '021-33333333', '13162155626', '', 1, 1483957038, 1488449060),
(3, 'hello', '522228198888888888', 2, 1367424000, '梵蒂冈', '17602128368', '', '', 2, 1484211799, 0),
(4, '的方法', '522229199999999933', 2, 1367424000, '电饭锅sdfsfsdfdfs', '021-33333333', '', '', 1, 1484211920, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sc_teacher_subject`
--

CREATE TABLE `sc_teacher_subject` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '关联id',
  `teacher_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '教师id',
  `subject_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '科目id',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师科目关联' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_teacher_subject`
--

INSERT INTO `sc_teacher_subject` (`id`, `teacher_id`, `subject_id`, `add_time`) VALUES
(14, 4, 17, 1484212426),
(15, 4, 20, 1484212426),
(16, 3, 19, 1484212442),
(17, 3, 20, 1484212442),
(45, 2, 20, 1488449060),
(51, 1, 19, 1489128497);

-- --------------------------------------------------------

--
-- 表的结构 `sc_user`
--

CREATE TABLE `sc_user` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(50) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `pwd` char(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `salt` char(6) NOT NULL DEFAULT '' COMMENT '配合密码加密的随机数',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `signature` char(168) NOT NULL DEFAULT '' COMMENT '个人签名（最大字数168）',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '个人描述（最大字数255）',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户状态',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `sc_user`
--

INSERT INTO `sc_user` (`id`, `mobile`, `email`, `pwd`, `salt`, `nickname`, `gender`, `birthday`, `signature`, `describe`, `state`, `add_time`, `upd_time`) VALUES
(12, '17602128368', 'gfx@gongfuxiang.com', '2e5a15ef6dce8cadb0999a34b0191e97', '161176', 'gongfuxiang', 2, 702684000, '测试删除说说', '', 0, 1489117020, 1494325853),
(13, '17091959688', 'fuxiang.gong@qq.com', '3b270aeb48531e52c9b5fa28dd8f3339', '778722', '魔鬼', 2, 666201600, 'hello', '喜欢睡觉觉', 0, 1489141439, 1492101203),
(15, '13162155626', '', '8412e2af117e9cfd3d102cedade8c58d', '327579', '测试用户', 0, 0, '测试看看哈', '', 1, 1490867166, 1491982342);

-- --------------------------------------------------------

--
-- 表的结构 `sc_user_student`
--

CREATE TABLE `sc_user_student` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `student_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学生id',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关联学生';

--
-- 转存表中的数据 `sc_user_student`
--

INSERT INTO `sc_user_student` (`id`, `user_id`, `student_id`, `add_time`) VALUES
(1, 13, 8, 1490176253),
(2, 13, 14, 1490177248),
(4, 13, 9, 1490239994),
(5, 13, 13, 1490240196),
(6, 13, 11, 1490350607),
(7, 13, 10, 1490351197),
(8, 13, 12, 1490511525);

-- --------------------------------------------------------

--
-- 表的结构 `sc_week`
--

CREATE TABLE `sc_week` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `name` char(30) NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='周天类别' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sc_week`
--

INSERT INTO `sc_week` (`id`, `name`, `is_enable`, `sort`, `add_time`, `upd_time`) VALUES
(12, '星期一', 1, 0, 0, '2016-12-25 06:43:30'),
(14, '星期二', 1, 0, 0, '2016-12-25 09:19:00'),
(17, '星期三', 1, 0, 1482840012, '2016-12-27 12:00:12'),
(19, '星期四', 1, 0, 1482851842, '2016-12-27 15:17:22'),
(20, '星期五', 1, 0, 1482851855, '2016-12-27 15:17:35'),
(21, '星期六', 1, 0, 1482852585, '2016-12-27 15:29:45'),
(22, '星期日', 1, 0, 1482852593, '2016-12-27 15:29:53');

--
-- 转储表的索引
--

--
-- 表的索引 `sc_admin`
--
ALTER TABLE `sc_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sc_article`
--
ALTER TABLE `sc_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `article_class_id` (`article_class_id`),
  ADD KEY `is_enable` (`is_enable`),
  ADD KEY `access_count` (`access_count`),
  ADD KEY `image_count` (`image_count`);

--
-- 表的索引 `sc_article_class`
--
ALTER TABLE `sc_article_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- 表的索引 `sc_class`
--
ALTER TABLE `sc_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `is_enable` (`is_enable`),
  ADD KEY `sort` (`sort`);

--
-- 表的索引 `sc_config`
--
ALTER TABLE `sc_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `only_tag` (`only_tag`);

--
-- 表的索引 `sc_course`
--
ALTER TABLE `sc_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `semester_teacher_class_subject_week_interval` (`semester_id`,`teacher_id`,`class_id`,`subject_id`,`week_id`,`interval_id`),
  ADD UNIQUE KEY `semester_week_interval_room` (`semester_id`,`week_id`,`interval_id`,`room_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `week_id` (`week_id`),
  ADD KEY `interval_id` (`interval_id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `room_id` (`room_id`);

--
-- 表的索引 `sc_custom_view`
--
ALTER TABLE `sc_custom_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `is_enable` (`is_enable`),
  ADD KEY `access_count` (`access_count`),
  ADD KEY `image_count` (`image_count`);

--
-- 表的索引 `sc_fraction`
--
ALTER TABLE `sc_fraction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `semester_student_subject_score` (`semester_id`,`student_id`,`subject_id`,`score_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `score_id` (`score_id`),
  ADD KEY `score` (`score`);

--
-- 表的索引 `sc_interval`
--
ALTER TABLE `sc_interval`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sc_layout`
--
ALTER TABLE `sc_layout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `value` (`value`),
  ADD KEY `sort` (`sort`);

--
-- 表的索引 `sc_layout_module`
--
ALTER TABLE `sc_layout_module`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sc_link`
--
ALTER TABLE `sc_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `is_enable` (`is_enable`);

--
-- 表的索引 `sc_mood`
--
ALTER TABLE `sc_mood`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 表的索引 `sc_mood_comments`
--
ALTER TABLE `sc_mood_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mood_id` (`mood_id`),
  ADD KEY `reply_id` (`reply_id`);

--
-- 表的索引 `sc_mood_praise`
--
ALTER TABLE `sc_mood_praise`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_mood` (`mood_id`,`user_id`),
  ADD KEY `mood_id` (`mood_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 表的索引 `sc_navigation`
--
ALTER TABLE `sc_navigation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_show` (`is_show`),
  ADD KEY `sort` (`sort`),
  ADD KEY `nav_type` (`nav_type`),
  ADD KEY `pid` (`pid`);

--
-- 表的索引 `sc_power`
--
ALTER TABLE `sc_power`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sc_region`
--
ALTER TABLE `sc_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `is_enable` (`is_enable`),
  ADD KEY `sort` (`sort`);

--
-- 表的索引 `sc_role`
--
ALTER TABLE `sc_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sc_role_power`
--
ALTER TABLE `sc_role_power`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `power_id` (`power_id`);

--
-- 表的索引 `sc_room`
--
ALTER TABLE `sc_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `is_enable` (`is_enable`),
  ADD KEY `sort` (`sort`);

--
-- 表的索引 `sc_score`
--
ALTER TABLE `sc_score`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sc_semester`
--
ALTER TABLE `sc_semester`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sc_student`
--
ALTER TABLE `sc_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_card_semester_id` (`id_card`,`semester_id`),
  ADD UNIQUE KEY `number_id_card_semester_id` (`number`,`id_card`,`semester_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `state` (`state`),
  ADD KEY `tuition_state` (`tuition_state`),
  ADD KEY `birthday` (`birthday`),
  ADD KEY `gender` (`gender`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `my_mobile` (`my_mobile`),
  ADD KEY `parent_mobile` (`parent_mobile`),
  ADD KEY `email` (`email`),
  ADD KEY `number` (`number`);

--
-- 表的索引 `sc_subject`
--
ALTER TABLE `sc_subject`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sc_teacher`
--
ALTER TABLE `sc_teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_card` (`id_card`),
  ADD KEY `state` (`state`),
  ADD KEY `birthday` (`birthday`),
  ADD KEY `gender` (`gender`),
  ADD KEY `tel` (`tel`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `email` (`email`);

--
-- 表的索引 `sc_teacher_subject`
--
ALTER TABLE `sc_teacher_subject`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teacher_subject` (`teacher_id`,`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- 表的索引 `sc_user`
--
ALTER TABLE `sc_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `email` (`email`);

--
-- 表的索引 `sc_user_student`
--
ALTER TABLE `sc_user_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_student` (`user_id`,`student_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `student_id` (`student_id`);

--
-- 表的索引 `sc_week`
--
ALTER TABLE `sc_week`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `sc_admin`
--
ALTER TABLE `sc_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `sc_article`
--
ALTER TABLE `sc_article`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=32;

--
-- 使用表AUTO_INCREMENT `sc_article_class`
--
ALTER TABLE `sc_article_class`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `sc_class`
--
ALTER TABLE `sc_class`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `sc_config`
--
ALTER TABLE `sc_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '基本设置id', AUTO_INCREMENT=58;

--
-- 使用表AUTO_INCREMENT `sc_course`
--
ALTER TABLE `sc_course`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `sc_custom_view`
--
ALTER TABLE `sc_custom_view`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `sc_fraction`
--
ALTER TABLE `sc_fraction`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '成绩id', AUTO_INCREMENT=60;

--
-- 使用表AUTO_INCREMENT `sc_interval`
--
ALTER TABLE `sc_interval`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `sc_layout`
--
ALTER TABLE `sc_layout`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=513;

--
-- 使用表AUTO_INCREMENT `sc_layout_module`
--
ALTER TABLE `sc_layout_module`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=857;

--
-- 使用表AUTO_INCREMENT `sc_link`
--
ALTER TABLE `sc_link`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `sc_mood`
--
ALTER TABLE `sc_mood`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `sc_mood_comments`
--
ALTER TABLE `sc_mood_comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=71;

--
-- 使用表AUTO_INCREMENT `sc_mood_praise`
--
ALTER TABLE `sc_mood_praise`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=70;

--
-- 使用表AUTO_INCREMENT `sc_navigation`
--
ALTER TABLE `sc_navigation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `sc_power`
--
ALTER TABLE `sc_power`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限id', AUTO_INCREMENT=144;

--
-- 使用表AUTO_INCREMENT `sc_region`
--
ALTER TABLE `sc_region`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `sc_role`
--
ALTER TABLE `sc_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色组id', AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `sc_role_power`
--
ALTER TABLE `sc_role_power`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关联id', AUTO_INCREMENT=1376;

--
-- 使用表AUTO_INCREMENT `sc_room`
--
ALTER TABLE `sc_room`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `sc_score`
--
ALTER TABLE `sc_score`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `sc_semester`
--
ALTER TABLE `sc_semester`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `sc_student`
--
ALTER TABLE `sc_student`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学生id', AUTO_INCREMENT=58;

--
-- 使用表AUTO_INCREMENT `sc_subject`
--
ALTER TABLE `sc_subject`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `sc_teacher`
--
ALTER TABLE `sc_teacher`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学生id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sc_teacher_subject`
--
ALTER TABLE `sc_teacher_subject`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关联id', AUTO_INCREMENT=52;

--
-- 使用表AUTO_INCREMENT `sc_user`
--
ALTER TABLE `sc_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `sc_user_student`
--
ALTER TABLE `sc_user_student`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `sc_week`
--
ALTER TABLE `sc_week`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
