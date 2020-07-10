-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DBProject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBProject` DEFAULT CHARACTER SET utf8 ;
USE `DBProject` ;

-- -----------------------------------------------------
-- Table `DBProject`.`station_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBProject`.`station_details` (
  `station_id` DECIMAL(15,2) NOT NULL,
  `station_name` VARCHAR(200) NULL,
  `elev_m` DECIMAL(6,2) NULL,
  `call_code` VARCHAR(8) NULL,
  PRIMARY KEY (`station_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBProject`.`state_lockdown_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBProject`.`state_lockdown_details` (
  `state` VARCHAR(30) NOT NULL,
  `date_stay_at_home_announced` DATETIME NULL,
  `date_stay_at_home_effective` DATETIME NULL,
  PRIMARY KEY (`state`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBProject`.`county_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBProject`.`county_details` (
  `fips` VARCHAR(20) NOT NULL,
  `county` VARCHAR(50) NULL,
  `state` VARCHAR(30) NOT NULL,
  `total_population` INT NULL,
  `lat` FLOAT NULL,
  `lon` FLOAT NULL,
  `area_sqmi` FLOAT NULL,
  PRIMARY KEY (`fips`, `state`),
  INDEX `fk_county_details_state_lockdown_details1_idx` (`state` ASC) VISIBLE,
  CONSTRAINT `fk_county_details_state_lockdown_details1`
    FOREIGN KEY (`state`)
    REFERENCES `DBProject`.`state_lockdown_details` (`state`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBProject`.`fips_daily_cases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBProject`.`fips_daily_cases` (
  `fips` VARCHAR(20) NOT NULL,
  `date_recorded` DATETIME NOT NULL,
  `cases` INT NULL,
  `deaths` INT NULL,
  PRIMARY KEY (`fips`, `date_recorded`),
  INDEX `fk_fips_daily_cases_county_details1_idx` (`fips` ASC) VISIBLE,
  CONSTRAINT `fk_fips_daily_cases_county_details1`
    FOREIGN KEY (`fips`)
    REFERENCES `DBProject`.`county_details` (`fips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBProject`.`daily_weather_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBProject`.`daily_weather_details` (
  `fips` VARCHAR(20) NOT NULL,
  `date_recorded` DATETIME NOT NULL,
  `mean_temp` DECIMAL(6,2) NULL,
  `min_temp` DECIMAL(6,2) NULL,
  `max_temp` DECIMAL(6,2) NULL,
  `dewpoint` DECIMAL(6,2) NULL,
  `sea_level_pressure` DECIMAL(6,2) NULL,
  `station_pressure` DECIMAL(6,2) NULL,
  `visibility` DECIMAL(6,2) NULL,
  `wind_speed` DECIMAL(6,2) NULL,
  `max_wind_speed` DECIMAL(6,2) NULL,
  `wind_gust` DECIMAL(6,2) NULL,
  `precipitation` DECIMAL(6,2) NULL,
  `precip_flag` VARCHAR(4) NULL,
  `fog` DECIMAL(6,2) NULL,
  `rain` DECIMAL(6,2) NULL,
  `snow` DECIMAL(6,2) NULL,
  `hail` DECIMAL(6,2) NULL,
  `thunder` DECIMAL(6,2) NULL,
  `tornado` DECIMAL(6,2) NULL,
  PRIMARY KEY (`date_recorded`, `fips`),
  INDEX `fk_daily_weather_details_county_details1_idx` (`fips` ASC) VISIBLE,
  CONSTRAINT `fk_daily_weather_details_county_details1`
    FOREIGN KEY (`fips`)
    REFERENCES `DBProject`.`county_details` (`fips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBProject`.`county_socio_health`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBProject`.`county_socio_health` (
  `num_deaths` INT NULL,
  `years_of_potential_life_lost_rate` FLOAT NULL,
  `percent_fair_or_poor_health` FLOAT NULL,
  `average_number_of_physically_unhealthy_days` FLOAT NULL,
  `average_number_of_mentally_unhealthy_days` FLOAT NULL,
  `percent_low_birthweight` FLOAT NULL,
  `percent_smokers` FLOAT NULL,
  `percent_adults_with_obesity` FLOAT NULL,
  `food_environment_index` FLOAT NULL,
  `percent_physically_inactive` FLOAT NULL,
  `percent_with_access_to_exercise_opportunities` FLOAT NULL,
  `percent_excessive_drinking` FLOAT NULL,
  `num_alcohol_impaired_driving_deaths` FLOAT NULL,
  `num_driving_deaths` FLOAT NULL,
  `percent_driving_deaths_with_alcohol_involvement` FLOAT NULL,
  `num_chlamydia_cases` FLOAT NULL,
  `chlamydia_rate` FLOAT NULL,
  `teen_birth_rate` FLOAT NULL,
  `num_uninsured` FLOAT NULL,
  `percent_uninsured` FLOAT NULL,
  `num_primary_care_physicians` FLOAT NULL,
  `primary_care_physicians_rate` FLOAT NULL,
  `num_dentists` FLOAT NULL,
  `dentist_rate` FLOAT NULL,
  `num_mental_health_providers` FLOAT NULL,
  `mental_health_provider_rate` FLOAT NULL,
  `preventable_hospitalization_rate` FLOAT NULL,
  `percent_with_annual_mammogram` FLOAT NULL,
  `percent_vaccinated` FLOAT NULL,
  `high_school_graduation_rate` FLOAT NULL,
  `num_some_college` FLOAT NULL,
  `population` FLOAT NULL,
  `percent_some_college` FLOAT NULL,
  `num_unemployed_CHR` FLOAT NULL,
  `labor_force` FLOAT NULL,
  `percent_unemployed_CHR` FLOAT NULL,
  `percent_children_in_poverty` FLOAT NULL,
  `eightieth_percentile_income` FLOAT NULL,
  `twentieth_percentile_income` FLOAT NULL,
  `income_ratio` FLOAT NULL,
  `num_single_parent_households_CHR` FLOAT NULL,
  `num_households_CHR` FLOAT NULL,
  `percent_single_parent_households_CHR` FLOAT NULL,
  `num_associations` FLOAT NULL,
  `social_association_rate` FLOAT NULL,
  `annual_average_violent_crimes` FLOAT NULL,
  `violent_crime_rate` FLOAT NULL,
  `num_injury_deaths` FLOAT NULL,
  `injury_death_rate` FLOAT NULL,
  `average_daily_pm2_5` FLOAT NULL,
  `presence_of_water_violation` VARCHAR(10) NULL,
  `percent_severe_housing_problems` FLOAT NULL,
  `severe_housing_cost_burden` FLOAT NULL,
  `overcrowding` FLOAT NULL,
  `inadequate_facilities` FLOAT NULL,
  `percent_drive_alone_to_work` FLOAT NULL,
  `num_workers_who_drive_alone` FLOAT NULL,
  `percent_long_commute_drives_alone` FLOAT NULL,
  `life_expectancy` FLOAT NULL,
  `num_deaths_2` FLOAT NULL,
  `age_adjusted_death_rate` FLOAT NULL,
  `num_deaths_3` FLOAT NULL,
  `child_mortality_rate` FLOAT NULL,
  `num_deaths_4` FLOAT NULL,
  `infant_mortality_rate` FLOAT NULL,
  `percent_frequent_physical_distress` FLOAT NULL,
  `percent_frequent_mental_distress` FLOAT NULL,
  `percent_adults_with_diabetes` FLOAT NULL,
  `num_hiv_cases` FLOAT NULL,
  `hiv_prevalence_rate` FLOAT NULL,
  `num_food_insecure` FLOAT NULL,
  `num_limited_access` FLOAT NULL,
  `percent_limited_access_to_healthy_foods` FLOAT NULL,
  `num_drug_overdose_deaths` FLOAT NULL,
  `drug_overdose_mortality_rate` FLOAT NULL,
  `num_motor_vehicle_deaths` FLOAT NULL,
  `motor_vehicle_mortality_rate` FLOAT NULL,
  `percent_insufficient_sleep` FLOAT NULL,
  `num_uninsured_2` FLOAT NULL,
  `percent_uninsured_2` FLOAT NULL,
  `num_uninsured_3` FLOAT NULL,
  `percent_uninsured_3` FLOAT NULL,
  `other_primary_care_provider_rate` FLOAT NULL,
  `percent_disconnected_youth` FLOAT NULL,
  `average_grade_performance` FLOAT NULL,
  `average_grade_performance_2` FLOAT NULL,
  `median_household_income` FLOAT NULL,
  `percent_enrolled_in_free_or_reduced_lunch` FLOAT NULL,
  `segregation_index` FLOAT NULL,
  `segregation_index_2` FLOAT NULL,
  ` homicide_rate` FLOAT NULL,
  `num_deaths_5` FLOAT NULL,
  `suicide_rate_age_adjusted` FLOAT NULL,
  `num_firearm_fatalities` FLOAT NULL,
  `firearm_fatalities_rate` FLOAT NULL,
  `juvenile_arrest_rate` FLOAT NULL,
  `average_traffic_volume_per_meter_of_major_roadways` FLOAT NULL,
  `num_homeowners` FLOAT NULL,
  `percent_homeowners` FLOAT NULL,
  `num_households_with_severe_cost_burden` FLOAT NULL,
  `percent_severe_housing_cost_burden` FLOAT NULL,
  `population_2` FLOAT NULL,
  `percent_less_than_18_years_of_age` FLOAT NULL,
  `percent_65_and_over` FLOAT NULL,
  `num_black` FLOAT NULL,
  `percent_black` FLOAT NULL,
  `num_american_indian_alaska_native` FLOAT NULL,
  `percent_american_indian_alaska_native` FLOAT NULL,
  `num_asian` FLOAT NULL,
  `percent_asian` FLOAT NULL,
  `num_native_hawaiian_other_pacific_islander` FLOAT NULL,
  `percent_native_hawaiian_other_pacific_islander` FLOAT NULL,
  `num_hispanic` FLOAT NULL,
  `percent_hispanic` FLOAT NULL,
  `num_non_hispanic_white` FLOAT NULL,
  `percent_non_hispanic_white` FLOAT NULL,
  `num_not_proficient_in_english` FLOAT NULL,
  `percent_not_proficient_in_english` FLOAT NULL,
  `percent_female` FLOAT NULL,
  `num_rural` FLOAT NULL,
  `percent_rural` FLOAT NULL,
  `num_housing_units` FLOAT NULL,
  `num_households_CDC` FLOAT NULL,
  `num_below_poverty` FLOAT NULL,
  `num_unemployed_CDC` FLOAT NULL,
  `per_capita_income` FLOAT NULL,
  `num_no_highschool_diploma` FLOAT NULL,
  `num_age_65_and_older` FLOAT NULL,
  `num_age_17_and_younger` FLOAT NULL,
  `num_disabled` FLOAT NULL,
  `num_single_parent_households_CDC` FLOAT NULL,
  `num_minorities` FLOAT NULL,
  `num_limited_english_abilities` FLOAT NULL,
  `num_multi_unit_housing` FLOAT NULL,
  `num_mobile_homes` FLOAT NULL,
  `num_overcrowding` FLOAT NULL,
  `num_households_with_no_vehicle` FLOAT NULL,
  `percent_below_poverty` FLOAT NULL,
  `percent_unemployed_CDC` FLOAT NULL,
  `percent_no_highschool_diploma` FLOAT NULL,
  `percent_age_65_and_older` FLOAT NULL,
  `percent_age_17_and_younger` FLOAT NULL,
  `percent_single_parent_households_CDC` FLOAT NULL,
  `percent_minorities` FLOAT NULL,
  `percent_limited_english_abilities` FLOAT NULL,
  `percent_multi_unit_housing` FLOAT NULL,
  `percent_mobile_homes` FLOAT NULL,
  `percent_overcrowding` FLOAT NULL,
  `percent_no_vehicle` FLOAT NULL,
  `percent_institutionalized_in_group_quarters` FLOAT NULL,
  `percentile_rank_below_poverty` FLOAT NULL,
  `percentile_rank_unemployed` FLOAT NULL,
  `percentile_rank_per_capita_income` FLOAT NULL,
  `percentile_rank_no_highschool_diploma` FLOAT NULL,
  `percentile_rank_socioeconomic_theme` FLOAT NULL,
  `percentile_rank_age_65_and_older` FLOAT NULL,
  `percentile_rank_age_17_and_younger` FLOAT NULL,
  `percentile_rank_disabled` FLOAT NULL,
  `percentile_rank_single_parent_households` FLOAT NULL,
  `percentile_rank_household_comp_disability_theme` FLOAT NULL,
  `percentile_rank_minorities` FLOAT NULL,
  `percentile_rank_limited_english_abilities` FLOAT NULL,
  `percentile_rank_minority_status_and_language_theme` FLOAT NULL,
  `percentile_rank_multi_unit_housing` FLOAT NULL,
  `percentile_rank_mobile_homes` FLOAT NULL,
  `percentile_rank_overcrowding` FLOAT NULL,
  `percentile_rank_no_vehicle` FLOAT NULL,
  `percentile_rank_institutionalized_in_group_quarters` FLOAT NULL,
  `percentile_rank_housing_and_transportation` FLOAT NULL,
  `percentile_rank_social_vulnerability` FLOAT NULL,
  `km_to_closest_station` DECIMAL(6,2) NULL,
  `num_institutionalized_in_group_quarters` FLOAT NULL,
  `percent_disabled` FLOAT NULL,
  `percent_food_insecure` FLOAT NULL,
  `homicide_rate` FLOAT NULL,
  `fips` VARCHAR(20) NOT NULL,
  `station_id` DECIMAL(15,2) NULL,
  PRIMARY KEY (`fips`),
  INDEX `fk_county_socio_health_county_details1_idx` (`fips` ASC) VISIBLE,
  INDEX `fk_county_socio_health_station_details1_idx` (`station_id` ASC) VISIBLE,
  CONSTRAINT `fk_county_socio_health_county_details1`
    FOREIGN KEY (`fips`)
    REFERENCES `DBProject`.`county_details` (`fips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_county_socio_health_station_details1`
    FOREIGN KEY (`station_id`)
    REFERENCES `DBProject`.`station_details` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
