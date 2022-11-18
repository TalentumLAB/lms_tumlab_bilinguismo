-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2022 a las 15:56:20
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.28


-- ------------------------------------------------------------------------------------------------
-- -------------------------------SET THIS INFORMATION TO THE SQL FILE-----------------------------
-- ------------------------------------------------------------------------------------------------

-- ENABLE NATIVE PASSWORD
ALTER USER 'bilinguismo-user'@'%' IDENTIFIED WITH mysql_native_password BY 'Bilinguismo2022';

-- INSTRUCTION TO CREATE DB
CREATE DATABASE bilinguismo_db
  CHARACTER SET = 'utf8mb4'
  COLLATE = 'utf8mb4_unicode_ci';

-- ASSIGNMENT OF PERMISSIONS TO THE USER
GRANT ALL PRIVILEGES ON bilinguismo_db.* TO 'bilinguismo-user'@'%';
FLUSH PRIVILEGES;

-- SELECT DB
USE bilinguismo_db;

-- -----------------------------------------------END----------------------------------------------
-- ------------------------------------------------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bilinguismo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--

CREATE TABLE `course` (
  `id_course` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `institutions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `course`
--

INSERT INTO `course` (`id_course`, `name`, `institutions_id`) VALUES
(2, 'test', 1),
(3, 'test1', 1),
(4, 'PRIMERO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_indicators`
--

CREATE TABLE `course_indicators` (
  `id_course` int(11) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `calc_indicator` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `course_indicators`
--

INSERT INTO `course_indicators` (`id_course`, `indicator_id`, `calc_indicator`) VALUES
(2, 8, '1'),
(2, 9, '0,00'),
(3, 8, '1'),
(3, 9, '0,00'),
(4, 8, '3'),
(4, 9, '0,00'),
(4, 11, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dtops`
--

CREATE TABLE `dtops` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dtops`
--

INSERT INTO `dtops` (`id`, `name`) VALUES
(1, 'VALLE'),
(2, 'NARIÑO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grades`
--

INSERT INTO `grades` (`id`, `name`) VALUES
(1, 'PRIMERO'),
(2, 'SEGUNDO'),
(3, 'TERCERO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'GRUPO 1'),
(2, 'GRUPO 2'),
(3, 'GRUPO 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headquarters`
--

CREATE TABLE `headquarters` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `town_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `headquarters`
--

INSERT INTO `headquarters` (`id`, `name`, `town_id`, `institution_id`) VALUES
(1, 'SEDE 1 IE CALI 1', 1, 1),
(2, 'SEDE 2 IE CALI 1', 1, 1),
(3, 'SEDE 3 IE CALI 1', 1, 1),
(4, 'SEDE 1 IE VALLE 1', 2, 2),
(5, 'SEDE 2 IE VALLE 1', 2, 2),
(6, 'SEDE 1 IE CARTAGENA 1', 2, 3),
(7, 'SEDE 2 IE CARTAGENA 1', 2, 3),
(8, 'SEDE 3 IE CARTAGENA 1', 2, 3),
(9, 'SEDE 4 IE CARTAGENA 1', 2, 3),
(10, 'SEDE 1 IE SAN ANDRES 1', 2, 4),
(11, 'SEDE 1 IE PEDRO CLAVEL 1', 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headquarters_has_grade_has_group`
--

CREATE TABLE `headquarters_has_grade_has_group` (
  `id` int(11) NOT NULL,
  `headquarters_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `headquarters_has_grade_has_group`
--

INSERT INTO `headquarters_has_grade_has_group` (`id`, `headquarters_id`, `grade_id`, `group_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 1, 2, 1),
(5, 1, 2, 2),
(6, 1, 2, 3),
(7, 1, 3, 1),
(8, 1, 3, 2),
(9, 1, 3, 3),
(10, 2, 1, 1),
(11, 3, 1, 1),
(12, 3, 1, 2),
(13, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headquarters_has_grade_has_group_has_simat`
--

CREATE TABLE `headquarters_has_grade_has_group_has_simat` (
  `headquarters_has_grade_has_group_id` int(11) NOT NULL,
  `simat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `headquarters_has_grade_has_group_has_simat`
--

INSERT INTO `headquarters_has_grade_has_group_has_simat` (`headquarters_has_grade_has_group_id`, `simat_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(9, 10),
(10, 11),
(10, 13),
(11, 12),
(12, 13),
(13, 375);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicators`
--

CREATE TABLE `indicators` (
  `id` int(11) NOT NULL,
  `ind_type_id` int(11) NOT NULL,
  `und_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `operator_id` int(20) NOT NULL,
  `ind_category_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `indicators`
--

INSERT INTO `indicators` (`id`, `ind_type_id`, `und_id`, `name`, `title`, `description`, `operator_id`, `ind_category_id`) VALUES
(1, 1, 1, 'global_progress', 'progreso global', 'Porcentaje de progreso teniendo en cuenta el número de actividades', 0, 5),
(2, 3, 4, 'last_signin', 'último inicio de sesión', 'Fecha del ultimo ingreso del estudiante a la plataforma.', 3, 3),
(3, 2, 3, 'ratings', 'calificaciones', 'Calificacion del estudiante en los diferentes tipos de actividad', 1, 2),
(4, 2, 2, 'time_online', 'tiempo en línea', 'Tiempo total que el estudiante permanece dentro de un curso', 0, 3),
(5, 2, 3, 'grade_point_average', 'Promedio de notas ', 'Promedio de notas de un estudiante en un curso', 2, 2),
(6, 2, 5, 'number_of_courses', 'cantidad de cursos', 'Cantidad de cursos que se han creado en la institucion', 3, 4),
(7, 2, 5, 'activities_views', 'Cantidad de actividades vistas', 'Cantidad de actividades visualizadas por el estudiante', 1, 5),
(8, 2, 5, 'count_of_activities', 'cantidad de actividades', 'Cantidad de actividades que hay en cada curso', 1, 5),
(9, 1, 1, 'global_c_progress', 'progreso del curso ', 'Progreso de todos los estudiantes en el curso', 0, 5),
(10, 2, 5, 'quantity_students', 'Cantidad de estudiantes', 'Cantidad de estudiantes en al institución', 3, 4),
(11, 1, 1, 'grade_point_averagec', 'Promedio de notas curso', 'Promedio de notas de todo el curso', 0, 2),
(12, 2, 5, 'students_by_gender', 'Cantidad de estudiantes por genero', 'Cantidad de estudiantes por genero', 3, 1),
(13, 2, 5, 'average_student_age', 'edad promedio del estudiante', 'Edad promedio de los estudiantes', 2, 1),
(14, 2, 5, 'ethnic_students', 'cantidad de estudiantes pertenecientes a una etnia', 'cantidad de estudiantes pertenecientes a una etnia', 3, 1),
(15, 2, 5, 'students_disability', 'cantidad de estudiantes con discapacidad', 'cantidad de estudiantes con alguna discapacidad', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ind_category`
--

CREATE TABLE `ind_category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ind_category`
--

INSERT INTO `ind_category` (`id`, `name`) VALUES
(1, 'Indicadores personales'),
(2, 'Indicadores de notas'),
(3, 'Indicador de desercion'),
(4, 'Indicador de instituciones'),
(5, 'Indicador de actividades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ind_types`
--

CREATE TABLE `ind_types` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ind_types`
--

INSERT INTO `ind_types` (`id`, `type`) VALUES
(1, 'percentage'),
(2, 'number'),
(3, 'date');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institutions`
--

CREATE TABLE `institutions` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `institutions`
--

INSERT INTO `institutions` (`id`, `name`) VALUES
(1, 'IE CALI 1'),
(2, 'IE VALLE 1'),
(3, 'IE CARTAGENA 1'),
(4, 'IE SAN ANDRES 1'),
(5, 'IE PEDRO CLAVEL 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operators`
--

CREATE TABLE `operators` (
  `id` int(11) NOT NULL,
  `operator` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `operators`
--

INSERT INTO `operators` (`id`, `operator`) VALUES
(1, 'frecuency_number_percentage'),
(2, 'grade_point_average'),
(3, 'count_students');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform`
--

CREATE TABLE `platform` (
  `id_platform` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `platform`
--

INSERT INTO `platform` (`id_platform`, `name`) VALUES
(1, 'test');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_indicators`
--

CREATE TABLE `platform_indicators` (
  `platform_id_platform` int(11) NOT NULL,
  `indicators_id` int(11) NOT NULL,
  `calc_indicator` varchar(155) NOT NULL,
  `institutions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `platform_indicators`
--

INSERT INTO `platform_indicators` (`platform_id_platform`, `indicators_id`, `calc_indicator`, `institutions_id`) VALUES
(1, 10, '4', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `simats`
--

CREATE TABLE `simats` (
  `id` int(11) NOT NULL,
  `year_information` int(11) NOT NULL,
  `type_document` int(11) NOT NULL,
  `number_document` int(11) NOT NULL,
  `expedition_department` varchar(45) NOT NULL,
  `municipal_expedition` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `second_surname` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `second_name` varchar(45) DEFAULT NULL,
  `residence_adress` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `residence_department` varchar(45) NOT NULL,
  `residence_municipality` varchar(45) NOT NULL,
  `stratum` int(11) NOT NULL,
  `sisben` double DEFAULT NULL,
  `birth_date` date NOT NULL,
  `final_date` date DEFAULT NULL,
  `age` int(11) NOT NULL,
  `birth_department` varchar(45) NOT NULL,
  `birth_municipality` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `population_victim_conflict` varchar(45) NOT NULL,
  `department_expedition` varchar(45) DEFAULT NULL,
  `municipality_expedition` varchar(45) DEFAULT NULL,
  `from_private_sector` tinyint(1) NOT NULL,
  `from_other_municipality` tinyint(1) NOT NULL,
  `disability` varchar(45) DEFAULT NULL,
  `exeptional_capabilities` varchar(45) NOT NULL,
  `ethnicity` varchar(45) DEFAULT NULL,
  `precucordos` varchar(45) NOT NULL,
  `journal` varchar(45) NOT NULL,
  `characterization` varchar(45) NOT NULL,
  `specialty` varchar(45) NOT NULL,
  `methodology` varchar(45) NOT NULL,
  `enrolled_enrollment` varchar(45) NOT NULL,
  `is_repeat` tinyint(1) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `academic_situation_above` varchar(45) NOT NULL,
  `fountain_resources` varchar(45) NOT NULL,
  `student_area` varchar(45) NOT NULL,
  `head_family` tinyint(1) NOT NULL,
  `ben_mad_flia` tinyint(1) NOT NULL,
  `ben_vet_fp` tinyint(1) NOT NULL,
  `ben_her_birth` tinyint(1) NOT NULL,
  `admitted_code` int(11) DEFAULT NULL,
  `valuation_code_1` int(11) DEFAULT NULL,
  `valuation_code_2` int(11) DEFAULT NULL,
  `number_agreement` int(11) DEFAULT NULL,
  `per_id` int(11) NOT NULL,
  `special_academic_support` varchar(45) DEFAULT NULL,
  `criminal_responsibility` varchar(45) DEFAULT NULL,
  `country_origin` varchar(45) DEFAULT NULL,
  `specific_disorders` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `simats`
--

INSERT INTO `simats` (`id`, `year_information`, `type_document`, `number_document`, `expedition_department`, `municipal_expedition`, `last_name`, `second_surname`, `name`, `second_name`, `residence_adress`, `phone`, `residence_department`, `residence_municipality`, `stratum`, `sisben`, `birth_date`, `final_date`, `age`, `birth_department`, `birth_municipality`, `gender`, `population_victim_conflict`, `department_expedition`, `municipality_expedition`, `from_private_sector`, `from_other_municipality`, `disability`, `exeptional_capabilities`, `ethnicity`, `precucordos`, `journal`, `characterization`, `specialty`, `methodology`, `enrolled_enrollment`, `is_repeat`, `is_new`, `academic_situation_above`, `fountain_resources`, `student_area`, `head_family`, `ben_mad_flia`, `ben_vet_fp`, `ben_her_birth`, `admitted_code`, `valuation_code_1`, `valuation_code_2`, `number_agreement`, `per_id`, `special_academic_support`, `criminal_responsibility`, `country_origin`, `specific_disorders`) VALUES
(1, 2021, 1, 1111111111, '76', '563', 'BERRIO', 'QUIÑONEZ', 'LANDY', 'LISETH', 'IND LA CONCORDIA CS 2', '2147483647', '76', '563', 1, 22, '2033-01-10', '2033-01-10', 37, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NEGRITUDES', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 4666, 4689, 4756, 0, 543739, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(2, 2021, 1, 1111111112, '76', '563', 'QUIÑONES', 'PATIÑO', 'CLAUDIA', 'PATRICIA', 'CGTO LOMITAS', '2147483647', '76', '563', 1, 22, '2033-01-11', '2033-01-11', 26, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Rural', 0, 0, 0, 0, 7366, 7389, 7456, 0, 544724, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(3, 2021, 1, 1111111113, '76', '563', 'CARDONA', 'QUINTERO', 'FRANCY', '', 'CL 8 3 30', '2147483647', '76', '563', 2, 22, '2033-01-09', '2033-01-09', 31, '76', '563', 'F', 'Amenaza', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NEGRITUDES', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 4828, 4851, 4918, 0, 544939, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(4, 2021, 1, 1111111114, '76', '563', 'MARTINEZ', 'MELO', 'MARÍA', 'DEL MAR', 'CALLE 2 NO. 1-56', '2147483647', '76', '563', 2, 22, '2033-01-10', '2033-01-10', 30, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'VISUAL - BAJA VISIóN IRREVERSI', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'No culminó', 'SGP', 'Urbana', 0, 0, 0, 0, 3348, 3371, 3438, 0, 544959, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(5, 2021, 1, 1111111115, '76', '563', 'LOPEZ', 'NUÑEZ', 'JOSE', 'MOISES', 'IND LA CONCORDIA CS 2', '2147483647', '76', '563', 1, 22, '2033-01-11', '2033-01-11', 30, '76', '520', 'M', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'AFRODESCENDIENTE', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 3507, 3530, 3597, 0, 547606, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(6, 2021, 1, 1111111116, '76', '563', 'GUACA', 'VASQUEZ', 'DIANA', 'CRISTINA', 'IND PRADERA', '2147483647', '76', '563', 2, 22, '2033-01-09', '2033-01-09', 32, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NOCTURNA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 8855, 8878, 8945, 0, 547882, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(7, 2021, 1, 1111111117, '76', '563', 'DOMINGUEZ', 'VARGAS', 'TAIRUN', 'JOSE', 'IND CALLE 4 7-73', '2147483647', '76', '563', 1, 22, '2033-01-10', '2033-01-10', 28, '76', '563', 'M', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NOCTURNA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 8578, 8601, 8668, 0, 549119, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(8, 2021, 1, 1111111118, '76', '563', 'VACCA', 'RODRIGUEZ', 'ANGIE', 'VANESSA', 'MZ 34 CS 8', '2147483647', '76', '563', 1, 22, '2033-01-11', '2033-01-11', 29, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'No culminó', 'SGP', 'Rural', 0, 0, 0, 0, 1014, 1037, 1104, 0, 549408, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(9, 2021, 1, 1111111119, '76', '563', 'POSU', '', 'LUZ', 'ANGELICA', 'IND MZ 6 CASA 6', '2147483647', '76', '563', 1, 22, '2033-01-09', '2033-01-09', 27, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NOCTURNA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Rural', 0, 0, 0, 0, 1010, 1033, 1100, 0, 550299, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(10, 2021, 1, 1111111120, '76', '563', 'LUCUMI', 'SALAMANDO', 'AYDA', 'LITH', 'IND CLL 1 NO. 5-91ADERA', '2147483647', '76', '563', 2, 22, '2033-01-10', '2033-01-10', 23, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NOCTURNA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, ' Reprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 8300, 8323, 8390, 0, 551283, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(11, 2021, 1, 1111111121, '76', '520', 'MARTINEZ', 'CHAGUEZA', 'JHON', 'JAIRO', 'LA GRANJA', '2147483647', '76', '563', 1, 22, '2033-01-11', '2033-01-11', 26, '76', '275', 'M', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NEGRITUDES', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 5453, 5476, 5543, 0, 551475, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(12, 2021, 1, 1111111122, '76', '248', 'CARDENAS', 'MOLINA', 'JOSE', 'JAVIER', 'HACIENDA LAS MARGARITAS', '2147483647', '76', '130', 1, 22, '2033-01-09', '2033-01-09', 25, '76', '248', 'M', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NOCTURNA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'No culminó', 'SGP', 'Urbana', 0, 0, 0, 0, 2889, 2912, 2979, 0, 551529, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(13, 2021, 1, 1111111123, '76', '563', 'DAZA', 'ALVAREZ', 'GREICY', 'ALEJANDRA', 'IND PRADERA', '2147483647', '76', '563', 1, 22, '2033-01-10', '2033-01-10', 25, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NOCTURNA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, ' Reprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 6792, 6815, 6882, 0, 551863, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(14, 2021, 1, 1111111124, '76', '563', 'MEJIA', 'LOPEZ', 'CRISTIAN', 'DAVID', 'MANZANA F CASA 4', '2147483647', '76', '563', 1, 22, '2033-01-11', '2033-01-11', 25, '76', '563', 'M', 'Desplazamiento Forzado', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA ', 'NO APLICA ', 'Programa para jóvenes en extra', 'N', 0, 0, 'Aprobó', 'SGP', 'Urbana', 0, 0, 0, 0, 9113, 9136, 9203, 0, 551866, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA'),
(375, 2021, 1, 1231111111, '76', '563', 'ROBIN', 'GONZALEZ', 'ANDRES', 'FELIPE', 'IND LA CONCORDIA CS 2', '2147483647', '76', '563', 1, 22, '2033-01-10', '2033-01-10', 37, '76', '563', 'F', 'No aplica', '0', '0', 0, 0, 'NO APLICA', 'NO APLICA', 'NEGRITUDES', 'NO APLICA', 'FIN DE SEMANA', 'NO APLICA', 'NO APLICA', 'Programa para jÃ³venes  en extra', 'N', 0, 0, 'AprobÃ³', 'SGP', 'Urbana', 0, 0, 0, 0, 4666, 4689, 4756, 0, 543739, 'NO APLICA', 'NO APLICA', 'Colombia', 'NO APLICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `towns`
--

CREATE TABLE `towns` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `dtop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `towns`
--

INSERT INTO `towns` (`id`, `name`, `dtop_id`) VALUES
(1, 'ALCALA', 1),
(2, 'CALI', 1),
(3, 'FILANDIA', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unds`
--

CREATE TABLE `unds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unds`
--

INSERT INTO `unds` (`id`, `name`) VALUES
(1, 'percentage'),
(2, 'hour'),
(3, 'qualification'),
(4, 'time'),
(5, 'quantity');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `keycloak_sub_id` varchar(255) NOT NULL,
  `simat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `keycloak_sub_id`, `simat_id`) VALUES
(1, '3c01cb28-5d01-4af9-a065-c36f0daf8c31', 13),
(2, 'c4d5639f-31f8-4d6b-9a03-026815b8db89', 12),
(3, '0f7561ce-da8b-4b59-81a4-678bd12ae28e', 11),
(4, 'd5ed7b49-ab1f-469c-a709-a17b05145833', 10),
(5, '7a0846f5-0e50-4b57-b346-06defd9332d9', 9),
(6, 'da895baf-36e1-40c7-8d56-f5efaf315d38', 8),
(7, '9efb250f-fbdf-471d-8a17-4736ea2ddb74', 7),
(8, '563c4d16-4567-439d-9c41-76506fc9e2bd', 6),
(9, 'b0f3b887-735d-4960-a60d-50dacbe0b510', 5),
(10, '37e53232-6f26-462b-bee8-6ac60d188f48', 4),
(11, '7ac0c15d-b1e6-4154-96d2-17a8d7931855', 3),
(12, '7db9e723-7ea7-4a7f-acfa-96bd29f91b87', 2),
(13, '939620c7-6a94-4910-9327-42b8b9c5b051', 1),
(582, '7c546870-aec5-434b-adb0-0e39a8db736a', 375);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_indicators`
--

CREATE TABLE `user_indicators` (
  `user_id` int(11) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `calc_indicator` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_indicators`
--

INSERT INTO `user_indicators` (`user_id`, `indicator_id`, `calc_indicator`) VALUES
(1, 1, '58'),
(2, 1, '1'),
(3, 1, '23'),
(4, 1, '68'),
(5, 1, '33'),
(6, 1, '61'),
(7, 1, '27'),
(8, 1, '3'),
(9, 1, '23'),
(10, 1, '48'),
(11, 1, '33,33'),
(12, 1, '82'),
(13, 1, '100,00'),
(1, 2, 'Wed/jan/1969'),
(2, 2, 'mon/Dec/1969'),
(3, 2, 'Wed/Dec/1969'),
(4, 2, 'Wed/Dec/1969'),
(5, 2, 'Wed/Dec/1969'),
(6, 2, 'Wed/Dec/1969'),
(7, 2, 'Wed/Dec/1969'),
(8, 2, 'Wed/Dec/1969'),
(9, 2, 'Wed/Dec/1969'),
(10, 2, 'Wed/Dec/1969'),
(11, 2, 'Wed/Dec/1969'),
(12, 2, 'Wed/feb/1969'),
(13, 2, 'Wed/Dec/1969'),
(1, 3, '5'),
(2, 3, '4.51'),
(3, 3, '4.34'),
(4, 3, '4.265'),
(5, 3, '3.255'),
(6, 3, '0.785'),
(7, 3, '1.915'),
(8, 3, '3.705'),
(9, 3, '6'),
(10, 3, '2.6'),
(11, 3, '33,33'),
(12, 3, '4.72'),
(13, 3, '66,67'),
(1, 4, '55'),
(2, 4, '50'),
(3, 4, '11'),
(4, 4, '22'),
(5, 4, '98'),
(6, 4, '53'),
(7, 4, '88'),
(8, 4, '52'),
(9, 4, '56'),
(10, 4, '97'),
(11, 4, '33,33'),
(12, 4, '26'),
(13, 4, '66,67'),
(11, 5, '6.00000'),
(13, 5, '9.00000'),
(11, 7, '1'),
(13, 7, '2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_course`);

--
-- Indices de la tabla `course_indicators`
--
ALTER TABLE `course_indicators`
  ADD PRIMARY KEY (`id_course`,`indicator_id`),
  ADD KEY `fk_Course_has_indicators_indicators1_idx` (`indicator_id`),
  ADD KEY `fk_Course_has_indicators_Course1_idx` (`id_course`);

--
-- Indices de la tabla `dtops`
--
ALTER TABLE `dtops`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `headquarters`
--
ALTER TABLE `headquarters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_headquarters_town` (`town_id`),
  ADD KEY `fk_headquarters_institution` (`institution_id`);

--
-- Indices de la tabla `headquarters_has_grade_has_group`
--
ALTER TABLE `headquarters_has_grade_has_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_all` (`headquarters_id`,`grade_id`,`group_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_grade_has_group_group1_idx` (`group_id`),
  ADD KEY `fk_grade_has_group_grade1_idx` (`grade_id`),
  ADD KEY `fk_grade_has_group_headquarters1_idx` (`headquarters_id`);

--
-- Indices de la tabla `headquarters_has_grade_has_group_has_simat`
--
ALTER TABLE `headquarters_has_grade_has_group_has_simat`
  ADD PRIMARY KEY (`headquarters_has_grade_has_group_id`,`simat_id`),
  ADD KEY `fk_headquarters_has_grade_has_group_has_simat_simat1_idx` (`simat_id`),
  ADD KEY `fk_headquarters_has_grade_has_group_has_simat_headquarter_idx` (`headquarters_has_grade_has_group_id`);

--
-- Indices de la tabla `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_indicators_ind_types` (`ind_type_id`),
  ADD KEY `fk_indicators_und` (`und_id`);

--
-- Indices de la tabla `ind_category`
--
ALTER TABLE `ind_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ind_types`
--
ALTER TABLE `ind_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`id_platform`);

--
-- Indices de la tabla `platform_indicators`
--
ALTER TABLE `platform_indicators`
  ADD PRIMARY KEY (`platform_id_platform`,`indicators_id`,`institutions_id`),
  ADD KEY `fk_platform_has_indicators_indicators1_idx` (`indicators_id`),
  ADD KEY `fk_platform_has_indicators_platform1_idx` (`platform_id_platform`),
  ADD KEY `fk_platform_indicators_institutions1_idx` (`institutions_id`);

--
-- Indices de la tabla `simats`
--
ALTER TABLE `simats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_town_dtop` (`dtop_id`);

--
-- Indices de la tabla `unds`
--
ALTER TABLE `unds`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_simat` (`simat_id`);

--
-- Indices de la tabla `user_indicators`
--
ALTER TABLE `user_indicators`
  ADD PRIMARY KEY (`indicator_id`,`user_id`),
  ADD KEY `fk_user_indicators_user` (`user_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `course_indicators`
--
ALTER TABLE `course_indicators`
  ADD CONSTRAINT `fk_Course_has_indicators_Course1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Course_has_indicators_indicators1` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `headquarters`
--
ALTER TABLE `headquarters`
  ADD CONSTRAINT `fk_headquarters_institution` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_headquarters_town` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `headquarters_has_grade_has_group`
--
ALTER TABLE `headquarters_has_grade_has_group`
  ADD CONSTRAINT `fk_grade_has_group_grade1` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grade_has_group_group1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grade_has_group_headquarters1` FOREIGN KEY (`headquarters_id`) REFERENCES `headquarters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `headquarters_has_grade_has_group_has_simat`
--
ALTER TABLE `headquarters_has_grade_has_group_has_simat`
  ADD CONSTRAINT `fk_headquarters_has_grade_has_group_has_simat_headquarters` FOREIGN KEY (`headquarters_has_grade_has_group_id`) REFERENCES `headquarters_has_grade_has_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_headquarters_has_grade_has_group_has_simat_simat` FOREIGN KEY (`simat_id`) REFERENCES `simats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `indicators`
--
ALTER TABLE `indicators`
  ADD CONSTRAINT `fk_indicators_ind_types` FOREIGN KEY (`ind_type_id`) REFERENCES `ind_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_indicators_und` FOREIGN KEY (`und_id`) REFERENCES `unds` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `platform_indicators`
--
ALTER TABLE `platform_indicators`
  ADD CONSTRAINT `fk_platform_has_indicators_indicators1` FOREIGN KEY (`indicators_id`) REFERENCES `indicators` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_platform_has_indicators_platform1` FOREIGN KEY (`platform_id_platform`) REFERENCES `platform` (`id_platform`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_platform_indicators_institutions1` FOREIGN KEY (`institutions_id`) REFERENCES `institutions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `towns`
--
ALTER TABLE `towns`
  ADD CONSTRAINT `fk_town_dtop` FOREIGN KEY (`dtop_id`) REFERENCES `dtops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_simat` FOREIGN KEY (`simat_id`) REFERENCES `simats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_indicators`
--
ALTER TABLE `user_indicators`
  ADD CONSTRAINT `fk_user_indicators_indicators` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_indicators_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
