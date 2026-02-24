-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2026 at 10:56 AM
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
-- Database: `cauvery`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_cus_id` (IN `new_cus_id` VARCHAR(150), IN `old_cus_id` VARCHAR(150))   BEGIN
	UPDATE `customer_register` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `request_creation` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `in_verification` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `customer_profile` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `verification_family_info` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `verification_property_info` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `verification_bank_info` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `verification_kyc_info` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `verification_cus_feedback` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `verification_documentation` SET `cus_id_doc` = new_cus_id WHERE `cus_id_doc` = old_cus_id;
    UPDATE `signed_doc` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `signed_doc_info` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `cheque_info` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `cheque_no_list` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `cheque_upd` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `gold_info` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `document_info` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `verification_loan_calculation` SET `cus_id_loan` = new_cus_id WHERE `cus_id_loan` = old_cus_id;
    UPDATE `in_approval` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `in_acknowledgement` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `acknowlegement_customer_profile` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `acknowlegement_documentation` SET `cus_id_doc` = new_cus_id WHERE `cus_id_doc` = old_cus_id;
    UPDATE `acknowlegement_loan_calculation` SET `cus_id_loan` = new_cus_id WHERE `cus_id_loan` = old_cus_id;
    UPDATE `in_issue` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `loan_issue` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `collection` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `collection_charges` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `closing_customer` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `closed_status` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `document_track` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `noc` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `loan_followup` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `confirmation_followup` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `new_promotion` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `commitment` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
    UPDATE `customer_status` SET `cus_id` = new_cus_id WHERE `cus_id` = old_cus_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_cus_full_details` (IN `reqid` INT(255) UNSIGNED)   BEGIN
    DELETE FROM `request_creation` WHERE req_id = reqid;
    DELETE FROM `request_category_info` WHERE req_ref_id = reqid;
    DELETE FROM `in_verification` WHERE req_id = reqid;
    DELETE FROM `customer_profile` WHERE req_id = reqid;
    DELETE FROM `verification_family_info` WHERE req_id = reqid;
    DELETE FROM `verification_property_info` WHERE req_id = reqid;
    DELETE FROM `verification_bank_info` WHERE req_id = reqid;
    DELETE FROM `verification_kyc_info` WHERE req_id = reqid;
    DELETE FROM `verification_documentation` WHERE req_id = reqid;
    DELETE FROM `signed_doc` WHERE req_id = reqid;
    DELETE FROM `signed_doc_info` WHERE req_id = reqid;
    DELETE FROM `cheque_info` WHERE req_id = reqid;
    DELETE FROM `cheque_no_list` WHERE req_id = reqid;
    DELETE FROM `cheque_upd` WHERE req_id = reqid;
    DELETE FROM `gold_info` WHERE req_id = reqid;
    DELETE FROM `document_info` WHERE req_id = reqid;
    DELETE FROM `verification_loan_calculation` WHERE req_id = reqid;
    DELETE FROM `verif_loan_cal_category` WHERE req_id = reqid;
    DELETE FROM `in_approval` WHERE req_id = reqid;
    DELETE FROM `in_acknowledgement` WHERE req_id = reqid;
    DELETE FROM `acknowlegement_customer_profile` WHERE req_id = reqid;
    DELETE FROM `acknowlegement_documentation` WHERE req_id = reqid;
    DELETE FROM `acknowlegement_loan_calculation` WHERE req_id = reqid;
    DELETE FROM `acknowledgement_loan_cal_category` WHERE req_id = reqid;
    DELETE FROM `in_issue` WHERE req_id = reqid;
    DELETE FROM `loan_issue` WHERE req_id = reqid;
    DELETE FROM `collection` WHERE req_id = reqid;
    DELETE FROM `collection_charges` WHERE req_id = reqid;
    DELETE FROM `penalty_charges` WHERE req_id = reqid;
    DELETE FROM `commitment` WHERE req_id = reqid;
    DELETE FROM `closing_customer` WHERE req_id = reqid;
    DELETE FROM `closed_status` WHERE req_id = reqid;
    DELETE FROM `document_track` WHERE req_id = reqid;
    DELETE FROM `noc` WHERE req_id = reqid;
    DELETE FROM `customer_status` WHERE req_id = reqid;
    DELETE FROM `document_track` WHERE req_id = reqid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_till_collection` (IN `reqid` VARCHAR(20))   BEGIN
    DELETE FROM `request_creation` WHERE req_id = reqid;
    DELETE FROM `request_category_info` WHERE req_ref_id = reqid;
    DELETE FROM `customer_register` WHERE req_ref_id = reqid;
    DELETE FROM `in_verification` WHERE req_id = reqid;
    DELETE FROM `verification_family_info` WHERE req_id = reqid;
    DELETE FROM `customer_profile` WHERE req_id = reqid;
    DELETE FROM `verification_documentation` WHERE req_id = reqid;
    DELETE FROM `verification_loan_calculation` WHERE req_id = reqid;
    DELETE FROM `verif_loan_cal_category` WHERE req_id = reqid;
    DELETE FROM `in_approval` WHERE req_id = reqid;
    DELETE FROM `in_acknowledgement` WHERE req_id = reqid;
    DELETE FROM `acknowlegement_customer_profile` WHERE req_id = reqid;
    DELETE FROM `acknowlegement_documentation` WHERE req_id = reqid;
    DELETE FROM `acknowlegement_loan_calculation` WHERE req_id = reqid;
    DELETE FROM `acknowledgement_loan_cal_category` WHERE req_id = reqid;
    DELETE FROM `in_issue` WHERE req_id = reqid;
    DELETE FROM `document_track` WHERE req_id = reqid;
    DELETE FROM `loan_issue` WHERE req_id = reqid;
    DELETE FROM `doc_replace_ids` WHERE req_id = req_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_area_loan_count_report` (IN `p_taluk` VARCHAR(255), IN `p_loan_cat` INT, IN `p_user_id` INT, IN `p_report_access` INT)   BEGIN
    DECLARE v_to_date DATE;
    DECLARE v_month_start DATE;

    SET v_to_date = CURDATE();
    SET v_month_start = DATE_FORMAT(v_to_date, '%Y-%m-01');
    SET SESSION group_concat_max_len = 1000000;

    
    SELECT GROUP_CONCAT(DISTINCT cs2.req_id) INTO @dueNilReqIds
    FROM customer_status cs2
    JOIN collection col ON cs2.req_id = col.req_id
    WHERE cs2.sub_status = 'Due Nil'
      AND col.coll_sub_status IN ('Current','Pending','OD')
      AND MONTH(col.coll_date) = MONTH(v_to_date)
      AND YEAR(col.coll_date) = YEAR(v_to_date);

    SET @dueNilReqIds = IFNULL(@dueNilReqIds, '0');

    
    SELECT GROUP_CONCAT(DISTINCT cs5.req_id) INTO @closedReqIds
    FROM customer_status cs5
    JOIN (
        SELECT c.req_id, MIN(c.coll_date) AS first_coll_date
        FROM collection c
        WHERE MONTH(c.coll_date) = MONTH(v_to_date)
          AND YEAR(c.coll_date) = YEAR(v_to_date)
        GROUP BY c.req_id
    ) first_col ON cs5.req_id = first_col.req_id
    JOIN collection col 
      ON col.req_id = first_col.req_id
     AND col.coll_date = first_col.first_coll_date
    WHERE cs5.sub_status = 'Closed'
      AND col.coll_sub_status IN ('Pending','OD','Current');

    SET @closedReqIds = IFNULL(@closedReqIds, '0');
    
    SELECT 
        a.area_id,
        a.area_name,
        a.taluk,
        GROUP_CONCAT(DISTINCT alm.line_name) AS line_names,
        GROUP_CONCAT(DISTINCT agm.group_name) AS group_names,
        GROUP_CONCAT(DISTINCT ii.loan_id) AS loan_ids,
        COUNT(DISTINCT ii.cus_id) AS customer_count,
        COUNT(DISTINCT ii.loan_id) AS loan_count,
        SUM(cs.sub_status = 'Current'
            OR FIND_IN_SET(ii.req_id, @dueNilReqIds)
            OR FIND_IN_SET(ii.req_id, @closedReqIds)) AS current,
        SUM(cs.sub_status = 'Pending') AS pending,
        SUM(cs.sub_status = 'OD') AS od,
        SUM(cs.sub_status = 'Error') AS error,
        SUM(cs.sub_status = 'Legal') AS legal
    FROM area_list_creation a
    LEFT JOIN area_line_mapping alm ON FIND_IN_SET(a.area_id, alm.area_id)
    LEFT JOIN area_group_mapping agm ON FIND_IN_SET(a.area_id, agm.area_id)
    LEFT JOIN acknowlegement_customer_profile acp ON  a.area_id = acp.area_confirm_area 
    LEFT JOIN in_issue ii ON acp.req_id = ii.req_id 
    LEFT JOIN customer_status cs ON  ii.req_id = cs.req_id 
    LEFT JOIN acknowlegement_loan_calculation alc ON ii.req_id = alc.req_id
    WHERE (p_taluk = 0 OR a.taluk = p_taluk)
    
      
      AND (p_loan_cat = 0 OR alc.loan_category = p_loan_cat)

      
      AND (cs.sub_status NOT IN ('Due Nil','Closed')
           OR FIND_IN_SET(ii.req_id, @dueNilReqIds)
           OR FIND_IN_SET(ii.req_id, @closedReqIds))

      
      AND (ii.updated_date IS NULL OR DATE(ii.updated_date) < v_month_start)

      
      
      
      AND (
            p_report_access = 2            
            OR alc.insert_login_id = p_user_id  
          )

    GROUP BY a.area_id  ;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cus_name` (IN `cusid` VARCHAR(20))  NO SQL SELECT CONCAT(first_name, ' ', last_name) AS customer_name from customer_register WHERE cus_id = cusid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_kyc_guarentor` (IN `reqid` VARCHAR(20))  NO SQL SELECT a.famname,a.relationship from verification_family_info a 
LEFT JOIN customer_profile b ON a.id = b.guarentor_name
where b.req_id = reqid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_loan_id` (IN `reqid` VARCHAR(20))   SELECT loan_id from in_issue WHERE req_id = reqid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_due_list_status_count` (IN `p_user_id` INT, IN `p_report_access` INT, IN `p_loan_cat` INT)   BEGIN
    DECLARE v_to_date DATE;
    DECLARE v_month_start DATE;

    SET v_to_date = CURDATE();
    SET v_month_start = DATE_FORMAT(v_to_date,'%Y-%m-01');

    SELECT
        a.area_id,
        a.area_name,
        a.taluk,

        COUNT(DISTINCT ii.cus_id) AS customer_count,
        COUNT(DISTINCT ii.loan_id) AS loan_count,

        
        SUM(
            CASE
                WHEN cs.cus_status = '15'
                     AND DATE(ii.updated_date) < v_to_date THEN 0

                WHEN cs.cus_status = '16'
                     AND DATE(ii.updated_date) < v_to_date THEN 0

                
                WHEN
                    (alc.tot_amt_cal - IFNULL(col.total_due_amt,0)) = 0
                    AND
                    (
                      (
                        (YEAR(v_to_date) - YEAR(alc.due_start_from)) * 12
                        + (MONTH(v_to_date) - MONTH(alc.due_start_from))
                      ) * alc.due_amt_cal
                      - IFNULL(col.total_due_amt,0)
                    ) = 0
                THEN 0

                
                WHEN
                    (
                      (
                        (
                          (YEAR(v_to_date) - YEAR(alc.due_start_from)) * 12
                          + (MONTH(v_to_date) - MONTH(alc.due_start_from))
                          + 1
                        ) * alc.due_amt_cal
                        - IFNULL(col.total_due_amt,0)
                      ) <= alc.due_amt_cal
                      AND
                      (
                        (
                          (YEAR(v_to_date) - YEAR(alc.due_start_from)) * 12
                          + (MONTH(v_to_date) - MONTH(alc.due_start_from))
                        ) * alc.due_amt_cal
                        - IFNULL(col.total_due_amt,0)
                      ) = 0
                      AND
                      (alc.tot_amt_cal - IFNULL(col.total_due_amt,0)) > 0
                      AND
                      (
                        (alc.due_method_scheme = '1' OR alc.due_method_calc = 'Monthly')
                            AND DATE_FORMAT(alc.maturity_month,'%Y-%m') >= DATE_FORMAT(v_to_date,'%Y-%m')
                        OR
                        (alc.due_method_scheme != '1' AND alc.due_method_calc != 'Monthly')
                            AND alc.maturity_month >= v_to_date
                      )
                    )
                THEN 1
                ELSE 0
            END
        ) AS current,

        
        SUM(
            CASE
                WHEN
                    (
                      (
                        (
                          (YEAR(v_to_date) - YEAR(alc.due_start_from)) * 12
                          + (MONTH(v_to_date) - MONTH(alc.due_start_from))
                        ) * alc.due_amt_cal
                        - IFNULL(col.total_due_amt,0)
                      ) > 0
                      AND
                      (
                        (alc.due_method_scheme = '1' OR alc.due_method_calc = 'Monthly')
                            AND DATE_FORMAT(alc.maturity_month,'%Y-%m') >= DATE_FORMAT(v_to_date,'%Y-%m')
                        OR
                        (alc.due_method_scheme != '1' AND alc.due_method_calc != 'Monthly')
                            AND alc.maturity_month > v_to_date
                      )
                    )
                THEN 1
                ELSE 0
            END
        ) AS pending,

        
        SUM(
            CASE
                WHEN
                    (alc.tot_amt_cal - IFNULL(col.total_due_amt,0)) > 0
                    AND
                    (
                        (alc.due_method_scheme = '1' OR alc.due_method_calc = 'Monthly')
                            AND DATE_FORMAT(alc.maturity_month,'%Y-%m') < DATE_FORMAT(v_to_date,'%Y-%m')
                        OR
                        (alc.due_method_scheme != '1' AND alc.due_method_calc != 'Monthly')
                            AND alc.maturity_month < v_to_date
                    )
                THEN 1
                ELSE 0
            END
        ) AS od,

        
        SUM(
            CASE
                WHEN cs.cus_status = '15'
                     AND DATE(ii.updated_date) < v_to_date
                THEN 1 ELSE 0
            END
        ) AS error,

        
        SUM(
            CASE
                WHEN cs.cus_status = '16'
                     AND DATE(ii.updated_date) < v_to_date
                THEN 1 ELSE 0
            END
        ) AS legal

    FROM area_list_creation a

    LEFT JOIN acknowlegement_customer_profile acp
           ON a.area_id = acp.area_confirm_area

    LEFT JOIN in_issue ii
           ON acp.req_id = ii.req_id

    LEFT JOIN customer_status cs
           ON ii.req_id = cs.req_id

    LEFT JOIN acknowlegement_loan_calculation alc
           ON ii.req_id = alc.req_id

    
    LEFT JOIN (
        SELECT
            req_id,
            SUM(due_amt_track) AS total_due_amt
        FROM collection
        WHERE DATE(coll_date) < CURDATE()
        GROUP BY req_id
    ) col ON col.req_id = ii.req_id

    WHERE alc.balance_amount = '0'
      AND (p_loan_cat = 0 OR alc.loan_category = p_loan_cat)
      AND (ii.updated_date IS NULL OR DATE(ii.updated_date) < v_month_start)
      AND (
            p_report_access = 2
            OR alc.insert_login_id = p_user_id
          )

    GROUP BY a.area_id;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `acknowledgement_loan_cal_category`
--

CREATE TABLE `acknowledgement_loan_cal_category` (
  `cat_id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `loan_cal_id` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acknowlegement_customer_profile`
--

CREATE TABLE `acknowlegement_customer_profile` (
  `id` int(11) NOT NULL,
  `req_id` varchar(50) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `mobile1` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `cus_pic` varchar(255) DEFAULT NULL,
  `guarentor_name` varchar(255) DEFAULT NULL,
  `guarentor_relation` varchar(100) DEFAULT NULL,
  `guarentor_photo` varchar(255) DEFAULT NULL,
  `cus_type` varchar(50) DEFAULT NULL,
  `cus_exist_type` varchar(50) DEFAULT NULL,
  `residential_type` varchar(50) DEFAULT NULL,
  `residential_details` varchar(255) DEFAULT NULL,
  `residential_address` varchar(255) DEFAULT NULL,
  `residential_native_address` varchar(255) DEFAULT NULL,
  `occupation_type` varchar(50) DEFAULT NULL,
  `occupation_details` varchar(255) DEFAULT NULL,
  `occupation_income` varchar(255) DEFAULT NULL,
  `occupation_address` varchar(255) DEFAULT NULL,
  `dow` varchar(255) DEFAULT NULL,
  `abt_occ` varchar(255) DEFAULT NULL,
  `area_confirm_type` varchar(50) DEFAULT NULL,
  `area_confirm_state` varchar(100) DEFAULT NULL,
  `area_confirm_district` varchar(100) DEFAULT NULL,
  `area_confirm_taluk` varchar(100) DEFAULT NULL,
  `area_confirm_area` varchar(255) DEFAULT NULL,
  `latlong` varchar(255) DEFAULT NULL,
  `area_group` varchar(255) DEFAULT NULL,
  `area_line` varchar(255) DEFAULT NULL,
  `communication` varchar(50) DEFAULT NULL,
  `com_audio` varchar(255) DEFAULT NULL,
  `verification_person` varchar(255) DEFAULT NULL,
  `verification_location` varchar(255) DEFAULT NULL,
  `cus_status` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(100) DEFAULT NULL,
  `update_login_id` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acknowlegement_documentation`
--

CREATE TABLE `acknowlegement_documentation` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id_doc` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `cus_profile_id` varchar(255) DEFAULT NULL,
  `doc_id` varchar(255) DEFAULT NULL,
  `mortgage_process` varchar(100) DEFAULT NULL,
  `mortgage_process_noc` varchar(10) NOT NULL DEFAULT '0',
  `mort_noc_date` varchar(255) DEFAULT NULL,
  `mort_noc_person` varchar(255) DEFAULT NULL,
  `mort_noc_name` varchar(255) DEFAULT NULL,
  `Propertyholder_type` varchar(100) DEFAULT NULL,
  `Propertyholder_name` varchar(255) DEFAULT NULL,
  `Propertyholder_relationship_name` varchar(100) DEFAULT NULL,
  `doc_property_relation` varchar(100) DEFAULT NULL,
  `doc_property_type` varchar(255) DEFAULT NULL,
  `doc_property_measurement` varchar(255) DEFAULT NULL,
  `doc_property_location` varchar(255) DEFAULT NULL,
  `doc_property_value` varchar(255) DEFAULT NULL,
  `mortgage_name` varchar(255) DEFAULT NULL,
  `mortgage_dsgn` varchar(255) DEFAULT NULL,
  `mortgage_nuumber` varchar(255) DEFAULT NULL,
  `reg_office` varchar(255) DEFAULT NULL,
  `mortgage_value` varchar(255) DEFAULT NULL,
  `mortgage_document` varchar(255) DEFAULT NULL,
  `mortgage_document_noc` varchar(10) NOT NULL DEFAULT '0',
  `mort_doc_noc_date` varchar(255) DEFAULT NULL,
  `mort_doc_noc_person` varchar(255) DEFAULT NULL,
  `mort_doc_noc_name` varchar(255) DEFAULT NULL,
  `mortgage_document_used` varchar(10) NOT NULL DEFAULT '0',
  `mortgage_document_upd` varchar(255) DEFAULT NULL,
  `mortgage_document_pending` varchar(150) DEFAULT NULL,
  `endorsement_process` varchar(50) DEFAULT NULL,
  `endorsement_process_noc` varchar(10) NOT NULL DEFAULT '0',
  `endor_noc_date` varchar(255) DEFAULT NULL,
  `endor_noc_person` varchar(255) DEFAULT NULL,
  `endor_noc_name` varchar(255) DEFAULT NULL,
  `owner_type` varchar(100) DEFAULT NULL,
  `owner_name` varchar(200) DEFAULT NULL,
  `ownername_relationship_name` varchar(100) DEFAULT NULL,
  `en_relation` varchar(100) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_process` varchar(50) DEFAULT NULL,
  `en_Company` varchar(200) DEFAULT NULL,
  `en_Model` varchar(200) DEFAULT NULL,
  `vehicle_reg_no` varchar(150) DEFAULT NULL,
  `endorsement_name` varchar(255) DEFAULT NULL,
  `en_RC` varchar(50) DEFAULT NULL,
  `en_RC_noc` varchar(10) NOT NULL DEFAULT '0',
  `en_rc_noc_date` varchar(255) DEFAULT NULL,
  `en_rc_noc_person` varchar(255) DEFAULT NULL,
  `en_rc_noc_name` varchar(255) DEFAULT NULL,
  `en_RC_used` varchar(10) NOT NULL DEFAULT '0',
  `Rc_document_upd` varchar(255) DEFAULT NULL,
  `Rc_document_pending` varchar(150) DEFAULT NULL,
  `en_Key` varchar(50) DEFAULT NULL,
  `en_Key_noc` varchar(10) NOT NULL DEFAULT '0',
  `en_key_noc_date` varchar(255) DEFAULT NULL,
  `en_key_noc_person` varchar(255) DEFAULT NULL,
  `en_key_noc_name` varchar(255) DEFAULT NULL,
  `en_Key_used` varchar(10) NOT NULL DEFAULT '0',
  `gold_info` varchar(50) DEFAULT NULL,
  `gold_sts` varchar(50) DEFAULT NULL,
  `gold_type` varchar(255) DEFAULT NULL,
  `Purity` varchar(255) DEFAULT NULL,
  `gold_Count` varchar(255) DEFAULT NULL,
  `gold_Weight` varchar(255) DEFAULT NULL,
  `gold_Value` varchar(255) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `document_details` varchar(255) DEFAULT NULL,
  `document_type` varchar(50) DEFAULT NULL,
  `doc_info_upload` varchar(255) DEFAULT NULL,
  `doc_info_upload_noc` varchar(10) NOT NULL DEFAULT '0',
  `doc_info_upload_used` varchar(10) NOT NULL DEFAULT '0',
  `document_holder` varchar(50) DEFAULT NULL,
  `docholder_name` varchar(255) DEFAULT NULL,
  `docholder_relationship_name` varchar(50) DEFAULT NULL,
  `doc_relation` varchar(50) DEFAULT NULL,
  `doc_remarks` varchar(100) DEFAULT NULL,
  `doc_sts` varchar(11) DEFAULT NULL,
  `update_remarks` varchar(100) DEFAULT NULL,
  `noc_replace_status` int(11) NOT NULL DEFAULT 1 COMMENT '0-YES,1-NO',
  `noc_replace_doc_id` varchar(150) DEFAULT NULL,
  `cus_status` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `submitted` varchar(10) DEFAULT NULL,
  `insert_login_id` varchar(50) DEFAULT NULL,
  `update_login_id` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acknowlegement_loan_calculation`
--

CREATE TABLE `acknowlegement_loan_calculation` (
  `loan_cal_id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id_loan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `cus_data_loan` varchar(255) DEFAULT NULL,
  `mobile_loan` varchar(255) DEFAULT NULL,
  `pic_loan` varchar(255) DEFAULT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `tot_value` varchar(255) DEFAULT NULL,
  `ad_amt` varchar(255) DEFAULT NULL,
  `loan_amt` varchar(255) DEFAULT NULL,
  `profit_type` varchar(255) DEFAULT NULL,
  `due_method_calc` varchar(255) DEFAULT NULL,
  `due_type` varchar(255) DEFAULT NULL,
  `profit_method` varchar(255) DEFAULT NULL,
  `calc_method` varchar(255) DEFAULT NULL,
  `due_method_scheme` varchar(255) DEFAULT NULL,
  `profit_method_scheme` varchar(50) DEFAULT NULL,
  `day_scheme` varchar(255) DEFAULT NULL,
  `scheme_name` varchar(255) DEFAULT NULL,
  `int_rate` varchar(255) DEFAULT NULL,
  `due_period` varchar(255) DEFAULT NULL,
  `doc_charge` varchar(255) DEFAULT NULL,
  `proc_fee` varchar(255) DEFAULT NULL,
  `loan_amt_cal` varchar(255) DEFAULT NULL,
  `principal_amt_cal` varchar(255) DEFAULT NULL,
  `int_amt_cal` varchar(255) DEFAULT NULL,
  `tot_amt_cal` varchar(255) DEFAULT NULL,
  `due_amt_cal` varchar(255) DEFAULT NULL,
  `doc_charge_cal` varchar(255) DEFAULT NULL,
  `proc_fee_cal` varchar(255) DEFAULT NULL,
  `net_cash_cal` varchar(255) DEFAULT NULL,
  `due_start_from` varchar(255) DEFAULT NULL,
  `maturity_month` varchar(255) DEFAULT NULL,
  `collection_method` varchar(255) DEFAULT NULL,
  `communication` varchar(50) DEFAULT NULL,
  `com_audio` varchar(255) DEFAULT NULL,
  `verification_person` varchar(255) DEFAULT NULL,
  `verification_location` varchar(255) DEFAULT NULL,
  `verify_remark` varchar(255) DEFAULT NULL,
  `cus_status` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT current_timestamp(),
  `update_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_communication_details`
--

CREATE TABLE `agent_communication_details` (
  `comm_id` int(11) NOT NULL,
  `agent_reff_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_creation`
--

CREATE TABLE `agent_creation` (
  `ag_id` int(11) NOT NULL,
  `ag_code` varchar(255) DEFAULT NULL,
  `ag_name` varchar(255) DEFAULT NULL,
  `ag_group_id` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `branch_id` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `scheme` varchar(255) DEFAULT NULL,
  `loan_payment` varchar(255) DEFAULT NULL,
  `responsible` varchar(255) DEFAULT NULL,
  `collection_point` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_branch_name` varchar(255) DEFAULT NULL,
  `acc_no` varchar(255) DEFAULT NULL,
  `ifsc` varchar(255) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `more_info` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_group_creation`
--

CREATE TABLE `agent_group_creation` (
  `agent_group_id` int(11) NOT NULL,
  `agent_group_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_creation`
--

CREATE TABLE `area_creation` (
  `area_creation_id` int(11) NOT NULL,
  `area_name_id` int(11) NOT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `enable` varchar(255) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT 0,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(50) DEFAULT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `updated_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_duefollowup_mapping`
--

CREATE TABLE `area_duefollowup_mapping` (
  `map_id` int(11) NOT NULL,
  `duefollowup_name` varchar(150) DEFAULT NULL,
  `cus_count` varchar(50) NOT NULL,
  `loan_count` varchar(50) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `branch_id` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` varchar(11) DEFAULT NULL,
  `delete_login_id` varchar(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_duefollowup_mapping_area`
--

CREATE TABLE `area_duefollowup_mapping_area` (
  `id` int(11) NOT NULL,
  `duefollowup_map_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_group_mapping`
--

CREATE TABLE `area_group_mapping` (
  `map_id` int(11) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `branch_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `cus_count` varchar(50) NOT NULL,
  `loan_count` varchar(50) NOT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_group_mapping_area`
--

CREATE TABLE `area_group_mapping_area` (
  `id` int(11) NOT NULL,
  `group_map_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_line_mapping`
--

CREATE TABLE `area_line_mapping` (
  `map_id` int(11) NOT NULL,
  `line_name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `branch_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `cus_count` varchar(50) NOT NULL,
  `loan_count` varchar(50) NOT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_line_mapping_area`
--

CREATE TABLE `area_line_mapping_area` (
  `id` int(11) NOT NULL,
  `line_map_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_list_creation`
--

CREATE TABLE `area_list_creation` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `area_enable` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_creation`
--

CREATE TABLE `bank_creation` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) NOT NULL,
  `acc_no` varchar(255) DEFAULT NULL,
  `ifsc` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `gpay` varchar(255) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `under_branch` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_stmt`
--

CREATE TABLE `bank_stmt` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_id` varchar(255) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL,
  `narration` varchar(255) NOT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `debit` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `transaction_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `clr_status` varchar(10) NOT NULL DEFAULT '0' COMMENT '0 - unclear,1-cleared',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_creation`
--

CREATE TABLE `branch_creation` (
  `branch_id` int(11) NOT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `address1` text DEFAULT NULL,
  `whatsapp_number` text DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `landline_number` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `delete_login_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_tally`
--

CREATE TABLE `cash_tally` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `op_hand` varchar(255) DEFAULT NULL,
  `op_date` varchar(10) NOT NULL,
  `op_bank` varchar(255) DEFAULT NULL,
  `op_agent` varchar(255) DEFAULT NULL,
  `opening_bal` varchar(255) DEFAULT NULL,
  `cl_date` date NOT NULL,
  `cl_hand` varchar(255) DEFAULT NULL,
  `cl_bank` varchar(255) DEFAULT NULL,
  `bank_untrkd` varchar(255) DEFAULT NULL,
  `cl_agent` varchar(255) DEFAULT NULL,
  `closing_bal` varchar(255) DEFAULT NULL,
  `uncleared_credit` varchar(250) DEFAULT NULL,
  `uncleared_debit` varchar(250) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_tally_modes`
--

CREATE TABLE `cash_tally_modes` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `modes` varchar(255) DEFAULT NULL,
  `admin_access` varchar(10) NOT NULL DEFAULT '1',
  `handcredit` varchar(10) NOT NULL DEFAULT '1',
  `bankcredit` varchar(10) NOT NULL DEFAULT '1',
  `handdebit` varchar(10) NOT NULL DEFAULT '1',
  `bankdebit` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cash_tally_modes`
--

INSERT INTO `cash_tally_modes` (`id`, `modes`, `admin_access`, `handcredit`, `bankcredit`, `handdebit`, `bankdebit`) VALUES
(1, 'Collection', '1', '0', '1', '1', '1'),
(2, 'Bank Withdrawal', '1', '0', '1', '1', '1'),
(3, 'Other Income', '1', '0', '0', '1', '1'),
(4, 'Exchange', '1', '0', '0', '0', '0'),
(5, 'Cash Deposit', '1', '1', '0', '1', '1'),
(6, 'Bank Deposit', '1', '1', '1', '0', '1'),
(7, 'Cash Withdrawal', '1', '1', '1', '1', '0'),
(8, 'Agent', '1', '0', '0', '0', '0'),
(9, 'Investment', '0', '0', '0', '0', '0'),
(10, 'Deposit', '0', '0', '0', '0', '0'),
(11, 'EL', '0', '0', '0', '0', '0'),
(12, 'Excess Fund', '0', '1', '1', '1', '0'),
(13, 'Issued', '1', '1', '1', '0', '1'),
(14, 'Expenses', '1', '1', '1', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cheque_info`
--

CREATE TABLE `cheque_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` varchar(50) DEFAULT NULL,
  `cus_profile_id` varchar(50) DEFAULT NULL,
  `holder_type` varchar(255) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `holder_relationship_name` varchar(255) DEFAULT NULL,
  `cheque_relation` varchar(255) DEFAULT NULL,
  `chequebank_name` varchar(255) DEFAULT NULL,
  `cheque_count` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cheque_no_list`
--

CREATE TABLE `cheque_no_list` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cheque_table_id` varchar(255) DEFAULT NULL,
  `cheque_holder_type` varchar(255) DEFAULT NULL,
  `cheque_holder_name` varchar(255) DEFAULT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `used_status` varchar(255) NOT NULL DEFAULT '0',
  `noc_given` varchar(10) NOT NULL DEFAULT '0',
  `noc_date` varchar(255) DEFAULT NULL,
  `noc_person` varchar(255) DEFAULT NULL,
  `noc_name` varchar(255) DEFAULT NULL,
  `temp_sts` varchar(10) NOT NULL DEFAULT '0',
  `temp_date` date DEFAULT NULL,
  `temp_person` varchar(255) DEFAULT NULL,
  `temp_purpose` varchar(255) DEFAULT NULL,
  `temp_remarks` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(100) DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cheque_upd`
--

CREATE TABLE `cheque_upd` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cheque_table_id` varchar(255) DEFAULT NULL,
  `upload_cheque_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `closed_status`
--

CREATE TABLE `closed_status` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `closed_sts` varchar(50) DEFAULT NULL,
  `consider_level` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `cus_sts` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(100) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `closing_customer`
--

CREATE TABLE `closing_customer` (
  `id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `cus_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `closing_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `coll_id` int(11) NOT NULL COMMENT 'Primary Key',
  `coll_code` varchar(255) DEFAULT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `line` varchar(255) DEFAULT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `coll_status` varchar(255) DEFAULT NULL,
  `coll_sub_status` varchar(255) DEFAULT NULL,
  `tot_amt` varchar(255) DEFAULT NULL,
  `paid_amt` varchar(255) DEFAULT NULL,
  `bal_amt` varchar(255) DEFAULT NULL,
  `due_amt` varchar(255) DEFAULT NULL,
  `pending_amt` varchar(255) DEFAULT NULL,
  `payable_amt` varchar(255) DEFAULT NULL,
  `penalty` varchar(255) DEFAULT NULL,
  `coll_charge` varchar(255) DEFAULT NULL,
  `coll_mode` varchar(255) DEFAULT NULL,
  `bank_id` varchar(10) NOT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `trans_date` date DEFAULT NULL,
  `coll_location` varchar(255) DEFAULT NULL,
  `coll_date` datetime DEFAULT current_timestamp(),
  `due_amt_track` varchar(255) NOT NULL DEFAULT '0',
  `princ_amt_track` varchar(255) DEFAULT '0',
  `int_amt_track` varchar(255) DEFAULT '0',
  `penalty_track` varchar(255) NOT NULL DEFAULT '0',
  `coll_charge_track` varchar(255) NOT NULL DEFAULT '0',
  `total_paid_track` varchar(255) NOT NULL DEFAULT '0',
  `pre_close_waiver` varchar(255) NOT NULL DEFAULT '0',
  `interest_waiver` varchar(50) NOT NULL DEFAULT '0',
  `principal_waiver` varchar(50) NOT NULL DEFAULT '0',
  `penalty_waiver` varchar(255) NOT NULL DEFAULT '0',
  `coll_charge_waiver` varchar(255) NOT NULL DEFAULT '0',
  `total_waiver` varchar(255) NOT NULL DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL COMMENT 'Create Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_charges`
--

CREATE TABLE `collection_charges` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `coll_date` varchar(255) DEFAULT NULL,
  `coll_purpose` varchar(255) DEFAULT NULL,
  `coll_charge` varchar(255) NOT NULL DEFAULT '0',
  `paid_date` varchar(255) DEFAULT NULL,
  `paid_amnt` varchar(255) DEFAULT '0',
  `waiver_amnt` varchar(255) DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL COMMENT 'Create Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commitment`
--

CREATE TABLE `commitment` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) NOT NULL,
  `ftype` varchar(10) DEFAULT NULL,
  `fstatus` varchar(55) DEFAULT NULL,
  `person_type` varchar(255) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `comm_date` date DEFAULT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `comm_err` varchar(10) NOT NULL,
  `insert_login_id` varchar(55) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_creation`
--

CREATE TABLE `company_creation` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `mailid` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `landline` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `insert_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `concern_creation`
--

CREATE TABLE `concern_creation` (
  `id` int(11) NOT NULL,
  `raising_for` varchar(50) DEFAULT NULL,
  `self_name` varchar(255) DEFAULT NULL,
  `self_code` varchar(150) DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_dept_name` varchar(255) DEFAULT NULL,
  `staff_team_name` varchar(255) DEFAULT NULL,
  `ag_name` varchar(255) DEFAULT NULL,
  `ag_grp` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `cus_area` varchar(255) DEFAULT NULL,
  `cus_group` varchar(255) DEFAULT NULL,
  `cus_line` varchar(255) DEFAULT NULL,
  `com_date` varchar(50) DEFAULT NULL,
  `com_code` varchar(50) DEFAULT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `concern_to` varchar(50) DEFAULT NULL,
  `to_dept_name` varchar(255) DEFAULT NULL,
  `to_team_name` varchar(255) DEFAULT NULL,
  `concern_against` varchar(11) DEFAULT NULL,
  `com_sub` varchar(50) DEFAULT NULL,
  `com_remark` mediumtext DEFAULT NULL,
  `com_priority` varchar(10) DEFAULT NULL,
  `role_type` int(11) NOT NULL,
  `staff_assign_to` varchar(50) DEFAULT NULL,
  `pass_role` varchar(11) DEFAULT NULL,
  `pass_to` varchar(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `solution_date` varchar(50) DEFAULT NULL,
  `communication` varchar(50) DEFAULT NULL,
  `uploads` varchar(255) DEFAULT NULL,
  `location` varchar(11) DEFAULT NULL,
  `sol_participants` varchar(100) DEFAULT NULL,
  `solution_remark` varchar(255) DEFAULT NULL,
  `feedback_date` varchar(10) DEFAULT NULL,
  `feedback_rating` varchar(10) DEFAULT NULL,
  `insert_user_id` varchar(50) DEFAULT NULL,
  `update_user_id` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `concern_subject`
--

CREATE TABLE `concern_subject` (
  `concern_sub_id` int(11) NOT NULL,
  `concern_subject` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `insert_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_followup`
--

CREATE TABLE `confirmation_followup` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) NOT NULL,
  `cus_id` varchar(255) NOT NULL,
  `person_type` varchar(255) NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `relationship` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `upload` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `sub_status` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `remove_status` varchar(10) NOT NULL DEFAULT '0',
  `insert_login_id` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_bank_collection`
--

CREATE TABLE `ct_bank_collection` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_id` varchar(255) DEFAULT NULL,
  `credited_amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_bag`
--

CREATE TABLE `ct_cr_bag` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `ag_id` varchar(10) NOT NULL,
  `bank_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_bank_withdraw`
--

CREATE TABLE `ct_cr_bank_withdraw` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `db_ref_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `from_bank_id` varchar(20) DEFAULT NULL,
  `cheque_no` varchar(35) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_dae` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_bdeposit`
--

CREATE TABLE `ct_cr_bdeposit` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_bel`
--

CREATE TABLE `ct_cr_bel` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_bexchange`
--

CREATE TABLE `ct_cr_bexchange` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `db_ref_id` varchar(255) DEFAULT NULL,
  `from_bank_id` varchar(10) NOT NULL,
  `to_bank_id` varchar(10) NOT NULL,
  `from_user_id` varchar(10) NOT NULL,
  `to_user_id` varchar(10) NOT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) NOT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_binvest`
--

CREATE TABLE `ct_cr_binvest` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_boti`
--

CREATE TABLE `ct_cr_boti` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `ref_code` varchar(255) DEFAULT NULL,
  `to_bank_id` varchar(10) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_cash_deposit`
--

CREATE TABLE `ct_cr_cash_deposit` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `db_ref_id` varchar(255) DEFAULT NULL,
  `to_bank_id` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(10) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_hag`
--

CREATE TABLE `ct_cr_hag` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `ag_id` varchar(10) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_hdeposit`
--

CREATE TABLE `ct_cr_hdeposit` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_hel`
--

CREATE TABLE `ct_cr_hel` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_hexchange`
--

CREATE TABLE `ct_cr_hexchange` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `db_ref_id` varchar(255) DEFAULT NULL,
  `to_user_id` varchar(10) NOT NULL,
  `from_user_id` varchar(10) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_hinvest`
--

CREATE TABLE `ct_cr_hinvest` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cr_hoti`
--

CREATE TABLE `ct_cr_hoti` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `category` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_bag`
--

CREATE TABLE `ct_db_bag` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `ag_id` varchar(10) NOT NULL,
  `bank_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_bank_deposit`
--

CREATE TABLE `ct_db_bank_deposit` (
  `id` int(11) NOT NULL,
  `to_bank_id` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `received` int(11) NOT NULL DEFAULT 1,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_bdeposit`
--

CREATE TABLE `ct_db_bdeposit` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_bel`
--

CREATE TABLE `ct_db_bel` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_bexchange`
--

CREATE TABLE `ct_db_bexchange` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `ref_code` varchar(255) DEFAULT NULL,
  `from_acc_id` varchar(255) DEFAULT NULL,
  `to_bank_id` varchar(255) DEFAULT NULL,
  `to_user_id` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `received` int(11) NOT NULL DEFAULT 1,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_bexpense`
--

CREATE TABLE `ct_db_bexpense` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `username` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `bank_id` varchar(10) NOT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `part` varchar(255) DEFAULT NULL,
  `vou_id` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) NOT NULL,
  `rec_per` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `upload` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_binvest`
--

CREATE TABLE `ct_db_binvest` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `bank_id` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_bissued`
--

CREATE TABLE `ct_db_bissued` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `ref_code` varchar(255) DEFAULT NULL,
  `li_id` varchar(10) NOT NULL,
  `li_user_id` varchar(255) DEFAULT NULL,
  `li_bank_id` varchar(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `netcash` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_cash_withdraw`
--

CREATE TABLE `ct_db_cash_withdraw` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `ref_code` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `from_bank_id` varchar(255) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `received` varchar(10) NOT NULL DEFAULT '1',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_exf`
--

CREATE TABLE `ct_db_exf` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `username` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  `bank_id` varchar(10) NOT NULL,
  `ucl_ref_code` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `ucl_trans_id` varchar(255) DEFAULT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_hag`
--

CREATE TABLE `ct_db_hag` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `ag_id` varchar(10) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_hdeposit`
--

CREATE TABLE `ct_db_hdeposit` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_hel`
--

CREATE TABLE `ct_db_hel` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_hexchange`
--

CREATE TABLE `ct_db_hexchange` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `to_user_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `received` int(11) NOT NULL DEFAULT 1,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_hexpense`
--

CREATE TABLE `ct_db_hexpense` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `username` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `part` varchar(255) DEFAULT NULL,
  `vou_id` varchar(255) DEFAULT NULL,
  `rec_per` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `upload` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_hinvest`
--

CREATE TABLE `ct_db_hinvest` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `name_id` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_db_hissued`
--

CREATE TABLE `ct_db_hissued` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `li_user_id` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `netcash` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(10) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_hand_collection`
--

CREATE TABLE `ct_hand_collection` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `user_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `branch_id` varchar(255) DEFAULT NULL,
  `line_id` varchar(255) DEFAULT NULL,
  `pre_bal` varchar(255) DEFAULT NULL,
  `coll_amt` varchar(255) DEFAULT NULL,
  `tot_amt` varchar(255) DEFAULT NULL,
  `rec_amt` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile`
--

CREATE TABLE `customer_profile` (
  `id` int(11) NOT NULL,
  `req_id` varchar(50) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `mobile1` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `cus_pic` varchar(255) DEFAULT NULL,
  `guarentor_name` varchar(255) DEFAULT NULL,
  `guarentor_relation` varchar(100) DEFAULT NULL,
  `guarentor_photo` varchar(255) DEFAULT NULL,
  `cus_type` varchar(50) DEFAULT NULL,
  `cus_exist_type` varchar(50) DEFAULT NULL,
  `residential_type` varchar(50) DEFAULT NULL,
  `residential_details` varchar(255) DEFAULT NULL,
  `residential_address` varchar(255) DEFAULT NULL,
  `residential_native_address` varchar(255) DEFAULT NULL,
  `occupation_type` varchar(50) DEFAULT NULL,
  `occupation_details` varchar(255) DEFAULT NULL,
  `occupation_income` varchar(255) DEFAULT NULL,
  `occupation_address` varchar(255) DEFAULT NULL,
  `dow` varchar(255) DEFAULT NULL,
  `abt_occ` varchar(255) DEFAULT NULL,
  `area_confirm_type` varchar(50) DEFAULT NULL,
  `area_confirm_state` varchar(100) DEFAULT NULL,
  `area_confirm_district` varchar(100) DEFAULT NULL,
  `area_confirm_taluk` varchar(100) DEFAULT NULL,
  `area_confirm_area` varchar(255) DEFAULT NULL,
  `latlong` varchar(255) DEFAULT NULL,
  `area_group` varchar(255) DEFAULT NULL,
  `area_line` varchar(255) DEFAULT NULL,
  `communication` varchar(50) DEFAULT NULL,
  `com_audio` varchar(255) DEFAULT NULL,
  `verification_person` varchar(255) DEFAULT NULL,
  `verification_location` varchar(255) DEFAULT NULL,
  `cus_status` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(100) DEFAULT NULL,
  `update_login_id` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_register`
--

CREATE TABLE `customer_register` (
  `cus_reg_id` int(11) NOT NULL COMMENT 'Primary Key',
  `autogen_cus_id` varchar(255) NOT NULL,
  `req_ref_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile1` varchar(255) DEFAULT NULL,
  `mobile2` varchar(255) DEFAULT NULL,
  `mobile_whatsapp` varchar(100) DEFAULT NULL,
  `whatsapp_no` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `marital` varchar(255) DEFAULT NULL,
  `spouse` varchar(255) DEFAULT NULL,
  `occupation_type` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `how_to_know` varchar(100) DEFAULT NULL,
  `loan_count` varchar(50) DEFAULT NULL,
  `first_loan_date` varchar(255) DEFAULT NULL,
  `travel_with_company` varchar(255) DEFAULT NULL,
  `monthly_income` varchar(255) DEFAULT NULL,
  `other_income` varchar(255) DEFAULT NULL,
  `support_income` varchar(255) DEFAULT NULL,
  `commitment` varchar(255) DEFAULT NULL,
  `monthly_due_capacity` varchar(255) DEFAULT NULL,
  `loan_limit` varchar(255) DEFAULT NULL,
  `about_customer` varchar(255) DEFAULT NULL,
  `residential_type` varchar(10) DEFAULT NULL,
  `residential_details` varchar(150) DEFAULT NULL,
  `residential_address` varchar(255) DEFAULT NULL,
  `residential_native_address` varchar(255) DEFAULT NULL,
  `occupation_info_occ_type` varchar(10) DEFAULT NULL,
  `occupation_details` varchar(255) DEFAULT NULL,
  `occupation_income` varchar(255) DEFAULT NULL,
  `occupation_address` varchar(255) DEFAULT NULL,
  `dow` varchar(255) DEFAULT NULL,
  `abt_occ` varchar(255) DEFAULT NULL,
  `area_confirm_type` varchar(50) DEFAULT NULL,
  `area_confirm_state` varchar(50) DEFAULT NULL,
  `area_confirm_district` varchar(50) DEFAULT NULL,
  `area_confirm_taluk` varchar(50) DEFAULT NULL,
  `area_confirm_area` varchar(50) DEFAULT NULL,
  `latlong` varchar(255) DEFAULT NULL,
  `area_group` varchar(50) DEFAULT NULL,
  `area_line` varchar(50) DEFAULT NULL,
  `cus_status` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_status`
--

CREATE TABLE `customer_status` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) NOT NULL,
  `cus_id` varchar(150) NOT NULL,
  `sub_status` varchar(50) NOT NULL,
  `payable_amnt` varchar(255) NOT NULL,
  `bal_amnt` varchar(255) NOT NULL,
  `last_paid_date` int(11) DEFAULT 0,
  `current_month_paid` int(11) DEFAULT 0,
  `insert_login_id` varchar(150) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cus_feedback_name`
--

CREATE TABLE `cus_feedback_name` (
  `id` int(11) NOT NULL,
  `feedback_name` varchar(200) DEFAULT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `updated_login_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cus_old_data`
--

CREATE TABLE `cus_old_data` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `cus_id` varchar(50) DEFAULT NULL,
  `cus_name` varchar(200) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `loan_cat` varchar(100) DEFAULT NULL,
  `loan_amt` varchar(100) DEFAULT NULL,
  `due_chart_file` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `director_creation`
--

CREATE TABLE `director_creation` (
  `dir_id` int(11) NOT NULL,
  `dir_code` varchar(255) DEFAULT NULL,
  `dir_type` varchar(255) DEFAULT NULL,
  `dir_name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `branch_id` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `mail_id` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `whatsapp_no` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_info`
--

CREATE TABLE `document_info` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `cus_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `req_id` varchar(255) NOT NULL,
  `doc_name` varchar(255) DEFAULT NULL,
  `doc_detail` varchar(255) DEFAULT NULL,
  `doc_type` varchar(255) DEFAULT NULL,
  `doc_holder` varchar(255) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `relation_name` varchar(255) NOT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `doc_upload` varchar(255) DEFAULT NULL,
  `doc_info_upload_noc` int(11) DEFAULT 0,
  `noc_date` varchar(255) DEFAULT NULL,
  `noc_person` varchar(255) DEFAULT NULL,
  `noc_name` varchar(255) DEFAULT NULL,
  `doc_info_upload_used` int(11) DEFAULT 0,
  `temp_sts` varchar(10) NOT NULL DEFAULT '0',
  `temp_date` date DEFAULT NULL,
  `temp_person` varchar(255) DEFAULT NULL,
  `temp_purpose` varchar(255) DEFAULT NULL,
  `temp_remarks` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_track`
--

CREATE TABLE `document_track` (
  `id` int(11) NOT NULL,
  `req_id` varchar(100) NOT NULL,
  `cus_id` varchar(255) NOT NULL,
  `sign_doc_id` varchar(255) DEFAULT NULL,
  `cheque_doc_id` varchar(255) DEFAULT NULL,
  `ack_doc_id` varchar(100) DEFAULT NULL,
  `gold_doc_id` varchar(50) DEFAULT NULL,
  `doc_id` varchar(50) DEFAULT NULL,
  `track_status` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(50) NOT NULL,
  `update_login_id` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doc_mapping`
--

CREATE TABLE `doc_mapping` (
  `doc_map_id` int(11) NOT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `sub_category` varchar(255) DEFAULT NULL,
  `doc_creation` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doc_replace_ids`
--

CREATE TABLE `doc_replace_ids` (
  `id` int(11) NOT NULL,
  `req_id` varchar(50) NOT NULL,
  `cus_id` varchar(100) NOT NULL,
  `replace_doc_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `created_date` date NOT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_areas`
--

CREATE TABLE `event_areas` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `event_area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_promotion`
--

CREATE TABLE `event_promotion` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `event_created_date` date DEFAULT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `mobile_num` varchar(255) DEFAULT NULL,
  `area` varchar(250) DEFAULT NULL,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE `expense_category` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `expense_category`
--

INSERT INTO `expense_category` (`id`, `category`) VALUES
(1, 'Pooja'),
(2, 'Vehicle'),
(3, 'Fuel'),
(4, 'Stationary'),
(5, 'Press'),
(6, 'Food'),
(7, 'Donation'),
(8, 'Maintenance'),
(9, 'Salary'),
(10, 'Staff Welfare'),
(11, 'Tax'),
(12, 'Incentive'),
(13, 'Int Less'),
(14, 'Interest'),
(15, 'Common');

-- --------------------------------------------------------

--
-- Table structure for table `fingerprints`
--

CREATE TABLE `fingerprints` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `adhar_num` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hand` varchar(50) DEFAULT NULL,
  `ansi_template` longtext NOT NULL,
  `bitmap_data` longtext DEFAULT NULL,
  `insert_user_id` varchar(50) DEFAULT NULL,
  `update_user_id` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gold_info`
--

CREATE TABLE `gold_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `gold_sts` varchar(255) DEFAULT NULL,
  `gold_type` varchar(255) DEFAULT NULL,
  `Purity` varchar(255) DEFAULT NULL,
  `gold_Count` varchar(255) DEFAULT NULL,
  `gold_Weight` varchar(255) DEFAULT NULL,
  `gold_Value` varchar(255) DEFAULT NULL,
  `gold_upload` varchar(100) NOT NULL,
  `noc_given` varchar(10) NOT NULL DEFAULT '0',
  `noc_date` varchar(255) DEFAULT NULL,
  `noc_person` varchar(255) DEFAULT NULL,
  `noc_name` varchar(255) DEFAULT NULL,
  `used_status` varchar(10) NOT NULL DEFAULT '0',
  `temp_sts` varchar(10) NOT NULL DEFAULT '0',
  `temp_date` date DEFAULT NULL,
  `temp_person` varchar(255) DEFAULT NULL,
  `temp_purpose` varchar(255) DEFAULT NULL,
  `temp_remarks` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(100) DEFAULT NULL,
  `update_login_id` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holiday_creation`
--

CREATE TABLE `holiday_creation` (
  `holiday_id` int(11) NOT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `holiday_date` varchar(250) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `delete_login_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_upload`
--

CREATE TABLE `home_upload` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `media_path` varchar(255) NOT NULL,
  `media_type` enum('image','video','audio') NOT NULL,
  `upload_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `in_acknowledgement`
--

CREATE TABLE `in_acknowledgement` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `cus_status` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(50) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp(),
  `inserted_user` varchar(10) DEFAULT NULL,
  `inserted_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `in_approval`
--

CREATE TABLE `in_approval` (
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `cus_status` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `in_issue`
--

CREATE TABLE `in_issue` (
  `id` int(11) NOT NULL,
  `loan_id` varchar(255) DEFAULT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `cus_status` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(50) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `inserted_user` varchar(10) DEFAULT NULL,
  `inserted_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `in_verification`
--

CREATE TABLE `in_verification` (
  `req_id` int(11) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `responsible` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `declaration` varchar(255) DEFAULT NULL,
  `req_code` varchar(255) DEFAULT NULL,
  `dor` date DEFAULT NULL,
  `cus_reg_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `cus_data` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile1` varchar(255) DEFAULT NULL,
  `mobile2` varchar(255) DEFAULT NULL,
  `whatsapp_no` varchar(100) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `marital` varchar(255) DEFAULT NULL,
  `spouse_name` varchar(255) DEFAULT NULL,
  `occupation_type` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `tot_value` varchar(255) DEFAULT NULL,
  `ad_amt` varchar(255) DEFAULT NULL,
  `ad_perc` varchar(255) DEFAULT NULL,
  `loan_amt` varchar(255) DEFAULT NULL,
  `poss_type` varchar(255) DEFAULT NULL,
  `due_amt` varchar(255) DEFAULT NULL,
  `due_period` varchar(255) DEFAULT NULL,
  `cus_status` varchar(255) DEFAULT '0',
  `prompt_remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `issue_by` int(11) NOT NULL DEFAULT 1,
  `issue_mode` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `bank_id` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_calculation`
--

CREATE TABLE `loan_calculation` (
  `loan_cal_id` int(11) NOT NULL,
  `loan_category_id` int(11) DEFAULT NULL,
  `loan_category` varchar(250) DEFAULT NULL,
  `due_method` varchar(250) DEFAULT NULL,
  `due_type` varchar(250) DEFAULT NULL,
  `profit_method` varchar(250) DEFAULT NULL,
  `calculate_method` varchar(250) DEFAULT NULL,
  `intrest_rate_min` varchar(250) DEFAULT NULL,
  `intrest_rate_max` varchar(250) DEFAULT NULL,
  `due_period_min` varchar(250) DEFAULT NULL,
  `due_period_max` varchar(250) DEFAULT NULL,
  `doc_charge_type` varchar(11) DEFAULT NULL,
  `document_charge_min` varchar(250) DEFAULT NULL,
  `document_charge_max` varchar(250) DEFAULT NULL,
  `proc_fee_type` varchar(11) DEFAULT NULL,
  `processing_fee_min` varchar(250) DEFAULT NULL,
  `processing_fee_max` varchar(250) DEFAULT NULL,
  `loan_limit` varchar(255) DEFAULT NULL,
  `due_date` varchar(250) DEFAULT NULL,
  `grace_period` varchar(250) DEFAULT NULL,
  `penalty` varchar(250) DEFAULT NULL,
  `overdue_type` varchar(50) DEFAULT NULL,
  `overdue` varchar(250) DEFAULT NULL,
  `collection_info` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `delete_login_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_category`
--

CREATE TABLE `loan_category` (
  `loan_category_id` int(11) NOT NULL,
  `loan_category_name` varchar(255) DEFAULT NULL,
  `loan_limit` varchar(255) NOT NULL,
  `agent_loan` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `insert_user_id` int(11) DEFAULT NULL,
  `delete_user_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_category_creation`
--

CREATE TABLE `loan_category_creation` (
  `loan_category_creation_id` int(11) NOT NULL,
  `loan_category_creation_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_category_ref`
--

CREATE TABLE `loan_category_ref` (
  `loan_category_ref_id` int(11) NOT NULL,
  `loan_category_ref_name` varchar(255) DEFAULT NULL,
  `loan_category_id` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_followup`
--

CREATE TABLE `loan_followup` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(255) NOT NULL,
  `stage` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `follow_date` date NOT NULL,
  `insert_login_id` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_issue`
--

CREATE TABLE `loan_issue` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `issued_to` varchar(255) NOT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `issued_mode` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `cash` varchar(255) DEFAULT NULL,
  `bank_id` varchar(10) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `cheque_value` varchar(255) DEFAULT NULL,
  `cheque_remark` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_value` varchar(255) DEFAULT NULL,
  `transaction_remark` varchar(255) DEFAULT NULL,
  `balance_amount` varchar(255) NOT NULL,
  `loan_amt` varchar(255) NOT NULL,
  `net_cash` varchar(255) NOT NULL,
  `cash_guarentor_name` varchar(255) DEFAULT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_scheme`
--

CREATE TABLE `loan_scheme` (
  `scheme_id` int(11) NOT NULL,
  `scheme_name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `loan_category_id` varchar(255) DEFAULT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `due_method` varchar(255) DEFAULT NULL,
  `profit_method` varchar(255) DEFAULT NULL,
  `intrest_rate` varchar(255) DEFAULT NULL,
  `advance_type` varchar(100) DEFAULT NULL,
  `total_due` varchar(255) DEFAULT NULL,
  `advance_due` varchar(255) DEFAULT NULL,
  `due_period` varchar(255) DEFAULT NULL,
  `intreset_type` varchar(50) DEFAULT NULL,
  `intreset_min` varchar(50) DEFAULT NULL,
  `intreset_max` varchar(50) DEFAULT NULL,
  `doc_charge_type` varchar(255) DEFAULT NULL,
  `doc_charge_min` varchar(255) DEFAULT NULL,
  `doc_charge_max` varchar(255) DEFAULT NULL,
  `proc_fee_type` varchar(255) DEFAULT NULL,
  `proc_fee_min` varchar(255) DEFAULT NULL,
  `proc_fee_max` varchar(255) DEFAULT NULL,
  `due_date` varchar(255) DEFAULT NULL,
  `overdue` varchar(255) DEFAULT NULL,
  `grace_period` varchar(255) DEFAULT NULL,
  `penalty` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `insert_login_id` int(11) DEFAULT NULL,
  `update_login_id` int(11) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_summary_feedback`
--

CREATE TABLE `loan_summary_feedback` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `feedback_label` varchar(255) DEFAULT NULL,
  `cus_feedback` varchar(255) DEFAULT NULL,
  `feedback_remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location_audit`
--

CREATE TABLE `location_audit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `actions` varchar(150) NOT NULL,
  `actions_date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `latitude` varchar(150) NOT NULL,
  `longitude` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `screens` varchar(255) DEFAULT NULL,
  `modules` varchar(255) DEFAULT NULL,
  `access` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `screens`, `modules`, `access`) VALUES
(61, 'Company Creation', 'edit_company_creation', 'company_creation'),
(62, 'Branch Creation', 'edit_branch_creation', 'branch_creation'),
(63, 'Loan Category', 'edit_loan_category', 'loan_category'),
(64, 'Loan Calculation', 'edit_loan_calculation', 'loan_calculation'),
(65, 'Loan Scheme', 'edit_loan_scheme', 'loan_scheme'),
(66, 'Area Creation', 'edit_area_creation', 'area_creation'),
(67, 'Area Mapping', 'edit_area_mapping', 'area_mapping'),
(68, 'Area Approval', 'area_status', 'area_approval'),
(69, 'Director Creation', 'edit_director_creation', 'director_creation'),
(70, 'Agent Creation', 'edit_agent_creation', 'agent_creation'),
(71, 'Staff Creation', 'edit_staff_creation', 'staff_creation'),
(72, 'Bank Creation', 'edit_bank_creation', 'bank_creation'),
(73, 'Manage Users', 'edit_manage_user', 'manage_user'),
(74, 'Request', 'edit_request', 'request'),
(75, 'Verification', 'verification_list', 'verification'),
(76, 'Acknowledgement', 'edit_acknowledgement_list', 'acknowledgement'),
(77, 'Loan Issue', 'edit_loan_issue', 'loan_issue'),
(78, 'Collection', 'edit_collection', 'collection'),
(79, 'Closed', 'edit_closed', 'closed'),
(80, 'NOC', 'edit_noc', 'noc'),
(81, 'Update', 'edit_update', 'update_screen'),
(82, 'Concern Creation', 'edit_concern_creation', 'concern_creation'),
(83, 'Concern Solution', 'edit_concern_solution', 'concern_solution'),
(84, 'Concern Feedback', 'edit_concern_feedback', 'concern_feedback'),
(85, 'Bank Clearance', 'edit_bank_clearance', 'bank_clearance'),
(86, 'Due Followup', 'edit_due_followup', 'due_followup'),
(87, 'Approval', 'approval_list', 'approvalmodule'),
(88, 'Document Track', 'document_track', 'doctrack'),
(89, 'Cash Tally', 'cash_tally', 'cash_tally'),
(90, 'Financial Insights', 'finance_insight', 'finance_insight'),
(91, 'Promotion Activity', 'promotion_activity', 'promotion_activity'),
(92, 'Loan Followup', 'loan_followup', 'loan_followup'),
(93, 'Confirmation Followup', 'confirmation_followup', 'confirmation_followup'),
(94, 'Dashboard', 'dashboard', 'dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `name_detail_creation`
--

CREATE TABLE `name_detail_creation` (
  `name_id` int(11) NOT NULL COMMENT 'Primary Key',
  `name` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `opt_for` enum('inv','dep','el') DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `new_cus_promo`
--

CREATE TABLE `new_cus_promo` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `cus_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `sub_area` varchar(255) DEFAULT NULL,
  `int_status` varchar(10) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `new_promotion`
--

CREATE TABLE `new_promotion` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `follow_date` datetime DEFAULT NULL,
  `orgin_table` int(11) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noc`
--

CREATE TABLE `noc` (
  `noc_id` int(11) NOT NULL COMMENT 'Primary Key',
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sign_checklist` varchar(255) DEFAULT NULL,
  `cheque_checklist` varchar(255) DEFAULT NULL,
  `gold_checklist` varchar(255) DEFAULT NULL,
  `mort_checklist` varchar(255) DEFAULT NULL,
  `endorse_checklist` varchar(255) DEFAULT NULL,
  `doc_checklist` varchar(255) DEFAULT NULL,
  `noc_date` varchar(255) DEFAULT NULL,
  `noc_member` varchar(255) DEFAULT NULL,
  `receive_status` int(11) NOT NULL DEFAULT 0,
  `receive_by` int(11) DEFAULT NULL,
  `mem_name` varchar(255) DEFAULT NULL,
  `noc_handover_date` varchar(100) DEFAULT NULL,
  `noc_replace_status` int(11) NOT NULL DEFAULT 0 COMMENT '0-no_replace,1-replace,2-replace doc issued',
  `cus_status` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noc_cheque_checklist`
--

CREATE TABLE `noc_cheque_checklist` (
  `id` int(11) NOT NULL,
  `noc_id` int(11) NOT NULL,
  `cheque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noc_doc_checklist`
--

CREATE TABLE `noc_doc_checklist` (
  `id` int(11) NOT NULL,
  `noc_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noc_endorse_checklist`
--

CREATE TABLE `noc_endorse_checklist` (
  `id` int(11) NOT NULL,
  `noc_id` int(11) NOT NULL,
  `endorse_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noc_gold_checklist`
--

CREATE TABLE `noc_gold_checklist` (
  `id` int(11) NOT NULL,
  `noc_id` int(11) NOT NULL,
  `gold_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noc_mort_checklist`
--

CREATE TABLE `noc_mort_checklist` (
  `id` int(11) NOT NULL,
  `noc_id` int(11) NOT NULL,
  `mort_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noc_sign_checklist`
--

CREATE TABLE `noc_sign_checklist` (
  `id` int(11) NOT NULL,
  `noc_id` int(11) NOT NULL,
  `sign_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penalty_charges`
--

CREATE TABLE `penalty_charges` (
  `req_id` varchar(255) DEFAULT NULL,
  `penalty_date` varchar(255) DEFAULT NULL,
  `penalty` varchar(255) DEFAULT NULL,
  `paid_date` varchar(255) DEFAULT NULL,
  `paid_amnt` varchar(255) DEFAULT '0',
  `waiver_amnt` varchar(255) DEFAULT '0',
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_category_info`
--

CREATE TABLE `request_category_info` (
  `cat_info` int(11) NOT NULL,
  `req_ref_id` varchar(255) DEFAULT NULL,
  `category_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_creation`
--

CREATE TABLE `request_creation` (
  `req_id` int(11) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `responsible` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `declaration` varchar(255) DEFAULT NULL,
  `req_code` varchar(255) DEFAULT NULL,
  `dor` date DEFAULT NULL,
  `cus_reg_id` varchar(255) DEFAULT NULL,
  `cus_id` varchar(255) DEFAULT NULL,
  `cus_data` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile1` varchar(255) DEFAULT NULL,
  `mobile2` varchar(255) DEFAULT NULL,
  `mobile_whatsapp` varchar(100) DEFAULT NULL,
  `whatsapp_no` varchar(100) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `marital` varchar(255) DEFAULT NULL,
  `spouse_name` varchar(255) DEFAULT NULL,
  `occupation_type` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `tot_value` varchar(255) DEFAULT NULL,
  `ad_amt` varchar(255) DEFAULT NULL,
  `ad_perc` varchar(255) DEFAULT NULL,
  `loan_amt` varchar(255) DEFAULT NULL,
  `poss_type` varchar(255) DEFAULT NULL,
  `due_amt` varchar(255) DEFAULT NULL,
  `due_period` varchar(255) DEFAULT NULL,
  `cus_status` varchar(255) DEFAULT '0',
  `prompt_remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signed_doc`
--

CREATE TABLE `signed_doc` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `signed_doc_id` varchar(255) DEFAULT NULL,
  `upload_doc_name` varchar(255) DEFAULT NULL,
  `noc_given` varchar(10) NOT NULL DEFAULT '0',
  `noc_date` varchar(255) DEFAULT NULL,
  `noc_person` varchar(255) DEFAULT NULL,
  `noc_name` varchar(255) DEFAULT NULL,
  `used_status` varchar(10) NOT NULL DEFAULT '0',
  `temp_sts` varchar(10) NOT NULL DEFAULT '0',
  `temp_date` date DEFAULT NULL,
  `temp_person` varchar(255) DEFAULT NULL,
  `temp_purpose` varchar(255) DEFAULT NULL,
  `temp_remarks` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(100) DEFAULT NULL,
  `update_login_id` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signed_doc_info`
--

CREATE TABLE `signed_doc_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `doc_name` varchar(255) DEFAULT NULL,
  `sign_type` varchar(255) DEFAULT NULL,
  `signType_relationship` varchar(255) DEFAULT NULL,
  `doc_Count` varchar(255) DEFAULT NULL,
  `req_id` varchar(150) DEFAULT NULL,
  `cus_profile_id` varchar(150) DEFAULT NULL,
  `noc_given` varchar(10) NOT NULL DEFAULT '0',
  `noc_date` varchar(150) DEFAULT NULL,
  `noc_person` varchar(150) DEFAULT NULL,
  `noc_name` varchar(150) DEFAULT NULL,
  `used_status` varchar(10) NOT NULL DEFAULT '0',
  `temp_sts` varchar(10) NOT NULL DEFAULT '0',
  `temp_date` date DEFAULT NULL,
  `temp_person` varchar(150) DEFAULT NULL,
  `temp_purpose` varchar(150) DEFAULT NULL,
  `temp_remarks` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(100) DEFAULT NULL,
  `update_login_id` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_creation`
--

CREATE TABLE `staff_creation` (
  `staff_id` int(11) NOT NULL,
  `staff_code` varchar(255) DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_type` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `taluk` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `mobile1` varchar(255) DEFAULT NULL,
  `mobile2` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `cug_no` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_type_creation`
--

CREATE TABLE `staff_type_creation` (
  `staff_type_id` int(11) NOT NULL,
  `staff_type_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_area_list_creation`
--

CREATE TABLE `sub_area_list_creation` (
  `sub_area_id` int(11) NOT NULL,
  `area_id_ref` varchar(255) DEFAULT NULL,
  `sub_area_name` varchar(255) DEFAULT NULL,
  `sub_area_enable` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `role_type` varchar(255) DEFAULT NULL,
  `dir_id` varchar(255) DEFAULT NULL,
  `ag_id` varchar(255) DEFAULT NULL,
  `staff_id` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `branch_id` varchar(255) DEFAULT NULL,
  `bank_access` varchar(200) DEFAULT NULL,
  `loan_cat` varchar(255) DEFAULT NULL,
  `agentforstaff` varchar(255) DEFAULT NULL,
  `line_id` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `download_access` varchar(10) NOT NULL DEFAULT '1',
  `report_access` varchar(10) DEFAULT NULL,
  `home_access` int(11) NOT NULL DEFAULT 1,
  `pro_aty_access` varchar(100) DEFAULT '1,2,3',
  `promotion_activity_mapping_access` varchar(50) DEFAULT NULL,
  `mastermodule` varchar(255) DEFAULT '1',
  `company_creation` varchar(255) DEFAULT '1',
  `branch_creation` varchar(255) DEFAULT '1',
  `loan_category` varchar(255) DEFAULT '1',
  `area_creation` varchar(255) DEFAULT '1',
  `area_mapping` varchar(255) DEFAULT '1',
  `area_approval` varchar(255) DEFAULT '1',
  `adminmodule` varchar(255) DEFAULT '1',
  `director_creation` varchar(255) DEFAULT '1',
  `agent_creation` varchar(255) DEFAULT '1',
  `staff_creation` varchar(255) DEFAULT '1',
  `manage_user` varchar(255) DEFAULT '1',
  `doc_mapping` varchar(255) NOT NULL DEFAULT '1',
  `bank_creation` varchar(10) NOT NULL DEFAULT '1',
  `requestmodule` varchar(255) DEFAULT '1',
  `request` varchar(255) DEFAULT '1',
  `request_list_access` varchar(255) NOT NULL DEFAULT '1',
  `verificationmodule` varchar(255) DEFAULT '1',
  `verification` varchar(255) DEFAULT '1',
  `ver_loan_cat` varchar(255) DEFAULT NULL,
  `ver_group_id` varchar(100) DEFAULT NULL,
  `approvalmodule` varchar(255) NOT NULL DEFAULT '1',
  `approval` varchar(255) NOT NULL DEFAULT '1',
  `app_loan_cat` varchar(255) DEFAULT NULL,
  `acknowledgementmodule` varchar(255) NOT NULL DEFAULT '1',
  `acknowledgement` varchar(255) NOT NULL DEFAULT '1',
  `ack_loan_cat` varchar(255) DEFAULT NULL,
  `loanissuemodule` varchar(255) DEFAULT '1',
  `loan_issue` varchar(255) DEFAULT '1',
  `collectionmodule` varchar(25) NOT NULL DEFAULT '1',
  `collection` varchar(25) NOT NULL DEFAULT '1',
  `collection_access` varchar(25) NOT NULL DEFAULT '1',
  `closedmodule` varchar(10) NOT NULL DEFAULT '1',
  `closed` varchar(10) NOT NULL DEFAULT '1',
  `nocmodule` varchar(10) NOT NULL DEFAULT '1',
  `noc` varchar(10) NOT NULL DEFAULT '1',
  `noc_handover` varchar(11) NOT NULL DEFAULT '1',
  `noc_replace_access` int(11) NOT NULL DEFAULT 1,
  `noc_mapping_access` varchar(50) DEFAULT NULL,
  `doctrackmodule` varchar(50) NOT NULL DEFAULT '1',
  `doctrack` varchar(50) NOT NULL DEFAULT '1',
  `doc_rec_access` varchar(50) NOT NULL DEFAULT '1',
  `noc_replace` int(11) NOT NULL DEFAULT 1,
  `updatemodule` varchar(10) NOT NULL DEFAULT '1',
  `update_screen` varchar(10) NOT NULL DEFAULT '1',
  `update_screen_id` varchar(10) DEFAULT NULL,
  `concernmodule` varchar(10) DEFAULT '1',
  `concern_creation` varchar(10) DEFAULT '1',
  `concern_solution` varchar(10) DEFAULT '1',
  `concern_feedback` varchar(50) DEFAULT '1',
  `accountsmodule` varchar(10) NOT NULL DEFAULT '1',
  `cash_tally` varchar(10) NOT NULL DEFAULT '1',
  `cash_tally_access` varchar(200) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `cash_tally_admin` varchar(10) NOT NULL DEFAULT '1',
  `bank_clearance` varchar(10) NOT NULL DEFAULT '1',
  `bnk_clr_upl_acc` varchar(50) DEFAULT '1',
  `finance_insight` varchar(10) NOT NULL DEFAULT '1',
  `accounts_loan_issue` varchar(11) NOT NULL DEFAULT '1',
  `followupmodule` varchar(10) DEFAULT '1',
  `promotion_activity` varchar(10) DEFAULT '1',
  `loan_followup` varchar(10) DEFAULT '1',
  `confirmation_followup` varchar(10) DEFAULT '1',
  `due_followup` varchar(10) DEFAULT '1',
  `ecs_followup` int(11) DEFAULT 1,
  `due_followup_lines` varchar(100) DEFAULT NULL,
  `reportmodule` varchar(10) NOT NULL DEFAULT '1',
  `work_report_module` int(11) DEFAULT 1,
  `monitor_report_module` int(11) DEFAULT 1,
  `analysis_report_module` int(11) DEFAULT 1,
  `accounts_report_module` int(11) DEFAULT 1,
  `ledger_report` varchar(10) NOT NULL DEFAULT '1',
  `request_report` varchar(10) NOT NULL DEFAULT '1',
  `cancel_revoke_report` varchar(10) NOT NULL DEFAULT '1',
  `cus_profile_report` varchar(10) NOT NULL DEFAULT '1',
  `loan_issue_report` varchar(10) NOT NULL DEFAULT '1',
  `collection_report` varchar(10) NOT NULL DEFAULT '1',
  `principal_interest_report` int(11) NOT NULL DEFAULT 1,
  `balance_report` varchar(10) NOT NULL DEFAULT '1',
  `due_list_report` varchar(10) NOT NULL DEFAULT '1',
  `in_closed_report` int(11) NOT NULL DEFAULT 1,
  `closed_report` varchar(10) NOT NULL DEFAULT '1',
  `confirmation_followup_report` varchar(10) NOT NULL DEFAULT '1',
  `agent_report` varchar(10) NOT NULL DEFAULT '1',
  `no_due_pay_report` int(11) DEFAULT 1,
  `other_trans_report` varchar(10) DEFAULT '1',
  `day_end_report` varchar(50) DEFAULT '1',
  `cash_tally_activity_report` int(11) DEFAULT 1,
  `due_followup_customer_count_report` varchar(10) NOT NULL DEFAULT '1',
  `commitment_report` varchar(10) NOT NULL DEFAULT '1',
  `customer_status_report` varchar(10) NOT NULL DEFAULT '1',
  `promotion_activity_report` int(11) DEFAULT 1,
  `cleared_report` int(11) NOT NULL DEFAULT 1,
  `events_report` int(11) DEFAULT 1,
  `area_loan_count_report` int(11) DEFAULT 1,
  `work_count_report` int(11) NOT NULL DEFAULT 1,
  `noc_handover_report` varchar(10) NOT NULL DEFAULT '1',
  `confirmation_count_report` varchar(12) NOT NULL DEFAULT '1',
  `concern_report` varchar(11) NOT NULL DEFAULT '1',
  `partners_report` varchar(11) NOT NULL DEFAULT '1',
  `reportmodule_intrest` int(11) NOT NULL DEFAULT 1,
  `intrest_ledger_report` int(11) NOT NULL DEFAULT 1,
  `intrest_loan_issue_report` int(11) NOT NULL DEFAULT 1,
  `intrest_collection_report` int(11) NOT NULL DEFAULT 1,
  `intrest_balance_report` int(11) NOT NULL DEFAULT 1,
  `intrest_closed_report` int(11) NOT NULL DEFAULT 1,
  `search_module` varchar(10) NOT NULL DEFAULT '1',
  `search` varchar(10) NOT NULL DEFAULT '1',
  `bulk_upload_module` varchar(10) NOT NULL DEFAULT '1',
  `bulk_upload` varchar(10) NOT NULL DEFAULT '1',
  `loan_track` varchar(10) NOT NULL DEFAULT '1',
  `sms_module` int(11) NOT NULL DEFAULT 1,
  `sms_generation` int(11) NOT NULL DEFAULT 1,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `delete_login_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `fullname`, `title`, `emailid`, `user_name`, `user_password`, `role`, `role_type`, `dir_id`, `ag_id`, `staff_id`, `company_id`, `branch_id`, `bank_access`, `loan_cat`, `agentforstaff`, `line_id`, `group_id`, `download_access`, `report_access`, `home_access`, `pro_aty_access`, `promotion_activity_mapping_access`, `mastermodule`, `company_creation`, `branch_creation`, `loan_category`, `area_creation`, `area_mapping`, `area_approval`, `adminmodule`, `director_creation`, `agent_creation`, `staff_creation`, `manage_user`, `doc_mapping`, `bank_creation`, `requestmodule`, `request`, `request_list_access`, `verificationmodule`, `verification`, `ver_loan_cat`, `ver_group_id`, `approvalmodule`, `approval`, `app_loan_cat`, `acknowledgementmodule`, `acknowledgement`, `ack_loan_cat`, `loanissuemodule`, `loan_issue`, `collectionmodule`, `collection`, `collection_access`, `closedmodule`, `closed`, `nocmodule`, `noc`, `noc_handover`, `noc_replace_access`, `noc_mapping_access`, `doctrackmodule`, `doctrack`, `doc_rec_access`, `noc_replace`, `updatemodule`, `update_screen`, `update_screen_id`, `concernmodule`, `concern_creation`, `concern_solution`, `concern_feedback`, `accountsmodule`, `cash_tally`, `cash_tally_access`, `bank_details`, `cash_tally_admin`, `bank_clearance`, `bnk_clr_upl_acc`, `finance_insight`, `accounts_loan_issue`, `followupmodule`, `promotion_activity`, `loan_followup`, `confirmation_followup`, `due_followup`, `ecs_followup`, `due_followup_lines`, `reportmodule`, `work_report_module`, `monitor_report_module`, `analysis_report_module`, `accounts_report_module`, `ledger_report`, `request_report`, `cancel_revoke_report`, `cus_profile_report`, `loan_issue_report`, `collection_report`, `principal_interest_report`, `balance_report`, `due_list_report`, `in_closed_report`, `closed_report`, `confirmation_followup_report`, `agent_report`, `no_due_pay_report`, `other_trans_report`, `day_end_report`, `cash_tally_activity_report`, `due_followup_customer_count_report`, `commitment_report`, `customer_status_report`, `promotion_activity_report`, `cleared_report`, `events_report`, `area_loan_count_report`, `work_count_report`, `noc_handover_report`, `confirmation_count_report`, `concern_report`, `partners_report`, `reportmodule_intrest`, `intrest_ledger_report`, `intrest_loan_issue_report`, `intrest_collection_report`, `intrest_balance_report`, `intrest_closed_report`, `search_module`, `search`, `bulk_upload_module`, `bulk_upload`, `loan_track`, `sms_module`, `sms_generation`, `status`, `insert_login_id`, `update_login_id`, `delete_login_id`, `created_date`, `updated_date`) VALUES
(2, NULL, NULL, 'Naren', NULL, '', 'admin', 'Galaxy@2024', '3', '1', '', '', '1', '1', '1,2,3,4', '2', '1,2,3', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87', '1,2,3,4,5,6,7,8,9,10,11', '1,2,3,4,5,6,7,8,9,10,11', '1', '2', 0, '1,2,3,4,5', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1,2,3,7', '', '0', '0', '1,2,3,7', '0', '0', '1,2,3,7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 1, '2', '0', '0', '0', 1, '0', '0', '1,2', '0', '0', '0', '1', '0', '0', NULL, '2,3', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', 0, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15', '0', 0, 0, 0, 0, '1', '0', '0', '1', '0', '0', 0, '0', '0', 0, '0', '0', '0', 0, '0', '0', 0, '0', '0', '0', 0, 0, 0, 0, 0, '0', '0', '0', '0', 1, 1, 1, 1, 1, 1, '0', '0', '0', '0', '0', 0, 0, '0', '1', '2', NULL, '2024-06-26 15:01:00', '2026-02-02 14:14:51');

-- --------------------------------------------------------

--
-- Table structure for table `verification_bank_info`
--

CREATE TABLE `verification_bank_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `acc_holder_name` varchar(100) NOT NULL,
  `acc_no` bigint(20) NOT NULL,
  `ifsc_code` varchar(50) NOT NULL,
  `upload` varchar(100) DEFAULT NULL,
  `issue_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_cus_feedback`
--

CREATE TABLE `verification_cus_feedback` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `feedback_label` varchar(255) DEFAULT NULL,
  `cus_feedback` varchar(255) DEFAULT NULL,
  `feedback_remark` varchar(255) DEFAULT NULL,
  `inserted_date` datetime DEFAULT NULL,
  `insert_login_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_documentation`
--

CREATE TABLE `verification_documentation` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id_doc` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `cus_profile_id` varchar(255) DEFAULT NULL,
  `doc_id` varchar(255) DEFAULT NULL,
  `mortgage_process` varchar(100) DEFAULT NULL,
  `Propertyholder_type` varchar(100) DEFAULT NULL,
  `Propertyholder_name` varchar(255) DEFAULT NULL,
  `Propertyholder_relationship_name` varchar(100) DEFAULT NULL,
  `doc_property_relation` varchar(100) DEFAULT NULL,
  `doc_property_type` varchar(255) DEFAULT NULL,
  `doc_property_measurement` varchar(255) DEFAULT NULL,
  `doc_property_location` varchar(255) DEFAULT NULL,
  `doc_property_value` varchar(255) DEFAULT NULL,
  `mortgage_name` varchar(255) DEFAULT NULL,
  `mortgage_dsgn` varchar(255) DEFAULT NULL,
  `mortgage_nuumber` varchar(255) DEFAULT NULL,
  `reg_office` varchar(255) DEFAULT NULL,
  `mortgage_value` varchar(255) DEFAULT NULL,
  `mortgage_document` varchar(255) DEFAULT NULL,
  `mortgage_document_upd` varchar(255) DEFAULT NULL,
  `mortgage_document_pending` varchar(150) DEFAULT NULL,
  `endorsement_process` varchar(50) DEFAULT NULL,
  `owner_type` varchar(100) DEFAULT NULL,
  `owner_name` varchar(200) DEFAULT NULL,
  `ownername_relationship_name` varchar(100) DEFAULT NULL,
  `en_relation` varchar(100) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_process` varchar(50) DEFAULT NULL,
  `en_Company` varchar(200) DEFAULT NULL,
  `en_Model` varchar(200) DEFAULT NULL,
  `vehicle_reg_no` varchar(150) DEFAULT NULL,
  `endorsement_name` varchar(255) DEFAULT NULL,
  `en_RC` varchar(50) DEFAULT NULL,
  `Rc_document_upd` varchar(255) DEFAULT NULL,
  `Rc_document_pending` varchar(150) DEFAULT NULL,
  `en_Key` varchar(50) DEFAULT NULL,
  `gold_info` varchar(50) DEFAULT NULL,
  `gold_sts` varchar(50) DEFAULT NULL,
  `gold_type` varchar(255) DEFAULT NULL,
  `Purity` varchar(255) DEFAULT NULL,
  `gold_Count` varchar(255) DEFAULT NULL,
  `gold_Weight` varchar(255) DEFAULT NULL,
  `gold_Value` varchar(255) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `document_details` varchar(255) DEFAULT NULL,
  `document_type` varchar(50) DEFAULT NULL,
  `document_holder` varchar(50) DEFAULT NULL,
  `docholder_name` varchar(255) DEFAULT NULL,
  `docholder_relationship_name` varchar(50) DEFAULT NULL,
  `doc_relation` varchar(50) DEFAULT NULL,
  `cus_status` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `insert_login_id` varchar(50) DEFAULT NULL,
  `update_login_id` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_family_info`
--

CREATE TABLE `verification_family_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(100) DEFAULT NULL,
  `req_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `relationship` text DEFAULT NULL,
  `authorize` int(11) DEFAULT NULL,
  `other_remark` varchar(100) DEFAULT NULL,
  `other_address` varchar(200) DEFAULT NULL,
  `relation_age` varchar(50) DEFAULT NULL,
  `relation_aadhar` varchar(50) DEFAULT NULL,
  `relation_Mobile` double DEFAULT NULL,
  `relation_Occupation` text DEFAULT NULL,
  `relation_Income` varchar(50) DEFAULT NULL,
  `relation_Blood` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_group_info`
--

CREATE TABLE `verification_group_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_age` int(11) NOT NULL,
  `group_aadhar` text NOT NULL,
  `group_mobile` double NOT NULL,
  `group_gender` text NOT NULL,
  `group_designation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_kyc_info`
--

CREATE TABLE `verification_kyc_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` int(11) NOT NULL,
  `proofOf` varchar(50) NOT NULL,
  `fam_mem` varchar(255) NOT NULL,
  `guarantor_mem` varchar(100) DEFAULT NULL,
  `proof_type` varchar(50) NOT NULL,
  `proof_no` varchar(50) NOT NULL,
  `upload` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_loan_calculation`
--

CREATE TABLE `verification_loan_calculation` (
  `loan_cal_id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `cus_id_loan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `cus_data_loan` varchar(255) DEFAULT NULL,
  `mobile_loan` varchar(255) DEFAULT NULL,
  `pic_loan` varchar(255) DEFAULT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `tot_value` varchar(255) DEFAULT NULL,
  `ad_amt` varchar(255) DEFAULT NULL,
  `loan_amt` varchar(255) DEFAULT NULL,
  `profit_type` varchar(255) DEFAULT NULL,
  `due_method_calc` varchar(255) DEFAULT NULL,
  `due_type` varchar(255) DEFAULT NULL,
  `profit_method` varchar(255) DEFAULT NULL,
  `calc_method` varchar(255) DEFAULT NULL,
  `due_method_scheme` varchar(255) DEFAULT NULL,
  `profit_method_scheme` varchar(100) DEFAULT NULL,
  `day_scheme` varchar(255) DEFAULT NULL,
  `scheme_name` varchar(255) DEFAULT NULL,
  `int_rate` varchar(255) DEFAULT NULL,
  `due_period` varchar(255) DEFAULT NULL,
  `doc_charge` varchar(255) DEFAULT NULL,
  `proc_fee` varchar(255) DEFAULT NULL,
  `loan_amt_cal` varchar(255) DEFAULT NULL,
  `principal_amt_cal` varchar(255) DEFAULT NULL,
  `int_amt_cal` varchar(255) DEFAULT NULL,
  `tot_amt_cal` varchar(255) DEFAULT NULL,
  `due_amt_cal` varchar(255) DEFAULT NULL,
  `doc_charge_cal` varchar(255) DEFAULT NULL,
  `proc_fee_cal` varchar(255) DEFAULT NULL,
  `net_cash_cal` varchar(255) DEFAULT NULL,
  `due_start_from` varchar(255) DEFAULT NULL,
  `maturity_month` varchar(255) DEFAULT NULL,
  `collection_method` varchar(255) DEFAULT NULL,
  `communication` varchar(50) DEFAULT NULL,
  `com_audio` varchar(255) DEFAULT NULL,
  `verification_person` varchar(255) DEFAULT NULL,
  `verification_location` varchar(255) DEFAULT NULL,
  `verify_remark` varchar(255) DEFAULT NULL,
  `cus_status` varchar(255) DEFAULT NULL,
  `insert_login_id` varchar(255) DEFAULT NULL,
  `update_login_id` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_property_info`
--

CREATE TABLE `verification_property_info` (
  `id` int(11) NOT NULL,
  `cus_id` varchar(250) DEFAULT NULL,
  `req_id` int(11) NOT NULL,
  `property_type` varchar(50) NOT NULL,
  `property_measurement` varchar(50) NOT NULL,
  `property_value` varchar(50) NOT NULL,
  `property_holder` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verif_loan_cal_category`
--

CREATE TABLE `verif_loan_cal_category` (
  `cat_id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `loan_cal_id` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acknowledgement_loan_cal_category`
--
ALTER TABLE `acknowledgement_loan_cal_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `acknowlegement_customer_profile`
--
ALTER TABLE `acknowlegement_customer_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_acknowlegement_customer_profile` (`req_id`,`area_confirm_area`) USING BTREE,
  ADD KEY `idx_cus_id` (`cus_id`);

--
-- Indexes for table `acknowlegement_documentation`
--
ALTER TABLE `acknowlegement_documentation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ack_doc_req` (`req_id`);

--
-- Indexes for table `acknowlegement_loan_calculation`
--
ALTER TABLE `acknowlegement_loan_calculation`
  ADD PRIMARY KEY (`loan_cal_id`),
  ADD KEY `idx_req_id` (`req_id`,`cus_id_loan`);

--
-- Indexes for table `agent_communication_details`
--
ALTER TABLE `agent_communication_details`
  ADD PRIMARY KEY (`comm_id`);

--
-- Indexes for table `agent_creation`
--
ALTER TABLE `agent_creation`
  ADD PRIMARY KEY (`ag_id`);

--
-- Indexes for table `agent_group_creation`
--
ALTER TABLE `agent_group_creation`
  ADD PRIMARY KEY (`agent_group_id`);

--
-- Indexes for table `area_creation`
--
ALTER TABLE `area_creation`
  ADD PRIMARY KEY (`area_creation_id`);

--
-- Indexes for table `area_duefollowup_mapping`
--
ALTER TABLE `area_duefollowup_mapping`
  ADD PRIMARY KEY (`map_id`);

--
-- Indexes for table `area_duefollowup_mapping_area`
--
ALTER TABLE `area_duefollowup_mapping_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_duefollowup_area` (`duefollowup_map_id`,`area_id`) USING BTREE;

--
-- Indexes for table `area_group_mapping`
--
ALTER TABLE `area_group_mapping`
  ADD PRIMARY KEY (`map_id`),
  ADD KEY `idx_area_group_mapping` (`map_id`,`branch_id`);

--
-- Indexes for table `area_group_mapping_area`
--
ALTER TABLE `area_group_mapping_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_group_area` (`group_map_id`,`area_id`);

--
-- Indexes for table `area_line_mapping`
--
ALTER TABLE `area_line_mapping`
  ADD PRIMARY KEY (`map_id`),
  ADD KEY `idx_line_name` (`map_id`,`line_name`),
  ADD KEY `idx_ids` (`branch_id`);

--
-- Indexes for table `area_line_mapping_area`
--
ALTER TABLE `area_line_mapping_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_line_area` (`line_map_id`,`area_id`);

--
-- Indexes for table `area_list_creation`
--
ALTER TABLE `area_list_creation`
  ADD PRIMARY KEY (`area_id`),
  ADD KEY `idx_area_list_creation` (`area_id`);

--
-- Indexes for table `bank_creation`
--
ALTER TABLE `bank_creation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_stmt`
--
ALTER TABLE `bank_stmt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_creation`
--
ALTER TABLE `branch_creation`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `cash_tally`
--
ALTER TABLE `cash_tally`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_tally_modes`
--
ALTER TABLE `cash_tally_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cheque_info`
--
ALTER TABLE `cheque_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cheque_no_list`
--
ALTER TABLE `cheque_no_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cheque_upd`
--
ALTER TABLE `cheque_upd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `closed_status`
--
ALTER TABLE `closed_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_id` (`req_id`),
  ADD KEY `cus_id` (`req_id`,`cus_id`,`closed_sts`,`consider_level`,`cus_sts`,`created_date`) USING BTREE,
  ADD KEY `idx_closed_status_main` (`closed_sts`,`cus_id`,`created_date`),
  ADD KEY `idx_closed_status_block` (`cus_id`,`closed_sts`),
  ADD KEY `idx_closed_status_req` (`req_id`,`created_date`);

--
-- Indexes for table `closing_customer`
--
ALTER TABLE `closing_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_uni` (`req_id`),
  ADD KEY `req_id` (`req_id`,`cus_id`,`closing_date`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`coll_id`),
  ADD UNIQUE KEY `coll_code` (`coll_code`),
  ADD KEY `idx_collection` (`req_id`,`cus_id`,`coll_date`,`trans_date`,`coll_id`);

--
-- Indexes for table `collection_charges`
--
ALTER TABLE `collection_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commitment`
--
ALTER TABLE `commitment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_commitment` (`req_id`,`cus_id`,`comm_date`) USING BTREE,
  ADD KEY `idx_commitment_cusid_createddate` (`cus_id`,`created_date`);

--
-- Indexes for table `company_creation`
--
ALTER TABLE `company_creation`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `concern_creation`
--
ALTER TABLE `concern_creation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `concern_subject`
--
ALTER TABLE `concern_subject`
  ADD PRIMARY KEY (`concern_sub_id`);

--
-- Indexes for table `confirmation_followup`
--
ALTER TABLE `confirmation_followup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cf_req_remove_created` (`req_id`,`remove_status`,`created_date`),
  ADD KEY `idx_cf_req_remove` (`req_id`,`remove_status`);

--
-- Indexes for table `ct_bank_collection`
--
ALTER TABLE `ct_bank_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_bag`
--
ALTER TABLE `ct_cr_bag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_bank_withdraw`
--
ALTER TABLE `ct_cr_bank_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_bdeposit`
--
ALTER TABLE `ct_cr_bdeposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_bel`
--
ALTER TABLE `ct_cr_bel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_bexchange`
--
ALTER TABLE `ct_cr_bexchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_binvest`
--
ALTER TABLE `ct_cr_binvest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_boti`
--
ALTER TABLE `ct_cr_boti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_cash_deposit`
--
ALTER TABLE `ct_cr_cash_deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_hag`
--
ALTER TABLE `ct_cr_hag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_hdeposit`
--
ALTER TABLE `ct_cr_hdeposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_hel`
--
ALTER TABLE `ct_cr_hel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_hexchange`
--
ALTER TABLE `ct_cr_hexchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_hinvest`
--
ALTER TABLE `ct_cr_hinvest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_cr_hoti`
--
ALTER TABLE `ct_cr_hoti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_bag`
--
ALTER TABLE `ct_db_bag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_bank_deposit`
--
ALTER TABLE `ct_db_bank_deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_bdeposit`
--
ALTER TABLE `ct_db_bdeposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_bel`
--
ALTER TABLE `ct_db_bel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_bexchange`
--
ALTER TABLE `ct_db_bexchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_bexpense`
--
ALTER TABLE `ct_db_bexpense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_binvest`
--
ALTER TABLE `ct_db_binvest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_bissued`
--
ALTER TABLE `ct_db_bissued`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_cash_withdraw`
--
ALTER TABLE `ct_db_cash_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_exf`
--
ALTER TABLE `ct_db_exf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_hag`
--
ALTER TABLE `ct_db_hag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_hdeposit`
--
ALTER TABLE `ct_db_hdeposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_hel`
--
ALTER TABLE `ct_db_hel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_hexchange`
--
ALTER TABLE `ct_db_hexchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_hexpense`
--
ALTER TABLE `ct_db_hexpense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_hinvest`
--
ALTER TABLE `ct_db_hinvest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_db_hissued`
--
ALTER TABLE `ct_db_hissued`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_hand_collection`
--
ALTER TABLE `ct_hand_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_register`
--
ALTER TABLE `customer_register`
  ADD PRIMARY KEY (`cus_reg_id`),
  ADD KEY `idx_cus_id` (`cus_id`) USING BTREE;

--
-- Indexes for table `customer_status`
--
ALTER TABLE `customer_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_req_id` (`req_id`) USING BTREE,
  ADD KEY `idx_cus_id` (`cus_id`,`payable_amnt`,`bal_amnt`,`sub_status`) USING BTREE,
  ADD KEY `idx_paid_date` (`last_paid_date`,`current_month_paid`);

--
-- Indexes for table `cus_feedback_name`
--
ALTER TABLE `cus_feedback_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cus_old_data`
--
ALTER TABLE `cus_old_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `director_creation`
--
ALTER TABLE `director_creation`
  ADD PRIMARY KEY (`dir_id`);

--
-- Indexes for table `document_info`
--
ALTER TABLE `document_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_track`
--
ALTER TABLE `document_track`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_unique_req_id` (`req_id`);

--
-- Indexes for table `doc_mapping`
--
ALTER TABLE `doc_mapping`
  ADD PRIMARY KEY (`doc_map_id`);

--
-- Indexes for table `doc_replace_ids`
--
ALTER TABLE `doc_replace_ids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_areas`
--
ALTER TABLE `event_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `event_promotion`
--
ALTER TABLE `event_promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fingerprints`
--
ALTER TABLE `fingerprints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gold_info`
--
ALTER TABLE `gold_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holiday_creation`
--
ALTER TABLE `holiday_creation`
  ADD PRIMARY KEY (`holiday_id`);

--
-- Indexes for table `home_upload`
--
ALTER TABLE `home_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `in_acknowledgement`
--
ALTER TABLE `in_acknowledgement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `in_issue`
--
ALTER TABLE `in_issue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_req_id` (`req_id`) USING BTREE,
  ADD KEY `idx_loanid_reqid_cusid` (`loan_id`,`req_id`,`cus_id`),
  ADD KEY `idx_cus_status` (`status`,`cus_status`,`req_id`) USING BTREE,
  ADD KEY `idx_in_issue_cus_status` (`cus_id`,`cus_status`,`req_id`);

--
-- Indexes for table `in_verification`
--
ALTER TABLE `in_verification`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `idx_req-id_loancat_sts` (`req_id`,`loan_category`,`cus_status`,`cus_id`);

--
-- Indexes for table `loan_calculation`
--
ALTER TABLE `loan_calculation`
  ADD PRIMARY KEY (`loan_cal_id`);

--
-- Indexes for table `loan_category`
--
ALTER TABLE `loan_category`
  ADD PRIMARY KEY (`loan_category_id`),
  ADD KEY `idx_loan_category` (`loan_category_id`,`loan_category_name`);

--
-- Indexes for table `loan_category_creation`
--
ALTER TABLE `loan_category_creation`
  ADD PRIMARY KEY (`loan_category_creation_id`),
  ADD KEY `idx_loan_category_creation` (`loan_category_creation_id`);

--
-- Indexes for table `loan_category_ref`
--
ALTER TABLE `loan_category_ref`
  ADD PRIMARY KEY (`loan_category_ref_id`);

--
-- Indexes for table `loan_followup`
--
ALTER TABLE `loan_followup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_issue`
--
ALTER TABLE `loan_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_loan_issue` (`req_id`) USING BTREE,
  ADD KEY `idx_loan_issue_req_id_id` (`req_id`,`id`);

--
-- Indexes for table `loan_scheme`
--
ALTER TABLE `loan_scheme`
  ADD PRIMARY KEY (`scheme_id`);

--
-- Indexes for table `loan_summary_feedback`
--
ALTER TABLE `loan_summary_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_audit`
--
ALTER TABLE `location_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `name_detail_creation`
--
ALTER TABLE `name_detail_creation`
  ADD PRIMARY KEY (`name_id`);

--
-- Indexes for table `new_cus_promo`
--
ALTER TABLE `new_cus_promo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_promotion`
--
ALTER TABLE `new_promotion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cus_id` (`cus_id`,`follow_date`),
  ADD KEY `idx_np_cusid_createddate` (`cus_id`,`created_date`);

--
-- Indexes for table `noc`
--
ALTER TABLE `noc`
  ADD PRIMARY KEY (`noc_id`);

--
-- Indexes for table `noc_cheque_checklist`
--
ALTER TABLE `noc_cheque_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noc_doc_checklist`
--
ALTER TABLE `noc_doc_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noc_endorse_checklist`
--
ALTER TABLE `noc_endorse_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noc_gold_checklist`
--
ALTER TABLE `noc_gold_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noc_mort_checklist`
--
ALTER TABLE `noc_mort_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noc_sign_checklist`
--
ALTER TABLE `noc_sign_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_category_info`
--
ALTER TABLE `request_category_info`
  ADD PRIMARY KEY (`cat_info`);

--
-- Indexes for table `request_creation`
--
ALTER TABLE `request_creation`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `idx_request_creation` (`cus_status`,`area`,`req_id`),
  ADD KEY `idx_cus_id` (`cus_id`),
  ADD KEY `idx_request_creation_block` (`cus_id`,`cus_status`),
  ADD KEY `idx_rc_status_req_updated` (`cus_status`,`req_id`,`updated_date`);

--
-- Indexes for table `signed_doc`
--
ALTER TABLE `signed_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signed_doc_info`
--
ALTER TABLE `signed_doc_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_creation`
--
ALTER TABLE `staff_creation`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `staff_type_creation`
--
ALTER TABLE `staff_type_creation`
  ADD PRIMARY KEY (`staff_type_id`);

--
-- Indexes for table `sub_area_list_creation`
--
ALTER TABLE `sub_area_list_creation`
  ADD PRIMARY KEY (`sub_area_id`),
  ADD KEY `idx_sub_area_list_creation` (`sub_area_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `idx_user` (`user_name`,`user_password`,`agentforstaff`),
  ADD KEY `idx_map_ids` (`branch_id`,`loan_cat`,`line_id`);

--
-- Indexes for table `verification_bank_info`
--
ALTER TABLE `verification_bank_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_cus_feedback`
--
ALTER TABLE `verification_cus_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_documentation`
--
ALTER TABLE `verification_documentation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_family_info`
--
ALTER TABLE `verification_family_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_group_info`
--
ALTER TABLE `verification_group_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_kyc_info`
--
ALTER TABLE `verification_kyc_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_loan_calculation`
--
ALTER TABLE `verification_loan_calculation`
  ADD PRIMARY KEY (`loan_cal_id`);

--
-- Indexes for table `verification_property_info`
--
ALTER TABLE `verification_property_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verif_loan_cal_category`
--
ALTER TABLE `verif_loan_cal_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acknowledgement_loan_cal_category`
--
ALTER TABLE `acknowledgement_loan_cal_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acknowlegement_customer_profile`
--
ALTER TABLE `acknowlegement_customer_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acknowlegement_documentation`
--
ALTER TABLE `acknowlegement_documentation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acknowlegement_loan_calculation`
--
ALTER TABLE `acknowlegement_loan_calculation`
  MODIFY `loan_cal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_communication_details`
--
ALTER TABLE `agent_communication_details`
  MODIFY `comm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_creation`
--
ALTER TABLE `agent_creation`
  MODIFY `ag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_group_creation`
--
ALTER TABLE `agent_group_creation`
  MODIFY `agent_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_creation`
--
ALTER TABLE `area_creation`
  MODIFY `area_creation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_duefollowup_mapping`
--
ALTER TABLE `area_duefollowup_mapping`
  MODIFY `map_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_duefollowup_mapping_area`
--
ALTER TABLE `area_duefollowup_mapping_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_group_mapping`
--
ALTER TABLE `area_group_mapping`
  MODIFY `map_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_group_mapping_area`
--
ALTER TABLE `area_group_mapping_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_line_mapping`
--
ALTER TABLE `area_line_mapping`
  MODIFY `map_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_line_mapping_area`
--
ALTER TABLE `area_line_mapping_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_list_creation`
--
ALTER TABLE `area_list_creation`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_creation`
--
ALTER TABLE `bank_creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `bank_stmt`
--
ALTER TABLE `bank_stmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `branch_creation`
--
ALTER TABLE `branch_creation`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_tally`
--
ALTER TABLE `cash_tally`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `cash_tally_modes`
--
ALTER TABLE `cash_tally_modes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cheque_info`
--
ALTER TABLE `cheque_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cheque_no_list`
--
ALTER TABLE `cheque_no_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cheque_upd`
--
ALTER TABLE `cheque_upd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `closed_status`
--
ALTER TABLE `closed_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `closing_customer`
--
ALTER TABLE `closing_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `coll_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `collection_charges`
--
ALTER TABLE `collection_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `commitment`
--
ALTER TABLE `commitment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_creation`
--
ALTER TABLE `company_creation`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `concern_creation`
--
ALTER TABLE `concern_creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `concern_subject`
--
ALTER TABLE `concern_subject`
  MODIFY `concern_sub_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `confirmation_followup`
--
ALTER TABLE `confirmation_followup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_bank_collection`
--
ALTER TABLE `ct_bank_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_bag`
--
ALTER TABLE `ct_cr_bag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_bank_withdraw`
--
ALTER TABLE `ct_cr_bank_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_bdeposit`
--
ALTER TABLE `ct_cr_bdeposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_bel`
--
ALTER TABLE `ct_cr_bel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_bexchange`
--
ALTER TABLE `ct_cr_bexchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_binvest`
--
ALTER TABLE `ct_cr_binvest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_boti`
--
ALTER TABLE `ct_cr_boti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_cash_deposit`
--
ALTER TABLE `ct_cr_cash_deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_hag`
--
ALTER TABLE `ct_cr_hag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_hdeposit`
--
ALTER TABLE `ct_cr_hdeposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_hel`
--
ALTER TABLE `ct_cr_hel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_hexchange`
--
ALTER TABLE `ct_cr_hexchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_hinvest`
--
ALTER TABLE `ct_cr_hinvest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_cr_hoti`
--
ALTER TABLE `ct_cr_hoti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_bag`
--
ALTER TABLE `ct_db_bag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_bank_deposit`
--
ALTER TABLE `ct_db_bank_deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_db_bdeposit`
--
ALTER TABLE `ct_db_bdeposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_bel`
--
ALTER TABLE `ct_db_bel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_bexchange`
--
ALTER TABLE `ct_db_bexchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_bexpense`
--
ALTER TABLE `ct_db_bexpense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_binvest`
--
ALTER TABLE `ct_db_binvest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_bissued`
--
ALTER TABLE `ct_db_bissued`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_cash_withdraw`
--
ALTER TABLE `ct_db_cash_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_exf`
--
ALTER TABLE `ct_db_exf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_hag`
--
ALTER TABLE `ct_db_hag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_hdeposit`
--
ALTER TABLE `ct_db_hdeposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_hel`
--
ALTER TABLE `ct_db_hel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_hexchange`
--
ALTER TABLE `ct_db_hexchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_hexpense`
--
ALTER TABLE `ct_db_hexpense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_hinvest`
--
ALTER TABLE `ct_db_hinvest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_db_hissued`
--
ALTER TABLE `ct_db_hissued`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `ct_hand_collection`
--
ALTER TABLE `ct_hand_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `customer_profile`
--
ALTER TABLE `customer_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_register`
--
ALTER TABLE `customer_register`
  MODIFY `cus_reg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `customer_status`
--
ALTER TABLE `customer_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_feedback_name`
--
ALTER TABLE `cus_feedback_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_old_data`
--
ALTER TABLE `cus_old_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `director_creation`
--
ALTER TABLE `director_creation`
  MODIFY `dir_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_info`
--
ALTER TABLE `document_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `document_track`
--
ALTER TABLE `document_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doc_mapping`
--
ALTER TABLE `doc_mapping`
  MODIFY `doc_map_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doc_replace_ids`
--
ALTER TABLE `doc_replace_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_areas`
--
ALTER TABLE `event_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_promotion`
--
ALTER TABLE `event_promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `fingerprints`
--
ALTER TABLE `fingerprints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `gold_info`
--
ALTER TABLE `gold_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holiday_creation`
--
ALTER TABLE `holiday_creation`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_upload`
--
ALTER TABLE `home_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `in_acknowledgement`
--
ALTER TABLE `in_acknowledgement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `in_issue`
--
ALTER TABLE `in_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_calculation`
--
ALTER TABLE `loan_calculation`
  MODIFY `loan_cal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_category`
--
ALTER TABLE `loan_category`
  MODIFY `loan_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_category_creation`
--
ALTER TABLE `loan_category_creation`
  MODIFY `loan_category_creation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_category_ref`
--
ALTER TABLE `loan_category_ref`
  MODIFY `loan_category_ref_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_followup`
--
ALTER TABLE `loan_followup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_issue`
--
ALTER TABLE `loan_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_scheme`
--
ALTER TABLE `loan_scheme`
  MODIFY `scheme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_summary_feedback`
--
ALTER TABLE `loan_summary_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_audit`
--
ALTER TABLE `location_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `name_detail_creation`
--
ALTER TABLE `name_detail_creation`
  MODIFY `name_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `new_cus_promo`
--
ALTER TABLE `new_cus_promo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `new_promotion`
--
ALTER TABLE `new_promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noc`
--
ALTER TABLE `noc`
  MODIFY `noc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `noc_cheque_checklist`
--
ALTER TABLE `noc_cheque_checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noc_doc_checklist`
--
ALTER TABLE `noc_doc_checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noc_endorse_checklist`
--
ALTER TABLE `noc_endorse_checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noc_gold_checklist`
--
ALTER TABLE `noc_gold_checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noc_mort_checklist`
--
ALTER TABLE `noc_mort_checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noc_sign_checklist`
--
ALTER TABLE `noc_sign_checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_category_info`
--
ALTER TABLE `request_category_info`
  MODIFY `cat_info` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_creation`
--
ALTER TABLE `request_creation`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `signed_doc`
--
ALTER TABLE `signed_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `signed_doc_info`
--
ALTER TABLE `signed_doc_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_creation`
--
ALTER TABLE `staff_creation`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_type_creation`
--
ALTER TABLE `staff_type_creation`
  MODIFY `staff_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_area_list_creation`
--
ALTER TABLE `sub_area_list_creation`
  MODIFY `sub_area_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `verification_bank_info`
--
ALTER TABLE `verification_bank_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_cus_feedback`
--
ALTER TABLE `verification_cus_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_documentation`
--
ALTER TABLE `verification_documentation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_family_info`
--
ALTER TABLE `verification_family_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_group_info`
--
ALTER TABLE `verification_group_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_kyc_info`
--
ALTER TABLE `verification_kyc_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_loan_calculation`
--
ALTER TABLE `verification_loan_calculation`
  MODIFY `loan_cal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_property_info`
--
ALTER TABLE `verification_property_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verif_loan_cal_category`
--
ALTER TABLE `verif_loan_cal_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `closing_customer`
--
ALTER TABLE `closing_customer`
  ADD CONSTRAINT `requestForegin` FOREIGN KEY (`req_id`) REFERENCES `request_creation` (`req_id`);

--
-- Constraints for table `event_areas`
--
ALTER TABLE `event_areas`
  ADD CONSTRAINT `event_areas_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
