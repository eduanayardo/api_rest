/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 11.1.2-MariaDB-1:11.1.2+maria~ubu2204 : Database - db_mexico
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_mexico` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;

USE `db_mexico`;

/*Table structure for table `detalle` */

DROP TABLE IF EXISTS `detalle`;

CREATE TABLE `detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informacion` text DEFAULT NULL,
  `tipo_actividad_id` int(11) NOT NULL,
  `municipio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_tipo_actividad1_idx` (`tipo_actividad_id`),
  KEY `fk_detalle_municipio1_idx` (`municipio_id`),
  CONSTRAINT `fk_detalle_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_tipo_actividad1` FOREIGN KEY (`tipo_actividad_id`) REFERENCES `tipo_actividad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `detalle` */

insert  into `detalle`(`id`,`informacion`,`tipo_actividad_id`,`municipio_id`) values (1,'{\"actividades\":[{\"nombre\":\"Topolobampo\",\"descripcion\":\"Hermosa bahía con un puerto que recibe cruceros internacionales y transbordadores con servicio a La Paz, B.C.S. Tiene un malecón peatonal.\",\"actividad\":\"Paseos en lancha, pesca deportiva, observación de fauna marina.\",\"servicio\":\"Hospedaje, restaurantes, transporte, comercios.\"},{\"nombre\":\"El Maviri\",\"descripcion\":\"A 6 km. de Topolobampo, pequeña isla con playas y manglares.\",\"actividad\":\"Playa, paseos en lancha y kayac, motos acuáticas, pesca deportiva observación de la flora y fauna, tirolesa, juegos infantiles.\",\"servicio\":\"Restaurantes, baños y vestidores, puentes y miradores de madera.\"},{\"nombre\":\"Isla del Farallón\",\"descripcion\":\"Ubicada a 27 km de Topolobampo, es un islote rocoso considerado el segundo más grande del mundo en su género, santuario de focas y lobos marinos, así como delfines, varias especies marinas y aves acuáticas.\",\"actividad\":\"Paseos en lancha, observación de fauna, pesca deportiva, buceo.\",\"servicio\":\"\"},{\"nombre\":\"Jardín Botánico\",\"descripcion\":\"Ubicado en la zona centro de Los Mochis, es un agradable espacio recreativo de 16 ha., que tiene más de 200 especies de plantas y flores de diversas partes del mundo, destaca el jardín de cactáceas, así como algunas especies de aves.\",\"actividad\":\"\",\"servicio\":\"\"},{\"nombre\":\"Otros sitios\",\"descripcion\":\"Bahía Ohuira, Isla de los Pájaros, Playa La Biznaga y San Juan, Cueva Murciélagos.\",\"actividad\":\"\",\"servicio\":\"\"},{\"nombre\":\"En Los Mochis\",\"descripcion\":\"\",\"actividad\":\"\",\"servicio\":\"Aeropuerto, transportes, hospedaje, restaurantes, plazas comerciales.\"}]}',1,1),(2,'{\"actividades\":[{\"nombre\":\"Museo Regional Valle del Fuerte\",\"descripcion\":\"En Los Mochis tiene una exposición de la historia y piezas prehispánicas de la región, así como la historia sobre los orígenes de Los Mochis. También presenta muestras de artistas locales y foráneos.\"},{\"nombre\":\"Villa de Ahome\",\"descripcion\":\"Fundada en 1605, fue nombrada Pueblo Señorial, se ubica a 25 km. de Los Mochis y aún conserva casonas coloniales y tiene calles adoquinadas.\"},{\"nombre\":\"Cultura Mayo-Yoreme\",\"descripcion\":\"Las poblaciones de San Miguel Zapotitlán y La Florida son habitadas por indígenas Mayo – Yoreme, son famosas sus fiestas en Semana Santa.\"},{\"nombre\":\"Otros sitios\",\"descripcion\":\"En Los Mochis están la Casa de la Cultura Conrado Espinoza, el Cerro de la Memoria, el Teatro Ingenio, el Museo Interactivo Trapiche.\"}]}',2,1);

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `abreviatura` varchar(2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `estado` */

insert  into `estado`(`id`,`nombre`,`abreviatura`,`status`) values (1,'Aguascalientes','AS',1),(2,'Baja California','BC',1),(3,'Baja California Sur','BS',1),(4,'Campeche','CC',1),(5,'Coahuila de Zaragoza','CL',1),(6,'Colima','CM',1),(7,'Chiapas','CS',1),(8,'Chihuahua','CH',1),(9,'Ciudad de México','DF',1),(10,'Durango','DG',1),(11,'Guanajuato','GT',1),(12,'Guerrero','GR',1),(13,'Hidalgo','HG',1),(14,'Jalisco','JC',1),(15,'México','MC',1),(16,'Michoacán de Ocampo','MN',1),(17,'Morelos','MS',1),(18,'Nayarit','NT',1),(19,'Nuevo León','NL',1),(20,'Oaxaca','OC',1),(21,'Puebla','PL',1),(22,'Querétaro','QT',1),(23,'Quintana Roo','QR',1),(24,'San Luis Potosí','SP',1),(25,'Sinaloa','SL',1),(26,'Sonora','SR',1),(27,'Tabasco','TC',1),(28,'Tamaulipas','TP',1),(29,'Tlaxcala','TL',1),(30,'Veracruz de Ignacio de la Llave','VZ',1),(31,'Yucatán','YN',1),(32,'Zacatecas','ZS',1);

/*Table structure for table `galeria` */

DROP TABLE IF EXISTS `galeria`;

CREATE TABLE `galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `municipio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_galeria_municipio1_idx` (`municipio_id`),
  CONSTRAINT `fk_galeria_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `galeria` */

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `titulo` text DEFAULT NULL,
  `superficie` varchar(45) DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `fundacion` date DEFAULT NULL,
  `pueblo_magico` year(4) DEFAULT 0000,
  `descripcion` text DEFAULT NULL,
  `gastronomia` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `estado_id` int(11) NOT NULL,
  `zona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_municipios_estados_idx` (`estado_id`),
  KEY `fk_municipio_zona1_idx` (`zona_id`),
  CONSTRAINT `fk_municipio_zona1` FOREIGN KEY (`zona_id`) REFERENCES `zona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipios_estados` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `municipio` */

insert  into `municipio`(`id`,`nombre`,`titulo`,`superficie`,`poblacion`,`fundacion`,`pueblo_magico`,`descripcion`,`gastronomia`,`status`,`estado_id`,`zona_id`) values (1,'Ahome','Del mar a la montaña','3995',449215,'1977-01-05',0000,NULL,NULL,1,25,1),(2,'Angostura','Paraíso natural que seduce con sus amplias playas','1448',47207,'1916-12-17',0000,'Amplios litorales, lagunas, esteros y una extraordinaria biodiversidad configuran el municipio de Angostura, un paraíso natural que seduce con sus amplias playas, en las que el agua y la arena sirven de hábitat natural para numerosas aves acuáticas que han encontrado aquí su edén particular.','Angostura tiene una ubicación geográfica privilegiada ofrece una gran diversidad de alimentos del mar como del campo sinaloense. Deléitate con platillos como machaca de res, manta o camarón, barbacoa, cabeza de res, filete de pescado zarandeado, e infinidad de preparaciones de mariscos.',1,25,2),(3,'Badiraguato','Espíritu provinciano de abundante naturaleza que envuelve cada ríncón…','5864',31821,'1605-11-24',0000,'Refugio de la naturaleza, aquí encontrarás innumerables montañas y valles, arroyos, bosques y pequeñas poblaciones donde la vida rural parece haberse afincado con fuerza manteniendo las costumbres de antaño. Badiraguato el “arroyo de las montañas”, según su nombre indígena, es el segundo municipio más grande en extensión del Estado.','Sus platillos se basan principalmente en carne de res, cerdo y gallina, aunque también puede encontrar pescado y mariscos. Entre los que puedes degustar se encuentran la machaca, el pozole, huacabaqui, nopales con chile colorado, quelites, requesón, asados de conejo y liebre, tamales, entre otros.',1,25,2),(4,'Choix',NULL,'3220',32998,'1916-09-11',0000,'Choix se encuentra ubicado al extremo noroeste del Estado; su cabecera es la ciudad de Choix.Choix o también llamado Choiz proviene del cahita choim que significa \"las breas\", y este era aplicado a una tribu colectores de gomas o resinas vegetales; este topónimo significa, según don Héctor R. Olea, \"lugar de brea\" o \"donde habitan los colectores de resina”.',NULL,1,25,1),(5,'Concordia','Vive el antiguo esplendor minero que aún conserva su arquitectura ...','2163',27157,'1915-04-08',0000,'Población tradicional reducto colonial y añoranza del feudo minero que fue en el pasado, Concordia se perfila como una ciudad de coquetos rincones, de arquitectura singular y de bellos parajes naturales. Fue fundada por Francisco de Ibarra en 1565, con el nombre de San Sebastián. En 1828 la villa cambió su nombre por el de Concodia, en homenaje a los acuerdos pacíficos que tuvieron lugar aquí entre dos hermandades masónicas rivales. Mucho antes de los españoles, la región estuvo ocupada por grupos indígenas, cuya presencia se puede apreciar en los petroglífos dispersos por el territorio a orillas del Arroyo del Zapotillo, Ceroo de los MOnos o en La Petaca. Por su ubicación geográfica en la forntera con el Estado de Sinaloa y Durango, el territorio esta dominado por las estribaciones de la Sierra Madre Occidental daondo como resultado la presencia de bosques, zonas montañosas, barrancos y quebradas que dan un touqe especial a la zona.','En Concordia puedes encontrar una gran variedad de platillos típicos como la cazuela, tostadas, asado a la plaza, pero esta región es famosa porque se prepara el mejor \"pay de plátano del mundo\", además no podemos dejar de saborear los famosos raspados de Concordia, todos los sabores deliciosos pero el imperdible, es el de leche quemada.',1,25,3),(6,'Cosalá','Impresionate con los edificios históricos y las fachadas coloridas de estilo colonial…','164',6557,'1562-03-13',2005,'Ubicado en la Sierra Madre Oriental, Cosalá tiene angostas callejuelas empedradas y más de 250 construcciones que guardan siglos de historia. Se trata de un pueblo lleno de vida, en el que convergen su rica gastronomía y sus leyendas de fantasmas. Su caluroso verdor invita a los visitantes al ecoturismo y a la diversión. En 1531 llegaron aquí los primeros expedicionarios españoles, admirados tanto por la belleza del lugar como por la riqueza de su suelo, pródigo en metales preciosos.\r\nEn 1562 se tiene constancia real de la fundación de Cosalá conocida entonces como Real de MInas de las Once Mil Vírgenes. Para inicios del siglo XIX la convirtío en la población más próspera del noroeste de México, gracias a lo cual se convierte en la capital del Estado de Occidente, que comprendía los actuales estados de Sonora y Sinaloa. Hoy día, Cosalá es uno de los lugares más visitados de Sinaloa. Su legado histórico, la armonía de su arquitectura y la fescura natural que lo envuelve, han sido motivos sobrados para que la Secretaría de Turismo de México lo considere Pueblo Mágico. La magia que envuelve Cosalá puedes descubrirla al recorrer sus calles pintorescas y espacios de gran belleza que se integran a la naturaleza. Su arquitectura vernácula, su historia centenaria, sus tradiciones, su excelente gastronomía y la diversidad de atractivos turísticos en los que es posible disfrutar del turismo alternativo, te harán vivir este maravilloso Pueblo Mágico.','La llegada de los españoles en el año de 1542, marca el momento en que da inicio la gastonomía de Cosalá. Es posible degustar diversos platillos y postres preparados con una amalgama de ingredientes, algunos de origen prehispánico en suculenta combinación con componentes de la comida española.\r\n¿Qué tal una rica machaca y unas gorditas de asiento para empezar?\r\nTambién se preparan deliciosas recetas con tilapia y lobina recién pescados en ela presa José López Portillo. Hay que dejar un buen espacio a los dulces típicos, la elaboración de conservas de frutas, pan, empanadas, dulce de leche, machaca, chorizo, queso, tamales y guisos regionales, que resultan una delicia al paladar y que pueden ser saboreados en los restaurantes y demás sitios de venta de alimentos.',1,25,2),(7,'Culiacán','Capital de Sinaloa, cuidad de belleza y sabor...','4758',905265,'1531-09-29',0000,'Rodeada de verdes campos agrícolas, su magnificencia, conceptualizada en el marco de sus tres ríos, se compone de elementos naturales complementarios de su pujante desarrollo urbano. Probar Culiacán es asegurarse que sabe bien. La capital del estado de Sinaloa, en el Pacífico Mexicano, invita a conocerla desde el primer momento. Considerada como uno de los principales proveedores de alimentos del mundo, esta urbe tiene en la producción agroalimentaria su principal protagonista económico, y en la industria de reuniones su vocación turística.\r\n\r\nEs una excelente combinación que genera muy buenos resultados. Una ciudad de gente amable, de carácter franco y alegre, que lo mismo disfruta recorrer en un tranquilo paseo en bicicleta las riberas de sus tres rios: Humaya, Tamazula y Culiacán. Como sentarse en alguno de sus famosos restaurantes de mariscos o carnes rojas, acompañando sus deliciosos platillos con los acordes de “El Sinaloense”, himno popular del Estado. Las calles de Culiacán están llenas de historias y misticismo.\r\n\r\nLa música de Banda, una tradición que se vive a cada momento, envuelve al destino en una fiesta y alegría, recorriendo sus calles y descubriendo sus historias y leyendas, como la de “La Lupita”, la eterna novia de la ciudad o “Malverde”, aquel místico “bandido generoso”, protector de los pobres, cuya historia se cuenta entre propios y extraños. Tradiciones como el Ulama, juego prehispánico rasgo cultural de los sinaloenses, aún se mantienen vivas entre sectores de la población, que se esfuerzan por mantener vigentes las raíces de esta tierra.','Una muy buena razón por la que Culiacán sabe bien es su comida. La riqueza gastronómica del destino es impactante, reconocida a nivel internacional. La variedad de platillos realizados con productos de la región, desde el campo hasta el mar, en manos de maestros culinarios locales, nacionales e internacionales, es una de las experiencias que ofrece el destino. Fácilmente se pueden degustar los artesanales platillos elaborados por gente de la ciudad, como el famoso “aguachile”, en tradicionales carretas o restaurantes a pie de calle, hasta las más novedosas creaciones gastronómicas desarrolladas por preparados chefs en espectaculares restaurantes de calidad internacional, mismos que hablan del poderío gastronómico que tiene el destino.',1,25,2),(8,'El Fuerte','Impresionate con los edificios históricos y las fachadas coloridas de estilo colonial…','3843',12848,'1858-08-19',2009,'Ubicado eal noreste del Estado de Sinaloa, con grandes atractivos naturales, históricos, arquitectónicos, culturales y arraigadas tradiciones indígenas (Yoremes).\r\n\r\nEsta ciudad colonial es considerada como la más hermosa de Sinaloa, fundada en 1564 por el capitán español Francisco de Ibrra. El Origen de su nombre se deriva del \"Recinto Fortificado\" durante el virreinato de Don Juan Mendoza y Luna, Marqués de Montesclaros. El encantador estilo de la ciudad evoca la atmósfera colonial en sus majestuosas construcciones.','Tenemos una gran variedad de platillos típicos: machaca, caldillo, picadillo, arroz, huacabaqui, barbacoa, tamales de piña, carne, elote y dulce. En la cabecera municipal se han hecho costumbre los platillos a base de lobina como: los chicharrones, callos, albóndigas, filete zarandeado, empanizado o flameado, así como las mariscadas y los langostinos (cauques) preparados de diferentes maneras. En lo dulce encontramos pepitorias, jamoncillos, cocadas, capirotada, tacuarines (coricos), coyotas, semitas, melcocha, buñuelos y gorditas de queso.',1,25,1),(9,'Elota','Orgullosas raíces indígenas, danzas, artesanías y rica comida…','1518',53856,'1914-04-03',0000,'Flanqueando las costas centrales del Estado, en un punto equidistante entre Mazatlán y Culiacán, emerge la hermosa población de Elota.\r\n\r\nEl municipio cuenta con un extenso litoral de 45 Km. de longitud, contando con numerosas playas dotadas de los mejores servicios para hacer más placentera su visita. La Cruz es la cabeza del Municipio de Elota desde 1927. La Arquitectura predominante en La Cruz de Elota es moderna y pragmática, con edificios construidos mayoritariamente a lo largo del siglo XX.','En Elota, podrás disfrutar de unas excelentes parrilladas de pescado, o de los deliciosos ostiones en su concha, encontrarás variedad de platillos preparados a base de pescados y mariscos frescos sacados de sus costas. También se produce queso ranchero, requesón, dulce de leche y pan de mujer, y se preparan cauques al chipotle , sacados del río.',1,25,3),(10,'Escuinapa','Aventuras ecológicas, paseos en lancha por los islotes para observar aves, manglares y más…','1558.489',54131,'1915-09-07',0000,'Su costa forma una enorme zona de humedales rica en marismas y manglares donde viven infinidad de aves, insectos, moluscos y otras especies costeras. Es un pequeño pueblo pesquero orgullosamente “bicicletero”, por lo que es común ver bicicletas dobles, triples y bicitaxis. En el camino hasta llegar allí se aprecian pequeñas granjas camaroneras y zonas de salinas.\r\n\r\nLos Totorames que habitaron Escuinapa, lo conocieron como “lugar de perros del agua” o como “lugar de la diosa Ixcuina”, Diosa del parto, del maíz, del algodón.\r\n\r\nTras el paseo por las calles, llega el momento de degustar los tradicionales tamales barbones de camarón y otros platillos elaborados con frescos productos del mar, no en vano Escuinapa es conocida con el nombre de la “Perla Camaronera”.',NULL,1,25,3),(11,'Guasave','Guarda en cada uno de sus recovecos, tesoros milenarios y una ventana para asomarse a las maravillas del Mar de Cortés…','3464',320000,'1595-06-24',0000,'Pueblo con encanto, fuertemente marcado por la huella evangelizadora de los Jesuitas y que se ha mantenido a pesar del paso de los siglos. Incluso las antiguas construcciones conservan su majestuosidad convirtiéndose en focos de interés para los amantes tanto de la arquitectura como de la historia. Es la cabecera del municipio del mismo nombre.\r\n\r\nSe asienta en una zona donde han sido encontrados numerosos vestigios de grupos prehispánicos como los guasave, hasta principios del siglo xx no se conocía nada de dicha civilización, pero en 1938 un arqueólogo norteamericano, descubrió un enorme panteón prehispánico se clasifico la céramica demostrándose su calidad y se propuso a la civilización guasave como la frontera más septentrional de Mesoamérica. La mayor parte de las piezas halladas están en el Museo de Historia Natural de Nueva York, algunas se conservan en el Museo Comunitario de Tamazula. Guasave es muy conocido por la cría de caballos especialmente de pura sangre.','Guasave por ser un municipio líder en la producción de alimentos ofrece una amplia oferta gastronómica en la que destacan los pescados y mariscos, teniendo como ejemplo: los chicharrones, zarandeado, aguachiles y ceviche, también cuenta con una variedad de platillos típicos como tamales, gallina pinta y barbacoa, entre otros, siendo la gastronomía un elemento fundamental en la cultura local.',1,25,1),(12,'Mazatlán','Belleza natural y grandes atractivos históricos y arquitectónicos…','3068.48',441975,'1531-05-14',0000,'Experimente unas vacaciones inolvidables, conjugando la diversión, la aventura, los atractivos naturales, la calidez y la hospitalidad de su gente. Mazatlán es el único destino de playa en la costa del pacífico mexicano en el que sus visitantes tienen la oportunidad de caminar entre calles y callejones que son vibrantes vías hacia un recorrido por su grandioso pasado histórico. La arquitectura de Mazatlán se caracteriza por mostrar notables trazas de influencia española, francesa, alemana, así como de otras corrientes de la Europa del siglo XIX. Este hermoso destino posee legendaria tradición artística y cultural que data del siglo XIX. El Centro Histórico, es la mejor alternativa para conocer esta ancestral historia. La Catedral, el Cerro de la Nevería, la Plazuela Machado, el Teatro Ángela Peralta, Patrimonio Histórico de la Nación, y los interminables callejones invitan a contemplar la arquitectura y vida que ofrece la Perla del Pacífico. Aquí, la robusta arquitectura decimonónica que albergara nombres y apellidos de alcurnia, ha cedido los espacios a encantadores restaurantes para degustar lo mejor de la famosa gastronomía sinaloense, románticos bares y cafés gourmet, galerías de arte y tiendas de artesanías que lo convierten en sitio memorable.\r\n\r\nAsí, este deslumbrante destino combina la arquitectura tradicional del centro histórico, conocido como el Viejo Mazatlán - con los modernos hoteles y restaurantes que conforman la espectacular Zona Dorada, dotada con más de 10 kilómetros de hermosas playas -como Playa Norte, Playa Gaviotas y Playa Venados, que albergan infraestructura turística de primer nivel. La riqueza mazatleca también se aprecia en sus cristalinas aguas, donde abunda una variedad de peces y mariscos. Son muchos los eventos deportivos de pesca organizados en este destino, son muchas las actividades que confirman que tu vista a Mazatlán será una experiencia inolvidable!.','Mazatlán tiene el Récord Guinnes del coctel de camarón más grande\r\ndel mundo, que lo identifica como “La capital del camarón”. En sus platillos abundan ingredientes procedentes del mar de la más alta calidad, creando exquisitos y auténticos platillos conocidos en todo el mundo, como el aguachile de camarón, callo de hacha y su famoso pescado zarandeado.',1,25,3),(13,'Mocorito','Escenario de nostalgias y rincón de sueños…','2566',45351,'1915-04-01',2015,'Los orígenes de Mocorito se encuentran en una misión Jesuita fundada a principios del siglo XVII por los padres Juan Bautista Velasco y Hernando de Santarán, en la región noroeste del estado, en el valle del río Évora. Su nombre deriva de un vocablo Cahita que puede traducirse como “lugar donde habitan los indios mayos\", aunque algunos historiadores consideran más acertado traducirlo como \"lugar de muertos”, un término paradójico para un lugar lleno de vida, magia y romanticismo. Una de la peciliaridades de Mocorito es su variedad climática. El territorio es predominanteplano, existiendo pequeños cerros en la zona central, como el Cerro Batamoto, la sierra de Baragua o la Sierra del Capirato. Muchos de estos parajes naturales ofrecen interesantes pisibilidades para la caza, de paloma blanca y codorniz. El recorrido por las antiguas calles del centro histórico de Mocorito constituye una experiencia inolvidable, ya que te permite imbuirse de lleno en el pasado, contemplando algunas construcciones que mantienen intacto el aspecto de años atrás. Mocorito es conocido tamnién por sus apasionantes carreras de caballos. Aquí hant tenido lugar las competencias ecuestres más importantes de Sinaloa, en torno a las que se realizan cunatiosas apuestas.','Uno de los principales atractivos de Mocorito es su gastronomía, son famosos los “Productos hechos en Mocorito”, uno de los principales motivos para visitar el destino. Mocorito es la “cuna del Chilorio”, producto elaborado a base de carne de puerco y que es uno de los principales platillos sinaloenses. En enero del 2013 se publicó en el Periódico Oficial “El Estado de Sinaloa”, el Decreto que declara al “Chilorio” Patrimonio Municipal de Mocorito. Además del Chilorio, destacan la machaca y chorizo. En la parte dulce los jamoncillos (elaborados a base de leche bronca de vaca, azúcar y esencia de vainilla), los coricos, las bizcotelas, las coyotas, el pan de mujer o de trigo, los suspiros, las mestizas y las empanadas.\r\n\r\nTambién hay productos a base de cacahuate como pepitorias y garapiñados. En las Moliendas de El Valle, se elaboran productos derivados de la caña de azúcar: miel, dulce de caña, apanizada, palanqueta, panocha con cacahuate tostado, noroto (espuma) y melcochas.',1,25,2),(14,'Navolato','Hermosas costas y aguas mansas, favorecen el descanso y la relajación entre dunas de arena y abundante vegetación…','7253',28676,'1982-06-27',0000,'El surgimiento de Navolato se da a principios del siglo XVI, con una lucha por alcanzar las exigencias como entidad para este poblado prehispánico de origen Tahue Neo Aztlan y llegar a ser Municipio. Es rico en cultura, producción, tradición y personajes ilustres que llenan de historia la entidad. La ciudad presenta, vestigios coloniales en sus viejas casonas con elegantes balcones.','Navolato cuenta con una gran variedad de platillos elaborados con productos del mar como el marlín, camarón, machaca de pescado, jaiba, almeja, almeja amarilla, callo de lobina, callo de hacha entre muchos más.',1,25,2),(15,'Rosario','Pueblo Mágico, cuna de Lola Beltrán, es un destino lleno de cultura, tradición e historia…','2723',16001,'1655-08-03',2012,'Una de las poblaciones más atractivas de Sinaloa, con extensas playas a lo largo de sus 40 kilómetors de litoral prolóngandose desde la costa del Pacífico hasta la Sierra Madre Occidental, cuentan que en el lugar donde ahora está el pueblo, el caporal Bonifacio Rojas perdió un rosario y, al buscarlo, encontró una gran cantidad de plata, convirtiéndose en la próspera Mina de Tajo.\r\n\r\nAsí se fundó El Rosario en 1655, uno de los pueblos más prósperos del noroeste mexicano produciendo importantes cantidades de oro y plata durante 290 años. En la actualidad es una opción interesante para el viaje y la aventura. La cabecera municipal, del mismo nombre, se localiza a 70 kms. del sur de Mazatlán, uno de los encantos del municipio es el carácter de la gente, siempre afable y dispuesta a recibir a los forasteros, un estimulo más para adentrarse en esta zona.\r\n','En Rosario se puede disfrutar una gran variedad de platillos que hacen vibrar al más exigente de los paladares. La cocina Sinaloense es reconocida por su exquisito sazón y singular sabor. No hay nada igual, y es que, para creerlo, hay que probarlo.\r\n\r\nTambién hay que destacar el Chorizo, producto típico hecho a base de carne de puerco, molida, sazonada con chile y especias. El chorizo es a su vez la base de deliciosos platillos. El Pozole Rojo, de lo más típico y delicioso de México, elaborado con granos de maíz, chile negro, carne de puerco y diferentes especias.\r\n\r\nAsado a la Plaza, autentico y regional, carne y papa en cubitos, servidos con verdura cocida y bañada con una exquisita salsa de tomate. Menudo, preparado con pancita y pata de res, granos de maíz y ajo, acompañado con cebolla y hierbabuena.\r\n\r\nTacos dorados rellenos de camarón, pollo, carne o papa. En lo referente al dulce se encuentra el jamoncillo de leche, ciruelas negras, arroz con leche, dulces de leche, hasta cocadas, dulce de mango. La bebida está representada por el agua de coco, horchata, tamarindo, Jamaica, raspados y cerveza. Prueba Refresco Toni Col, refresco típico y único, sabor vainilla, 100% rosarense, refrescante y vigorizante.',1,25,3),(16,'Salvador Alvarado','Escenario de nostalgias, rincón de sueños, callejuelas de recuerdo que en los atardeceres solitarios dejan escuchar el traqueteo del viejo tranvía…','1197.5',81109,'1962-02-07',0000,'Este municipio lleva su nombre en honor al gran General Salvador Alvarado. Su cabecera municipal, Guamúchil, es considerada como el centro de negocios de la Región del Évora y es tierra del gran ídolo Pedro Infante, reconocido actor y cantante, quien brilló con luz propia en la época de oro del cine mexicano.\r\n\r\nEsta localidad comenzó a crecer a principios del siglo XX, cuando se instaló allí la primera estación del tren, lo que detonó su actividad comercial. Hoy tiene un caractér plácido: su bonita plaza principal esta adornada con un quiosco de herrería blanca y una estatua dedicada a Pedro Infante. La calma impera las calles de Guamúchil y enormes palmeras irrumpen por doquier, poniendo un toque de verdor en las largas avenidas.\r\n\r\nGoza de un próspero desarrollo económico fruto del intenso cultivo de garbanzo. Entre las construcciones más importantes se encuentras varios edificios de interés arquitectónico como laantigua Hacienda de la Ciénaga de Casal, el Hotel Sudpacífico, edificado a prinicpios del siglo XX, el Hotel Davidmar y la sede de la Escuela Primaria Federal por Cooperación.','En el municipio de Salvador Alvarado, tradicionalmente se degustan platillos como la cazuela, tamales de puerco, elote y el chilorio, producto originario de este lugar, así como también pescados y mariscos. Además son tradicionales el arroz con leche, las pepitorias y la capirotada.',1,25,2),(17,'San Ignacio','Las calles pintorescas encantan con edificaciones coloniales mostrando la historia de tesoros escondidos…','4651',4543,'1633-01-01',0000,'En sus orígenes San Ignacio fue una misión jesuita fundada en el siglo XVI, hoy día es un hermoso lugar con magníficos ejemplos arquitectónicos de estética europea definidos por su marcado sabor colonial e histórico, sus calles lucen algunos monumentos dedicados a ilustres del pasado como a Don Benito Juárez o al General Gabriel Leyva Velázquez.','Los guisos más comunes que se preparan son la cazuela y el cocido basándose en carne de res; el colachi, platillos a base de pescado y mariscos como el aguachile, pescado zarandeado y ostiones en su concha. Se preparan exquisitos dulces como la capirotada, arroz con leche y jamoncillos.',1,25,3),(18,'Sinaloa de Leyva','Sus calles estrechas y adoquinadas mantienen su aspecto de antaño, adornadas por casonas del siglo XIX…','4651',4543,'1583-04-30',0000,'Los españoles bautizaron a este lugar como Villa de San Felipe y Santiago de Sinaloa, nombre que extendió a la actualidad. Éste fue el origen del patrimonio cultural de una pequeña ciudad serrana que convive con el pasado arquitectónico de sus edificios, con sus tradiciones que se aferran a perdurar y con un marco natural que sólo espera tu visita para enamorar.\r\n\r\nSinaloa de Leyva es el punto de inicio de la evangelización cristiana del noroeste de México, con la llegada de los primeros misioneros jesuitas y llegó a ser la región más poblada de SInaloa gracias a sus esfuerzos. En la Actualidad, las calles estrechas y adoquinadas mantienen su aspecto de antaño, adornadas por varias casonas del siglo XIX, de arquitectura típicamente española.','Sinaloa de Leyva es reconocida en su gastronomía por su gran variedad de platillos autóctonos como quelites con queso, calabacitas en colachi, el huacabaqui, pozole, menudo, barbacoa, y los famosos cauques de la región.',1,25,1);

/*Table structure for table `pueblo` */

DROP TABLE IF EXISTS `pueblo`;

CREATE TABLE `pueblo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL,
  `informacion` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `municipio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudades_municipios1_idx` (`municipio_id`),
  CONSTRAINT `fk_ciudades_municipios1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `pueblo` */

insert  into `pueblo`(`id`,`nombre`,`img`,`informacion`,`status`,`municipio_id`) values (1,'Villa de Ahome','ahome-pueblo-senorial.png','{\"titulo\":\"Pueblo Señorial con más de 400 años de historia.\",\"descripcion\":\"<p>Fundada en 1605, la Villa de Ahome tiene lugares y construcciones que la convierten en un sitio maravilloso, como la plazuela central, el parque recreativo, además de el Arco que da la bienvenida a los visitantes.</p><p>Sinaloa de Leyva es reconocida en su gastronomía por su gran variedad de platillos autóctonos como quelites con queso, calabacitas en colachi, el huacabaqui, pozole, menudo, barbacoa, y los famosos cauques de la región.</p>\"}',1,1);

/*Table structure for table `tipo_actividad` */

DROP TABLE IF EXISTS `tipo_actividad`;

CREATE TABLE `tipo_actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `tipo_actividad` */

insert  into `tipo_actividad`(`id`,`nombre`,`status`) values (1,'Actividad',1),(2,'Imperdible',1);

/*Table structure for table `zona` */

DROP TABLE IF EXISTS `zona`;

CREATE TABLE `zona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `zona` */

insert  into `zona`(`id`,`nombre`,`status`) values (1,'Zona Norte',1),(2,'Zona Centro',1),(3,'Zona Sur',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;