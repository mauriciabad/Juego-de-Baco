-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2018 at 11:39 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baco`
--

-- --------------------------------------------------------

--
-- Table structure for table `modes`
--

CREATE TABLE `modes` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `shortname` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modes`
--

INSERT INTO `modes` (`id`, `shortname`, `name`) VALUES
(1, 'yonunca', 'Yo nunca'),
(2, 'abebersehadicho', '¡A beber se ha dicho!'),
(3, 'perdiendolaropa', 'Perdiendo la ropa'),
(4, 'lamoneda', 'La moneda'),
(5, 'bodytwister', 'Body Twister'),
(6, 'entrelaespadaylapared', 'Entre la espada y la pared'),
(7, 'quienes', 'Toc, Toc.. ¿Quién es?');

-- --------------------------------------------------------

--
-- Table structure for table `phrases`
--

CREATE TABLE `phrases` (
  `id` int(10) UNSIGNED NOT NULL,
  `mode` smallint(5) UNSIGNED NOT NULL,
  `phrase` varchar(200) NOT NULL,
  `players` tinyint(1) UNSIGNED NOT NULL,
  `upvotes` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dificulty` tinyint(1) UNSIGNED NOT NULL,
  `creation-date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phrases`
--

INSERT INTO `phrases` (`id`, `mode`, `phrase`, `players`, `upvotes`, `downvotes`, `dificulty`, `creation-date`) VALUES
(1, 2, '${p[0]}, bebe 1 trago', 1, 1, 0, 0, '2018-08-26 13:22:50'),
(2, 2, 'El más bajo bebe ${random(1,3)} tragos del más alto', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(3, 2, 'El más joven bebe 2 tragos', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(4, 2, 'Si te gusta el reggaeton bebe ${random(2,3)} tragos', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(5, 2, 'El que tenga el vaso más lleno bebe ${random(2,3)} tragos', 0, 4, 3, 0, '2018-08-26 13:22:50'),
(6, 2, 'Si crees que ${p[0]} besaría a ${p[1]} bebe ${random(2,3)} tragos', 2, 0, 0, 0, '2018-08-26 13:22:50'),
(7, 2, 'El que señale último a ${p[0]} bebe', 1, 1, 0, 0, '2018-08-26 13:22:50'),
(8, 2, 'Si te queda menos de la mitad del vaso terminalo', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(9, 2, 'Por cada uno que crea posible un trío entre ${p[0]}, ${p[1]} y ${p[2]} beben un trago', 3, 0, 0, 0, '2018-08-26 13:22:50'),
(10, 2, '${p[0]}, repite todo lo quediga ${p[1]}. Cada vez que te olvides bebe un poco', 2, 0, 0, 0, '2018-08-26 13:22:50'),
(11, 2, '${p[0]} finje un orgasmo y/o bebe ${random(2,5)} tragos', 1, 0, 0, 0, '2018-08-26 13:22:50'),
(12, 2, '${p[0]} pon el dedo en la nariz de ${p[1]} y ${p[1]} en la oreja de ${p[0]}', 2, 0, 0, 0, '2018-08-26 13:22:50'),
(13, 2, 'Votad quien bebe ${random(2,3)} tragos', 0, 4, 0, 0, '2018-08-26 13:22:50'),
(14, 2, 'Si tu categoría porno preferida és teenagers bebe 2 tragos', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(15, 2, 'Si eres mayor de edad bebe', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(16, 1, 'Yo nunca me he tirado un pedo para joder', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(17, 1, 'Yo nunca he escupido a alguien', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(18, 1, 'Yo nunca me he meado encima', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(19, 1, 'Yo nunca he pegado a alguien', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(20, 1, 'Yo nunca me caigo con frecuencia', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(21, 1, 'A mi nunca se me ha caido el móvil en el WC', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(22, 1, 'Yo nunca he llamado a ${p[0]} colegui', 1, 0, 0, 0, '2018-08-26 13:22:50'),
(23, 1, 'Yo nunca he perdido algo importante', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(24, 1, 'Yo nunca he hecho un agujero a una goma de borrar sin romperla', 0, 0, 1, 0, '2018-08-26 13:22:50'),
(25, 1, 'Yo nunca he robado', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(26, 1, 'Yo nunca he \"tomado prestado\" algo y no lo he devuelto', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(27, 1, 'Yo nunca he estado más de 8h en el ordenador/consola un solo día.', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(28, 1, 'Yo nunca he hecho fisting', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(29, 1, 'Yo nunca he practicado sexo anal', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(30, 1, 'Yo nunca he comido pizza con ketchup', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(31, 1, 'Yo nunca he ligado en una discoteca', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(32, 1, 'Yo nunca he practicado cruising', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(33, 1, 'Yo nunca he querido besar a ${p[0]}', 1, 0, 0, 0, '2018-08-26 13:22:50'),
(34, 1, 'Yo nunca he hecho he paseado desnudo por en una fiesta (batman)', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(35, 1, 'Yo nunca he jugado a \"Yo nunca\"', 0, 2, 0, 0, '2018-08-26 13:22:50'),
(36, 1, 'Yo nunca me he imaginado a mis abuelos follando', 0, 0, 1, 0, '2018-08-26 13:22:50'),
(37, 1, 'Yo nunca he visto el video de smegma', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(38, 1, 'Yo nunca me he masturbado mirando fotos de Facebook/Instagram', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(39, 1, 'Yo nunca he bebido una cerveza', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(40, 1, 'Yo nunca he pillado a mis padres haciendo el amor', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(41, 1, 'Yo nunca he tenido relaciones sexuales con un oriental', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(42, 1, 'Yo nunca he dormido en un barco', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(43, 1, 'Yo nunca he dormido en la intemperie', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(44, 1, 'Yo nunca he probado el surf', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(45, 1, 'Yo nunca he querido follarme a alguien de clase', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(46, 1, 'Yo nunca he sido llamado la atención por quedarme embobado mirando a alguien.', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(47, 1, 'Yo nunca he besado a alguien del mismo sexo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(48, 1, 'Yo nunca he robado algo de valor superior a 10€', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(49, 1, 'Yo nunca he sido pillado masturbándome', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(50, 1, 'Yo nunca me emborrache, y al dia siguiente, no recordaba nada de lo que pasó la noche anterior', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(51, 1, 'Yo nunca he tenido sexo en la calle', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(52, 1, 'Yo nunca he perdido las llaves de casa', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(53, 1, 'Yo nunca he visto porno gay', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(54, 1, 'Yo nunca he meado en una piscina o el mar', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(55, 1, 'Yo nunca me he masturbado pensando en alguien del grupo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(56, 1, 'Yo nunca he hecho sexo oral', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(57, 1, 'Yo nunca he durado más de 15 minutos en la cama', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(58, 1, 'Yo nunca he pillado a mi hermano/a follando', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(59, 1, 'Yo nunca he comido un pene', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(60, 1, 'Yo nunca me he liado con más de 3 personas en una noche', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(61, 1, 'Yo nunca he tenido un accidente de coche', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(62, 1, 'Yo nunca he sido infiel', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(63, 1, 'Yo nunca he dudado de mi orientación sexual', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(64, 1, 'Yo nunca me he roto un hueso', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(65, 1, 'Yo nunca me he masturbado', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(66, 1, 'Yo nunca he consumido drogas duras', 0, 0, 1, 0, '2018-08-26 13:22:50'),
(67, 1, 'Yo nunca me he puesto ropa interior del otro sexo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(68, 1, 'Yo nunca he vomitado de fiesta', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(69, 1, 'Yo nunca he tenido sexo en un lugar público', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(70, 1, 'Yo nunca he besado a alguno de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(71, 1, 'Yo nunca he tenido sexo en la ducha', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(72, 1, 'Yo nunca he robado en un supermercado', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(73, 1, 'Yo nunca he hablado mal de alguno de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(74, 1, 'Yo nunca he sentido celos de alguno de los presentes', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(75, 1, 'Yo nunca me he acostado con alguien borracho', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(76, 1, 'Yo nunca he salido a la calle en pijama', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(77, 1, 'Yo nunca me he hecho el enfermo para evitar hacer algo que no quería', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(78, 1, 'Yo nunca he perreado en una discoteca', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(79, 1, 'Yo nunca he escuchado a mis padres haciéndolo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(80, 1, 'Yo nunca he besado a alguien del mismo sexo y me ha gustado', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(81, 1, 'Yo nunca he sentido atracción por el dolor', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(82, 1, 'Yo nunca me he ido de casa', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(83, 1, 'Yo nunca le he mirado las tetas a una amiga', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(84, 1, 'Yo nunca me he rascado el culo y me he olido los dedos', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(85, 1, 'Yo nunca dije un \"te quiero\" sin sentirlo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(86, 1, 'Yo nunca me apuntaría a gran hermano', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(87, 1, 'Yo nunca me he tirado un pedo en la bañera y he visto como salía la burbuja', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(88, 1, 'Yo nunca he querido acostarme con alguno de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(89, 1, 'Yo nunca he participado en una orgía', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(90, 1, 'Yo nunca he sentido asco al tener relaciones con alguien', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(91, 1, 'Yo nunca he hecho sexo oral', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(92, 1, 'Yo nunca negué un beso', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(93, 1, 'Yo nunca he meado en la ducha', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(94, 1, 'Yo nunca me quedé con las ganas de follar', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(95, 1, 'Yo nunca me he acostado con alguien de los que está aquí', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(96, 1, 'Yo nunca he odiado a mi ex', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(97, 1, 'Yo nunca he fumado marihuana', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(98, 1, 'Yo nunca he tragado mis propios fluídos', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(99, 1, 'Yo nunca he tenido fantasías sexuales con un familiar', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(100, 1, 'Yo nunca he llamado puta a una chica', 0, 0, 1, 0, '2018-08-26 13:22:50'),
(101, 1, 'Yo nunca me he excitado en clase', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(102, 1, 'Yo nunca me ducharía con alguno de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(103, 1, 'Yo nunca he visto porno', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(104, 1, 'Yo nunca me he peleado en la calle', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(105, 1, 'Yo nunca me he masturbado en las últimas 48 horas', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(106, 1, 'Yo nunca he sido sorprendido por mis padres haciendo el amor', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(107, 1, 'Yo nunca he tenido pensamientos acerca de la muerte o el suicidio', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(108, 1, 'Yo nunca me he ido de un taxi sin pagar', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(109, 1, 'Yo nunca he hecho un trío', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(110, 1, 'Yo nunca he pensado que alguien de aquí viste mal', 0, 1, 2, 0, '2018-08-26 13:22:50'),
(111, 1, 'Yo nunca he evitado tener relaciones porque no estaba rasurado', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(112, 1, 'Yo nunca he dormido con alguien de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(113, 1, 'Yo nunca he masturbado a alguien de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(114, 1, 'Yo nunca he gritado de dolor mientras defeco', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(115, 1, 'Yo nunca he besado a dos personas al mismo tiempo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(116, 1, 'Yo nunca he visto two girls one cup', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(117, 1, 'Yo nunca he tenido sexo con alguna persona drogada', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(118, 1, 'Yo nunca he practicado sexo anal', 0, 1, 1, 0, '2018-08-26 13:22:50'),
(119, 1, 'Yo nunca he tenido sexo en un coche', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(120, 1, 'Yo nunca he intentado hacerme sexo oral para ver si llegaba', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(121, 1, 'Yo nunca he tenido una relación de más de un año', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(122, 1, 'Yo nunca he sido rechazado al dar un beso', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(123, 1, 'Yo nunca he robado a mis padres', 0, 0, 1, 0, '2018-08-26 13:22:50'),
(124, 1, 'Yo nunca he pegado a una mujer', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(125, 1, 'Yo nunca he hecho un strip-tease', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(126, 1, 'Yo nunca invité a alguien a ver una película con doble intención', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(127, 1, 'Yo nunca he tenido sexo sin condón', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(128, 1, 'Yo nunca he pensado que alguien de aquí huele mal', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(129, 1, 'Yo nunca he pagado por tener relaciones', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(130, 1, 'Yo nunca he gritado el nombre de otra persona al tener relaciones', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(131, 1, 'Yo nunca he besado a alguien para dar celos a otra persona', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(132, 1, 'Yo nunca he usado tanga', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(133, 1, 'Yo nunca tendría una relación seria con alguno de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(134, 1, 'Yo nunca he tenido un follamigo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(135, 1, 'Yo nunca he mentido sobre mi edad para ligar', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(136, 1, 'Yo nunca he fantaseado con uniformes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(137, 1, 'Yo nunca he tenido sexo con alguien menor de edad', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(138, 1, 'Yo nunca he pensado que alguien de los presentes es homosexual', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(139, 1, 'Yo nunca he jugado a la botella', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(140, 1, 'Yo nunca he estado enamorado', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(141, 1, 'Yo nunca he cagado delante de mi pareja', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(142, 1, 'Yo nunca lo he hecho en el cine', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(143, 1, 'Yo nunca he tenido sexo silencioso', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(144, 1, 'Yo nunca he fingido un orgasmo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(145, 1, 'Yo nunca he insultado a alguien por su nacionalidad o su condición sexual', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(146, 1, 'Yo nunca me he enfadado con alguien de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(147, 1, 'Yo nunca he apoyado a la derecha', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(148, 1, 'Yo nunca fui a una playa nudista', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(149, 1, 'Yo nunca he querido matar a alguien', 0, 1, 0, 0, '2018-08-26 13:22:50'),
(150, 1, 'Yo nunca me he equivocado de agujero', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(151, 1, 'Yo nunca he pasado más de 3 días sin ducharme', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(152, 1, 'Yo nunca he visto porno gay', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(153, 1, 'Yo nunca he tenido un sueño erótico', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(154, 1, 'Yo nunca he estado en un bukake', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(155, 1, 'Yo nunca he sido forzado sexualmente', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(156, 1, 'Yo nunca me he echado un pedo en la mano y lo he olido', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(157, 1, 'Yo nunca he mandado fotos desnudo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(158, 1, 'Yo nunca he escupido en la bebida de alguien', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(159, 1, 'Yo nunca he sangrado por el culo', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(160, 1, 'Yo nunca he follado a cuatro patas', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(161, 1, 'Yo nunca he estado dispuesto a experimentar para comprobar mi orientación sexual', 0, 0, 0, 0, '2018-08-26 13:22:50'),
(162, 1, 'Yo nunca he follado con la regla (o teniéndola mi pareja)', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(163, 1, 'Yo nunca he hecho un beso negro', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(164, 1, 'Yo nunca he tenido una ETS', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(165, 1, 'Yo nunca me he masturbado en el baño del instituto', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(166, 1, 'Yo nunca me he mordido una uña del pie', 0, 0, 1, 0, '2018-08-26 13:22:51'),
(167, 1, 'Yo nunca he fantaseado con un profesor', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(168, 1, 'Yo nunca he gustado de ser azotado durante el sexo', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(169, 1, 'Yo nunca he follado más de 5 veces en un día', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(170, 1, 'Yo nunca me he reído tanto que me he meado encima', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(171, 1, 'Yo nunca me he excitado con alguno de los presentes', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(172, 1, 'Yo nunca he lamido un pezón', 0, 0, 1, 0, '2018-08-26 13:22:51'),
(173, 1, 'Yo nunca he sido tentado a probar la droga', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(174, 7, '¿Le gustan las motos?', 0, 2, 0, 0, '2018-08-26 13:22:51'),
(175, 7, '¿Ha llevado lentillas alguna vez?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(176, 7, '¿Es una persona?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(177, 7, '¿Sabe su nombre?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(178, 7, '¿Le gustan los chicos?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(179, 7, '¿Su color favorito es el azul?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(180, 7, '¿Te está mirando?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(181, 7, '¿Le gusta el pescado?', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(182, 7, '¿Puede saltar lejos?', 0, 0, 1, 0, '2018-08-26 13:22:51'),
(183, 7, '¿Llevaría un tanga?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(184, 7, '¿Follaría por dinero?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(185, 7, '¿Se masturbaria en publico?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(186, 7, '¿Estaría una semana sin lavarse?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(187, 7, '¿Ha llevado o lleva gafas?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(188, 7, '¿Se quedaría antes sin amigos?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(189, 7, '¿Suele llevar gorra?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(190, 7, '¿Es timido/timida?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(191, 7, '¿Le gusta jugar a videojuegos?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(192, 7, '¿Le gusta la música? ¿Qué tipo?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(193, 7, '¿Es inteligente?', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(194, 7, '¿Fuma?', 0, 0, 1, 0, '2018-08-26 13:22:51'),
(195, 4, '¿A quien le caes peor?', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(196, 4, '¿Quién es la más guarra del grupo?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(197, 7, '¿Tiene pinta de tener el pene grande?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(198, 4, '¿Con quién tendrías sexo? (no se vale decir nadie)', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(199, 4, '¿A quién besarías?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(200, 4, 'Di ${p[0]} como si fuera la respuesta', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(201, 4, 'Di lo que quieras (di algo que los deje flipando)', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(202, 4, '¿Cual es el sitio más raro en el que has tenido sexo?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(203, 4, '¿Con quien NO tendrías sexo?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(204, 4, '¿Quienes crees que tendrán una noche loca próximamente?', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(205, 4, '¿Quien tiene la madre que está más buena?', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(206, 4, '¿Si te obligan a matar a alguien del grupo, quien matarias?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(207, 4, '¿Te has masturbado pensando en alguien del grupo?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(208, 4, 'Debes hacer un viaje muy largo con alguien del grupo, ¿quién es?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(209, 4, '¿Cual es tu categoria porno preferida?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(210, 4, '¿A qué persona del grupo te has imaginado desnuda alguna vez?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(211, 4, '¿Crees que ${p[0]} es atractivo/a?', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(212, 4, '¿Vivirías con ${p[0]}?', 1, 1, 0, 0, '2018-08-26 13:22:51'),
(213, 4, '¿Quién de aquí crees que la tiene más pequeña?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(214, 4, '¿Quién de aquí crees que la tiene más grande?', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(215, 4, '¿És ${p[0]} un hijo de la gran mega puta?', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(216, 4, '¿Hay alguien del grupo al que le huela el aliento?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(217, 4, '¿Quién de aquí crees que se dejaría masturbar por alguien del mismo sexo?', 0, 0, 1, 0, '2018-08-26 13:22:51'),
(218, 4, '¿Si o No?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(219, 4, '¿Quién de aquí es el más tonto?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(220, 4, '¿Quiénes de aquí folla menos?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(221, 4, '¿Quién de aquí se masturba mas a menudo?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(222, 4, '¿Quién de aquí tiene menos amigos?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(223, 4, '¿Qué chica del grupo es la más salida?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(224, 5, '${p[0]} pisa a ${p[1]}', 2, 0, 1, 0, '2018-08-26 13:22:51'),
(225, 5, '${p[0]} y ${p[1]}, daros la mano', 2, 1, 0, 0, '2018-08-26 13:22:51'),
(226, 5, '${p[0]}, pon el dede on la nariz de ${p[1]}', 2, 0, 2, 0, '2018-08-26 13:22:51'),
(227, 5, '${p[0]}, pon el codo en el pecho de ${p[1]}', 2, 1, 1, 0, '2018-08-26 13:22:51'),
(228, 5, '${p[0]}, pon la cabeza en el trasero de ${p[1]}', 2, 2, 0, 0, '2018-08-26 13:22:51'),
(229, 5, '${p[0]} ponte a la pata coja', 1, 2, 0, 0, '2018-08-26 13:22:51'),
(230, 5, '${p[0]} decide quien pone las nalgas en el entrepierna de ${p[1]}', 2, 3, 0, 0, '2018-08-26 13:22:51'),
(231, 5, '${p[0]} pon la mano donde ${p[1]} te diga de su cuerpo', 2, 1, 1, 0, '2018-08-26 13:22:51'),
(232, 5, '${p[0]}, pon el pulgar en el cuello de ${p[1]}', 2, 1, 0, 0, '2018-08-26 13:22:51'),
(233, 5, '${p[0]}, pon el dedo gordo del pie en la boca  de ${p[1]}', 2, 2, 0, 0, '2018-08-26 13:22:51'),
(234, 5, '${p[0]} pon la nariz en el culo de ${p[1]}', 2, 3, 0, 0, '2018-08-26 13:22:51'),
(235, 5, '${p[0]} con la mano izquierda toca la nalga derecha de ${p[1]}', 2, 1, 1, 0, '2018-08-26 13:22:51'),
(236, 6, '¿Te follarías antes un perro o un gato?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(237, 6, '¿Sentarte en una tarta y comerte una polla o sentarte en una polla y comerte una tarta?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(238, 5, '${p[0]} muerde la oreja izquierda de ${p[1]}', 2, 1, 1, 0, '2018-08-26 13:22:51'),
(239, 6, 'Escoge con quien te casarías, tendrías una noche loca y asesinarías entre ${p[0]}, ${p[1]} y $${p[2]}', 3, 0, 0, 0, '2018-08-26 13:22:51'),
(240, 6, '¿Que mañana llueva o haga sol?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(241, 6, '¿Tener un hijo o dos?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(242, 6, '¿A quién besarías antes, a ${p[0]} o ${p[1]}?', 2, 0, 0, 0, '2018-08-26 13:22:51'),
(243, 6, '¿Pelear contra 1 hámster del tamaño de 1 oso o 100 osos del tamaño de 1 hámster?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(244, 6, '¿Llevar el reloj 5 minutos adelantado o 5 minutos atrasado?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(245, 6, '¿Introducirías el pene en un ano masculino por ${random(0,50)}00 €?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(246, 6, '¿Tener frío o calor?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(247, 6, '¿Si tuvieras que escuchar SOLO una canción de por vida cuál sería?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(248, 6, 'Pegarías a ${p[0]} por ${random(0,30)} €', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(249, 6, '¿Te liarías con el de al lado por ${random(0,30)} euros?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(250, 6, '¿Si cada vez que te tires a una persona, esa persona tuviese que morir, te tirarías a alguien? ', 0, 1, 0, 0, '2018-08-26 13:22:51'),
(251, 6, 'Si hoy fueras a morir, ¿cuál sería tu última comida?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(252, 6, '¿Morir quemado o por desgarro anal? ', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(253, 6, 'Si te conceden un deseo ahora mismo, ¿qué pedirías)', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(254, 6, 'Puedes escoger un superpoder, ¿cuál sería?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(255, 6, '¿Anal o suspender un curso?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(256, 6, '¿Tener un enano tocando la trompeta en tu oreja para siempre o que un tigre viviera en tu casa?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(257, 6, '¿Dejarías que ${p[0]} te hiciera sexo oral?', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(258, 6, '¿Morir quemado/a o morir ahogado/a?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(259, 6, '¿Tragas o escupes?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(260, 6, '¿Comerte viva a tu madre o comer vivo a tu padre?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(261, 6, 'Si fumas, ¿Por qué fumas?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(262, 6, '¿Que te amputen los dos brazos o las dos piernas?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(263, 6, '¿Convertirse en un perro apestoso y moribundo o un gato medio podrido(pero vivo)?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(264, 6, '¿Que te comieran poco a poco el brazo derecho o que mearas pequeños trozo de cristal?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(265, 6, '¿Prefieres que tu pareja se deje o afeite el pelo púbico?', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(266, 3, '${p[0]}, quítate los zapatos si los llevas', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(267, 3, '${p[0]} y ${p[1]}, jugad a piedra papel tijera', 2, 0, 0, 0, '2018-08-26 13:22:51'),
(268, 3, 'El último en saltar pierde', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(269, 3, '${p[0]}, dale un beso a quien queras en la boca o pierdes una prenda', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(270, 3, 'Di correctamente: \"Pablito clavó un clavito, ¿qué clavito clavó Pablito?, el clavito de Pablito.\"', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(271, 3, '${p[0]}, dale un beso a ${p[1]} en la mejilla o pierdes una prenda', 2, 0, 0, 0, '2018-08-26 13:22:51'),
(272, 3, 'El próximo en decir la palabra \"no\" se pierde por ser tan negativo', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(273, 3, 'Si ${p[0]} y ${p[1]} se besa en la boca durante 5 segundos o más pueden ponerse una prenda', 2, 0, 0, 0, '2018-08-26 13:22:51'),
(274, 3, 'Quien beba un vaso más lento entre ${p[0]} y ${p[1]} pierde', 2, 0, 0, 0, '2018-08-26 13:22:51'),
(275, 3, '${p[0]}, ${p[1]}, ${p[2]} y ${p[3]} decid un número del 1 al ${random(2,10)} en voz alta a la vez, quienes digan el mismo numero pierden', 4, 0, 0, 0, '2018-08-26 13:22:51'),
(276, 3, 'Pulso entre ${p[0]} y ${p[1]}', 2, 0, 0, 0, '2018-08-26 13:22:51'),
(277, 3, 'Imita el sonido de un perro, si el grupo cree que lo has hecho mal pierdes', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(278, 3, 'Quien no le de un beso al de su izquierda o derecha pierde', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(279, 3, '${p[0]} haz ${random(7,13)} flexiones, si no lo consigues pierdes', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(280, 3, '¡The floor is lava! El que en 5 segundos este tocando el suelo pierde', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(281, 3, 'El primero en encontrar un objeto redondo recupera una prenda', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(282, 3, 'El próximo en contestar a ${p[0]} sin decir su nombre pierde', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(283, 3, 'El próximo en hacer un chante se pone una prenda del que se lo haya comido.', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(284, 3, 'Alguien debe sacrificarse y perder o pierden todos', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(285, 3, 'Tocan elecciones, escoged democráticamente quien pierde', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(286, 3, 'Si suspendiste alguna asignatura el último curso pierdes ', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(287, 3, 'Vaya! A partir de ahora los relojes se consideran prendas!', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(288, 3, 'Quien tenga la mano más grande pierde', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(289, 3, '${p[0]} puede robarle una prenda a quien quiera y ponersela, o no', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(290, 3, '${p[0]} cierra los ojos y los demás le poneis alguien delante. Si ${p[0]} no adivina quien es, tocándole la cara con el meñique, en ${random(1,5)}0s pierde', 1, 0, 1, 0, '2018-08-26 13:22:51'),
(291, 3, '${p[0]} y ${p[1]} miraros fijamente durante ${random(5,20)}s, quien aparte la mirada antes pierde', 2, 0, 0, 0, '2018-08-26 13:22:51'),
(292, 3, 'Quien haga algo que sorprenda a los demás puede recuperar una prenda', 0, 0, 0, 0, '2018-08-26 13:22:51'),
(293, 3, '${p[0]} se convierte en un gatito triste, debe hacer reír a alguien con su cara de pena o perderá', 1, 0, 0, 0, '2018-08-26 13:22:51'),
(298, 7, 'bla bla<div><br></div>', 0, 0, 0, 5, '2018-09-03 13:40:17'),
(301, 7, 'bla&nbsp;<div>bla</div><div>bla</div>', 0, 0, 0, 5, '2018-09-03 13:41:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `modes`
--
ALTER TABLE `modes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shortname` (`shortname`);

--
-- Indexes for table `phrases`
--
ALTER TABLE `phrases`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `mode` (`mode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `modes`
--
ALTER TABLE `modes`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `phrases`
--
ALTER TABLE `phrases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `phrases`
--
ALTER TABLE `phrases`
  ADD CONSTRAINT `phrases_ibfk_1` FOREIGN KEY (`mode`) REFERENCES `modes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
