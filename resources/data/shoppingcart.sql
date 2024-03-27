SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `shoppingcart`
--
CREATE DATABASE IF NOT EXISTS `shoppingcart` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shoppingcart`;

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(3) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Popolazione con i dati della tabella `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Dresses'),
(2, 'Jumpsuit'),
(3, 'Shoes'),
(4, 'Tops'),
(5, 'Swimwear'),
(6, 'Shorts');

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE `orders` (
  `id` varchar(30) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `shipping` float NOT NULL,
  `amount` float NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` varchar(30) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(3) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `description` varchar(150) NOT NULL,
  `price` float NOT NULL,
  `discount` tinyint(4) NOT NULL DEFAULT 0,
  `sizes` varchar(100) DEFAULT 'null',
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Popolazione con i dati della tabella `product`
--

INSERT INTO `product` (`product_id`, `description`, `price`, `discount`, `sizes`, `category`) VALUES
(1000, 'White floral dress', 35.99, 0, 'S, M, L, XL', 1),
(1001, 'Gray spaghetti strap dress', 29.5, 0, 'S, M, L, XL', 1),
(1002, 'Purple lace knitted dress', 48, 0, 'S, M, L, XL', 1),
(1003, 'Pastel pink, floral halter-top dress', 38, 30, 'S, M, L, XL', 1),
(1004, 'White dress with floral textile', 40, 0, 'S, M, L, XL', 1),
(1005, 'White V-Neck sleeveless dress', 32, 0, 'S, M, L, XL', 1),
(1006, 'Red sleeveless dress', 41, 0, 'S, M, L, XL', 1),
(1007, 'Red floral dress', 26.99, 0, 'S, M, L, XL', 1),
(1008, 'Metallic blue jumpsuit', 60, 0, 'S, M, L, XL', 2),
(1009, 'Gray jumpsuit', 53.5, 0, 'S, M, L, XL', 2),
(1010, 'Light blue striped jumpsuit', 42, 30, 'S, M, L, XL', 2),
(1011, 'White spaghetti strap jumpsuit', 47.5, 0, 'S, M, L, XL', 2),
(1012, 'Beige sleeveless jumpsuit', 58.99, 0, 'S, M, L, XL', 2),
(1013, 'Green athletic shoes', 39.99, 0, '4.5, 5.5, 6, 7, 8, 8.5, 9.5, 10', 3),
(1014, 'Simple white sneakers', 30, 0, '4.5, 5.5, 6, 7, 8, 8.5, 9.5, 10', 3),
(1015, 'Red sneakers', 42.5, 30, '4.5, 5.5, 6, 7, 8, 8.5, 9.5, 10', 3),
(1016, 'Pink patent leather stilettos', 54.99, 0, '4.5, 5.5, 6, 7, 8, 8.5, 9.5, 10', 3),
(1017, 'Gold leather heeled sandals', 49.99, 0, '4.5, 5.5, 6, 7, 8, 8.5, 9.5, 10', 3),
(1018, 'Black stilettos', 40, 0, '4.5, 5.5, 6, 7, 8, 8.5, 9.5, 10', 3),
(1019, 'Yellow tracksuit', 75, 30, 'S, M, L, XL', 2),
(1020, 'Black skull hand top', 24.99, 0, 'S, M, L, XL', 4),
(1021, 'Gray turtle-neck top', 29.99, 30, 'S, M, L, XL', 4),
(1022, 'Blue denim shorts', 24.99, 0, 'S, M, L, XL', 6),
(1023, 'Black long sleeve t-shirt', 20, 0, 'S, M, L, XL', 4),
(1024, 'Green halter bikini', 17.99, 0, 'S, M, L, XL', 5),
(1025, 'Basic black bikini', 12.99, 0, 'S, M, L, XL', 5),
(1026, 'Red with white dots bikini', 14.99, 0, 'S, M, L, XL', 5),
(1027, 'Animal print bikini top', 12, 0, 'S, M, L, XL', 5),
(1028, 'Floral halter bikini top', 11.5, 0, 'S, M, L, XL', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `remembered_logins`
--

CREATE TABLE `remembered_logins` (
  `token_hash` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `session`
--

CREATE TABLE `session` (
  `session_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `password_reset_hash` varchar(64) DEFAULT NULL,
  `password_reset_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle esportate
--

--
-- Indici della tabella `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cart_user` (`user_id`);

--
-- Indici della tabella `cart_items`
--
ALTER TABLE `cart_items`
  ADD KEY `FK_cart_items_product` (`product_id`),
  ADD KEY `FK_cart_items_cart` (`cart_id`);

--
-- Indici della tabella `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indici della tabella `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`);

--
-- Indici della tabella `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indici della tabella `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category` (`category`);

--
-- Indici della tabella `remembered_logins`
--
ALTER TABLE `remembered_logins`
  ADD PRIMARY KEY (`token_hash`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici della tabella `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `FK_session_user` (`user_id`);

--
-- Indici della tabella `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `password_reset_hash` (`password_reset_hash`);

--
-- AUTO_INCREMENT per le tabelle esportate
--

--
-- AUTO_INCREMENT della tabella `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT della tabella `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT della tabella `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT della tabella `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1029;

--
-- AUTO_INCREMENT della tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Restrizioni per le tabelle esportate
--

--
-- Restrizioni per la tabella `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_cart_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrizioni per la tabella `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cart_items_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrizioni per la tabella `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrizioni per la tabella `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrizioni per la tabella `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `FK_session_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

