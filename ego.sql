-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2021-04-08 06:52:52
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ego`
--

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) DEFAULT NULL,
  `name` text,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `cid`) VALUES
(1, '家用电器', 1001),
(1, '手机/运营商/数码', 1002),
(1, '电脑/办公', 1003),
(1, '家具/家居', 1004),
(1001, '电视', 100001),
(1001, '空调', 10002),
(1001, '洗衣机', 10003),
(1001, '冰箱', 10004),
(1002, '手机通讯', 10001),
(1002, '运营商', 10002),
(1002, '摄影', 10003),
(1002, '摄像', 10004),
(1003, '电脑整机', 10001),
(1003, '电脑配件', 10002),
(1003, '外设产品', 10003),
(1003, '游戏设备', 10004),
(1004, '厨具', 10001),
(1004, '家纺', 10002),
(1004, '灯具', 10003),
(1004, '家具', 10004),
(100001, '超薄点视', 100004),
(100001, '全面屏点视', 100005);

-- --------------------------------------------------------

--
-- 表的结构 `content`
--

CREATE TABLE `content` (
  `id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `content`
--

INSERT INTO `content` (`id`, `name`, `pid`) VALUES
(1001, 'banner广告', 10001),
(1003, '电子产品广告', 10003),
(19412, '刚刚赚了很多钱', 89602),
(1004, '京东618', 90410),
(90410, '电脑', 56320),
(1, '广告分类', 1001),
(10001, '侧边广告', 8020),
(10001, 'bbb', 1529),
(10001, 'cc', 474),
(10002, 'bbb', 9196),
(10001, 'nnn', 280),
(10002, '冲冲冲', 2999),
(1001, '2021京东618', 100);

-- --------------------------------------------------------

--
-- 表的结构 `contentinfo`
--

CREATE TABLE `contentinfo` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `contentinfo`
--

INSERT INTO `contentinfo` (`id`, `pid`, `name`, `url`, `image`) VALUES
(1, 10001, 'OPPO Watch', 'https://pro.jd.com/mall/active/tG3nBBhghqhfM69HoJw9ZoDaT7d/index.html?extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjg5YzRjMTUyLWUwZjktNGQ0OC05NDI4LTJhODQ4NWJjNTc1N1wiLFwibWF0ZXJpYWxfaWRcIjpcIjE4NTAxMDcyMjlcIixcInBvc19pZFwiOlwiNDI3MlwiLFwic2lkXCI6XCJmODcwZmM2MS1jYjc3LTQwN2UtOTM1ZC1jYzhlZTc0MTYyZTdcIn0ifQ==&jd_pop=89c4c152-e0f9-4d48-9428-2a8485bc5757&abt=1', '//img14.360buyimg.com/pop/s1180x940_jfs/t1/110562/14/10737/42247/5e81bb76E6fffa006/b3f703f750bd37ea.jpg.webp'),
(3, 90410, '椅子', 'https://channel-m.jd.com/pc/psp/10979325649?imup=CgwKBnd3dGxpdRIAGAASEAjR7azzKBDmZhoAIJpNKAEYsRsgACoUaWwsdWEseGdiLGdhLGNpYSxiYWEyAmlsOioKCWpkX2hiZHl5MRDnYRgCIJL50ty1x-S1dyjCo6Q3MMGjpDc4E0CAgCA&extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjJiNmEyNjE5LWE4MmItNGMyNi1iYzYwLWI3ZGE1NzljOWRkZVwiLFwibWF0ZXJpYWxfaWRcIjpcIjg2MDUxMzIyOTY2NTg2NjQ1OTRcIixcInBvc19pZFwiOlwiMzUwNVwiLFwic2lkXCI6XCJmN2Y5ODM2ZS0yZTViLTQyMTUtYWNiMi04NDdmZmI2N2U2ZDdcIn0ifQ==&jd_pop=2b6a2619-a82b-4c26-bc60-b7da579c9dde&abt=0', 'https://img12.360buyimg.com/pop/s1180x940_jfs/t1/117573/18/9029/83238/5ed7c92aE789977c2/b11a288a7284cdfe.jpg.webp'),
(5, 10002, 'fggh', 'dffg', 'dfdf'),
(6, 10002, 'hhh', 'hh', 'hh'),
(7, 10002, 'hhh', 'hh', 'hhh'),
(8, 10002, 'hhh', 'hh', 'hh'),
(9, 10002, 'aaa', 'aa', 'aaa'),
(11, 10001, '轮播图', 'http://www.baidu.com', 'http://www.baidu.com/banner.jpg'),
(12, 10001, '轮播图', 'http://www.baidu.com', 'http://www.baidu.com/banner.jpg'),
(13, 10001, 'hjh', '6666', '666');

-- --------------------------------------------------------

--
-- 表的结构 `params`
--

CREATE TABLE `params` (
  `id` int(11) NOT NULL,
  `itemCatId` text NOT NULL,
  `paramData` text NOT NULL,
  `specsName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `params`
--

INSERT INTO `params` (`id`, `itemCatId`, `paramData`, `specsName`) VALUES
(10027, '10003', '[{"value":"","title":"外观","children":[{"value":"","title":"体重"}]}]', '外设产品'),
(10031, '10002', '[{"value":"","title":"基本参数","children":[{"value":"","title":"外观"},{"value":"","title":"重量"},{"value":"","title":"生产时期"}]},{"value":"","title":"形状","children":[{"value":"","title":"耗电量"}]}]', '空调'),
(10032, '10003', '[{"value":"","title":"基本信息","children":[{"value":"","title":"体重"}]}]', '外设产品'),
(10033, '1004', '[{"value":"","title":"材料","children":[{"value":"","title":"纯棉"},{"value":"","title":"蕾丝"}]}]', '家具/家居'),
(10036, '10004', '[{"value":"","title":"多少度","children":[]}]', '摄像'),
(10037, '1004', '[{"value":"","title":"方法","children":[{"value":"","title":"热"}]}]', '家具/家居'),
(10044, '1003', '[{"value":"","title":"基本信息","children":[{"value":"","title":"外观"}]},{"value":"","title":"特殊配置","children":[{"value":"","title":"内存"}]}]', '电脑/办公'),
(10045, '1001', '[{"value":"","title":"dsds","children":[{"value":"","title":"dff"}]}]', '家用电器'),
(10046, '1002', '[{"value":"","title":"基本信息","children":[{"value":"","title":"参数"}]}]', '手机/运营商/数码'),
(10047, '1003', '[{"value":"","title":"过分过分过分","children":[{"value":"","title":"55人"}]}]', '电脑/办公'),
(10049, '1002', '[{"value":"","title":"配置参数","children":[{"value":"","title":"外观"}]}]', '手机/运营商/数码'),
(10051, '1001', '[{"value":"","title":"配置","children":[{"value":"","title":"111"}]}]', '家用电器'),
(10052, '10004', '[{"value":"","title":"配置","children":[{"value":"","title":"111"}]}]', '摄像'),
(10053, '1004', '[{"value":"","title":"家具","children":[{"value":"","title":"床"}]}]', '家具/家居'),
(10059, '10004', '[{"value":"","name":"基本信息","children":[{"value":"","name":"材料组成"},{"value":"","name":"使用寿命"}]}]', '冰箱'),
(10060, '10001', '[{"value":"","title":"手机配置","children":[{"value":"","title":"尺寸"},{"value":"","title":"像素"},{"value":"","title":"内存"}]}]', '手机通讯'),
(10061, '1001', '[{"value":"","title":"外观","children":[{"value":"","title":"高度"},{"value":"","title":"重量"}]}]', '家用电器'),
(10062, '10004', '[{"value":"","title":"66","children":[{"value":"","title":"666"}]}]', '冰箱');

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` text NOT NULL,
  `sellPoint` text NOT NULL,
  `price` text NOT NULL,
  `cid` text NOT NULL,
  `category` text,
  `num` text NOT NULL,
  `barcode` text NOT NULL,
  `status` text NOT NULL,
  `created` text NOT NULL,
  `updated` text NOT NULL,
  `descs` text NOT NULL,
  `paramsInfo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `title`, `image`, `sellPoint`, `price`, `cid`, `category`, `num`, `barcode`, `status`, `created`, `updated`, `descs`, `paramsInfo`) VALUES
(10015, '三体-刘慈欣', '', '未来科幻', '99', '', NULL, '999', '', '', '', '', '<p>这是大刘的得意之作，连奥巴马都喜欢看！</p>', NULL),
(10028, '梦里花落知多少', '2.jpg', '小时代！！！', '11', '10001', NULL, '11', '', '', '', '', '<p>还不错，但是要看书籍，不要看电影</p>', NULL),
(10031, '我与地坛', '', '做一个不动声色的人', '55', '', NULL, '464', '', '', '', '', '人生尔尔，错过了，就是一辈子', NULL),
(10032, '舞！舞！舞！', '', '村上春树经典作品', '234', '43', NULL, '34', '', '', '', '', '人不是慢慢变老的，而是一瞬间变老的', NULL),
(10033, '岁月神偷', '', '经典书籍', '23', '', NULL, '23', '', '', '', '', '我没有精力去认识一个新的人，或者花力气去宠福新维系一段感情，跟没办法在把自己的故事讲述一遍又一遍', NULL),
(10035, '解忧杂货店', '', '无论现在有多么的不开心，你要相信明天会比今天更好', '34', '', NULL, '12', '', '', '', '', '<p>无论现在有多么的不开心，你要相信明天会比今天更好!!!!</p>', NULL),
(10038, '小王子', '', '写给成年人的童话故事', '20', '', NULL, '1', '', '1', '', '', '所有人都曾是小孩，虽然之后少数人记得', NULL),
(10039, '笑场', 'mock\\upload\\1585277506405-u=2137641711,889921437&fm=26&gp=0.jpg', '李诞的作品，很有意思，集成了扯经', '55', '100002', NULL, '1000', '', '1', '', '', '<p>未曾开言，我先笑场，笑过之后，听我来诉一诉衷肠</p>', NULL),
(10040, '万历十五年', 'mock\\upload\\1585277681739-u=2137641711,889921437&fm=26&gp=0.jpg', '人民的名义里面出现过很多次', '45', '10002', NULL, '26', '', '1', '', '', '<p>在明朝当皇帝其实没那么幸福，比其清朝来说，还是清朝的皇帝牛逼，毕竟清朝才是更加牛逼的中央集权制</p>', NULL),
(10084, '666', '', '666', '666', '', '', '666', '', '1', '', '', '<p>666</p>', NULL),
(10085, '888', '', '88', '888', '', '', '888', '', '1', '', '', '<p>888</p>', NULL),
(10088, '888', '', '888', '88', '', '', '888', '', '1', '', '', '<p>8888</p>', NULL),
(10089, '999', '', '99', '999', '', '', '99', '', '1', '', '', '<p>999</p>', NULL),
(10090, '3333', '', '', '333', '', '', '333', '', '1', '', '', '<p>3333</p>', NULL),
(10091, '4444', '', '', '444', '', '', '444', '', '1', '', '', '<p>4444</p>', NULL),
(10092, 'ioii', '', 'hhh', 'hhh', '', '', 'hhhh', '', '1', '', '', '<p>hhh</p>', NULL),
(10093, 'jjj', '', 'jjj', 'jjj', '10001', '电视', 'jjj', '', '1', '', '', '<p>jjj</p>', NULL),
(10094, '666', '', '66', '66', '10001', '电视', '66', '', '1', '', '', '<p>66</p>', NULL),
(10095, '444', '', '44', '444', '10001', '电视', '444', '', '1', '', '', '<p>4444</p>', '[{"value":"","name":"基本参数","children":[{"value":"44","name":"电视大小"},{"value":"44","name":"尺寸单位"}]}]'),
(10096, '777', '', '777', '77', '', '电视', '77', '', '1', '', '', '<p>777</p>', '[{"value":"","name":"基本参数","children":[{"value":"77666","name":"电视大小"},{"value":"77677","name":"尺寸单位"}]}]'),
(10097, '888', 'http://localhost:3065/upload/1616920627783-QQ图片20200722115959.jpg', '', '88', '', '', '8', '', '1', '', '', '', '[]'),
(10098, 'hhh', 'http://localhost:3065/1616921161534-QQ图片20200722115959.jpg', '', 'hh', '', '', 'hhh', '', '1', '', '', '', '[]'),
(10099, '', '', '', '', '', '', '', '', '1', '', '', '', ''),
(10100, '', '', '', '', '', '', '', '', '1', '', '', '', ''),
(10102, 'ggg', '', '44', '54', '', '', '45', '', '1', '', '', '', ''),
(10107, '电视长虹', 'http://localhost:4000/1617103475898-qq.jpg', '111', '111', '10001', '电视', '223', '', '1', '', '', '<p>4444最好的电视</p>', ''),
(10108, '家具用品', 'http://localhost:4000/1617103894235-qq.jpg', 'www', '12.00', '1004', '家具/家居', '3445', '', '1', '', '', '<p>哈哈哈，看看怎么样吧，测试数据</p>', ''),
(10112, '游戏光盘', 'http://localhost:4000/1617104395957-qq.jpg', '1323', '45.34', '10004', '游戏设备', '3455', '', '1', '', '', '<p>目前加入的prop 那么神奇吗</p>', ''),
(10117, '天高任鸟飞，海阔凭鱼跃', '', '心敢比天高', '1200.00', '', '', '1', '', '1', '', '', '<p>越自律越优秀</p>', ''),
(10121, '灌灌灌灌', 'http://localhost:3000/1617242837899-qq.jpg', '455', '455', '10002', '家纺', '455', '', '1', '', '', '<p>4555</p>', ''),
(10138, '对对对', '', '11', '11', '1003', '电脑/办公', '11', '', '1', '', '', '<p>111</p>', '[{"value":"22","title":"基本信息","children":[{"value":"22","title":"外观"}]},{"value":"22","title":"特殊配置","children":[{"value":"22","title":"内存"}]}]'),
(10139, '666', '', '', '666', '10001', '手机通讯', '666', '', '1', '', '', '', ''),
(10140, '888', '', '888888', '888', '1004', '家具/家居', '888', '', '1', '', '', '<p>888</p>', '[{"value":"纯棉66","title":"材料","children":[{"value":"新疆棉花66","title":"纯棉"},{"value":"嗯嗯66","title":"蕾丝"}]}]');

-- --------------------------------------------------------

--
-- 表的结构 `projectparams`
--

CREATE TABLE `projectparams` (
  `id` int(11) NOT NULL,
  `productId` text NOT NULL,
  `paramscontent` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `userinfo`
--

INSERT INTO `userinfo` (`id`, `username`, `password`) VALUES
(1, 'admin', '123'),
(2, 'ime', '123'),
(3, 'jack', '123'),
(4, 'sakura', '123'),
(5, '张三', '123'),
(6, '李四', '123'),
(7, 'hello1', '123123'),
(8, 'hello2', '123'),
(9, 'qq', '123'),
(10, 'QQ', '123'),
(11, 'QQ', '123'),
(12, 'ww', '123'),
(13, 'www', '123'),
(14, 'eee', 'eee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contentinfo`
--
ALTER TABLE `contentinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `params`
--
ALTER TABLE `params`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projectparams`
--
ALTER TABLE `projectparams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `contentinfo`
--
ALTER TABLE `contentinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `params`
--
ALTER TABLE `params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10063;
--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10141;
--
-- 使用表AUTO_INCREMENT `projectparams`
--
ALTER TABLE `projectparams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
