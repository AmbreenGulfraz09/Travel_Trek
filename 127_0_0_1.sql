-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 06:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"travel_trek\",\"table\":\"app_transcript\"},{\"db\":\"travel_trek\",\"table\":\"trancripts\"},{\"db\":\"travel_trek\",\"table\":\"auth_permission\"},{\"db\":\"travel_trek\",\"table\":\"auth_group_permissions\"},{\"db\":\"travel_trek\",\"table\":\"auth_group\"},{\"db\":\"travel_trek\",\"table\":\"Trancripts\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-12-10 17:32:56', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `travel_trek`
--
CREATE DATABASE IF NOT EXISTS `travel_trek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `travel_trek`;

-- --------------------------------------------------------

--
-- Table structure for table `app_transcript`
--

CREATE TABLE `app_transcript` (
  `id` bigint(20) NOT NULL,
  `video_id` varchar(100) NOT NULL,
  `video_title` varchar(255) NOT NULL,
  `video_url` varchar(200) NOT NULL,
  `transcript_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_transcript`
--

INSERT INTO `app_transcript` (`id`, `video_id`, `video_title`, `video_url`, `transcript_text`) VALUES
(1, 'wSHXd-K-jIk', '10 Best Places to Visit in England - Travel Video', 'https://www.youtube.com/watch?v=wSHXd-K-jIk', 'England is a richly historic country, and one  that is packed with fascinating destinations.   It’s a great place to explore, and whether  you’re a resident or tourist the country   retains a boundless capacity to surprise,  charm and excite. From the mystery of ancient   Stonehenge to the modern architecture along the  Thames River, England has a wide range of appeal   to visitors from around the world. Here’s a  look at the best places to visit in England: Number 10. Chester. Located in Northwest England just on the Welsh  border, Chester is a charming city with Roman   origins. Its biggest attraction might just be  the Chester Cathedral, a stunning structure that   was one of the few to survive under Henry VIII  because it was simply too beautiful to tear down.   Travel back even further in time by  exploring some of the Roman landmarks,   such as the ancient walls or the ruins of an  enormous amphitheater. Just across the street   from the Roman amphitheater is a traditional 19th  century Victorian garden perfect for picnics. Number 9. Brighton. Brighton, on the Sussex coast, has been a  popular beach resort since the mid-19th century.   Much of its popularity is due to the proximity to  London, making it popular with day trippers. The   beachfront is lined with graceful old Victorian  homes that today provide tourist accommodations.   Visitors will want to walk  out on the famous Palace Pier   or admire the traditional English gardens.  The Palace Pier is where you’ll find rides,   attractions and vendors selling everything  from ice cream cones to fish and chips. Number 8. Lake District. Located in north west England  in the county of Cumbria,   the Lake District is the largest National Park  in the country. The main attraction is the   lakes and mountains carved by glacial erosion  and providing dramatic and inspiring scenery.   It is England’s premier destination for  hiking and climbing. Others may prefer more   gentle walks through the valleys while they  contemplate the works of William Wordsworth,   a famous 19th century poet, or riding  a steam train through the scenic are. Number 7. Cambridge. There is no question that the main attraction  in the city of Cambridge is the University of   Cambridge, a campus with hundreds of years of  history. The university is made up of several   colleges, some of the most famous of which include  King’s College, Queen’s College and Trinity   College. Perhaps the best way to see Cambridge is  just to stroll through the campus architecture,   peeking into halls and admiring the Backs,  a park located on the banks of the river. Number 6. Jurassic Coast. Fossil hunters may want to make  a beeline for the Jurassic Coast,   a section in southern England that runs roughly  from Bournemouth to Exmouth. The rocks date back   185 million years to when the continents  were crunching up against each other   and then drifting apart. Museums along the  way explain each region. Fossil hunters, and   all visitors, should take time to walk the beaches  or visit the small charming towns along the way.   Take care when walking near cliffs  since rocks can fall at any time. Number 5. Oxford. Just as Cambridge is known for its university,  so too is Oxford. Since Oxford University was   established in the 12th century, however,  its provenance dates even further back,   making it the oldest English-speaking campus in  the world. If you only get the chance to see one   building in Oxford, make it the breathtaking  Bodleian Library. Established in 1601,   the library is home to more than 11 million  volumes. Film buffs will appreciate that it   has served as the backdrop for countless movies,  including several from the Harry Potter series. Number 4. Stonehenge. Dotted along the Salisbury Plain in Wiltshire,  England, Stonehenge is easily one of the most   recognized ancient ruins in the world. Dating  back over 5,000 years, these curious stone rings   are some of the oldest stone structures  on the planet. Created out of sandstone,   they are ensconced in mystery. Who built  them and why is still largely unknown. Two   popular theories maintain that Stonehenge  was used as a site for religious rituals   or otherwise to monitor the movements of the sun  and moon. As you only need two hours to explore   the ruins of Stonehenge, a day trip from London  is often combined with a visit to Windsor or Bath. Number 3. Bath. Bath got its name because that’s what it was  when it was founded by the Romans in 60 AD,   who built baths here because of the hot springs.  It reached its popularity peak in the Georgian   years when the wealthy flocked here for the spas.  Besides being famous for its waters, the city also   is an excellent example of Georgian architecture.  The city has an active cultural scene today, with   live theatre and fine dining and makes a good base  from which to visit the monolithic Stonehenge. Number 2. York The city of York is a truly ancient destination,  and it boasts an impressive collection of   architectural remains that date to Roman, medieval  and even viking times. Plenty of exciting sights   compete for visitors’ attention as they stroll  along the city’s cobblestone streets. One of the   city’s landmarks is York Minster. This commanding  stone cathedral is filled with remarkable works   of art. The medieval Clifford’s Tower, which  was built by William the Conqueror and rebuilt   by Henry III in the 13th century, is a great  vantage point for panoramic views around the city. Number 1. London. English history buffs will have a field day in  London. This city on the Thames is chock full   of palaces, from Buckingham Palace to Hampton  Court Palace . More a prison than a palace,   the Tower of London is home to the crowns  jewels. And from Knightsbridge – don’t   forget to visit the magnificent food  halls at Harrods – to Carnaby Street,   the shopping is awesome. You can get around London  quickly and efficiently by riding the famous Tube.\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n'),
(2, 'NYY2ELEH0AA', 'Best Things To Do in London England 2024 4K', 'https://www.youtube.com/watch?v=NYY2ELEH0AA', '[Music] what\'s going on everybody this is  Island Hopper TV and today we\'re coming   to you from London England out here in the United  Kingdom we\'re going to show you 22 things you can   do while visiting there will be time stamps Below  in the description so you can go across the video   for the list first up we\'re headed to Buckingham  Palace this is one of three official residents of   the king Buckingham Palace Windsor Castle and the  Palace of holy root house in Edinburgh there is   775 rooms here including 92 offices 188 staff  bedrooms and many other rooms for Royals and   guests so a really big Palace right here in the  heart of London it is open to the public in the   summertime next up we\'re headed to the British  museum where they keep over 8 million works it\'s   actually one of the largest and most comprehensive  exhibits and collections of human history in the   world you\'ll see everything from Egyptian mummies  on down to the Rosetta Stone and so much more   This truly is one of the most impressive museums  I\'ve ever been to although they are starting to   give back some of the collection to the native  countries in which they come from this Museum   receives over 6 million visitors per year and  the best news of all it is totally free to the   public next up we\'re headed to a London iconic  Landmark this here is called the London Eye it\'s   the first of many big Ferris wheels that we saw  built around the world and the London Eye sits   right here on the Thames River very beautiful  views you can get inside of these capsules it   does cost around 30 pounds to ride this or around  37 US Dollars based on current currency rates it   does take about 30 minutes for the London Eye to  do one full rotation so keep that in mind when   considering riding the ferris wheel next up we\'re  headed to Piccadilly Circus this area here is a   road Junction and a public space in London\'s West  End now it is popular because it has these big   signs kind of like you would see in Times Square  with advertisements but it\'s also a very popular   neighborhood with young people who are looking  for nightlife because it\'s considered one of the   liveliest neighborhoods in all of London I would  suggest that if you\'re looking for a hotel or an   Airbnb that it\'s nearby this area of Piccadilly  Circus this is one of a few top locations next up   let\'s talk about the main thoroughfare in London  the Thames River now it is the longest river in   all of England at 215 miles now while here you  can actually take a river boat cruise they have   many different ferries that go up and down here  and it\'s a great way to see historical London   from the comfort of a boat here on the Thames  now let\'s talk about markets they have very   many markets here including Borough Market which  is a fresh food market but you could also go to   Maltby Street Market The Brick Lane Market Camden  Market so many different markets around here I   mean the list really goes on but you should  try to visit more than one market while here   in London one of the best times to actually visit  these markets is during Christmas time because of   all the festivities going on across the city but  the markets benefit the most from this here is a   look at the horse tunnel Vintage Market there\'s  Camden Market and Stables market nearby and then   of course the scene at Christmas looks like this  plenty of fresh seafood and other cuts of meat   can be found in these markets next up we\'re headed  to Big Ben the clock tower the actual name is the   great Bell or the gray clock of Westminster after  all right next door is the Palace of Westminster   where the parliament is located now the clock  tower was built in the year built in the year   1859 but has seen several makeovers since those  years it is the third largest Clock Tower in the   UK at over 316 feet tall it is a UNESCO world  heritage site and certainly a landmark here   in the great city of London if you wanted if you  wanted to go to the parliament you would go over   towards Westminster Abbey from here after crossing  the bridge speaking of bridges let\'s take a look   at the tower bridge now this iconic Bridge here is  often confused with the London Bridge this one is   the tower bridge going over towards the tower in  the background you will see The Shard Tower the   bridge itself was built in 1886 and completed in  1894 it extends over 800 feet which is 240 meters   in length and is 213 feet wide connecting the two  Bridge Towers you can actually drive a vehicle   across the bridge or take a bus but there\'s also a  walking bridge on the right side that you can walk   across the bridge as well and in the area of the  Tower Bridge you\'ll see the Tower of London which   is another place we\'ll add to the list there\'s  also the London Wall HMS Belfast which we will   be showing you a little later on and just a little  bit down the river is the London Bridge the South   work bridge and the Millennium Bridge as we keep  this things to do in London video going here I   want to remind you guys to check the description  below we have full things to do travel guides   Barcelona Paris and Rome all videos down below  watch all three if you can and I even recommend   sending these videos to your friends and family  that you want to have join you on a trip to Europe   this is the information you\'re looking for of the  Premier cities a great way to get around London   is a Big Bus tour they have the big bus which is  like a hop-on hop off but they also have those red   double decker buses if you get a chance to go  over any of the bridges in one of those try to   sit up top it\'s really a great view this here is  a look going over the Westminster Bridge towards   Big Bend if you decide to go with the double  decker bus you can actually get a fare for one   way as cheap as one pound 75 but if you do a full  day it\'s five pounds 25 per person the big bus is   a bit more expensive and those do vary now let\'s  talk about Westminster where they have Westminster   Abbey the Palace of Westminster the Parliament  and it\'s really an interesting area because of the   historical relevance of this place Westminster is  a neighborhood located in the city of Westminster   in the heart of London in this area you\'ll also  find important houses like the parliament as we   mentioned Westminster Abbey Buckingham Palace  Trafalgar Square and the area is also known for   many different historic architectural museums  theaters and government buildings as well as   a popular shopping area like Oxford Street and  this here is me just cruising around on a big   bus on the top deck you can see this is what it\'s  going to look like for you when you cruise around   and do the tour as well next up we\'re headed to  Hyde Park not the one in Chicago but the one here   in London Hyde Park is actually the largest park  located in the city of Westminster in London it   covers around 350 Acres which is 140 hectares it\'s  right next to Kensington Gardens and St James Park   to other popular parks right next to Buckingham  Palace you\'ll also see that it\'s a popular tourist   destination with wide variety of attractions  beautiful gardens the big lake right here in the   middle and several fountains and statues some of  the famous landmarks include the serpentine Bridge   the Diana Princess of Wales Memorial Foundation  Speaker\'s Corner where people can speak their   minds on a variety of different topics also they  have events including the annual Winter Wonderland   Festival but yes I would definitely recommend  walking around here and just relaxing middle   of the day typically in the summertime is the  perfect time for these Parks Hyde Park St James   Park and the trees around here when they\'re  in bloom very beautiful to walk around during   this time lots of swans and other Ducks as well  some of the wildlife you\'ll find around London   next up we\'re actually headed to the Natural  History Museum you can see this big blue whale   skeleton right there on the roof the Museum\'s  exhibits include a wide variety of natural   world stuff like geology botany paleontology  zoology a collection of dinosaur fossils and   of course the blue whale from the roof which I  mentioned previously it is in the neighborhood of   Kensington in London so you can also check out  the science center the Science Museum and the   Victorian Albert Museum while nearby the museum  founded in 1881 is one of the largest natural   history museums in the world housing over 80  million specimens in its collection so this is   a really large museum with a variety of different  Natural History that\'s very interesting that\'s one   of the things about London the museums here are  definitely world class and of course the kids are   going to love these life-size replicas of the  dinosaurs even these feathered dinosaurs right   here plan for around three to four hours here  next up we\'re actually headed to the Tower of   London and we\'re going to talk about the history  involving this structure this historical Castle   was founded in 1066 by William the Conqueror and  served as the Royal Palace a prison and a mint as   well as the Fortress for many centuries right here  on the Thames River it is one of London\'s most   popular tourist attractions millions of of people  visit here every year next up we\'re at The Shard   which is the largest skyscraper in all of London  standing over 1016 feet tall that\'s 310 meters it   was completed in 2012. it\'s a mixed-use building  for business offices restaurants and luxury hotel   and you can go to the top where they have the  view from The Shard there is panoramic views over   London at 800 feet and if you\'re looking for these  observation decks I would also recommend you check   out something called the sky Garden another area  that I highly recommend you check out is called   the Covent Garden it\'s a popular District in the  West End of London it was originally established   as a fruit and vegetable market but nowadays you  can go to places like the Crown and Anchor Bar and   restaurant this whole area is very colorful it was  established in 1904 if you go to that Crown and   Anchor Bar in addition to the market they also  have historical buildings like the Royal Opera   House St Paul\'s Church many street performers  you can can find up and down the road here so   walking around taking in the sights and sound  doing some shopping really this is the vibrant   atmosphere of London right here it\'s really a  mix of old buildings and new buildings as you   can see they have the IMAX theater and a casino  right there along the road and next up let\'s   talk about Chelsea Football Club you can see the  stadium right here London and England in general   very popular teams they have Liverpool they have  Manchester but here in London the main team is   going to be the Chelsea Football Club and if you  can try to get to one of those games you will have   a good time now we\'re headed to Trafalgar Square  it is a Public Square named after a British royal   Navy battle between France and Spain in 1805. you  will also see Nelson\'s column which commemorates   Admiral Horatio Nelson who died at the Battle  it stands over 169 feet and it\'s surrounded   by four bronze Lions there is also a National  Gallery world-renowned Art Museum that houses   over 2 300 paintings nearby so when you come down  here to Trafalgar Square it\'s a popular tourist   destination with both tourists and locals and  a vibrant Lively atmosphere throughout the year   really next up we\'re at Cuddy Sark a historic  British Clipper right here in Greenwich London   it was built in 1869. today it\'s a popular tourist  attraction because of the historical relevance of   this ship and a poem now we\'re on the way to the  HMS Belfast just down the Thames from the Cutty   Sark which is a ship built in the 1930s it played  a significant role in World War II including the   D-Day Landings and sinking the German battleship  schrenhorse so this is a very historical ship and   it was actually decommissioned in the 1960s now  it\'s been preserved as a museum and opened to   the public since 1971. that\'s the thing about  visiting London you\'ll realize they\'ve been   involved in many different Wars not just World  War One or World War II there was many different   Wars that the British Empire was fighting in  and HMS Belfast and the Cutty Sark are just two   relics of that war fighting pass that come out of  London and now we\'re at the Tate modern which is   a Contemporary Art Museum located on the bankside  area of London so this has a network of galleries   that you\'ll want to check out if you\'re into art  they have sculptures paintings and photographs   as well as having a permanent collection they also  have a variety of temporary exhibitions throughout   the years onto the London Underground also known  as the tube it is a rapid transit system that has   over 270 stations and 400 kilometers of track  it\'s a really big Metro that goes all across   the London area it operates 24 hours a day it\'s  not just underground by the way there are some   areas that go above ground it was originally  opened in 1863 so it was one of the very first   metro systems in the entire world now let\'s talk  about the food and Cuisine while here obviously   English breakfast is very popular you can see  they\'ve got sausages eggs they\'ve got bacon and   tomatoes Sometimes some mushrooms very popular  also fish and chips fresh fish that\'s actually   deep fried and some french fries also you can  see a variety of different other Cuisines that   involve mostly sausages and various cuts of meat  and also beer lots of beer here in London well   that\'s 22 things to do in London hope you guys  enjoyed it if you did please consider liking   the video subscribing to the channel thank you to  all of our channel members and also watch our next   video from Paris or Rome by clicking one of these  links or the links in the description [Music]   thank you\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n'),
(3, 'VxMHHqSOSTk', 'TOP 10 Things to do in LONDON - [2023 Travel Guide]', 'https://www.youtube.com/watch?v=VxMHHqSOSTk', 'In this video, we\'ll show you the  top 10 things to do in London.  The suggestions are based  on our many trips to this beautiful city.  Don\'t forget to like this video, subscribe to our channel, and enable notifications. And share your own experience  or ask a question in the comments below. This video is sponsored by GetYourGude,  the best way to book your London experiences.  The link is in the description. And stick around until the end because  we have a bonus attraction for you.  Here are our top 10 picks: NUMBER 10: Big Ben and Palace of Westminster The Big Ben clock tower was completed in 1859. This British cultural icon is situated at  the north end of the Palace of Westminster,   which is the seat of the Parliament of the United  Kingdom. The official name of the tower in which   Big Ben is located was originally the Clock Tower and was oficially renamed to Elizabeth Tower in 2012.   Did you know that Big Ben chimes  every hour, and every 15 minutes   smaller bells chime to indicate quarter hour?  The Big Ben chimes can be heard up to 5 miles away.   A few steps away from Big Ben you’ll also find an impressive  gothic royal church, the Westminster Abbey. NUMBER 9: Camden Town This former industrial economic base has been replaced by service industries such as retail, tourism, and entertainment.   The area now hosts street markets and music venues  strongly associated with the alternative culture.   Visit the busy Camden Market, which got its name  from what used to be a horse stable and hospital,   located right next to Camden Lock. Don\'t skip  Camden Market Buck Street, England\'s first market   dedicated to the conscious consumer. There are  many other impressive neighborhoods and streets   worth exploring in London, like the upscale  Soho close to Chinatown and Notting Hill,   home to Portobello Road Market. But more about  exciting places to shop and eat shortly.  NUMBER 8: Museums London is full of incredible museums, and most of them are free. You can start with The British Museum, founded in the mid-19th century. The museum is dedicated to human history, art, and  culture. Did you know that it also displays the famous Rosetta Stone?  This piece of rock with an inscribed slab became the key to unlocking  the mysterious Egyptian hieroglyphs. Continue to the beautiful 19th-century Natural History Museum,  exhibiting a vast range of specimens  from various segments of natural history. You can even try the earthquake simulator recreating the 1995 Kobe, Japan earthquake  or embark on other  fun and educational adventures. And the impressive Science Museum is just around the corner.  A great place to see, touch, and experience science  first-hand. Of course, there are many other museums in London worth exploring. NUMBER 7: Covent Garden Covent Garden is a car-free area next to the  Royal Opera House, filled with luxury designer boutiques, craft shops, and booths. Conveniently  located in close to London\'s famous theatres,  Covent Garden also offers excellent dining  options. Visit Covent Garden Market,   a seven-day-a-week market that opened in 1845,   and Jubilee Market, with a variety  of goods sold throughout the week. There are many other markets  in London worth exploring,   offering everything from food to antiques and  collectibles, like the Portobello Road Market,   Borough Market, and many other  places, including fascinating food courts.  Check our travel guide for more  suggestions. By the way, our mobile-friendly travel guide  covers the top 20 things to do in London and things to know before you visit. NUMBER 6: London Eye London Eye is a giant Ferris wheel on the South Bank of the River Thames  overlooking Big Ben and Westminster. When it opened to the public in the year 2000,   it was the world\'s tallest Ferris wheel. The structure is 443 feet or 135-meter-tall, and the wheel has a diameter of 394 feet or 120 m. London is full of other impressive views, that from London\'s Highest Public Garden - Sky Garden. NUMBER 5: Little Venice Little Venice is a neighborhood centered on decorative houseboats and a partly tree-lined, three-way junction of canals. Little Venice is one of London\'s prime residential areas and contains restaurants, shops, theatres, and pubs.   A refreshing site and something you do not expect to see in London. If you have time, explore the nearby Paddington basin with Floating Pocket Park. NUMBER 4: Buckingham Palace Buckingham Palace is the most iconic royal  building in the UK. It is the London residence   of Her Majesty the Queen and is one of only a  few working royal palaces left in the world.   Don\'t miss the iconic ceremony of Changing  the Guard, also known as Guard Mounting,   carried out by soldiers on active duty from the  Foot Guards. They have guarded the Sovereign   and the Royal Palaces since 1660. Check the  description box for the link to the updated guard   mounting timetable. And while you are in the area,  take a walk around beautiful St James\'s Park.  And that brings us to GetYourGuide - the sponsor of this video. When you book experiences or tours, for instance, a guided tour to learn more about Buckingham palace and other parts  and history of Royal London, you can  effortlessly do that with GetYourGuide. You can even buy a London city pass, which  allows access to other attractions around the city  and enjoy a hop-on hop-off  bus tour and skip-the-line privileges.   Or you can book other exciting experiences.  The choices are practically limitless   anywhere you go since GetYourGuide  covers over 3600 destinations worldwide with over 60,000 curated experiences. You  might even find things you never knew existed. You can also book your next  experience using your phone with an easy-to-use app and have your  tickets ready right away with no printing and free cancelation up to 24 hours before  your activity. Download GetYourGuide now and find your unforgettable experience in London.  The link is in the description. NUMBER 3: Shopping From high-end department stores to quirky boutiques, London is a shopper\'s paradise. One of the best places to start your shopping spree is Oxford Street, the busiest shopping street in Europe. Continue to the nearby SoHo neighborhood, home to a truly unique shopping experience, like the famous Carnaby shopping street or Liberty London.   If you are in the area, visit the fashionable Regent Street   that passes through Piccadilly Circus, also  famous for dining and lifestyle. If you love luxury department stores, don\'t skip Harrods,  with over 5000 brands selling everything from   luxury accessories and clothing to the newest  gadgets, prestigious furniture, and delicious food. There are many other places worth exploring,  like the unique Cyber dog store in Camden with futuristic fashion, clubwear, and rave clothes.  Check our travel guide for more information. NUMBER 2: Parks & Gardens There are many impressive green areas in London worth exploring.  Hyde Park is London\'s main park offering world-class events and concerts   and plenty of quiet places to relax. Walk around Princess Diana Memorial Fountain   or rent a boat to paddle around the lake. Don\'t skip the nearby royal Kensington Palace with the vast Kensington Gardens and picturesque Italian Gardens. Our favorite was The Regent\'s Park with plenty of paths and a green areas to relax. Walk around beautiful lakes and breathtaking gardens,   including the Japanese Garden  Island, and admire the animals.  NUMBER 1: Tower Bridge and Tower of London Tower Bridge crosses the River Thames and was  built at the end of the 19th century. You can even take a boat ride that goes under Tower  Bridge. Don\'t miss the two essential attractions nearby - the historic castle Tower of London from  the 11th century, which is famous for holding many infamous prisoners as well as housing the  crown jewel, and the remains of the Roman Wall   built in the 2nd and 3rd century. Most of the  buildings in London were destroyed throughout   its 2000-year history. However, you’ll still  find Roman and other ruins spread throughout   the city that are still visible today.  Check our travel guide for more suggestions.  And here is the bonus attraction that we promised. Did you know that the Prime Meridian Line, an imaginary line like the equator dividing the  earth into the eastern and western hemispheres,   is located in Greenwich, a village near  London? You can actually see the line and cross it.  How cool is that? And while you  are in the area, explore other attractions,   like Cutty Sark, the iconic sailing  ship, the fastest ship of its time.  Continue to our video on what you  should know before visiting London.\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n'),
(4, 'tkr8iuG6QR8', '5 major things London tourists ALWAYS overpay for | ad', 'https://www.youtube.com/watch?v=tkr8iuG6QR8', '- Good morning from London. It happens to all of us when we travel to a new place, that we end up overpaying for a bunch of different things and that happens for a variety of reasons. But in this video, I\'m gonna tell you about five things I always see tourists overpaying for, and how you can avoid doing that, so let\'s go. Getting from the airport to the centre of London, there are three ways that I see tourists overpaying for this, so let me walk you through them. Let\'s start with taxis. Almost all of London\'s airports are not actually in London, so a lot of tourists will walk off the plane and be shocked when they find out that a taxi to their hotel is going to cost them 100 Pounds or more. If that\'s not in your budget, every airport has at least a couple of public transport options that will get you into Central London for a lot cheaper. With just a quick search on Citymapper from the airport you\'re flying into to your hotel, you can see all of your available routes and also how much each of them will cost you. Just be sure to adjust your arrival time in the app because the availability of public transport drastically reduces very early in the morning or late at tonight. Now let\'s talk about the Heathrow Express. If you fly into London Heathrow Airport, you\'re gonna see loads of signs telling you to take the Heathrow Express into Central London. You can do that, but the Heathrow Express is the most expensive train per minute in the world, at 25 Pounds per ticket for a 15 minute ride. But if you\'re booking your ticket 90 days in advance, or more, you can avoid paying 25 Pounds and instead opt for an advanced purchase ticket, which just five Pounds 50, which makes it cheaper than taking the tube, which actually takes way longer. If you aren\'t booking your tickets 90 days in advance or more, you can still avoid that 25 Pound ticket price by avoiding the Heathrow Express and opting instead for the Elizabeth line. This goes into Paddington as well, takes only 28 minutes, and only costs 12 Pound 80. So it\'s much cheaper, just a bit slower. The Elizabeth line also goes well into Central London and even to East London, so Google Maps might actually tell you that taking the Elizabeth line to your hotel is a much better option anyway. Now if you\'re not flying into Heathrow, chances are you\'re flying into Gatwick Airport instead and we\'ve got another tricky one there as well. There is the Gatwick Express, and that is a hard no. In basically all instances, if you take the Gatwick Express, you will be overpaying for your transport into Central London from the airport, why? Well, one-way the Gatwick Express ticket, when you buy it at the station, is 20 Pounds, and the train takes 30 minutes to get to London Victoria Station. But there\'s also a Southern train that goes from the exact same place to the exact same place, that is only 12 Pound 50 and has two extra stops in between, making it only three minutes longer than the Gatwick Express. So if you take the Gatwick Express, you\'re paying a lot more money for saving three minutes of time. So it\'s basically just never worth it. By the way, this video is sponsored by Google Pixel. I have been using Google Pixel phones for years, and I just got my hands on the brand new Google Pixel 7 Pro, which is made out of 100% recycled materials. There are lots of new features that come with the Google Pixel 7 Pro, but as always, my favourite new features have to do with the camera. The new super res zoom is very impressive, giving you 30X zoom, which makes for very dramatic, very up close photos. I also pair the phone with my new Google Pixel Watch, and I use it with Google Maps so I can navigate around London without having to have my phone out. If you wanna find out about all the other features that come with the Google Pixel 7 Pro, click the link in the description box of the video. And now let\'s get back to the things that tourists always overpay for. - It\'s my first time here. - Oh! - And I\'ve seen all your videos and all your things before coming here. - Oh cool! Overpaying for public transport. Okay, so now you\'re in Central London and you wanna get around the city. The number one way that tourists overpay for the tube and the bus while you\'re here is by getting a daily travel card. Now you hear daily travel card and you think, oh, unlimited rides, that surely is gonna save me money. But it actually doesn\'t, it actually ends up costing you more than if you had just used an Oyster card or contactless payment methods, let me explain. The daily travel card costs 14 Pound 40 for travel through zones one through four. Now, most tourists end up staying in zones one to two, which if you pay for public transportation in those zones, the daily cap or the most that you\'ll ever pay for the entire day in zones one to two is just seven Pounds 70. So if you stay in those two zones and you get a daily travel card, you\'re basically paying double the price for the same type of travel. Even if you do travel through zones one through four, the daily cap for those zones is 11 Pounds. So you\'re still paying more if you get a daily travel card. If you\'re super confused, don\'t worry, all you have to know is don\'t get a daily travel card, you\'ll end up paying a lot more. And instead, pay for your transportation with contactless payment method or an Oyster card, and you\'re good to go. Okay, enough about public transport. Let\'s talk about attractions. I get mixed reviews from my community who go and do the must dos in London, like the London Eye or the Tower of London. The tickets for major attractions like this are like 30 Pounds plus. So some people feel as if they have overpaid for going to these things. So, how do you know if you\'re gonna feel like that? Well, it seems simple, but ask yourself, why am I gonna go to the Tower of London if I\'m not really that interested in history? Or if you don\'t really like musicals, don\'t feel like you have to go see a show on the West End. It\'s important for you to think about what you like to do and what you\'re interested in, and not what someone tells you is a must do when you\'re in London. We have so many things that you can do here, that no matter what your interest, you\'ll always find something that will be of interest to you and that you\'ll feel that you got good value paying for, and that you didn\'t overpay for it. Okay, now let\'s say you are here to do all the big must dos and the big tourist attractions, that\'s totally fine. Let me give you a couple tips to help you save a little bit of money and help you feel like you haven\'t overpaid for your attractions tickets. First tip, most tickets are 10% cheaper if you order them online versus getting them at the door, so make sure you do that ahead of time. Number two is to check out the London Pass and the London Explorer Pass. These are two different city passes that give you discounts for going to a bunch of the attractions around the city. And I have articles for both of them that will help you figure out if either of them are gonna be a good fit for your trip, so I\'ll leave links to those in the description box. Overpaying for bad food near the tourist attractions. Make sure that you plan out your meals when you\'re going to be sightseeing, and don\'t just leave it to, we\'ll find something when we\'re there. That is the perfect recipe for ending up at any old restaurant, that\'s probably a tourist trap, where you\'re gonna pay a load of money for some really bad food. By doing your research and planning your meals out, you can ensure that you\'re not trying to find any old place while on an empty stomach. You can make reservations at the good places, you can make sure you can actually get a table at the time that you want. And you can just do your research and make sure that you\'re finding places that you are gonna feel like you got really good value for your money. It could mean the difference between paying 30 Pounds for a terrible burger at Planet Hollywood, or paying half the price at a market just around the corner that has delicious street food that you knew about because you did your research. Overpaying for your accommodation, just \'cause you think you\'ll be safer. I once had a follower tell me that a friend of his told him that the only way to ensure that your accommodation in London is safe enough is to make sure you\'re paying at least 600 Pounds a night for it. That is absurd and also completely wrong. I do hear of a lot of tourists who end up spending a lot of money on mediocre, international, overpriced hotel chains here in London because they think they\'ll be more comfortable and more safe there. But the truth is that here in London, we have even budget hotels and hostels that are incredibly safe. So you don\'t need to overextend yourself to be able to feel comfortable and safe where you\'re staying. That\'s tip number one, tip number two is we have lots of accommodation recommendations on loveandlondon.com. But if you\'re looking at a particular property here in London, the best way to get a feel of if it\'s going to be safe is simply to read through the reviews. So make sure you check those booking.com or TripAdvisor reviews before you book anything. Tip number three, don\'t be afraid to book accommodation a bit outside of Central London where all the main tourist attractions are. Generally, you\'re gonna get a bit more for your money if you do that, but it doesn\'t mean that you\'re gonna be anywhere that isn\'t safe. If you stay outside of Central London, you can get to better know some of the more local areas that we have in the city that are also perfectly safe. And you get to know the tube and the bus system really well, which I think is a great part of staying in London. If you want more tips for your London trip, I have literally hundreds of videos that you can watch. And you can do that by clicking one of the boxes popping up right around me. (inaudible station announcements) \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n');
INSERT INTO `app_transcript` (`id`, `video_id`, `video_title`, `video_url`, `transcript_text`) VALUES
(5, '5XCI_gP6m2E', '9 BEST Places To Visit In Saudi Arabia (&amp; Top Things to Do) | Saudi Arabia Travel Guide', 'https://www.youtube.com/watch?v=5XCI_gP6m2E', 'Saudi Arabia is the largest Arabian  country in Asia as expected there are  many exciting things to do here in this  country here are the top places to visit  in Saudi Arabia for the best vacation  experience be sure to stick around until  the end to discover the breathtaking  destination at number one  number nine Triad Riyadh is Saudi  Arabia\'s capital and the country\'s  largest city it is also one of the most  popular tourist destinations in the  Middle East and you don\'t want to miss  out on visiting it during your stay in  Saudi Arabia in fact the capital city  should be among your top priorities and  the first places to explore once you get  here plus the King Khalid International  Airport is the second largest airport in  the country and likely where your flight  will touch down it is located just north  of Riyadh making the city easily  accessible This Magnificent City doesn\'t  waste any time to impress and you will  be immediately wowed by the modern  architecture lined up here you might  need a moment to take in the beautiful  scenery before heading down to explore  the several attractions in the city King  Abdul Aziz historic Center is the  national museum of Saudi Arabia and it  is a good place to start your tour here  you will learn everything you need to  know about Saudi Arabia\'s Rich history  and Heritage also with more than eight  exit ambition Halls to explore you can  rest assured of seeing your fill of  historic relics and monuments the  capital city also boasts other  impressive attractions like the Almas  mock Fort how rajahi Grand Mosque and  the end of the world clip at the end of  the toike mountain range also get ready  to be blown away by the mesmerizing view  of the 99-story skyscraper in the  Kingdom Center you might also want to  check out the ever busy dirasuk where  you can shop for take-home souvenirs  number 8. Medina known as the city of  God Medina is considered the second  holiest city in Islam and one of the top  attractions in Saudi Arabia it is where  the Prophet Muhammad lived after he left  Mecca and you can explore the different  attractions in this city when you arrive  although the city did exist for over  1500 years before Muhammad\'s immigration  it only really became significant after  the prophet today not only is it famous  for its religious significance but it  also has some cultural relevance events  that further adds to its importance  al-mashid on nabawi is the prophet\'s  mosque in Medina and it is a site worthy  of visiting for religious enthusiasts  the architecture and structure of this  mosque also make it a valid attraction  for regular tourists looking to have a  good time exploring the holy city  however non-muslims can only admire the  structure from a distance as they are  not allowed into the mosque premises  although the city is developed and  features a few more attractions tourists  often only visit here for religious  duties number seven yonbu yanbu is a  port city in the Red Sea region of Saudi  Arabia and it shares a coast with the  famous sea of course yanbu is a very  popular city because of its numerous  attractions but it is also economically  significant because of its shipping  terminals the port has been used as a  point of trade for many years especially  for the Import and Export of petroleum  well you could bet that this city is  worth your time and attention as there\'s  much more to it than its Port due duties  thanks to its fantastic beaches yonbu  has become an ideal relaxation spot  especially after a tour of the desert  Landscapes some activities to enjoy here  include swimming snorkeling and spa  treatments among others also there are  some exotic Resorts and hotels offering  Top Class accommodations to interested  tourists you can also enjoy the  delicious Cuisines served in the  restaurants around town number 6. Jetta  Jetta is a must visit destination in  Saudi Arabia especially since it\'s the  top Trade Center in the country the  ancient city became prominent as early  as 647 when it was named an  international travel Hub Jetta is the  biggest and Main port in the country and  it also shares the coast of the famous  Red Sea of course the top attraction in  Jetta is its International Airport  however all Rama mosque is a very close  second as it also records tons of  visitors annually also known as the  floating mosque all Rama is enclosed By  the Waters of the Red Sea and its white  silts often look as though they are  suspended tourists visiting Jetta can  count on having a fun experience as  there are more than a few attractions to  explore here if you are thrilled by  archaeological sites you may want to  visit all balad historical site you can  also check out king fod\'s Fountain  towards the city center shop at the Red  Sea Mall or stroll along the Jetta  Cornish number 5. hail a trip to the  southwestern part of the country will  bring you to hail which is the capital  and the largest city in the name Sac  region bordered by Mount Shamar to the  north and mount Sama to the South the  city boasts a unique landscape dominated  by the Red Sands of the aona food desert  the city is most famous for the  international events hosted here  including the hail International rally  and desert festival at the center of the  city you\'ll find the popular hail Market  where agricultural produce from the city  is sold feel free to shop for fruits  vegetables and dates which are favorites  in this part also so check out the  nearby kishler Palace which is a 20th  century artillery and weapon Depot in  the hyu besides you may want to look  into the city\'s Rich history at the hail  Heritage Museum here you\'ll find about 2  000 antiques representing the culture  and history of the city Life\'s too short  to stay in one place hit that subscribe  button and let us take you on a journey  to some of the most amazing destinations  around the world number four dam is one  of the top cities in Saudi Arabia and  it\'s a must visit for tourists visiting  the country the fact that it is only the  fifth most populated city in the country  goes to show just how great the city is  demand is the richest oil region in the  world and it is the major Center of  saudi\'s oil industry the city is well  developed and the view is enchanting  even at first glance however the fun  only starts once you get into the city  first it would interest you to know that  demand boasts the country\'s largest  International Airport the king thought  International Airport in demand operates  37 Airlines which makes it easily  accessible for many countries next you  may want to head down to demam Cornish  which is a perfect place for an evening  on the seaside this Cornish overlooks  the sea on one side and lines up some  fancy restaurants and buzzing cafes on  the other there\'s hardly a better place  to watch the sunset in Saudi Arabia than  here along the coast of demand plus  other attractions in demand include  merjon Island othai mall and Prince  Muhammad bin fod Stadium among others  number three a Seer National Park you  should know that Saudi Arabia also  boasts an impressive collection of  wildlife most of which are displayed in  zoos around the country however the asir  national park in ABBA is your best  option to see an extensive collection of  this Wildlife a Seer National Park is an  almost untouched Wilderness in the heart  of Saudi Arabia with remarkable natural  landscapes the park covers an area of  more than 617 Square miles and is home  to about 300 different animal species of  course you can join a guided tour to  explore this Nature Reserve which  promises to be one of the highlights of  your trip number two hegra hegra is home  to one of the oldest and most impressive  structures in Saudi Arabia which is the  lonely Castle this historic structure is  believed to be over 2 000 years old  today it is one of the most famous  landmarks in the country and the  archaeological site has also proven to  be a must visit attraction especially  for history Buffs the unique art and  architecture of hekra\'s structures were  inspired by the nabatean people who were  the original inhabitants of hegra  although the monument was never  completed it is still one of the top  attractions in the region and is very  much worth visiting surely you will  Marvel at what is waiting for your  viewing pleasure when you arrive here  number one Mecca Mecca is by far the  most popular city in Saudi Arabia the  city is the capital of the mecca  Province and the holiest city in Islam  it is the birthplace of the Prophet  Muhammad and the religion of Islam and  only Muslims are allowed into the city  also Mecca often records large numbers  of Muslims trooping in for Hajj which is  the annual Islamic pilgrimage plus this  city is home to Masjid al-haram the  largest mosque in the world attracting  millions of devotees worldwide so if you  are a Muslim visiting the holy city of  Mecca will be a dream come true as you  get to experience true worship with  other devotees undoubtedly you will love  every bit of the experience click here  for more places to visit in the Middle  East'),
(6, 'dMwntdgw9qY', '10 BEST Things to Do in Jeddah, Saudi Arabia | Travel Guide', 'https://www.youtube.com/watch?v=dMwntdgw9qY', '[Music]  welcome to Jetta Saudi Arabia\'s  captivating coastal city along the Red  Sea known for its Rich history stunning  beaches and vibrant nightlife this  bustling Metropolis has something for  everyone here are the top things to do  in Jeddah Saudi Arabia number 10. Jetta  Cornish begin your exploration of Jeddah  by taking a leisurely stroll along the  Jetta Cornish A 2.6 Mile Stretch of  recreational parks in Seaside promenades  not only does this location offer  breathtaking Coastal scenery and  family-friendly activities it is also an  excellent place to gain your bearings  and Orient yourself within the city  while enjoying the beachfront views you  can indulge in local Cuisine and explore  cultural trademarks such as the floating  mosque and King fod\'s Fountain you can  explore the marine life exhibits at Foxy  aquarium shop for designer brands at the  mall of Arabia or enjoy a relaxing Boat  Ride Along the Red Sea and take in the  beautiful views of the coastline  children will love the thrilling rides  and entertainment at a tala happy Land  Park Jetta Cornish offers A Perfect  Blend of history and modernity making it  an ideal destination for travelers of  all interests who are looking to  experience the wonders of the  Magnificent City number 9. Bob Maca Bob  Maca a Monumental three-arched gate in  Jeddah holds immense cultural and  religious significance for both locals  and visitors as one of the top  attractions in the city it serves as the  principal gateway to Mecca Islam\'s  holiest site located 40 miles east of  Jeddah while exploring this historical  landmark you can\'t help but be awestruck  by its impressive architecture and Rich  history the fortification around Bob  Marcus speaks volumes about its  importance in safeguarding the sacred  pilgrimage route visiting this unique  structure is definitely a must when  searching for things to do in Jeddah not  only will you gain insights into its  religious significance within Islam but  also appreciate its role as a central  hub for Pilgrims from all over the world  number eight Jetta flagpole as part of  your Unforgettable visit to Jetta make  sure to check out the awe inspiring  Jetta flagpole Standing Tall at 560 feet  it proudly claims the title of the  world\'s tallest lagpole until 2021 and  is a true Testament to Saudi Arabia\'s  national pride during your time at King  Abdullah Square take the opportunity to  witness the raising or lowering of the  massive national flag that adorns this  colossal structure as you Marvel at its  sheer size and impressive engineering  feat don\'t forget to capture some  stunning photos against this unique  backdrop for your travel memories number  seven albelad if you\'re seeking a rich  cultural experience on your trip to  Jeddah look no further than albillard  this historic district is brimming with  history and charm as it\'s been the Heart  of the City since the 7th century begin  your albillard exploration at Bob Jade  old gate before wandering through narrow  streets lined with intricately detailed  Coral houses take time to visit art  exhibitions that showcase Saudi talent  and stop by by ancient trading ports  paying homage to the area\'s once  bustling Market life for True immersion  into local culture take advantage of  city tours where knowledgeable guides  will share engaging anecdotes about  historical sites within Avalon number  six King fod\'s Fountain one of the most  iconic landmarks in Jeddah is King fod\'s  Fountain which was donated to the City  by King fodd situated on the Red Sea  Shoreline this attraction is visible  from any point in Jeddah the fountain  holds a Guinness World Record as the  tallest Fountain of its type globally  reaching up to 853 feet high when  visiting Jeddah Travelers should  consider adding it to their itinerary  for an unforgettable sightseeing  experience Life\'s too short to stay in  one place hit that subscribe button and  let us take you on a journey to some of  the most amazing destinations around the  world number five arama mosque imagine  standing on the shores of the Red Sea  looking out at the sparkling water and  seeing a stunning mosque appear to be  floating on top of it this incredible  architectural Marvel is a sight to  behold and will give you an awe of its  beauty and design as you step inside  you\'ll be greeted by a peaceful and  Serene atmosphere with intricate Islamic  calligraphy decorating the walls and  ceilings you\'ll also see stunning  chandeliers that hang from the high  ceilings casting a warm glow throughout  the mosque while the mosque is primarily  a place of worship for Muslims visitors  of all faiths are welcome to appreciate  its beauty and take in the Magnificent  views of the Red Sea from its many  windows the al-arama mosque is a must  visit destination for anyone interested  in architecture religion or simply  seeking a unique and memorable  experience in Jeddah number four beat  nasif if you\'re interested in history  and architecture you must visit beat  nasif in Jeddah this stunning building  is a perfect example of the traditional  hijazi style of architecture and is  considered one of the most significant  cultural landmarks in Jeddah as you step  inside you\'ll be transported back in  time to the 19th century with its  beautiful Courtyards intricate Woodwork  and stunning geometric patterns you\'ll  see traditional Saudi Furniture pottery  and textiles giving you a glimpse into  the lives of wealthy Saudi families  during that time period the beat nasif  has been beautifully restored and  transformed into a cultural center with  a range of exhibitions and events that  celebrate Saudi culture and Heritage  from traditional music and dance  performances to art exhibitions and  workshops there\'s something for everyone  to enjoy number three Moon Valley Jetta  for an adventure and Jetta look no  further than the Moon Valley a Hidden  Gem that offers stunning natural  landscapes and outdoor activities this  destination is perfect for tourists who  love hiking camping mountain climbing  and stargazing under the starry Skies as  you explore Moon Valley you\'ll feel like  you\'re walking on the moon surrounded by  towering rock formations and lunar-like  terrain the unique and unusual rock  formations are a result of millions of  years of erosion creating a truly  otherworldly landscape you can hike  through the valley and take in the  stunning views or explore the area on a  guided tour to learn more about its  geological history and significance you  can even take a thrilling ATV ride  through the desert terrain adding an  extra layer of excitement to your  adventure number two Mall Of Arabia  you\'ll be amazed by the sheer size of  the mall of Arabia which features over  300 stores restaurants and attractions  to explore from designer Brands to local  boutiques Mall Of Arabia has something  for everyone you can shop till you drop  and take a break at one of the many  cafes or restaurants within the mall  offering delicious Cuisine from all over  the world if you\'re traveling with kids  they\'ll enjoy playing at the indoor  amusement park whether you\'re looking  for high-end fashion items or affordable  souvenirs to bring back home this mall  offers an unparalleled shopping  experience in Jetta that\'s worth  checking out during your travels in  Saudi Arabia number one foxy aquarium if  you\'re a nature lover or interested in  marine life you absolutely must visit  foxy aquarium when in Jetta this  world-class aquarium offers a unique  opportunity to see a variety of marine  creatures up close and learn more about  the rich biodiversity of the Red Sea at  Foxy aquarium you\'ll be amazed by the  stunning displays of marine life  including colorful tropical fish  Majestic sharks and graceful Rays you  can stroll through the aquarium\'s many  exhibits and get an up close view of the  diverse Marine ecosystem making for an  unforgettable experience foxy aquarium  also offers a range of activities for  visitors including interactive exhibits  and educational presentations you can  watch live shows featuring dolphins and  sea lions or even take a dive in the  aquarium shark tank for a thrilling  underwater Adventure click here for more  things to do in Saudi Arabia'),
(7, '-ht6pLR3vcY', 'Riyadh City - 10 of the Best Places to Visit in Riyadh, Saudi Arabia', 'https://www.youtube.com/watch?v=-ht6pLR3vcY', 'welcome to 10 minutes travel today we\'re  counting down our picks for the top 10  of the best places to visit in Riyadh  are you a fan of our videos be sure to  subscribe to 10 minutes travel and ring  the bell to be notified about our latest  video for this list we\'re looking at the  spots that have made Riyadh Saudi Arabia  a go-to Middle East destination for  Honeymooners families and worldly  Travelers Riyadh the capital of Saudi  Arabia is a vibrant Cultural Center  where old fortresses are seen side by  side with Modern Glass fronted  high-rises measuring nearly one eighteen  hundred square kilometers the majority  of the captivating sites are to be found  in the ancient city center such as the  remains of the wall that protected this  formerly strategic point along the  desert trading route the nation of Saudi  Arabia and the City of Riyadh are not  usually thought of as tourist  attractions for many people particularly  those from the U.S however the nation is  attempting to become a more popular  destination with its brand new  electronic Visa process that permits  easy access to the country with one  entry Visa so what are the most  outstanding locations to check out in  Riyadh and what should you not miss out  on here are some of the city\'s classic  and Modern Marvels number 10 Al masmac  fort masmac fort is one of the most  renowned sites in Riyadh which  translates to means strong in the local  language It is believed by the locals  that if this Fortress Falls the Kingdom  of Saudi Arabia will also fall this  Fortress made from clay and mud brick  was built in the 19th century and was  used in the recapturing of Riyadh In  1902 which was a crucial part of the  unification of the kingdom it is now  open to the public as a museum to  showcase the history of the city and the  kingdom as a whole I found the artifacts  and architecture in the Fortress to be  well preserved such as the luxurious  Arabic sitting room with a throne  although admission to the museum is free  I suggest checking for the admission  rules beforehand as there are family  days singles day days female days  furthermore I highly suggest that you  acquire the self-directed walking tour  of riyadh\'s history in almazmak to have  a more thorough experience of the  Fortress and nearby areas without the  requirement of a guided tour  number nine Riyadh desert the golden  desert of Riyadh is one of the top  attractions in Riyadh that many tourists  are eager to explore from Desert  Adventures to cultural exploration you  will find a number of Tours to choose  from to explore the desert in your own  style  number eight Dira Square which is also  referred to as Justice square or Chop  Chop square is a contemporary public  Plaza in which capital punishment by  decapitation is still carried out Saudi  Arabia is the only nation that continues  to do this in a public forum after the  Friday prayer police and other  Administration Personnel clear the  square to permit the executions once The  Condemned individual has been beheaded  the severed head is sewn back onto the  body and they are both wrapped up for  the final rights and taken away despite  the fact that it may not be the ideal  setting to be in while an execution  takes place the area is a pleasant spot  to visit with kids running around and  playing with the water fountains  number seven Al faisalia Tower the  alphaisalia tower stands out in the  Riyadh Skyline due to its pointed  structure that reaches for the heavens  and its glittering golden ball on top  its design is a modern take on classic  Arabic architecture that was prevalent  in the city in the past at a whopping  267 meters this is the fourth highest  tower in the city with 44 floors as with  the Kingdom tower one can Ascend to its  observation deck at the top and find a  shopping mall at its base I suggest  picking either one of the two structures  to check out its skybridge platform  number six the edge of the world have  you heard of Jebel firane it is a  popular destination in Saudi Arabia that  has earned the nickname the edge of the  world due to its 300 meter high Cliffs  that provide an uninterrupted view of  the Horizon the view is both stunning  and terrifying at the same time the  planes below the cliff were actually the  bottom of the ocean millions of years  ago and you can see the dried Rivers  running through the land and the  unspoiled desert landscape from the top  if you\'re lucky you may even spot some  camels moving along the ancient Caravan  route that passed through this area when  you\'re there don\'t forget to take a look  around for some fossils this is evidence  of when the eastern part of the Arabian  Peninsula was a shallow tropical sea  during the Jurassic period the best way  to get to the edge of the world is by  taking a day tour from Riyadh  number five Dira souk which is also  referred to as al-tumiri Suk and alzel  Suk is located in the old District close  to Al mazmak Fort it is renowned for the  gold market and antique stalls there are  hundreds of little shops that have a  wide range of items on sale such as rugs  gold silver souvenirs traditional  clothing and props Antiques and  Furniture the majority of retailers are  able to Converse in English which makes  it a tourist-friendly place to visit you  can go from shop to shop and haggle over  prices in my opinion this is not only  one of the most sought after spots for  tourists in Riyadh but also the most  exciting souk I have been to as it  offers a glimpse into the past with the  antique artifacts that are sold there if  you are only able to visit one souk in  Riyadh make sure to visit this one on  the other hand if you have the time and  would like to travel outside of the city  you can visit Suk al-jamal which is  situated 30 km north of the city center  this is an enormous trading hub for  camels located in the Arabian Peninsula  so it is a great place to get a taste of  the local culture if you wish to  participate in the bidding you should  ask the locals about the current  location and condition of the market as  it is presently undergoing some changes  number four maraba Palace and the King  Abdul Aziz Historical Center provides an  eye-opening look at the past of Saudi  Arabia  the building itself is a contemporary  version of traditional Saudi royalty  construction and it encloses the genuine  former Royal Palace of maraba which is  really worth a trip visitors can explore  the deserted Yard House the antique car  collection the old modulus and an old  water tower there is also a  reconstructed mosque derived from the  original Royal mosque that was connected  to the Palace the center has now become  the cultural core of modern day Riyadh  in fact the center is not only the  maraba palace complex but it consists of  multiple historic sites throughout the  city such as Al Mass Mac Fortress  number three historical diria situated  in the northern outskirts of the  Metropolis Daria formally served as the  home of the Saudi royal family and the  original capital of the country this  UNESCO heritage site had been one of the  biggest cities in the Arabian Peninsula  till it was destroyed in the early 19th  century during a long Siege when the  armies of the Ottoman and Saudi collided  tourists can now visit Daria and  appreciate its ancient mud architecture  plentiful parks and remarkable areas one  of them being the Saad bin Saud Palace  renowned for its Courtyard you can go to  Daria by taking a cab to the outskirts  of the city or you can take an in-depth  half-day tour like this  number two the National Museum located  in close proximity to maraba Palace is  located in a contemporary edifice thus  making it eligible for this category it  is a part of the King Abdul Aziz  Historical Center which is brimming with  significant relics the museum has a vast  array of objects that characterize Saudi  culture and its people there are fossils  ancient architectures and constructions  pre-islamic trading paths and pieces  from the Arab Kingdoms showcased in the  museum the admission charge for adults  is sar-10 and it is free for kids there  are audio visual shows in both English  and Arabic number one sky bridge at  Kingdom Center if you\'re looking for a  bird\'s eye view of Riyadh the sky bridge  is your go-to spot the bridge is  situated on the 50th floor of the  Kingdom tower currently the third  highest tower in Riyadh spanning a  length of 65 meters it offers an  incredible panoramic view of the city  from a height of 300 meters additionally  the kingdom Center mall is located at  the base of the skyscraper offering a  variety of luxury Brands the views from  the bridge are spectacular both during  the day and night but the night view is  arguably more mesmerizing with the city  lights and the other Towers illuminated  in a range of colors do you agree with  our picks check out these other recent  videos from 10 minutes travel and be  sure to subscribe and ring the bell to  be notified about our latest videos');
INSERT INTO `app_transcript` (`id`, `video_id`, `video_title`, `video_url`, `transcript_text`) VALUES
(8, 'QsqVixWw0j0', '15 BEST Things to do in Riyadh Saudi Arabia in 2024 ????????', 'https://www.youtube.com/watch?v=QsqVixWw0j0', 'Welcome to Riyadh, the pulsating heart of Saudi  Arabia. Riyadh is the largest city on the Arabian   Peninsula with a population of nearly 8 million  people. The city is the capital of Saudi and it   is also referred to as the cultural capital of  the country where ancient history and modern   development intertwine and in today\'s video guys  we are going to be exploring all over this massive   city and when I say massive it\'s not just about  population but Riyadh is one of the most unique   places I\'ve been to for the reason being that  it is one of the most spread out cities I have   seen in my entire life and so you can see it\'s  basically just a massive grid that stretches   as far as the Horizon can be seen with a naked  eye from here to go from one side of the city   to the other could take you an hour and a half  or more but because it\'s so vast there\'s also   a lot of things you can do both inside the city  as well as just outside in the beautiful desert   lands so right now I am in one of the places  that we\'ll be sharing with you guys a little   bit later in the video and aside from that like  a lot of people do speak English you\'ll get a mix   of like workers and restaurants who are from the  Philippines, Bangladesh, India you know uh if   you have Google translate you\'re always going to  be able to figure out how to communicate I would   also mention that gasoline prices or petrol is  much much cheaper like I\'ve got a small little   SUV that I\'ve been driving around roughly $ 20  $25 to fill up the tank so really inexpensive   but I just want to tell you that we have so many  things on this list and they\'re not in any order   from best to worst so make sure you stick around  to the end of this video so you don\'t miss out on   any of these amazing things to do here in Riyadh, Saudi Arabia. Number one on the list is to visit   Al felia tower all right and we have made it up  to the viewing point of the globe so we\'re going   to do a little walk around here it looks like it  is quite windy the views we came for there\'s the   Kingdom tower which you probably saw at some point  in this video that we went up to the top of that   one which I believe is a bit higher but coming  here at I guess like a bit more of a I guess   you could call it a cloudy somewhat rainy over  there day you can actually see things uh quite   clearly now they could use a little bit of a  glass cleaning but uh overall this is insane   standing at a whopping 267 M high comprising of  55 stories elisia Tower is notable for being the   first skyscraper built in Saudi Arabia it is  shaped like an elongated pyramid and it looks   particularly futuristic stick at night standing  out distinctly in the cityscape for about $18.40   you can take an elevator to the very top the  tower is actually famous for the enormous glass   globe near the Apex which is 24 m in diameter and  made of 655 glass panels let look at this it is a   bunch of mirrors so when you get closer to it  you can see me and then it kind of like turns   it this way number two on the list is to take  a 1-hour trip to the western side of Riad where   you can visit the Red Sand area we are actually  about to jump on these ATVs and go for a cruise   so we\'ve got the uh ATVs for 150 R per hour which  is I think like uh maybe $3 us and we got me and   the Don Rob I don\'t think they\'ve got helmets out  here now keep in mind that these ATVs are a bit   older for instance my cousin actually had one and  the brakes were not working properly [ __ ] bro oh [ __ ] all right my friends we\'re going  full speed ahead now let\'s going none of this   fortunately the ATVs aren\'t super fast so the  risk factor is reduced there but right at your   own risk our guys didn\'t have any helmets we  could use so that was a little bit scary this   is it my friends welcome to the Red Sand Dunes  we\'re out here in Riad or distant riad\'s nature   and look at this we\'ve just got rolling sand  dunes here in the distance since it\'s not the   weekend you don\'t have as many people here but  that\'s one thing I\'ll mention if you\'re here on   the weekends there\'s going to be a lot more but uh  yeah you got cars parked up there having picnics   and yeah one important thing I want to mention  here guys is I noticed there\'s a lot a lot of   trash in these beautiful beautiful sandw deserts  so it\'s still an amazing experience and I highly   recommend coming out here to do this but just  like pick up your trash all right riding up and   down the sand dunes in Riad is truly a remarkable  and must do experience my cousin and I spent about   2 hours doing doing this excursion which gave us  enough time to enjoy the thrill plus relax on top   of the sand dudes right at that breathtaking  desert Sunset one thing I want to mention is   this video is not sponsored but this video is  in collaboration with my new brand which his   perception it\'s all about changing perceptions  of the world one country at a time so if you   guys want to check out my new clothing brand that  literally just launched this year in 2024 you can   check it out in the link in the description  below and it would be a great way to support   this channel number three on the list is I\'m over  here at Wadi Namar and there is a huge waterfall   here that I\'m actually searching for but what  this place is is a massive almost like Desert   Oasis feel where we have this Lake in the middle  I even see actually see some fish swimming around   in here and you\'re surrounded by like this Rocky  Canyon and it looks like they\'ve built it up to   be in this like picnic like format you can see  families and friends and people all along the   entire area I\'m both sides fire pits right there  picnics places to pretty much just relax and have   a good time it\'s really peaceful here inside  the city but since it\'s down in this Canyon all   you can hear is well the sound of some traffic  of people inside the park and families playing   but other than that like it\'s a pretty peaceful  place to be able to walk around and enjoy this   place it stretches so far down I did a drive  right when we got here and I just kept going   until I was like okay now it\'s time to stop and  turn around because the sun was about to set but   I\'m sure like to walk around this entire area  would take hours cuz just to go from one side   of the other I didn\'t even make it to the end but  from one side to as far as I went took me like 10   15 minutes of driving so you\'ll definitely want  to check out the massive waterfall but at night   it is a little bit harder to see and that\'s  when I experienced it so if you can arrive a   little earlier to see the waterfall I think it\'ll  definitely be worth it number four on the list is   to visit Al masmak Palace a site that offers a  comprehensive dive into Saudi history this place   showcases the historical lifestyle in Saudi Arabia  providing insights into the evolution of the city   and Country as you explore this place you\'ll  be taken back in time with numerous artifacts   bringing the past to life constructed in the hij  14th century during the reign of Imam Abdullah   Bin fisel the al- masmak palace served as its  residence and a center of power and finance the   Arabic word el- masmak translates to a strong  thick building and the palace was originally   used as a Depot for weapons and ammunition it has  since been transformed into a historical landmark   and now functions as a museum it\'s really cool  to visit this place at night as well because   when you walk up to the Palace it\'ll be lit up  with multicolored lights our next place we\'re   at here is Salam park right at Sunset and we\'ve  got one of the few places where we\'ve got a lake   inside I\'m assuming this is a man-made lake here  but it\'s a nice little Vibe here we\'ve got cafes   align in here some local uh cats right there few  few boats right there in a relaxing environment   the place does open at 400 p.m. and I think it\'s  maybe 4:10 so it\'s a bit earlier than I think most   people get here but um more and more people are  starting to arrive at this hour picnics in this   area and just a big place to relax walk around  and just uh take in an interesting side of Saudi   because if you\'ve noticed this is grass and Riad  is a desert so it\'s cool to have this this kind of   nature right here smacked up in the middle of the  city it\'s also illegal to have grass here in Saudi   Arabia is it a wonderful place to experience this  relaxing Park atmosphere while being inside of the   city please no swimming or playing and like Oh I  thought this was a beach so I guess it\'s kind of   an area to hang out number six on the list is to  visit Boulevard City in Riad and I\'m going to show   you what this place is like probably what you\'re  going to see behind me and all around me is you\'re   going to get a bit of a feeling of Time Square  with all of these like lights and advertisements   but I would say this is a more like modernized  version of Time Square cuz in Time Square they fit   everything they could in every square inch whereas  here we\'re just surrounded by a ton of screens the   energy when you walk into this place is like no  other I mean you are just surrounded by lights   it almost feels like daytime with how bright it  is and this is it my friends we\'re up here at the   top in this big I guess you could call it like  Circle where you have all of these these areas   to eat surrounding it and then we\'ve got this  incredibly vibrant Fountain right here walking   on the floor here like everything\'s marble mixed  in with a bit of like you know designed concrete   here and so you really got to like pay attention  in these places for the detail it is reminding   me of the new like Vegas sphere but obviously  the one in Vegas is like a full-on Auditorium alum heuk this large entertainment City draws parallels  with many famous places around the world earning   its comparison to Time Square due to the walkways  with dazzling lights advertisements and spotlights   on all sides the alen Hill Boulevard and this is  a whole another world over here oh my gosh now   this is the fountain show we were looking for  this thing is just shooting into into the air   with mega screens and those are the spotlights  so like literally from 20 km away I could see   all these spotlights in the air and I was like  that\'s got to be the boulevard something\'s about   to happen Boom the sound system\'s great I mean  it\'s like vibrating through me right now venues   hosting performances a notable example  is anagami where mbel my fiance actually performed [Music] packed with activities including arcades  good news is we\'ve got ourselves the uh go-kart   ticket here it came out to about 220 so that\'s  about I want to say maybe like $50 roughly so   definitely not cheap to go go carding but it\'s  going to be an absolute blast and the downside   is I can\'t bring my GoPro but the upside is  you can pay 35 R and they attach a GoPro to   you and send you the footage this place becomes  most alive during Riad season which runs from   October to March late afternoon going into the  evening because as you\'ll see throughout this   video a lot of the things to do are in the  later evenings and at night because that\'s   the culture of Saudi number seven on our list is  to visit Suk Al aali this bustling Marketplace   is where you can find a wide range of items we\'re  going to be walking around seeing if we can find   ourselves some nice deals and getting the Don  Rob something fresh to look like a king uh uh 12 100 R all right we\'ve got the Don Rob getting  his on oh oh look at this you look like what is   good ke hak ke hak all right there we go got  cover up the hair let\'s see how we\'re looking there oh ia ia yal so total for these is about  350 real for two sets so that\'s going to give it   to us for about $50 to get us all set up by our  good man all right so me and the Don Rober back   in the marketplace and we\'ve gotten ourselves  set up with some new looks oh never never been   better number eight on the list is to visit the  centa UW walk which is known for its high-end   character that truly shines at night while the  shops and restaurants are open during the day   the nighttime experience is unique in the evening  you\'ll find both outdoor and indoor high-end spots   including rooftop lounges for shisha or ar and the  area is integrated with a mall providing a variety   of clothing and apparel shops mixed in with all  of the restaurants this place is an ideal spot to   walk around and immerse yourself in the upscale  nightlife experience we have just made it to our   next place we\'re going to be exploring which  is the famous Boulevard world right here and   just to give you an idea I paid about 92 s AR  to get in and you\'ll need this app called wee   book.com and you\'ll book your tickets at the  door so the cool part and also what I wasn\'t   used to is that there\'s no areas to uh buy tickets  when you walk in so you have to buy it through the   app so make sure you download it I had to sit  there for like 5 10 minutes not a big deal but   to uh download it so and even right when we\'re  walking in here I\'m seeing UK France USA look at   this when we\'re walking right through we\'ve got  a full set of LED screens above us which kind of   gives us that feel like we\'re in another world  and down here looks like there\'s boat tours to   go cruising through this area there are many  cities or many countries that are built inside   of this park so looks like we\'re heading into  little Paris this way which kind of does give   a feel of Paris right inside of here we gotes  Paris and a lot of people here yeah they did a   nice job making that uh F of France over here  just like a mini one with some of the uh same   type of architecture even some French restaurants  over there Paul lake cafe yeah we\'ve even got the   Tower up there to the right side so this is  awesome I will say this is already leveling   up the boulevard City Boulevard world is uh quite  [Music] epic got USA to the right so and a little   taste of the British life right over here so we\'ve  got hot dogs in this one we\'ve got Burgers up on   that screen and we\'ve got donuts there I\'d say  that\'s already quite fitting and then we\'ve got   Burger King there that\'s a good representation of  what USA is like Boulevard world these signs look   very very familiar now I actually do feel like  I\'m in the US with these ones over here we\'ve   got I guess Japan of Riad boulevards so look at  this all right the next area we are walking into   is India so this looks pretty sweet we\'ve got  karak chai explored about 30% of it and that   took me over an hour and a half I think to fully  experience this place you should spend at least   5 to 6 hours here inside the heart of of this  park you\'ll find one of the largest man-made   Lakes which allows visitors to travel from one of  these many cities to the other and you\'ll be able   to see how vast that Park is just by looking at  the amount of boats that are inside this man-made   lake all right we are arriving to duria this is  insanely large which is the birthplace of Saudi   Arabia they\'re basically creating an entire  new city that has like a modern INF infast   structure yet aligned with traditional design  everywhere in the city right now on a Saturday   is like construction noises stuff being built a  lot of stuff is already built at this point but   obviously like their 2030 plan of like building  this Mega City Mega country so many mega projects   and the first place looks like we\'re going to  be going over to is the bouari Terrace we got   a ticket right here last minute all right well I  got lucky the uh ticket cost is zero but I guess   in 1 hour and 30 minutes It\'ll be 5050 Saudi re  all right and we are walking in we\'ve got these   like metal things here which is quite interesting  as you can probably guess there are not that many   people out during the day cuz it is October time  frame like going into November and so it is still   relatively hot out most people in Saudi pretty  much spend their evenings going out exploring   places like these I\'m guessing that\'s part of  the reason why the ticket was Zero s AR to go   in right now cuz it\'s it\'s 3:30 p.m. because like  the evening is when people want to come in it\'s   probably free to just get people in here cuz it\'s  kind of quiet during the day walking through it\'s   got a great Vibe like there\'s surround sound at  all moments or at like all areas you walk around   I just walked out of the uh tourism visitor  Hub right there and it was quite quiet around   this time but I actually enjoyed having the  whole area to myself I got a moment to really   take in the culture stroll through the Alleyways  and I even encountered some really unique areas   that I feel like really Bridge the past to the  present of the overall Heritage of the park this   place offers a blend of that oldw world charm and  Saudi cultural experiences dates there the good stuff let\'s try one of these so where we just got here now is where the  destruction of a mosque happened during The   Siege September 1818 so you can see what\'s left  of the remains here so I found the only thing   pretty much that they have on the menu that\'s  uh local which is a sharing platter of like   hummus also like three or four different things  like quinoa and some specialty items on there   as well as some traditional Saudi coffee that  I guess is going to be served in a Saudi type   of way so actually though it\'s in Saudi culture  to not fill the glass up all the way so this is   not the accurate way they do it actually in Saudi  they\'ll fill it up about 1/4 of the way and you   think like oh why am I getting such a small cup  of coffee but the reason is is they want you to   stay so if they fill up a cup like that almost  all the way that means they want you to leave   leave like how I just filled it up she filled  it up for me 1/4 and that basically means like   whenever you finish a cup of coffee usually  people will leave right like in most of the   world so if you fill up a small cup of coffee  then you\'ll keep having more and more and so   that\'s their way of basically being hospitable  and saying here\'s a partial cup of coffee stay   for as many as you want the amount of people are  starting to pick up in some of the areas this is   like a quieter area but you can see how nicely  this place is lit up we\'ve got the uh hanging   lights right there we\'ve got the orange lighting  this up it just adds a completely new experience   at the evening time once the sun goes down so this  is pretty awesome but like many places in Riad it   truly comes alive at night and in the evening  the crowds gather and you\'ll find the Alleyways   beautifully lit creating a really amazing  Ambiance number 11 on the list is all right we   are arriving to this insanely exotic natural land  formation where there\'s just this hole that\'s got   to be hundreds of meters down and here is a huge  very still body of water probably from a natural   spring and I think you can swim in it I hear  some weird noises down there though let\'s head   towards them heat cave is a massive place that  has a depth of 390 M and sits right inside of   a mountain this place sits about 1 and 1/2 hours  outside of Riad and of course the travel time is   going to vary depending on whether you\'re coming  from the Northern or Southern part of the city feels pretty good though if you\'re afraid of  caves this is not going to be your favorite   because if you look up this way we had to climb  all the way down these rocks I can\'t say it\'s   the safest because uh you have really slippery  and Sandy rocks on the way down but once you get   down here it\'s cool there\'s if you listen here  besides a couple pigeons there\'s just no noise   the water\'s clear very still the views inside  are stunning and the surrounding area both most   incredible desert Landscapes also you can easily  navigate there just using Google Maps and most of   the way it\'s a paved road coming from Riad just  the last couple kilometers is not paved so you   pretty much don\'t need a 4x4 and if there\'s any  parts that you take a two- wheel drive car that   are too hard to drive over you can walk the rest  of the way because it\'s quite close to where the   paved Road ends but once again go at your own  risk and be safe when you\'re going there it is   a riskier place there are no guard rails to walk  down into the heat cave so you should of course   go there bring some shoes and not sandals  so that way you can climb down a little bit safer 12 on our list is Kingdom Center mall  and the skybridge look at this they even have   the plants right here carved out just like the  building shape well even the uh roadblocks right   there too first the skybridge is situated at the  very top of riad\'s most iconic building offering   insane views of the massive City from such a  height you can see places far and wide all right   and we have made it up when we walk over this  there there\'s like an opening under here welcome   to the sky Bridge here at Kingdom Center we are  99 floors up in the air and directly under me is   a huge drop this is a little terrifying so that\'s  the edge right there and as you can see all under   us is hollow the skyscrapers only on the sides  right there and then the rest is just a big drop   so if you\'re afraid of heights be ready for this  ticket price to go up was $18.40 so that\'s like 69   Saudi real so I mean it\'s not a bad bad price to  get obviously all the way up here I mean we had to   go up 99 floors so and then you get these crazy  views after you\'ve had the chance to experience   whether it was during the day or at night you want  to head down and stop on some of the base levels   of the Kingdom Center building where you\'re going  to find a really high-end mall and as you\'ll also   find out in Saudi malls are a big thing people  love to shop here and so there are an abundance of   malls all right my friends the next place we are  at is Wadi hanifa which is a really interesting   place because it\'s actually a really large Park  nature area obviously being in the desert we\'ve   got a river running through here and it\'s right  in the middle of the city I mean we have traffic   right here coming across but the nice part is  it\'s a little break from you know the busyness   and the just vast area you can choose to spend a  little time walking through a part of it or take   a much longer Journey that\'ll actually bring you  through smaller little Villages inside of Riad   number 14 on the list is to visit Riad Park Mall  located inside Riad as the name says shopping is   a favored p time in Saudi Arabia and the Middle  East much like most countries in the world and   Riad boasts a multitude of malls one of the malls  that stood out while we visited Riad was the Riad   Park Mall Of course as with all malls our entry is  free allowing you to wander and explore at leisure   and if you\'re in Riad during the summer it is a  great place to take a break from that extremely   hot heat but inside the mall you\'ll find a mix  of international and local Brands along with a   variety of delicious food options it\'s definitely  worth a stroll for those to enjoy shopping and   exploring diverse retail environments and last but  not least number 15 on the list of things to do   which is a very upscale and high-end complex that  has everything from high-end hotels restaurants   luxury Brands and so much more I don\'t want to  spoil it yet because we just arrived let\'s head   in and we have just made it over to Via Riad which  is one of the most luxurious spots to roam in the   evening and you\'re going to see why look at this  we are coming up and we are surrounded by all of   the buildings pretty much lit up and here we are  on the uh bottom level here look at this we\'ve   got this whole area pretty much candle lit this  is majestic it gives it this very romantic and   relaxing Ambiance the complex also has a high-end  car dealer right inside which really epitomizes   the extravagant lifestyle Riad is known for it\'s  a great place for date night or just to stroll   around and experience the atmosphere inside of  via Riad so my friends that\'s where I\'m going   to go ahead and end today\'s video I really hope  you\'ve enjoyed exploring Riad with me in today\'s   things to do video and I will tell you there\'s so  many more things to do in Riad and over the next   couple years depending on when you watch this  video there\'s going to be more and more things   added because riat is Mega expanding their boundar  Mega expanding their infrastructure and everything   and you can really feel that when you\'re in the  city cuz at least right now while I\'m here at the   end of 2023 beginning 2024 I am seeing so much  construction going on and a lot of incredible   potential for this place so and don\'t forget guys  if you want to support this channel you can check   out my new brand that I just launched which is  perception I\'ll put a link down in the description   so thank you guys so much for watching as always  and we\'ll see you in the next things too video\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n'),
(9, '_FlnD19-Y5s', 'Journey Through Saudi Arabia - Travel Documentary', 'https://www.youtube.com/watch?v=_FlnD19-Y5s', 'Saudi Arabia has been at the crossroads of civilizations for centuries and is a diverse and captivating travel destination.  It is known as the heartland of Islam, but also offers beautiful natural landscapes,  lively urban centers,  delicious food, and friendly people.  The country has long been closed to tourists,  but in recent years has opened its borders to independent travelers.  In this video, I’m taking you back to one of my favorite journeys,  through this complicated, but fascinating country.  From the modern streets of capital Riyadh  to the desert landscapes around Al Ula and the Edge of the World.  From the sacred atmosphere of Medina to the vibrant streets of coastal Jeddah.  And from the tranquil beaches of Umluj island to the grounds of a traditional camel race.  So join me, exploring the remarkable country of Saudi Arabia.  We begin our journey in Riyadh, the bustling capital city of Saudi Arabia.  It’s a political and economic powerhouse,  but also brims with culture and history.  With its rapid expansion in recent years,  contrasts are visible at almost every corner.  Many travelers start exploring Riyadh in the Masmak fortress and the National Museum,  which provide an interesting insight into Saudi Arabia’s history.  In sharp contrast stands the Kingdom Centre,  a huge shopping mall that also boasts an incredible sky bridge,  where you can admire sweeping vistas of the city and beyond.  Walking the streets of Riyadh is an experience in itself.  From crumbling neighborhoods to huge construction sites,  where migrant workers are building some of the city’s new skyscrapers.  As you can see behind me, there\'s a lot of people from South Asia mostly. I think many are from Pakistan, Bangladesh, and from India as well.  One year? Four years ago (I came here). Now you have a break. I have a break, lunch time. Lunch time. Tasty? Yes, tasty! And from intriguing mosques, emphasizing the role of religion in the country,  to welcoming bazaars and markets.  Perfumes, \'oud\', and roses. From 100 riyal to maybe 30,000 riyal. It\'s very, very heavy, you see.  This is 150,000 for the whole box. I\'m very careful with it. That\'s fine, it\'s not broken (easily). Looks like a nice and busy place to eat something.  The food here (in this restaurant) is mostly Sudanese, but there are also some Indian influences,  and maybe some different flavors and spices as well.  Also the people that are visiting are from different countries. I\'m sitting here with a very kind man from Pakistan, and a kind man from Sudan.  Another kind man from Saudi Arabia. Welcome Holland, welcome. There you go, we\'re very welcome. Thank you, Sir! Riyadh is also a popular venue for events,  with many focusing on art, music, culture, and food,  such as the Riyadh Season festival.  Welcome to our burger. Tamil Nadu? - Yes, Tamil Nadu. Hi, I have a food truck with specialty coffee and sweets. And I\'m very happy to be at the Riyadh Seasons, and I\'m still here for another month and a half. Thank you! We leave downtown Riyadh behind and travel onwards to the Edge of the World,  one of Saudi Arabia’s most spectacular natural sights.  Reaching this spot requires a 4WD, as the last part is unpaved,   and the trip is best done with a local expert guide.  Here we are on the top of the World Edge. That one on the top, we will go to that end, and we\'ll stand there. If you are standing here, you will see us very tiny. It\'s an amazing view. Very nice! The Edge of the World is part of the much larger Tuwaiq escarpment,  which runs roughly 700 kilometers through central Saudi Arabia.  What makes this place so special are the edges that reach out from the plateau,  the sudden drop in altitude,  and the seemingly endless views of the horizon. Make sure to take a look underground, to discover mysterious cave like empty spaces, eroded by time.   This cave, we call it \'degel\', is not actually a cave.  Usually the opening is above the ground,  but this one is in the ground, so you go down to it.  It is humid and a little bit hot. Now we can see clear and dry. Not far from the Edge of the World, and a popular day  trip from Riyadh is the Souq al Jamal,  one of the largest camel markets in the country.  Camels hold a special place in the hearts and minds of many Saudi people,  forming a symbol for the start of civilization in this region.  We drive Northwest through small cities and desert landscapes, and spend the night in Buraidah.  This small city is host to the annual Qassim dates festival,  attracting farmers and date traders, sharing their technology and expertise.  Date production is an important part of Saudi’s economy,  and the country is the second largest producer  of dates in the world, after Egypt.  Although it was out of season when I visited,  the size of the complex gave away its importance.  It\'s amazing how they mix their traditional culture with a modern style restaurant basically. Let\'s try this chicken.  After a hearty meal and a good night sleep,  it was time to travel to the next destination.  The Al Ula region, or governate, is home to some of Saudi\'s most surreal scenery,  with spectacular valleys, red sandstone cliffs and dry riverbeds, also known as wadi. The main settlement, also called Al Ula, was a market city on an historic trading route, linking India and the Persian Gulf to Europe and the Levant.  Today, it’s a friendly place that serves as a jumping-off point for attractions in the area,  such as the famous Madain Saleh, which was, unfortunately, closed at the time of visiting. Not far from Al Ula we stumble upon a local camel race,  one of the region’s most popular classic sports.  Camels have long played an important role in Saudi Arabia and beyond.  They were crucial for centuries as a means of transportation  through the unforgiving deserts.  Through the years, camel races became a form of entertainment,  with the first taking place as early as the 7th century.  These days, the sport seems ever more popular  as a symbol of wealth and a celebration of traditional culture.  With modern times come different ways.  The jockeys that used to ride the camels have been replaced by small robots with an automatic whip and microphone,  which are remotely controlled by the camel trainers, in jeeps and SUVs. It\'s rough and wild, and I\'m currently being driven around by this very kind gentleman.  It\'s stunning, here in the middle of Saudi Arabia, this Saturday camel race! Driving further South we take a brief look at the ancient ruins of Khaybar.  This place was the scene of the infamous Battle of Khaybar,  an armed confrontation in the 7th century that resulted in the early Muslims  conquering the Jewish community of Khaybar.  Surrounded by palm trees and built on volcanic soil,  the remains of the fort provide an interesting insight into human history in this area.  We continue our journey through a surreal landscape of rugged  desert scenery and imposing volcanoes,  to reach the West Coast of Saudi Arabia. Umluj is known for its unspoiled islands and beautiful beaches,  and is sometimes nicknamed as the ‘Maldives of Saudi Arabia’.  This area, located in the Red Sea, consists of 104 islands,  varying in size and character,  and stands in stark contrast with the arid desert landscapes  that the country is most famous for.  The Red Sea is an inlet of the Indian ocean and divides Asia from Africa.  It is historically an important trading route,  but also provides a livelihood for thousands of fishermen from the region.  As the world’s Northernmost tropical sea, it has a rich and diverse ecosystem,  and an abundance of fish.  At the time of visit, most islands were not officially open to tourism yet,  but a friendly fisherman and his son were happy  to show me around a few of the islands. So I made it to the island eventually, one of the smaller  islands here on the Umluj island group. It\'s really beautiful, it\'s white sands, pure water, some coral reefs around it as well. It\'s definitely worth the effort! We travel onwards to Medina, known as the City of the Prophet,  and considered the second holiest city in Islam after Mecca.  This is where Islam’s founder, Mohammed, lived and was eventually laid to rest. All able Muslims are supposed to make the journey to  Medina and Mecca once in their life.  You are from Kashmir in India?  Yes, from India. You are from Pakistan Sir? Pakistan. Made in Bangladesh, Dhaka. Where are you from? Indonesia. \'Allahu Akbar\' It\'s unbelievable, people from all parts  of the world converge here into Medina, and it\'s really quite special  for me to to walk here. The Prophet’s Mosque is a spectacular sight,  one of only two mosques in the world that can hold over a million people.  It holds deep significance for Muslims from all over the globe. While many pilgrims visit Medina by themselves and with their families,  there are also a lot of tour groups with professional guides.  Salam Alaykum (Peace be upon you). My name is Fidosi, this is Faudia, and that is Faisal. We are the three F\'s. We are from Nigeria and we are currently in Medina, for the lesser Hajj, also known as Umrah. Good morning to all the people, my name is Muhammed. I come from Malaysia actually. I\'m a tourist guide. So as you can see, nowadays we bring our people, about 4 buses, for Umrah. As the day was coming to an end, there was one more prayer session to go.  While the Sun was setting, I found a spectacular  vantage point of the Prophet’s Mosque,  where I was allowed to witness a beautiful event in the religion of Islam.  On the way to our last destination, we pass the highway to Mecca. Unlike Medina, this city is not open to non-Muslim visitors.  But somehow it was still a special feeling to be so close to the holiest city in Islam. We arrive in Jeddah, the second largest city in Saudi Arabia,  and an important commercial and economic center.  It’s often described as more liberal, and perhaps  cosmopolitan, than other places in the country.  One of the highlights for many travelers is the intriguing Al Balad,  the historic center of Jeddah, filled with traditional merchant houses and other, partly renovated buildings.  It’s fascinating to walk the narrow alleys here,  absorbing the sight and sounds of daily life happening around you.  Good morning! Hi, I\'m Maryam. And I\'m Afya. This is one of the most unique locations in Saudi, in Jeddah especially. Because it\'s one of the rare pedestrian areas, so you have access to the community. They are very accessible. You have access to the daily life. This is also where I met Abeer,  a tour guide that could explain me more about this area.  Hi Stef, my name is Abeer, and I\'m the first Saudi female tour guide. And I\'m happy that you came to our beautiful city, which is a Unesco World Heritage site. It has been registered in 2014. One of the nice things about this city is that it is built with coral stones, which is the Red Sea style. You see here, these are coral stones.  We call them the breathing stones because they have holes. This house has been restored and these are the new stones. So here we are in a beautiful house.  It\'s 140 years old, it has been restored and became a museum.   So you can come and fully experience how people used to live the last century. It was interesting to listen to Abeer’s stories,  and also to see women at work in Saudi Arabia.  For a long time, women have been limited in their ability to work in the country.  Recent changes, however, suggest that the role of women in the workforce is growing,  and Jeddah may be at the forefront of these developments.  Welcome to Saudi Arabia! After a brief stroll through the modern Red Sea shopping  mall, it was time to explore the shore.   Located on the Red Sea, Jeddah has a long coastline  with a beautiful promenade, called Corniche.  Hello, welcome to Saudi Arabia, welcome to Jeddah! Welcome to Jeddah! Where are you from? Bangladesh Cairo. You are welcome in Jeddah, our fish is fresh!  This is the number one fish. Other places not to miss here, are the massive fish market,  where some of the fish from across the region is traded,  and the imposing Al Rahmah mosque, nicknamed as the floating mosque.  And that concludes my journey through Saudi Arabia,  a diverse and eye-opening travel destination,  with beautiful natural scenery,  ancient historic landmarks,  important religious sites, bustling urban centers,  tasty food, and welcoming people.  I realize I have only scratched the surface, and you could  spend months exploring this intriguing country,  that has long been a mystery to outsiders.  Yet I still hope this video gave you some travel inspiration,  or at least provided a glimpse into this complex, but captivating place. Thanks for watching, and I hope to see you again next time.  Travel safely! \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add transcript', 7, 'add_transcript'),
(26, 'Can change transcript', 7, 'change_transcript'),
(27, 'Can delete transcript', 7, 'delete_transcript'),
(28, 'Can view transcript', 7, 'view_transcript'),
(29, 'Can add search', 8, 'add_search'),
(30, 'Can change search', 8, 'change_search'),
(31, 'Can delete search', 8, 'delete_search'),
(32, 'Can view search', 8, 'view_search');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'App', 'search'),
(7, 'App', 'transcript'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'App', '0001_initial', '2024-12-10 13:19:30.558540'),
(2, 'App', '0002_transcript_error_message_transcript_status', '2024-12-10 13:19:30.652290'),
(3, 'contenttypes', '0001_initial', '2024-12-10 13:19:30.803887'),
(4, 'auth', '0001_initial', '2024-12-10 13:19:32.905938'),
(5, 'admin', '0001_initial', '2024-12-10 13:19:33.378509'),
(6, 'admin', '0002_logentry_remove_auto_add', '2024-12-10 13:19:33.398456'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-10 13:19:33.417407'),
(8, 'contenttypes', '0002_remove_content_type_name', '2024-12-10 13:19:33.617357'),
(9, 'auth', '0002_alter_permission_name_max_length', '2024-12-10 13:19:33.903412'),
(10, 'auth', '0003_alter_user_email_max_length', '2024-12-10 13:19:33.939429'),
(11, 'auth', '0004_alter_user_username_opts', '2024-12-10 13:19:33.975220'),
(12, 'auth', '0005_alter_user_last_login_null', '2024-12-10 13:19:34.158237'),
(13, 'auth', '0006_require_contenttypes_0002', '2024-12-10 13:19:34.174121'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2024-12-10 13:19:34.234623'),
(15, 'auth', '0008_alter_user_username_max_length', '2024-12-10 13:19:34.267730'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2024-12-10 13:19:34.320632'),
(17, 'auth', '0010_alter_group_name_max_length', '2024-12-10 13:19:34.372481'),
(18, 'auth', '0011_update_proxy_permissions', '2024-12-10 13:19:34.404341'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2024-12-10 13:19:34.455679'),
(20, 'sessions', '0001_initial', '2024-12-10 13:19:34.594844'),
(21, 'App', '0003_remove_transcript_created_at_and_more', '2024-12-10 16:22:27.789058'),
(22, 'App', '0004_search_remove_transcript_transcript_text_and_more', '2024-12-10 17:04:35.009655'),
(23, 'App', '0005_transcript_transcript_text', '2024-12-10 17:04:35.039754'),
(24, 'App', '0006_remove_transcript_search_delete_search', '2024-12-10 17:09:42.843092');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trancripts`
--

CREATE TABLE `trancripts` (
  `ID` int(11) NOT NULL,
  `transcriptions` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_transcript`
--
ALTER TABLE `app_transcript`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `video_id` (`video_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `trancripts`
--
ALTER TABLE `trancripts`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_transcript`
--
ALTER TABLE `app_transcript`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `trancripts`
--
ALTER TABLE `trancripts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
