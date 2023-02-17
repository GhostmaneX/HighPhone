ALTER TABLE `users` ADD IF NOT EXISTS (
  `phone` varchar(50) DEFAULT NULL,
  `iban` varchar(50) DEFAULT NULL,
  `twitteraccount` varchar(50) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `calls` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `photos` longtext DEFAULT NULL,
  `darkchatuser` mediumtext DEFAULT NULL,
  `mailaccount` varchar(50) DEFAULT NULL
);