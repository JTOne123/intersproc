﻿--
-- Script.PostDeployment.sql.
--
-- Initialises the database, post-deployment with a set of example/test data
-- to work with.
--

SET IDENTITY_INSERT Employee ON;

INSERT INTO Employee
(
	Id,
	ManagerId,
	HireDate,
	FirstName,
	LastName,
	Email,
	HomeBased
)
VALUES
	(1, 77, '2016-08-28', 'Doy', 'Dowse', 'ddowse0@ibm.com', 1),
	(2, 14, '2016-10-03', 'Minor', 'Kenlin', 'mkenlin1@loc.gov', 1),
	(3, 195, '2016-08-22', 'Nancee', 'Merrett', 'nmerrett2@sbwire.com', 1),
	(4, 156, '2017-01-16', 'Blakelee', 'Choldcroft', 'bcholdcroft3@free.fr', 0),
	(5, 73, '2017-03-07', 'Saunders', 'Dabnot', 'sdabnot4@timesonline.co.uk', 1),
	(6, 53, '2016-11-08', 'Barnaby', 'Burdoun', 'bburdoun5@histats.com', 1),
	(7, 114, '2016-12-07', 'Rois', 'Nester', 'rnester6@weibo.com', 0),
	(8, 77, '2017-05-24', 'Tedi', 'Plitz', 'tplitz7@ocn.ne.jp', 1),
	(9, 179, '2016-06-09', 'Leroi', 'Tunnicliff', 'ltunnicliff8@oaic.gov.au', 1),
	(10, 137, '2016-11-14', 'Eula', 'Bucknill', 'ebucknill9@bizjournals.com', 1),
	(11, 88, '2016-06-15', 'Torrin', 'Stanyon', 'tstanyona@163.com', 1),
	(12, 51, '2016-12-29', 'Joelie', 'Castro', 'jcastrob@i2i.jp', 0),
	(13, 174, '2016-10-05', 'Debra', 'Saich', 'dsaichc@so-net.ne.jp', 1),
	(14, 140, '2016-12-28', 'Sander', 'Linster', 'slinsterd@gnu.org', 1),
	(15, 88, '2017-05-29', 'Terrill', 'Scrigmour', 'tscrigmoure@blinklist.com', 0),
	(16, 34, '2017-05-12', 'Megen', 'Browning', 'mbrowningf@hatena.ne.jp', 0),
	(17, 124, '2017-04-09', 'Maximilianus', 'Crocket', 'mcrocketg@etsy.com', 0),
	(18, 168, '2017-01-16', 'Aleda', 'Robelow', 'arobelowh@patch.com', 0),
	(19, 141, '2017-03-27', 'Keven', 'Wogdon', 'kwogdoni@cyberchimps.com', 0),
	(20, 34, '2017-04-20', 'Jerad', 'Torry', 'jtorryj@guardian.co.uk', 0),
	(21, 15, '2016-12-02', 'Joella', 'Probyn', 'jprobynk@noaa.gov', 1),
	(22, 54, '2017-01-07', 'Max', 'Groombridge', 'mgroombridgel@wikimedia.org', 0),
	(23, 182, '2016-10-26', 'Nadya', 'Ratledge', 'nratledgem@yandex.ru', 1),
	(24, 140, '2017-03-23', 'Paige', 'Riteley', 'priteleyn@rakuten.co.jp', 0),
	(25, 88, '2016-12-05', 'Jozef', 'Presswell', 'jpresswello@discuz.net', 1),
	(26, 182, '2016-06-17', 'Bord', 'Beese', 'bbeesep@liveinternet.ru', 1),
	(27, 169, '2017-02-23', 'Eduardo', 'Okenfold', 'eokenfoldq@google.ca', 1),
	(28, 156, '2017-01-22', 'Forest', 'Cyster', 'fcysterr@psu.edu', 0),
	(29, 11, '2016-07-24', 'Hattie', 'Fallows', 'hfallowss@hostgator.com', 1),
	(30, 1, '2017-04-07', 'Jone', 'Meakin', 'jmeakint@gmpg.org', 1),
	(31, 84, '2016-11-22', 'Dorian', 'Kimbling', 'dkimblingu@miitbeian.gov.cn', 0),
	(32, 122, '2017-05-19', 'Tonie', 'Palphramand', 'tpalphramandv@usgs.gov', 1),
	(33, 147, '2016-11-04', 'Toinette', 'Oultram', 'toultramw@list-manage.com', 0),
	(34, 140, '2016-09-09', 'Becky', 'Gudgen', 'bgudgenx@time.com', 1),
	(35, 168, '2017-01-01', 'Brandise', 'Brunsdon', 'bbrunsdony@mit.edu', 1),
	(36, 141, '2017-02-21', 'Minor', 'Cornfield', 'mcornfieldz@pbs.org', 1),
	(37, 84, '2017-03-03', 'Petrina', 'Wellington', 'pwellington10@weibo.com', 0),
	(38, 84, '2017-04-05', 'Eldin', 'Baysting', 'ebaysting11@amazonaws.com', 0),
	(39, 115, '2017-06-01', 'Malcolm', 'Fidgett', 'mfidgett12@statcounter.com', 1),
	(40, 24, '2016-12-22', 'Welsh', 'Semmens', 'wsemmens13@google.com.br', 1),
	(41, 195, '2016-09-28', 'Esme', 'Cristea', 'ecristea14@hp.com', 0),
	(42, 81, '2016-10-07', 'Walliw', 'Rickerd', 'wrickerd15@bloomberg.com', 1),
	(43, 53, '2016-12-03', 'Tamar', 'Oxx', 'toxx16@cpanel.net', 0),
	(44, 12, '2017-01-08', 'Decca', 'Hesse', 'dhesse17@cargocollective.com', 1),
	(45, 199, '2016-09-09', 'Isaac', 'Jarman', 'ijarman18@sourceforge.net', 0),
	(46, 13, '2016-08-16', 'Anallese', 'Jimson', 'ajimson19@seattletimes.com', 1),
	(47, 155, '2016-12-10', 'Johnette', 'Jolliman', 'jjolliman1a@noaa.gov', 1),
	(48, 142, '2016-09-09', 'Cazzie', 'Willets', 'cwillets1b@de.vu', 1),
	(49, 25, '2017-04-20', 'Dru', 'Bracegirdle', 'dbracegirdle1c@scientificamerican.com', 1),
	(50, 51, '2016-09-19', 'Katya', 'Kennion', 'kkennion1d@columbia.edu', 1),
	(51, 88, '2016-12-22', 'Leonhard', 'Bloxsum', 'lbloxsum1e@dyndns.org', 0),
	(52, 24, '2016-07-17', 'Brandea', 'O''Finan', 'bofinan1f@ezinearticles.com', 1),
	(53, 140, '2017-05-06', 'Anett', 'Causton', 'acauston1g@example.com', 0),
	(54, 174, '2016-10-31', 'Minnaminnie', 'Jeeves', 'mjeeves1h@prweb.com', 0),
	(55, 50, '2016-09-08', 'Cindee', 'Chillcot', 'cchillcot1i@blogs.com', 0),
	(56, 174, '2016-10-26', 'Lanny', 'Camilleri', 'lcamilleri1j@redcross.org', 1),
	(57, 158, '2017-05-31', 'Derrick', 'Matthius', 'dmatthius1k@yahoo.co.jp', 0),
	(58, 73, '2017-03-05', 'Ivar', 'Scopes', 'iscopes1l@wikia.com', 0),
	(59, 25, '2017-03-13', 'Beatrice', 'Stephen', 'bstephen1m@spotify.com', 1),
	(60, 132, '2017-05-28', 'Kippie', 'Cunniam', 'kcunniam1n@shareasale.com', 1),
	(61, 21, '2017-04-23', 'Mabelle', 'Wrightem', 'mwrightem1o@studiopress.com', 0),
	(62, 155, '2017-03-31', 'Ivette', 'Eriksson', 'ieriksson1p@cdbaby.com', 1),
	(63, 147, '2016-07-05', 'Kathlin', 'Gerkens', 'kgerkens1q@addtoany.com', 1),
	(64, 199, '2016-08-26', 'Nigel', 'Bartlosz', 'nbartlosz1r@comsenz.com', 0),
	(65, 59, '2017-01-28', 'Marshall', 'Brampton', 'mbrampton1s@chron.com', 0),
	(66, 56, '2016-10-05', 'Tallie', 'Sorton', 'tsorton1t@jalbum.net', 1),
	(67, 195, '2016-07-11', 'Else', 'Middlemiss', 'emiddlemiss1u@nhs.uk', 1),
	(68, 51, '2017-01-01', 'Gwennie', 'Siemantel', 'gsiemantel1v@constantcontact.com', 0),
	(69, 200, '2016-07-05', 'Kerrill', 'Cail', 'kcail1w@oakley.com', 1),
	(70, 181, '2016-06-16', 'Candy', 'Woollard', 'cwoollard1x@ted.com', 1),
	(71, 199, '2017-05-25', 'Paulie', 'Sambidge', 'psambidge1y@vk.com', 1),
	(72, 77, '2016-06-17', 'Courtnay', 'Skeeles', 'cskeeles1z@drupal.org', 0),
	(73, 25, '2016-10-07', 'Mirabel', 'Skotcher', 'mskotcher20@wired.com', 0),
	(74, 118, '2016-11-24', 'Herbert', 'Dunphie', 'hdunphie21@rambler.ru', 1),
	(75, 140, '2017-05-05', 'Doralin', 'Bang', 'dbang22@google.co.uk', 0),
	(76, 174, '2016-07-15', 'Gwyneth', 'Emmott', 'gemmott23@narod.ru', 0),
	(77, 88, '2016-06-26', 'Prince', 'Voysey', 'pvoysey24@purevolume.com', 1),
	(78, 51, '2016-06-15', 'Jud', 'Voss', 'jvoss25@booking.com', 0),
	(79, 12, '2017-01-11', 'Alvis', 'Pellingar', 'apellingar26@seesaa.net', 0),
	(80, 137, '2017-02-20', 'Burlie', 'Duckhouse', 'bduckhouse27@scientificamerican.com', 0),
	(81, 77, '2017-05-26', 'Benito', 'McCard', 'bmccard28@list-manage.com', 1),
	(82, 21, '2017-02-06', 'Vonny', 'Bracco', 'vbracco29@ft.com', 1),
	(83, 142, '2016-06-17', 'Caz', 'Doelle', 'cdoelle2a@opera.com', 1),
	(84, 51, '2017-03-13', 'Rodrique', 'Reichardt', 'rreichardt2b@webs.com', 0),
	(85, 118, '2016-12-02', 'Maurita', 'Stryde', 'mstryde2c@marketwatch.com', 1),
	(86, 51, '2016-11-24', 'Carlie', 'Physick', 'cphysick2d@cloudflare.com', 1),
	(87, 174, '2016-10-01', 'Juieta', 'Jaycox', 'jjaycox2e@home.pl', 0),
	(88, NULL, '2016-08-30', 'Darsie', 'Tschiersch', 'dtschiersch2f@ifeng.com', 0),
	(89, 56, '2017-02-12', 'Tannie', 'Lemmers', 'tlemmers2g@comsenz.com', 0),
	(90, 181, '2017-04-29', 'Cicily', 'Stobbe', 'cstobbe2h@devhub.com', 0),
	(91, 25, '2016-10-06', 'Jill', 'McIlwreath', 'jmcilwreath2i@mozilla.com', 0),
	(92, 77, '2016-08-21', 'Katy', 'Whitemarsh', 'kwhitemarsh2j@printfriendly.com', 1),
	(93, 8, '2017-03-04', 'Cash', 'Jozefczak', 'cjozefczak2k@cornell.edu', 1),
	(94, 158, '2017-04-07', 'Kara-lynn', 'Noble', 'knoble2l@youtu.be', 1),
	(95, 115, '2017-01-24', 'Tate', 'Feavyour', 'tfeavyour2m@who.int', 0),
	(96, 115, '2017-04-12', 'Genevieve', 'Gaucher', 'ggaucher2n@cargocollective.com', 0),
	(97, 179, '2016-08-17', 'Erena', 'Lickorish', 'elickorish2o@google.pl', 1),
	(98, 81, '2016-11-19', 'Faustine', 'Commucci', 'fcommucci2p@ftc.gov', 0),
	(99, 15, '2016-10-05', 'Randy', 'Walklot', 'rwalklot2q@fastcompany.com', 1),
	(100, 25, '2017-04-12', 'Vickie', 'Althrop', 'valthrop2r@canalblog.com', 1),
	(101, 72, '2017-05-04', 'Homere', 'Junkinson', 'hjunkinson2s@yahoo.com', 1),
	(102, 124, '2017-04-09', 'Christal', 'Skittreal', 'cskittreal2t@java.com', 0),
	(103, 72, '2017-02-20', 'Care', 'Blakeden', 'cblakeden2u@hubpages.com', 1),
	(104, 15, '2017-04-12', 'Charles', 'Dowdell', 'cdowdell2v@odnoklassniki.ru', 1),
	(105, 179, '2016-10-06', 'Raoul', 'Edmondson', 'redmondson2w@microsoft.com', 1),
	(106, 75, '2017-02-10', 'Priscilla', 'Woakes', 'pwoakes2x@wordpress.org', 0),
	(107, 25, '2016-11-15', 'Keenan', 'Woodington', 'kwoodington2y@yale.edu', 0),
	(108, 179, '2016-12-07', 'Damita', 'Grotty', 'dgrotty2z@mayoclinic.com', 0),
	(109, 73, '2017-01-24', 'Arvie', 'Maccaig', 'amaccaig30@ucoz.ru', 1),
	(110, 76, '2017-01-02', 'Dugald', 'Spain-Gower', 'dspaingower31@cpanel.net', 1),
	(111, 76, '2016-08-08', 'Livy', 'Skein', 'lskein32@t.co', 0),
	(112, 8, '2016-07-04', 'Yale', 'Toomer', 'ytoomer33@cmu.edu', 1),
	(113, 118, '2016-07-23', 'Clemence', 'Dibbs', 'cdibbs34@gov.uk', 0),
	(114, 140, '2016-12-21', 'Devin', 'Gildersleaves', 'dgildersleaves35@sina.com.cn', 1),
	(115, 25, '2016-10-27', 'Clair', 'Lamkin', 'clamkin36@amazonaws.com', 1),
	(116, 155, '2016-11-15', 'Velvet', 'Rau', 'vrau37@ucsd.edu', 0),
	(117, 200, '2016-09-11', 'Idaline', 'Mingardi', 'imingardi38@friendfeed.com', 1),
	(118, 11, '2017-04-23', 'Salome', 'Orwell', 'sorwell39@odnoklassniki.ru', 1),
	(119, 1, '2016-07-25', 'Silvana', 'Kas', 'skas3a@chron.com', 0),
	(120, 132, '2016-10-24', 'Duffy', 'Weall', 'dweall3b@psu.edu', 0),
	(121, 53, '2017-04-02', 'Kary', 'Ehrat', 'kehrat3c@hibu.com', 1),
	(122, 51, '2016-06-11', 'Christoph', 'Goundrill', 'cgoundrill3d@usa.gov', 0),
	(123, 182, '2016-12-01', 'Brandais', 'Janecki', 'bjanecki3e@paginegialle.it', 1),
	(124, 174, '2017-03-10', 'Erin', 'Januszkiewicz', 'ejanuszkiewicz3f@usnews.com', 1),
	(125, 87, '2017-01-05', 'Ruthie', 'Ager', 'rager3g@time.com', 1),
	(126, 21, '2016-11-09', 'Sonia', 'Graybeal', 'sgraybeal3h@eepurl.com', 0),
	(127, 179, '2016-07-20', 'Gustave', 'Moryson', 'gmoryson3i@pagesperso-orange.fr', 1),
	(128, 49, '2017-01-07', 'Yuri', 'Tayspell', 'ytayspell3j@yahoo.com', 0),
	(129, 163, '2017-03-05', 'Sisely', 'Gilvary', 'sgilvary3k@sourceforge.net', 1),
	(130, 158, '2017-01-10', 'Cherilyn', 'Habergham', 'chabergham3l@yellowpages.com', 1),
	(131, 49, '2017-03-05', 'Rhona', 'Chin', 'rchin3m@toplist.cz', 0),
	(132, 25, '2017-02-21', 'Fredi', 'Riccardini', 'friccardini3n@globo.com', 0),
	(133, 200, '2017-05-14', 'Monte', 'Tansill', 'mtansill3o@xrea.com', 1),
	(134, 1, '2016-09-26', 'Boy', 'Gimbrett', 'bgimbrett3p@opera.com', 0),
	(135, 14, '2017-05-05', 'Glenn', 'Clausson', 'gclausson3q@yahoo.com', 1),
	(136, 179, '2016-12-01', 'Johnette', 'Franckton', 'jfranckton3r@imgur.com', 0),
	(137, 11, '2017-01-26', 'Dulcie', 'Pardie', 'dpardie3s@yelp.com', 0),
	(138, 24, '2016-07-20', 'Alfi', 'Grieger', 'agrieger3t@craigslist.org', 1),
	(139, 14, '2016-08-13', 'Ryann', 'Whiley', 'rwhiley3u@hubpages.com', 0),
	(140, 88, '2016-11-07', 'Kathryne', 'Rayman', 'krayman3v@wikimedia.org', 1),
	(141, 11, '2017-04-10', 'Patti', 'Cumo', 'pcumo3w@odnoklassniki.ru', 1),
	(142, 15, '2016-07-12', 'Garvey', 'Croom', 'gcroom3x@hao123.com', 1),
	(143, 75, '2017-04-21', 'Meagan', 'MacKegg', 'mmackegg3y@state.gov', 1),
	(144, 87, '2017-01-07', 'Shanan', 'Licciardi', 'slicciardi3z@google.com', 0),
	(145, 11, '2016-06-23', 'Glynn', 'Blint', 'gblint40@desdev.cn', 1),
	(146, 13, '2017-01-28', 'Sylvia', 'Alexis', 'salexis41@ning.com', 0),
	(147, 15, '2016-10-31', 'Maria', 'Bourtoumieux', 'mbourtoumieux42@ihg.com', 0),
	(148, 77, '2016-08-23', 'Alexis', 'Geffen', 'ageffen43@dmoz.org', 1),
	(149, 114, '2017-05-02', 'Edan', 'Zorn', 'ezorn44@npr.org', 1),
	(150, 81, '2016-10-30', 'Verne', 'Dampney', 'vdampney45@eventbrite.com', 0),
	(151, 13, '2017-01-07', 'Dulciana', 'Leppard', 'dleppard46@cisco.com', 0),
	(152, 122, '2016-11-05', 'Adams', 'Simacek', 'asimacek47@dailymotion.com', 1),
	(153, 50, '2016-07-19', 'Page', 'Coggeshall', 'pcoggeshall48@liveinternet.ru', 0),
	(154, 168, '2017-03-24', 'Harv', 'Mould', 'hmould49@homestead.com', 1),
	(155, 77, '2016-09-27', 'Pierre', 'Brandle', 'pbrandle4a@wunderground.com', 0),
	(156, 15, '2016-09-30', 'Lauralee', 'Keyson', 'lkeyson4b@google.com.br', 0),
	(157, 137, '2017-03-31', 'Laurena', 'Janacek', 'ljanacek4c@businesswire.com', 1),
	(158, 51, '2016-11-02', 'Joelle', 'Brownsworth', 'jbrownsworth4d@flickr.com', 1),
	(159, 169, '2017-05-02', 'Ignatius', 'Carlozzi', 'icarlozzi4e@naver.com', 1),
	(160, 72, '2016-07-10', 'Moss', 'Parminter', 'mparminter4f@youtube.com', 0),
	(161, 59, '2016-07-20', 'Brittani', 'Pentlow', 'bpentlow4g@usda.gov', 0),
	(162, 15, '2017-01-27', 'Cheston', 'Meagh', 'cmeagh4h@arizona.edu', 0),
	(163, 179, '2017-05-14', 'Mariann', 'MattiCCI', 'mmatticci4i@reddit.com', 0),
	(164, 147, '2016-06-21', 'Say', 'Bodley', 'sbodley4j@naver.com', 1),
	(165, 75, '2017-01-31', 'Winifield', 'Di Bartolommeo', 'wdibartolommeo4k@cbsnews.com', 0),
	(166, 174, '2016-11-21', 'Mallorie', 'Heinsius', 'mheinsius4l@mlb.com', 0),
	(167, 166, '2017-01-26', 'Norman', 'Keepin', 'nkeepin4m@geocities.jp', 0),
	(168, 140, '2017-02-01', 'Emlyn', 'Klemke', 'eklemke4n@printfriendly.com', 1),
	(169, 140, '2017-04-14', 'Shoshana', 'Pilger', 'spilger4o@springer.com', 1),
	(170, 87, '2017-01-10', 'Frannie', 'Dible', 'fdible4p@answers.com', 0),
	(171, 166, '2016-10-02', 'Carling', 'Ferrey', 'cferrey4q@mapquest.com', 1),
	(172, 50, '2017-02-02', 'Berte', 'Amsberger', 'bamsberger4r@guardian.co.uk', 0),
	(173, 114, '2017-03-02', 'Johanna', 'Burkwood', 'jburkwood4s@businesswire.com', 0),
	(174, 88, '2016-08-26', 'Lucita', 'Prudham', 'lprudham4t@independent.co.uk', 0),
	(175, 54, '2016-09-18', 'Morton', 'Brokenshaw', 'mbrokenshaw4u@craigslist.org', 0),
	(176, 12, '2017-05-10', 'Inez', 'Castelot', 'icastelot4v@patch.com', 1),
	(177, 76, '2016-06-21', 'Fredrick', 'Clausner', 'fclausner4w@chronoengine.com', 1),
	(178, 11, '2016-11-26', 'Shirlene', 'Dassindale', 'sdassindale4x@time.com', 0),
	(179, 88, '2017-05-20', 'Ephrem', 'Olifard', 'eolifard4y@imgur.com', 1),
	(180, 122, '2017-05-23', 'Hartley', 'Vokes', 'hvokes4z@illinois.edu', 0),
	(181, 11, '2017-03-20', 'Kirby', 'Frigot', 'kfrigot50@ow.ly', 0),
	(182, 11, '2017-05-21', 'Tuck', 'Kornyshev', 'tkornyshev51@pen.io', 1),
	(183, 156, '2017-04-02', 'Dorolice', 'Myhan', 'dmyhan52@tripadvisor.com', 0),
	(184, 142, '2016-07-19', 'Jeddy', 'Ashcroft', 'jashcroft53@ezinearticles.com', 1),
	(185, 132, '2017-03-06', 'Ashlan', 'Karel', 'akarel54@oracle.com', 0),
	(186, 166, '2017-01-07', 'Fleming', 'Biggar', 'fbiggar55@wikimedia.org', 1),
	(187, 54, '2017-02-01', 'Kikelia', 'Burchill', 'kburchill56@macromedia.com', 1),
	(188, 141, '2017-05-16', 'Jo-ann', 'Daout', 'jdaout57@blogger.com', 1),
	(189, 181, '2016-11-07', 'Devi', 'Youson', 'dyouson58@msu.edu', 0),
	(190, 56, '2017-05-20', 'Dore', 'Yaus', 'dyaus59@twitpic.com', 1),
	(191, 49, '2017-05-30', 'Amargo', 'Holdworth', 'aholdworth5a@netvibes.com', 0),
	(192, 169, '2017-01-19', 'Selie', 'Gratrex', 'sgratrex5b@sciencedirect.com', 1),
	(193, 59, '2017-02-03', 'Claudianus', 'Sagar', 'csagar5c@ihg.com', 0),
	(194, 77, '2017-05-19', 'Marketa', 'Lowden', 'mlowden5d@cnet.com', 1),
	(195, 174, '2016-10-21', 'Joseph', 'Milius', 'jmilius5e@fastcompany.com', 0),
	(196, 34, '2016-06-27', 'Siobhan', 'Tabord', 'stabord5f@home.pl', 0),
	(197, 124, '2016-10-11', 'Bertine', 'Podd', 'bpodd5g@usatoday.com', 0),
	(198, 8, '2017-02-01', 'Beatriz', 'Mosedale', 'bmosedale5h@w3.org', 1),
	(199, 15, '2016-12-11', 'Helga', 'Drinkhall', 'hdrinkhall5i@ft.com', 1),
	(200, 179, '2017-03-22', 'Adelaide', 'Poile', 'apoile5j@berkeley.edu', 1);

SET IDENTITY_INSERT Employee OFF;