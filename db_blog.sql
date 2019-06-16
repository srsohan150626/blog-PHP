-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2019 at 10:37 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`) VALUES
(1, 'JAVA'),
(2, 'PHP'),
(3, 'C'),
(4, 'C++'),
(5, 'Algorithm'),
(6, 'Data Structure');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `firstname`, `lastname`, `email`, `body`, `status`, `Date`) VALUES
(1, 'Md Sohanur', 'Rahaman', 'email', 'body', 0, '2019-01-21 17:54:38'),
(2, 'Md Sohanur', 'Rahaman', 'sohan.ice.pust@gmail.com', 'Hellow Sohan!', 0, '2019-01-21 17:54:38'),
(3, 'Yousuf Hasan', 'Saikot', 'yousuf@gmail.com', 'Hellow Sohan vay!', 1, '2019-01-21 17:54:38'),
(5, 'Afroja', 'Akter', 'afroja@gmail.com', 'I Love You Sohan .', 0, '2019-01-21 20:10:44'),
(6, 'Afroja', 'Akter', 'afroja@gmail.com', 'I Love you so much Sohan.', 1, '2019-01-21 20:13:26'),
(7, 'Afroja', 'Akter', 'afroja@gmail.com', 'Tumi Amar Bor..', 1, '2019-01-22 10:14:37'),
(8, 'Afroja', 'Akter', 'afroja@gmail.com', 'Tumi Amar Bor..', 1, '2019-01-22 10:14:37'),
(10, 'Md', 'Ashraful', 'ashraful@gmail.com', 'Hi Sohan vai', 1, '2019-01-28 17:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_footer`
--

CREATE TABLE `tbl_footer` (
  `id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_footer`
--

INSERT INTO `tbl_footer` (`id`, `note`) VALUES
(1, 'Copyright Sohan the Dreamer..');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page`
--

CREATE TABLE `tbl_page` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_page`
--

INSERT INTO `tbl_page` (`id`, `name`, `body`) VALUES
(1, 'About Sohan', '<p>Hey , I am Md Sohanur Rahaman from Bangladesh . I am final year student of Department of Information and Communication Engineering at Pabna University os Science and Technology . I am a Competitive Programmer . I have take Participated in many national level Programming Contest .I Love code and also love to teach something what i know . That''s why i am created this blog for share something what i know about programming related topics! You can also connect with me in facebook. Here is My facebook id <a href="https://www.facebook.com/sohan150626" target="_blank">link</a>&nbsp;.</p>\r\n<p>Happy Coding !</p>'),
(2, 'Privacy Policy', '<p>Privacy policy:A computer is a tool for solving problems with data.A program is a sequence of instructions that tell a computer how to do a task. When a computer follows the instructions in a program, we say it&nbsp;<em>executes</em>&nbsp;the program. You can think of it like a recipe that tells you how to make a peanut butter sandwich. In this model, you are the computer, making a sandwich is the task, and the recipe is the program that tells you how to execute the task.</p>\r\n<p>A computer is a tool for solving problems with data.A program is a sequence of instructions that tell a computer how to do a task. When a computer follows the instructions in a program, we say it&nbsp;<em>executes</em>&nbsp;the program. You can think of it like a recipe that tells you how to make a peanut butter sandwich. In this model, you are the computer, making a sandwich is the task, and the recipe is the program that tells you how to execute the task.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `id` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`id`, `cat`, `title`, `body`, `image`, `author`, `tags`, `date`, `userid`) VALUES
(9, 1, 'About Java', '<p><span class="bodytext">Java is a programming language and computing platform first released by Sun Microsystems in 1995. There are lots of applications and websites that will not work unless you have Java installed, and more are created every day. Java is fast, secure, and reliable. From laptops to datacenters, game consoles to scientific supercomputers, cell phones to the Internet, Java is everywhere! </span></p>\r\n<p><span class="bodytext">Java is a programming language and computing platform first released by Sun Microsystems in 1995. There are lots of applications and websites that will not work unless you have Java installed, and more are created every day. Java is fast, secure, and reliable. From laptops to datacenters, game consoles to scientific supercomputers, cell phones to the Internet, Java is everywhere! </span></p>', 'upload/9396b23ca7.png', 'Sohan', 'Java Coding', '2019-01-28 19:34:15', 2),
(10, 2, 'About PHP', '<p><acronym title="PHP: Hypertext Preprocessor">PHP</acronym> (recursive acronym for <em>PHP: Hypertext Preprocessor</em>) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.</p>\r\n<p><acronym title="PHP: Hypertext Preprocessor">PHP</acronym> (recursive acronym for <em>PHP: Hypertext Preprocessor</em>) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.</p>\r\n<p><acronym title="PHP: Hypertext Preprocessor">PHP</acronym> (recursive acronym for <em>PHP: Hypertext Preprocessor</em>) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.</p>', 'upload/90c0777fa2.png', 'Sohan', 'PHP', '2019-01-28 19:34:39', 2),
(11, 3, 'About C', '<p>C is a powerful general-purpose programming language. It is fast, portable and available in all platforms.If you are new to programming, C is a good choice to start your programming journey.This is a comprehensive guide on how to get started in C programming language, why you should learn it and how you can learn it.</p>\r\n<p>C is a powerful general-purpose programming language. It is fast, portable and available in all platforms.If you are new to programming, C is a good choice to start your programming journey.This is a comprehensive guide on how to get started in C programming language, why you should learn it and how you can learn it.</p>\r\n<p>C is a powerful general-purpose programming language. It is fast, portable and available in all platforms.If you are new to programming, C is a good choice to start your programming journey.This is a comprehensive guide on how to get started in C programming language, why you should learn it and how you can learn it.</p>', 'upload/f81fa15c78.jpg', 'Sohan', 'c', '2019-01-28 19:34:56', 3),
(13, 5, 'About Algorithm', '<p>Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem.</p>\r\n<p>Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem. Algorithm is the way of solving a problem.</p>', 'upload/ec6c9829ae.jpg', 'Sohan', 'Algorithm', '2019-01-28 19:35:07', 4),
(14, 4, 'About C++', '<p>C++ ranks 4th in popularity according to 2016 IEEE spectrum Top Programming Language ranking. Learning C++ is a wise investment for all programmers.This guide answers all your questions related to C++ on what is it, when is it used, why is it used and how to get yourself started with it.</p>\r\n<p>C++ ranks 4th in popularity according to 2016 IEEE spectrum Top Programming Language ranking. Learning C++ is a wise investment for all programmers.This guide answers all your questions related to C++ on what is it, when is it used, why is it used and how to get yourself started with it.</p>\r\n<p>C++ ranks 4th in popularity according to 2016 IEEE spectrum Top Programming Language ranking. Learning C++ is a wise investment for all programmers.This guide answers all your questions related to C++ on what is it, when is it used, why is it used and how to get yourself started with it.</p>', 'upload/f52ef6acbe.png', 'Md Sohanur Rahaman', 'C++', '2019-01-28 19:36:03', 5),
(15, 6, 'What is Data Structure?', '<p><span>In computer science, a data structure is a data organization, management and storage format that enables efficient access and modification. More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.</span></p>\r\n<p><span>In computer science, a data structure is a data organization, management and storage format that enables efficient access and modification. More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.</span></p>\r\n<p><span>In computer science, a data structure is a data organization, management and storage format that enables efficient access and modification. More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.</span></p>', 'upload/58de053c2e.jpg', 'Md Sohanur Rahaman', 'Data Structure', '2019-01-28 19:36:14', 6),
(16, 6, 'What is Data Structure?', '<p><span>In computer science, a data structure is a data organization, management and storage format that enables efficient access and modification. More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.</span></p>\r\n<p><span>In computer science, a data structure is a data organization, management and storage format that enables efficient access and modification. More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.</span></p>\r\n<p><span>In computer science, a data structure is a data organization, management and storage format that enables efficient access and modification. More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.</span></p>', 'upload/c802cda95f.jpg', 'Md Sohanur Rahaman', 'Hellow Data Structure', '2019-01-28 19:36:25', 7),
(17, 5, 'Graph Theory', '<p><span>In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects. A graph in this context is made up of vertices, nodes, or points which are connected by edges, arcs, or lines.</span></p>\r\n<p><span>In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects. A graph in this context is made up of vertices, nodes, or points which are connected by edges, arcs, or lines.</span></p>\r\n<p><span>In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects. A graph in this context is made up of vertices, nodes, or points which are connected by edges, arcs, or lines.</span></p>\r\n<p><span>In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects. A graph in this context is made up of vertices, nodes, or points which are connected by edges, arcs, or lines.</span></p>', 'upload/2966be3b2a.jpg', 'Ashraful', 'Algorithm', '2019-01-28 20:28:41', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`id`, `title`, `image`) VALUES
(1, 'Algorithm is Beauty..', 'upload/slider/b622fa922e.jpg'),
(2, 'Data Structure is fun..', 'upload/slider/9f2ce89e67.jpg'),
(3, 'Welcome to my world of Programming.', 'upload/slider/81d2f52076.jpg'),
(5, 'Programming is Love.', 'upload/slider/7eec8bc346.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social`
--

CREATE TABLE `tbl_social` (
  `id` int(11) NOT NULL,
  `fb` varchar(255) NOT NULL,
  `tw` varchar(255) NOT NULL,
  `ln` varchar(255) NOT NULL,
  `gp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_social`
--

INSERT INTO `tbl_social` (`id`, `fb`, `tw`, `ln`, `gp`) VALUES
(1, 'http://facebook.com/sohan', 'http://twitter.com/sohan', 'http://linkedin.com/sohan', 'http://google.com/sohan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_theme`
--

CREATE TABLE `tbl_theme` (
  `id` int(11) NOT NULL,
  `theme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_theme`
--

INSERT INTO `tbl_theme` (`id`, `theme`) VALUES
(1, 'green');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name`, `username`, `password`, `email`, `details`, `role`) VALUES
(1, 'Md Sohanur Rahaman', 'Night_King', 'f45ab446d38a0960fcdb3833a0c5ed8d', 'sohan.ice.pust@gmail.com', '<p>Hey I am Sohan from Bangladesh.</p>', 0),
(10, 'Afroja Akter', 'author', '202cb962ac59075b964b07152d234b70', 'afroja@gmail.com', '<p>Hey i am Afroja Akter..I am legal wife of the admin of this blog Md Sohanur Rahaman</p>', 1),
(11, 'Mehedy Hasan', 'editor', '5aee9dbd2a188839105073571bee1b1f', 'mehedy@gmail.com', '<p>I am Mehedy from Bangladesh..I am a professional wb developer..</p>', 2),
(12, '', 'Hafiz', 'fb29ed3264c5a92bcf74eccd7489e828', '', '', 2),
(14, '', 'Joy', '26307ecc02f0e3cb30346d1f28d4c225', '', '', 2),
(15, '', 'Ashraful', '7d04559ddb86598ab0e369f4a5e82eab', '', '', 2),
(16, '', 'Helal', 'b5356d03c83357a2c602d9a59a5d9c10', 'helalcse06@gmail.com', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `title_slogan`
--

CREATE TABLE `title_slogan` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slogan` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title_slogan`
--

INSERT INTO `title_slogan` (`id`, `title`, `slogan`, `logo`) VALUES
(1, 'Sohan''s Programming Planet', 'This is my Programming tutorial Blog', 'upload/logo.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_footer`
--
ALTER TABLE `tbl_footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social`
--
ALTER TABLE `tbl_social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_theme`
--
ALTER TABLE `tbl_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `title_slogan`
--
ALTER TABLE `title_slogan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_footer`
--
ALTER TABLE `tbl_footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_social`
--
ALTER TABLE `tbl_social`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_theme`
--
ALTER TABLE `tbl_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `title_slogan`
--
ALTER TABLE `title_slogan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
