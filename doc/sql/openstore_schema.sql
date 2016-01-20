CREATE TABLE color_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', color_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', name VARCHAR(80) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_C81038637ADA1FB5 (color_id), INDEX IDX_C810386331098462 (lang), INDEX name_idx (name), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (color_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Color translation table' ;
CREATE TABLE product_pricelist (product_pricelist_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, pricelist_id SMALLINT UNSIGNED NOT NULL, product_id BIGINT UNSIGNED NOT NULL, status_id SMALLINT UNSIGNED DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the product is active in public website', price NUMERIC(12, 6) NOT NULL COMMENT 'Unit sales price discounts included', minimum_price NUMERIC(12, 6) NOT NULL COMMENT 'Minimum sale under wich product cannot be sold (discounts must be checked)', list_price NUMERIC(12, 6) NOT NULL COMMENT 'Unit sales list price wihtout discounts', public_price NUMERIC(12, 6) DEFAULT NULL COMMENT 'Unit public/msrp price', map_price NUMERIC(12, 6) DEFAULT NULL COMMENT 'Minimum advertised price, only where regulation applies', sale_minimum_qty NUMERIC(16, 6) DEFAULT NULL COMMENT 'Sales minimum quantity', sale_multiple_qty NUMERIC(16, 6) DEFAULT NULL COMMENT 'Sales multiple quantity', discount_1 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 1', discount_2 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 2', discount_3 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 3', discount_4 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 4', is_liquidation TINYINT(1) DEFAULT NULL COMMENT 'Whether the product is considered as liquidation (stock clearance), , eventual discounts will appear in discount_1,_2...', is_new TINYINT(1) DEFAULT NULL COMMENT 'Whether the product is considered as a new product in this pricelist', is_bestseller TINYINT(1) DEFAULT NULL COMMENT 'Whether the product is considered as a best seller in this pricelist', is_bestvalue TINYINT(1) DEFAULT NULL COMMENT 'Whether the product is considered as a best value in this pricelist', is_hot TINYINT(1) DEFAULT NULL COMMENT 'Whether the product is considered as a hot product in this pricelist', is_promotional TINYINT(1) DEFAULT NULL COMMENT 'Whether the product is considered as promotional, eventual discounts will appear in discount_1,_2...', promo_start_at DATE DEFAULT NULL COMMENT 'Discount started at', promo_end_at DATE DEFAULT NULL COMMENT 'Discount end at', available_at DATE DEFAULT NULL COMMENT 'Date on which product was made available, useful to display as new product', unavailable_at DATE DEFAULT NULL COMMENT 'Date on which product was/will be made unavailable', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', deleted_at DATETIME DEFAULT NULL COMMENT 'Record deletion date', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_326F5CE089045958 (pricelist_id), INDEX IDX_326F5CE04584665A (product_id), INDEX IDX_326F5CE06BF700BD (status_id), INDEX price_idx (price), UNIQUE INDEX unique_product_price_idx (pricelist_id, product_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(product_pricelist_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product pricelist' ;
CREATE TABLE sale_order_status_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', status_id SMALLINT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', title VARCHAR(80) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_7017D856BF700BD (status_id), INDEX IDX_7017D8531098462 (lang), INDEX title_idx (title), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (status_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Order type translation table' ;
CREATE TABLE sale_order_line_status_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', status_id SMALLINT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', title VARCHAR(80) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_F4D5EE4B6BF700BD (status_id), INDEX IDX_F4D5EE4B31098462 (lang), INDEX title_idx (title), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (status_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Order line status translation table' ;
CREATE TABLE user_scope (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, user_id INT UNSIGNED NOT NULL, customer_id INT UNSIGNED NOT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the user can activate the pricelist', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_E26DAE8BA76ED395 (user_id), INDEX IDX_E26DAE8B9395C3F3 (customer_id), UNIQUE INDEX unique_user_customer_idx (user_id, customer_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'User scope (customer, rep...)' ;
CREATE TABLE product_group (group_id INT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the group is active in public website', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_slug_idx (slug), PRIMARY KEY(group_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product group table' ;
CREATE TABLE api_key (api_id INT UNSIGNED AUTO_INCREMENT NOT NULL, api_key VARCHAR(64) NOT NULL COMMENT 'Api key (token)', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the api_key is active', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_api_key_idx (api_key), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(api_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Api credentials' ;
CREATE TABLE product_unit_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', unit_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', reference VARCHAR(10) DEFAULT NULL, title VARCHAR(80) DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_A1824BB5F8BD700D (unit_id), INDEX IDX_A1824BB531098462 (lang), INDEX description_idx (description), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (unit_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product unit translation' ;
CREATE TABLE product_serie (serie_id INT UNSIGNED AUTO_INCREMENT NOT NULL, brand_id INT UNSIGNED DEFAULT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(10000) DEFAULT NULL, specs VARCHAR(10000) DEFAULT NULL COMMENT 'Specifications', revision INT UNSIGNED DEFAULT 1 COMMENT 'Translation revision number', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the serie is active in public website', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_B66E86844F5D008 (brand_id), INDEX title_idx (title), INDEX description_idx (description), INDEX revision_idx (revision), UNIQUE INDEX unique_brand_reference_idx (brand_id, reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_slug_idx (slug), PRIMARY KEY(serie_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product serie table' ;
CREATE TABLE customer_pricelist (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, pricelist_id SMALLINT UNSIGNED NOT NULL, customer_id INT UNSIGNED NOT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the customer can activate the pricelist', activated_at DATE DEFAULT NULL COMMENT 'Date on which this pricelist was activated', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_F732127789045958 (pricelist_id), INDEX IDX_F73212779395C3F3 (customer_id), UNIQUE INDEX unique_user_pricelist_idx (customer_id, pricelist_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Customer pricelists' ;
CREATE TABLE media_container (container_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(50) NOT NULL, folder VARCHAR(255) NOT NULL, title VARCHAR(100) DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', deleted_at DATETIME DEFAULT NULL COMMENT 'Record deletion date', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_folder_idx (folder), UNIQUE INDEX unique_reference_idx (reference), PRIMARY KEY(container_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Media container table' ;
CREATE TABLE product (product_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, parent_id BIGINT UNSIGNED DEFAULT NULL, brand_id INT UNSIGNED DEFAULT NULL, group_id INT UNSIGNED DEFAULT NULL, model_id INT UNSIGNED DEFAULT NULL, serie_id INT UNSIGNED DEFAULT NULL, category_id INT UNSIGNED DEFAULT NULL, type_id SMALLINT UNSIGNED DEFAULT NULL, status_id SMALLINT UNSIGNED DEFAULT NULL, unit_id INT UNSIGNED DEFAULT NULL, product_stub_id INT UNSIGNED DEFAULT NULL, primary_color_id INT UNSIGNED DEFAULT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Unique reference, may include supplier information to maintain uniqueness', display_reference VARCHAR(60) DEFAULT NULL COMMENT 'Displayable reference, without extra info to maintain uniqueness', search_reference VARCHAR(60) DEFAULT NULL COMMENT 'Reference used for searches, may differ from display reference, some chars may be replaced', slug VARCHAR(255) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(150) DEFAULT NULL, invoice_title VARCHAR(100) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, characteristic VARCHAR(150) DEFAULT NULL, keywords VARCHAR(255) DEFAULT NULL, volume NUMERIC(12, 6) DEFAULT NULL COMMENT 'Volume per sales unit in m3', weight NUMERIC(12, 6) DEFAULT NULL COMMENT 'Weight per sales unit in Kg', length NUMERIC(12, 6) DEFAULT NULL COMMENT 'Length per sales unit in meter', height NUMERIC(12, 6) DEFAULT NULL COMMENT 'Heigth per sales unit in meter', width NUMERIC(12, 6) DEFAULT NULL COMMENT 'Width per sales unit in meter', diameter NUMERIC(10, 8) DEFAULT NULL COMMENT 'Diameter in meter', format VARCHAR(10) DEFAULT NULL COMMENT 'Format, i.e. 10x10..', pack_qty_box NUMERIC(15, 6) DEFAULT NULL COMMENT 'Packaging items per box', pack_qty_carton NUMERIC(15, 6) DEFAULT NULL COMMENT 'Packaging items per carton', pack_qty_master_carton NUMERIC(15, 6) DEFAULT NULL COMMENT 'Packaging items per master carton', pack_qty_palet NUMERIC(15, 6) DEFAULT NULL COMMENT 'Packaging items per palet', barcode_ean13 VARCHAR(13) DEFAULT NULL COMMENT 'EAN13 barcode', barcode_upca VARCHAR(20) DEFAULT NULL COMMENT 'UPCA barcode', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the product is active in public website', sort_index INT DEFAULT NULL, available_at DATE DEFAULT NULL COMMENT 'Date on which product was made available', unavailable_at DATE DEFAULT NULL COMMENT 'Date on which product was/will be made unavailable', icon_class VARCHAR(40) DEFAULT NULL, trade_code_intrastat VARCHAR(20) DEFAULT NULL COMMENT 'European intrastat customs code', trade_code_hts VARCHAR(20) DEFAULT NULL COMMENT 'International Harmonized Trade System common nomenclature code', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', deleted_at DATETIME DEFAULT NULL COMMENT 'Record deletion date', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_D34A04AD727ACA70 (parent_id), INDEX IDX_D34A04AD44F5D008 (brand_id), INDEX IDX_D34A04ADFE54D947 (group_id), INDEX IDX_D34A04AD7975B7E7 (model_id), INDEX IDX_D34A04ADD94388BD (serie_id), INDEX IDX_D34A04AD12469DE2 (category_id), INDEX IDX_D34A04ADC54C8C93 (type_id), INDEX IDX_D34A04AD6BF700BD (status_id), INDEX IDX_D34A04ADF8BD700D (unit_id), INDEX IDX_D34A04AD389B0DBA (product_stub_id), INDEX IDX_D34A04AD5BA57244 (primary_color_id), INDEX title_idx (title), INDEX reference_idx (reference), INDEX search_reference_idx (search_reference), INDEX description_idx (description), INDEX characteristic_idx (characteristic), INDEX barcode_ean13_idx (barcode_ean13), INDEX barcode_upca_idx (barcode_upca), INDEX keywords_idx (keywords), UNIQUE INDEX unique_reference_idx (reference, brand_id, flag_active), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_slug_idx (slug), PRIMARY KEY(product_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product table' ;
CREATE TABLE sale_order_type (type_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the model is active in public website', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(type_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Order type table' ;
CREATE TABLE sale_rep (rep_id INT UNSIGNED AUTO_INCREMENT NOT NULL, country_id SMALLINT UNSIGNED DEFAULT NULL, reference VARCHAR(60) DEFAULT NULL COMMENT 'Reference', name VARCHAR(80) NOT NULL, first_name VARCHAR(40) DEFAULT NULL, street VARCHAR(80) DEFAULT NULL, street_2 VARCHAR(80) DEFAULT NULL, street_number VARCHAR(10) DEFAULT NULL, po_box VARCHAR(10) DEFAULT NULL, zipcode VARCHAR(20) DEFAULT NULL, city VARCHAR(60) DEFAULT NULL, phone VARCHAR(20) DEFAULT NULL, phone_2 VARCHAR(20) DEFAULT NULL, mobile VARCHAR(20) DEFAULT NULL, mobile_2 VARCHAR(20) DEFAULT NULL, fax VARCHAR(20) DEFAULT NULL, fax_2 VARCHAR(20) DEFAULT NULL, email VARCHAR(50) DEFAULT NULL, email_2 VARCHAR(50) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the rep is active', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_C84C7443F92F3E70 (country_id), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(rep_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Sales representative table' ;
CREATE TABLE product_category (category_id INT UNSIGNED AUTO_INCREMENT NOT NULL, parent_id INT UNSIGNED DEFAULT NULL, reference VARCHAR(50) DEFAULT NULL, slug VARCHAR(64) NOT NULL, title VARCHAR(64) NOT NULL, description VARCHAR(255) DEFAULT NULL, breadcrumb VARCHAR(1500) DEFAULT NULL, sort_index INT UNSIGNED DEFAULT NULL COMMENT 'Relative sort index', global_sort_index BIGINT UNSIGNED DEFAULT NULL COMMENT 'Global sort index', icon_class VARCHAR(40) DEFAULT NULL, lft INT UNSIGNED NOT NULL, rgt INT UNSIGNED NOT NULL, root BIGINT UNSIGNED DEFAULT NULL, lvl INT UNSIGNED NOT NULL, alt_mapping_reference VARCHAR(10) DEFAULT NULL COMMENT 'Alternative free reference code', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, created_by VARCHAR(40) DEFAULT NULL, updated_by VARCHAR(40) DEFAULT NULL, legacy_mapping VARCHAR(40) DEFAULT NULL, legacy_synchro_at DATETIME DEFAULT NULL, INDEX IDX_CDFC7356727ACA70 (parent_id), INDEX title_idx (title), INDEX description_idx (description), INDEX slug_idx (slug), INDEX lft_idx (lft), INDEX rgt_idx (rgt), INDEX lvl_idx (lvl), INDEX breadcrumb_idx (breadcrumb), INDEX alt_mapping_reference_idx (alt_mapping_reference), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_slug_idx (slug), PRIMARY KEY(category_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product category table' ;
CREATE TABLE permission (permission_id INT UNSIGNED AUTO_INCREMENT NOT NULL, name VARCHAR(128) NOT NULL, UNIQUE INDEX unique_name_idx (name), PRIMARY KEY(permission_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Custom permissions' ;
CREATE TABLE discount_condition (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, pricelist_id SMALLINT UNSIGNED DEFAULT NULL, customer_group_id SMALLINT UNSIGNED DEFAULT NULL, customer_id INT UNSIGNED DEFAULT NULL, brand_id INT UNSIGNED DEFAULT NULL, product_group_id INT UNSIGNED DEFAULT NULL, model_id INT UNSIGNED DEFAULT NULL, category_id INT UNSIGNED DEFAULT NULL, product_id BIGINT UNSIGNED DEFAULT NULL, discount_1 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 1', discount_2 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 2', discount_3 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 3', discount_4 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 4', fixed_price NUMERIC(12, 6) DEFAULT NULL COMMENT 'Fixed price, only for products', valid_from DATE DEFAULT NULL COMMENT 'Discount valid from', valid_till DATE DEFAULT NULL COMMENT 'Discount valid till', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(80) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_DD0C00BE89045958 (pricelist_id), INDEX IDX_DD0C00BED2919A68 (customer_group_id), INDEX IDX_DD0C00BE9395C3F3 (customer_id), INDEX IDX_DD0C00BE44F5D008 (brand_id), INDEX IDX_DD0C00BE35E4B3D0 (product_group_id), INDEX IDX_DD0C00BE7975B7E7 (model_id), INDEX IDX_DD0C00BE12469DE2 (category_id), INDEX IDX_DD0C00BE4584665A (product_id), INDEX valid_from_idx (valid_from), INDEX valid_till_idx (valid_till), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Discount conditions table' ;
CREATE TABLE revision (revision_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, related_table VARCHAR(40) NOT NULL COMMENT 'Related table', related_id BIGINT NOT NULL COMMENT 'Related table primary key', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', flag_revision_updated TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Whether the saving includes a new revision', revision INT DEFAULT NULL COMMENT 'Optional revision number, revision differ from version as it acts like a milestone', message VARCHAR(150) DEFAULT NULL COMMENT 'Log message, reason of change', previous_data VARCHAR(64000) NOT NULL COMMENT 'Previous data, stored as json', current_data VARCHAR(64000) NOT NULL COMMENT 'Data at time of saving, stored as json', INDEX related_table_idx (related_table), INDEX related_id_idx (related_id), INDEX revision_idx (revision), INDEX created_at_idx (created_at), UNIQUE INDEX unique_revison_log (related_table, related_id, created_at), PRIMARY KEY(revision_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Custom table revisions history' ;
CREATE TABLE pricelist (pricelist_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, stock_id SMALLINT UNSIGNED NOT NULL, currency_id INT UNSIGNED NOT NULL, discount_condition_pricelist_id SMALLINT UNSIGNED DEFAULT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, flag_enable_discount_condition TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether this pricelist must honour special discount conditions', flag_default TINYINT(1) DEFAULT NULL COMMENT 'Whether this pricelist is default', flag_public TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the pricelist is public', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the brand is active in public website', new_product_min_date DATE DEFAULT NULL COMMENT 'Flag products as new if more recent than this date', sort_index INT UNSIGNED DEFAULT NULL COMMENT 'Relative sort index', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_5CCFEA6DDCD6110 (stock_id), INDEX IDX_5CCFEA6D38248176 (currency_id), INDEX IDX_5CCFEA6D2E5F6947 (discount_condition_pricelist_id), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_flag_default_idx (flag_default), UNIQUE INDEX sort_index_idx (sort_index), PRIMARY KEY(pricelist_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Pricelist table' ;
CREATE TABLE product_set (set_id INT UNSIGNED AUTO_INCREMENT NOT NULL, type_id SMALLINT UNSIGNED DEFAULT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, url VARCHAR(80) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the brand is active in public website', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_63B71C3C54C8C93 (type_id), INDEX description_idx (description), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_title_idx (title), UNIQUE INDEX unique_slug_idx (slug), PRIMARY KEY(set_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product set table' ;
CREATE TABLE product_pricelist_stat (product_pricelist_stat_id BIGINT UNSIGNED NOT NULL, forecasted_monthly_sales NUMERIC(16, 6) DEFAULT NULL COMMENT 'Forecasted monthly sales quantity', first_sale_recorded_at DATE DEFAULT NULL COMMENT 'First recorded sale at', latest_sale_recorded_at DATE DEFAULT NULL COMMENT 'Latest recorded sale at', nb_customers INT DEFAULT NULL COMMENT 'Number of distinct customers', nb_sale_reps INT DEFAULT NULL COMMENT 'Number of distinct sales reps', nb_orders INT DEFAULT NULL COMMENT 'Number of distinct orders', total_recorded_quantity NUMERIC(15, 6) DEFAULT NULL COMMENT 'Total recorded order line quantity', total_recorded_turnover NUMERIC(15, 6) DEFAULT NULL COMMENT 'Total recorded turn over', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(product_pricelist_stat_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product pricelist quick statistics' ;
CREATE TABLE customer_group (group_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the group is active in public website', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(group_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Customer group table' ;
CREATE TABLE sale_order_line_status (status_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, flag_default TINYINT(1) DEFAULT NULL COMMENT 'Is the default state', flag_readonly TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Is readonly', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the model is active in public website', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_flag_default_idx (flag_default), PRIMARY KEY(status_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Order line status table' ;
CREATE TABLE product_packaging (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, type_id SMALLINT UNSIGNED NOT NULL, product_id BIGINT UNSIGNED NOT NULL, quantity NUMERIC(12, 6) NOT NULL COMMENT 'Product unit quantity in the packaging', volume NUMERIC(12, 6) DEFAULT NULL COMMENT 'Volume per sales unit in m3', weight NUMERIC(12, 6) DEFAULT NULL COMMENT 'Weight per sales unit in Kg', length NUMERIC(12, 6) DEFAULT NULL COMMENT 'Length per sales unit in meter', height NUMERIC(12, 6) DEFAULT NULL COMMENT 'Heigth per sales unit in meter', width NUMERIC(12, 6) DEFAULT NULL COMMENT 'Width per sales unit in meter', barcode_ean VARCHAR(20) DEFAULT NULL COMMENT 'EAN barcode', barcode_upc VARCHAR(20) DEFAULT NULL COMMENT 'UPCA barcode', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_D12BBB08C54C8C93 (type_id), INDEX IDX_D12BBB084584665A (product_id), UNIQUE INDEX unique_product_packaging_idx (type_id, product_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product packaging information' ;
CREATE TABLE user (user_id INT UNSIGNED AUTO_INCREMENT NOT NULL, lang VARCHAR(2) DEFAULT NULL COMMENT 'iso_631_1 language code 2 digits', username VARCHAR(80) DEFAULT NULL, email VARCHAR(130) NOT NULL, displayName VARCHAR(50) DEFAULT NULL, password VARCHAR(128) NOT NULL, INDEX IDX_8D93D64931098462 (lang), UNIQUE INDEX unique_username_idx (username), UNIQUE INDEX unique_email_idx (email), PRIMARY KEY(user_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'User table' ;
CREATE TABLE user_role (user_id INT UNSIGNED NOT NULL, role_id INT UNSIGNED NOT NULL, INDEX IDX_2DE8C6A3A76ED395 (user_id), INDEX IDX_2DE8C6A3D60322AC (role_id), PRIMARY KEY(user_id, role_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE product_status (status_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, flag_product_archived TINYINT(1) DEFAULT '0' COMMENT 'Tells if products in this status are kept for history purpose', flag_default TINYINT(1) DEFAULT NULL COMMENT 'Is the default state', flag_till_end_of_stock TINYINT(1) DEFAULT '0' COMMENT 'Whether the product is a available till end of stock', flag_end_of_lifecycle TINYINT(1) DEFAULT '0' COMMENT 'Whether the product is in end of lifecycle', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the status is active', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_flag_default_idx (flag_default), PRIMARY KEY(status_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product status table' ;
CREATE TABLE product_model_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', model_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(16000) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_6EEE4ED07975B7E7 (model_id), INDEX IDX_6EEE4ED031098462 (lang), INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (model_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product model translation table' ;
CREATE TABLE sale_order_status (status_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, flag_default TINYINT(1) DEFAULT NULL COMMENT 'Is the default state', flag_readonly TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Is readonly', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the model is active in public website', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_flag_default_idx (flag_default), PRIMARY KEY(status_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Order status table' ;
CREATE TABLE product_stub_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', product_stub_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', description_header VARCHAR(5000) DEFAULT NULL COMMENT 'Description header that will be prepended to product desc', description_footer VARCHAR(5000) DEFAULT NULL COMMENT 'Description footer that will be appended to product desc', specs VARCHAR(5000) DEFAULT NULL COMMENT 'Common product stub specifications', keywords VARCHAR(200) DEFAULT NULL, revision INT UNSIGNED DEFAULT 1 COMMENT 'Translation revision number', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_89DB144E389B0DBA (product_stub_id), INDEX IDX_89DB144E31098462 (lang), INDEX description_idx (description_header), INDEX keywords_idx (keywords), INDEX revision_idx (revision), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (product_stub_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product stub translation table' ;
CREATE TABLE currency (currency_id INT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, symbol VARCHAR(4) DEFAULT NULL COMMENT 'Symbol', display_decimals SMALLINT UNSIGNED DEFAULT 2 COMMENT 'Number of decimals to display', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_title_idx (title), PRIMARY KEY(currency_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Currency table' ;
CREATE TABLE product_media (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, product_id BIGINT UNSIGNED NOT NULL, media_id BIGINT UNSIGNED NOT NULL, type_id INT UNSIGNED NOT NULL, flag_primary TINYINT(1) DEFAULT NULL, sort_index INT UNSIGNED DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_CB70DA504584665A (product_id), INDEX IDX_CB70DA50EA9FDD75 (media_id), INDEX IDX_CB70DA50C54C8C93 (type_id), INDEX sort_index_idx (sort_index), UNIQUE INDEX unique_product_media_type_idx (product_id, media_id, type_id), UNIQUE INDEX unique_product_type_flag_primary_idx (type_id, product_id, flag_primary), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product media table' ;
CREATE TABLE country (country_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(2) NOT NULL COMMENT 'ISO country code', name VARCHAR(40) NOT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the brand is country in public website', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(country_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Country table' ;
CREATE TABLE sale_invoice (invoice_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) DEFAULT NULL COMMENT 'Reference', customer_reference VARCHAR(60) DEFAULT NULL COMMENT 'Customer reference', comment VARCHAR(255) DEFAULT NULL COMMENT 'Comment', invoiced_at DATETIME DEFAULT NULL COMMENT 'Invoice date', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', deleted_at DATETIME DEFAULT NULL COMMENT 'Record deletion date', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX invoiced_at_idx (invoiced_at), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(invoice_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Sales invoices table' ;
CREATE TABLE sale_order_line (line_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, order_id BIGINT UNSIGNED DEFAULT NULL, status_id SMALLINT UNSIGNED NOT NULL, delivery_id BIGINT UNSIGNED DEFAULT NULL, invoice_id BIGINT UNSIGNED DEFAULT NULL, product_id BIGINT UNSIGNED NOT NULL, line_number SMALLINT UNSIGNED DEFAULT NULL COMMENT 'Order line number for display, sort....', reference VARCHAR(60) DEFAULT NULL COMMENT 'Reference', quantity NUMERIC(12, 6) NOT NULL COMMENT 'Ordered quantity', price NUMERIC(12, 6) NOT NULL COMMENT 'Total price of line', discount_1 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 1', discount_2 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 2', discount_3 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 3', discount_4 NUMERIC(9, 6) DEFAULT '0' NOT NULL COMMENT 'Regular discount 4', comment VARCHAR(512) DEFAULT NULL COMMENT 'Internal comment', customer_reference VARCHAR(60) DEFAULT NULL COMMENT 'Customer reference', customer_comment VARCHAR(255) DEFAULT NULL COMMENT 'Customer comment', delivered_at DATETIME DEFAULT NULL COMMENT 'Delivery date', invoiced_at DATETIME DEFAULT NULL COMMENT 'Invoice date', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', deleted_at DATETIME DEFAULT NULL COMMENT 'Record deletion date', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_61B16AA58D9F6D38 (order_id), INDEX IDX_61B16AA56BF700BD (status_id), INDEX IDX_61B16AA512136921 (delivery_id), INDEX IDX_61B16AA52989F1FD (invoice_id), INDEX IDX_61B16AA54584665A (product_id), INDEX delivered_at_idx (delivered_at), INDEX invoiced_at_idx (invoiced_at), INDEX line_number_idx (line_number), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(line_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Order line table' ;
CREATE TABLE product_serie_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', serie_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(16000) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_7D0456FD94388BD (serie_id), INDEX IDX_7D0456F31098462 (lang), INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (serie_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product serie translation table' ;
CREATE TABLE language (id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', title VARCHAR(40) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the language is active', flag_default TINYINT(1) DEFAULT NULL COMMENT 'Is the language default', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX title_idx (title), UNIQUE INDEX unique_lang_idx (lang), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_flag_default_idx (flag_default), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Language table' ;
CREATE TABLE api_key_service (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, api_id INT UNSIGNED NOT NULL, service_id INT UNSIGNED NOT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the service is active for the api key', activated_at DATE DEFAULT NULL COMMENT 'Date on which the service was activated', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_E93C346254963938 (api_id), INDEX IDX_E93C3462ED5CA9E6 (service_id), UNIQUE INDEX unique_api_service_idx (api_id, service_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Api key services' ;
CREATE TABLE product_set_type (type_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, flag_default TINYINT(1) DEFAULT NULL COMMENT 'Is the default state', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the type is active', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_flag_default_idx (flag_default), PRIMARY KEY(type_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product set type table' ;
CREATE TABLE media (media_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, container_id BIGINT UNSIGNED NOT NULL, mimetype VARCHAR(60) DEFAULT NULL, filename VARCHAR(120) DEFAULT NULL, location VARCHAR(255) DEFAULT NULL, filesize BIGINT UNSIGNED DEFAULT NULL, filemtime INT UNSIGNED DEFAULT NULL, title VARCHAR(100) DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', deleted_at DATETIME DEFAULT NULL COMMENT 'Record deletion date', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_6A2CA10CBC21F742 (container_id), INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(media_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Media table' ;
CREATE TABLE packaging_type (type_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' COMMENT 'Whether the packaging type is active', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(type_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product packaging type table' ;
CREATE TABLE product_search (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', product_id BIGINT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', keywords VARCHAR(1500) DEFAULT NULL, tags VARCHAR(700) DEFAULT NULL, updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', INDEX IDX_D68C9A034584665A (product_id), INDEX IDX_D68C9A0331098462 (lang), FULLTEXT INDEX keywords_ft_idx (keywords), UNIQUE INDEX unique_translation_idx (product_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product search indexes' ;
CREATE TABLE color (color_id INT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(16) NOT NULL COMMENT 'Color code', name VARCHAR(80) NOT NULL, hex_code VARCHAR(8) DEFAULT NULL COMMENT 'Hex color code, i.e. #FFFFFF', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(color_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Color table' ;
CREATE TABLE api_key_customer (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, api_id INT UNSIGNED NOT NULL, customer_id INT UNSIGNED NOT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_4A509C2B54963938 (api_id), INDEX IDX_4A509C2B9395C3F3 (customer_id), UNIQUE INDEX unique_api_cutomer_idx (api_id, customer_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Api key customers' ;
CREATE TABLE stock (stock_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) NOT NULL, description VARCHAR(15000) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the stock warehouse is active in public website', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(stock_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Stock warehouse' ;
CREATE TABLE product_unit (unit_id INT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(10) NOT NULL COMMENT 'Universal reference, kg, m3...', title VARCHAR(80) DEFAULT NULL, symbol VARCHAR(4) DEFAULT NULL COMMENT 'Symbol', display_decimals SMALLINT UNSIGNED DEFAULT 2 COMMENT 'Number of decimals to display', description VARCHAR(255) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the unit is active', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX title_idx (title), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(unit_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product unit table' ;
CREATE TABLE product_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', product_id BIGINT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', slug VARCHAR(150) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(150) DEFAULT NULL, invoice_title VARCHAR(100) DEFAULT NULL, description VARCHAR(5000) DEFAULT NULL, characteristic VARCHAR(150) DEFAULT NULL, specs VARCHAR(5000) DEFAULT NULL COMMENT 'Specifications', keywords VARCHAR(200) DEFAULT NULL, revision INT UNSIGNED DEFAULT 1 COMMENT 'Translation revision number', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_1846DB704584665A (product_id), INDEX IDX_1846DB7031098462 (lang), INDEX title_idx (title), INDEX description_idx (description), INDEX characteristic_idx (characteristic), INDEX keywords_idx (keywords), INDEX slug_idx (slug), INDEX revision_idx (revision), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (product_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product translation table' ;
CREATE TABLE sale_delivery (delivery_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) DEFAULT NULL COMMENT 'Reference', customer_reference VARCHAR(60) DEFAULT NULL COMMENT 'Customer reference', comment VARCHAR(255) DEFAULT NULL COMMENT 'Comment', delivered_at DATETIME DEFAULT NULL COMMENT 'Delivery date', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', deleted_at DATETIME DEFAULT NULL COMMENT 'Record deletion date', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX delivered_at_idx (delivered_at), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(delivery_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Sales deliveries table' ;
CREATE TABLE customer (customer_id INT UNSIGNED AUTO_INCREMENT NOT NULL, group_id SMALLINT UNSIGNED DEFAULT NULL, country_id SMALLINT UNSIGNED DEFAULT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', name VARCHAR(80) NOT NULL, first_name VARCHAR(40) DEFAULT NULL, street VARCHAR(80) DEFAULT NULL, street_2 VARCHAR(80) DEFAULT NULL, street_number VARCHAR(10) DEFAULT NULL, po_box VARCHAR(10) DEFAULT NULL, zipcode VARCHAR(20) DEFAULT NULL, city VARCHAR(60) DEFAULT NULL, phone VARCHAR(20) DEFAULT NULL, phone_2 VARCHAR(20) DEFAULT NULL, mobile VARCHAR(20) DEFAULT NULL, mobile_2 VARCHAR(20) DEFAULT NULL, fax VARCHAR(20) DEFAULT NULL, fax_2 VARCHAR(20) DEFAULT NULL, email VARCHAR(50) DEFAULT NULL, email_2 VARCHAR(50) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the customer is active in public website', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_81398E09FE54D947 (group_id), INDEX IDX_81398E09F92F3E70 (country_id), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(customer_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Customer table' ;
CREATE TABLE product_stock (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, stock_id SMALLINT UNSIGNED NOT NULL, product_id BIGINT UNSIGNED NOT NULL, available_stock NUMERIC(12, 6) NOT NULL COMMENT 'Available stock', theoretical_stock NUMERIC(12, 6) DEFAULT NULL COMMENT 'Theoretical stock', next_available_stock_at DATETIME DEFAULT NULL COMMENT 'Next stock arrival date', next_available_stock NUMERIC(12, 6) DEFAULT NULL COMMENT 'Next available stock', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_EA6A2D3CDCD6110 (stock_id), INDEX IDX_EA6A2D3C4584665A (product_id), INDEX available_stock_idx (available_stock), INDEX theoretical_stock_idx (theoretical_stock), UNIQUE INDEX unique_product_price_idx (stock_id, product_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product stock' ;
CREATE TABLE role (role_id INT UNSIGNED AUTO_INCREMENT NOT NULL, parent_id INT UNSIGNED DEFAULT NULL, name VARCHAR(48) NOT NULL, lft INT UNSIGNED NOT NULL, rgt INT UNSIGNED NOT NULL, root BIGINT UNSIGNED DEFAULT NULL, lvl INT UNSIGNED NOT NULL, INDEX IDX_57698A6A727ACA70 (parent_id), INDEX lft_idx (lft), INDEX rgt_idx (rgt), UNIQUE INDEX unique_name_idx (name), PRIMARY KEY(role_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Access roles' ;
CREATE TABLE role_permission (role_id INT UNSIGNED NOT NULL, permission_id INT UNSIGNED NOT NULL, INDEX IDX_6F7DF886D60322AC (role_id), INDEX IDX_6F7DF886FED90CCA (permission_id), PRIMARY KEY(role_id, permission_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE api_service (service_id INT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', description VARCHAR(255) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the service is active', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(service_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Api services' ;
CREATE TABLE api_key_log (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, api_id INT UNSIGNED NOT NULL, service_id INT UNSIGNED DEFAULT NULL, remote_ip VARCHAR(32) DEFAULT NULL COMMENT 'Remote api', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', message VARCHAR(255) DEFAULT NULL COMMENT 'Custom message', execution_time INT UNSIGNED DEFAULT NULL COMMENT 'Time of execution in seconds', network_usage INT UNSIGNED DEFAULT NULL COMMENT 'Size in bytes', usage_count INT UNSIGNED DEFAULT 1 NOT NULL COMMENT 'Count usage', INDEX IDX_B608017254963938 (api_id), INDEX IDX_B6080172ED5CA9E6 (service_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Api usage logs' ;
CREATE TABLE sale_order_type_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', type_id SMALLINT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', title VARCHAR(80) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_EEA9D8B7C54C8C93 (type_id), INDEX IDX_EEA9D8B731098462 (lang), INDEX title_idx (title), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (type_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Order type translation table' ;
CREATE TABLE product_model (model_id INT UNSIGNED AUTO_INCREMENT NOT NULL, brand_id INT UNSIGNED DEFAULT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(10000) DEFAULT NULL, specs VARCHAR(10000) DEFAULT NULL COMMENT 'Specifications', revision INT UNSIGNED DEFAULT 1 COMMENT 'Translation revision number', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the model is active in public website', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_76C9098544F5D008 (brand_id), INDEX title_idx (title), INDEX description_idx (description), INDEX revision_idx (revision), UNIQUE INDEX unique_brand_reference_idx (brand_id, reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_slug_idx (slug), PRIMARY KEY(model_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product model table' ;
CREATE TABLE product_category_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', category_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(64) DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, breadcrumb VARCHAR(1500) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_1DAAB48712469DE2 (category_id), INDEX IDX_1DAAB48731098462 (lang), INDEX title_idx (title), INDEX description_idx (description), INDEX slug_idx (slug), INDEX breadcrumb_idx (breadcrumb), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (category_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product translation table' ;
CREATE TABLE product_brand_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', brand_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_61BD57C944F5D008 (brand_id), INDEX IDX_61BD57C931098462 (lang), INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (brand_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product brand translation table' ;
CREATE TABLE user_pricelist (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, pricelist_id SMALLINT UNSIGNED NOT NULL, user_id INT UNSIGNED NOT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the user can activate the pricelist', activated_at DATE DEFAULT NULL COMMENT 'Date on which this pricelist was activated', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_5C2F678989045958 (pricelist_id), INDEX IDX_5C2F6789A76ED395 (user_id), UNIQUE INDEX unique_user_pricelist_idx (pricelist_id, user_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'User pricelists' ;
CREATE TABLE product_brand (brand_id INT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, url VARCHAR(80) DEFAULT NULL, flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the brand is active in public website', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX description_idx (description), UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_title_idx (title), UNIQUE INDEX unique_slug_idx (slug), PRIMARY KEY(brand_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product brand table' ;
CREATE TABLE sale_order (order_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, type_id SMALLINT UNSIGNED NOT NULL, status_id SMALLINT UNSIGNED DEFAULT NULL, customer_id INT UNSIGNED NOT NULL, rep_id INT UNSIGNED DEFAULT NULL, user_id INT UNSIGNED DEFAULT NULL, parent_id BIGINT UNSIGNED DEFAULT NULL, pricelist_id SMALLINT UNSIGNED NOT NULL, reference VARCHAR(60) DEFAULT NULL COMMENT 'Reference', comment VARCHAR(512) DEFAULT NULL COMMENT 'Internal comment', customer_reference VARCHAR(60) DEFAULT NULL COMMENT 'Customer reference', customer_comment VARCHAR(255) DEFAULT NULL COMMENT 'Customer comment', document_date DATETIME DEFAULT NULL COMMENT 'Order/Quote document date', expires_at DATETIME DEFAULT NULL COMMENT 'When in quote, make an expiry date', created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', deleted_at DATETIME DEFAULT NULL COMMENT 'Record deletion date', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_25F5CB1BC54C8C93 (type_id), INDEX IDX_25F5CB1B6BF700BD (status_id), INDEX IDX_25F5CB1B9395C3F3 (customer_id), INDEX IDX_25F5CB1B54C549EA (rep_id), INDEX IDX_25F5CB1BA76ED395 (user_id), INDEX IDX_25F5CB1B727ACA70 (parent_id), INDEX IDX_25F5CB1B89045958 (pricelist_id), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(order_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Sales order table' ;
CREATE TABLE product_type (type_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, flag_enable_discount_condition TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the product type must honour special discount conditions', flag_excluded_catalog TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Tells whether the type should be excluded from product catalog', flag_excluded_export TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Tells whether the type should be excluded from exported catalog', flag_default TINYINT(1) DEFAULT NULL COMMENT 'Is the default state', flag_active TINYINT(1) DEFAULT '1' NOT NULL COMMENT 'Whether the type is active', icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_flag_default_idx (flag_default), PRIMARY KEY(type_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product type table' ;
CREATE TABLE product_media_type (type_id INT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Reference', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, icon_class VARCHAR(40) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(type_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product media type table' ;
CREATE TABLE product_group_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', group_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_255468FDFE54D947 (group_id), INDEX IDX_255468FD31098462 (lang), INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (group_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product group translation table' ;
CREATE TABLE product_stub (product_stub_id INT UNSIGNED AUTO_INCREMENT NOT NULL, reference VARCHAR(60) NOT NULL COMMENT 'Unique reference', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', UNIQUE INDEX unique_reference_idx (reference), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), PRIMARY KEY(product_stub_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product stub' ;
CREATE TABLE product_set_translation (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Primary key', set_id INT UNSIGNED NOT NULL, lang VARCHAR(2) NOT NULL COMMENT 'iso_631_1 language code 2 digits', slug VARCHAR(64) DEFAULT NULL COMMENT 'Unique slug for this record', title VARCHAR(80) DEFAULT NULL, description VARCHAR(15000) DEFAULT NULL, created_at DATETIME DEFAULT NULL COMMENT 'Record creation timestamp', updated_at DATETIME DEFAULT NULL COMMENT 'Record last update timestamp', created_by VARCHAR(40) DEFAULT NULL COMMENT 'Creator name', updated_by VARCHAR(40) DEFAULT NULL COMMENT 'Last updater name', legacy_mapping VARCHAR(40) DEFAULT NULL COMMENT 'Unique reference of this record taken from legacy system', legacy_synchro_at DATETIME DEFAULT NULL COMMENT 'Last synchro timestamp', INDEX IDX_114B700710FB0D18 (set_id), INDEX IDX_114B700731098462 (lang), INDEX title_idx (title), INDEX description_idx (description), UNIQUE INDEX unique_legacy_mapping_idx (legacy_mapping), UNIQUE INDEX unique_translation_idx (set_id, lang), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = 'Product set translation table' ;
ALTER TABLE color_translation ADD CONSTRAINT FK_C81038637ADA1FB5 FOREIGN KEY (color_id) REFERENCES color (color_id) ON DELETE CASCADE;
ALTER TABLE color_translation ADD CONSTRAINT FK_C810386331098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE product_pricelist ADD CONSTRAINT FK_326F5CE089045958 FOREIGN KEY (pricelist_id) REFERENCES pricelist (pricelist_id) ON DELETE CASCADE;
ALTER TABLE product_pricelist ADD CONSTRAINT FK_326F5CE04584665A FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE;
ALTER TABLE product_pricelist ADD CONSTRAINT FK_326F5CE06BF700BD FOREIGN KEY (status_id) REFERENCES product_status (status_id) ON DELETE CASCADE;
ALTER TABLE sale_order_status_translation ADD CONSTRAINT FK_7017D856BF700BD FOREIGN KEY (status_id) REFERENCES sale_order_status (status_id) ON DELETE CASCADE;
ALTER TABLE sale_order_status_translation ADD CONSTRAINT FK_7017D8531098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE sale_order_line_status_translation ADD CONSTRAINT FK_F4D5EE4B6BF700BD FOREIGN KEY (status_id) REFERENCES sale_order_line_status (status_id) ON DELETE CASCADE;
ALTER TABLE sale_order_line_status_translation ADD CONSTRAINT FK_F4D5EE4B31098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE user_scope ADD CONSTRAINT FK_E26DAE8BA76ED395 FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE;
ALTER TABLE user_scope ADD CONSTRAINT FK_E26DAE8B9395C3F3 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE;
ALTER TABLE product_unit_translation ADD CONSTRAINT FK_A1824BB5F8BD700D FOREIGN KEY (unit_id) REFERENCES product_unit (unit_id) ON DELETE CASCADE;
ALTER TABLE product_unit_translation ADD CONSTRAINT FK_A1824BB531098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE product_serie ADD CONSTRAINT FK_B66E86844F5D008 FOREIGN KEY (brand_id) REFERENCES product_brand (brand_id) ON DELETE CASCADE;
ALTER TABLE customer_pricelist ADD CONSTRAINT FK_F732127789045958 FOREIGN KEY (pricelist_id) REFERENCES pricelist (pricelist_id) ON DELETE CASCADE;
ALTER TABLE customer_pricelist ADD CONSTRAINT FK_F73212779395C3F3 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04AD727ACA70 FOREIGN KEY (parent_id) REFERENCES product (product_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04AD44F5D008 FOREIGN KEY (brand_id) REFERENCES product_brand (brand_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04ADFE54D947 FOREIGN KEY (group_id) REFERENCES product_group (group_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04AD7975B7E7 FOREIGN KEY (model_id) REFERENCES product_model (model_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04ADD94388BD FOREIGN KEY (serie_id) REFERENCES product_serie (serie_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04AD12469DE2 FOREIGN KEY (category_id) REFERENCES product_category (category_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04ADC54C8C93 FOREIGN KEY (type_id) REFERENCES product_type (type_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04AD6BF700BD FOREIGN KEY (status_id) REFERENCES product_status (status_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04ADF8BD700D FOREIGN KEY (unit_id) REFERENCES product_unit (unit_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04AD389B0DBA FOREIGN KEY (product_stub_id) REFERENCES product_stub (product_stub_id) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_D34A04AD5BA57244 FOREIGN KEY (primary_color_id) REFERENCES color (color_id) ON DELETE CASCADE;
ALTER TABLE sale_rep ADD CONSTRAINT FK_C84C7443F92F3E70 FOREIGN KEY (country_id) REFERENCES country (country_id);
ALTER TABLE product_category ADD CONSTRAINT FK_CDFC7356727ACA70 FOREIGN KEY (parent_id) REFERENCES product_category (category_id) ON DELETE CASCADE;
ALTER TABLE discount_condition ADD CONSTRAINT FK_DD0C00BE89045958 FOREIGN KEY (pricelist_id) REFERENCES pricelist (pricelist_id) ON DELETE CASCADE;
ALTER TABLE discount_condition ADD CONSTRAINT FK_DD0C00BED2919A68 FOREIGN KEY (customer_group_id) REFERENCES customer_group (group_id) ON DELETE CASCADE;
ALTER TABLE discount_condition ADD CONSTRAINT FK_DD0C00BE9395C3F3 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE;
ALTER TABLE discount_condition ADD CONSTRAINT FK_DD0C00BE44F5D008 FOREIGN KEY (brand_id) REFERENCES product_brand (brand_id) ON DELETE CASCADE;
ALTER TABLE discount_condition ADD CONSTRAINT FK_DD0C00BE35E4B3D0 FOREIGN KEY (product_group_id) REFERENCES product_group (group_id) ON DELETE CASCADE;
ALTER TABLE discount_condition ADD CONSTRAINT FK_DD0C00BE7975B7E7 FOREIGN KEY (model_id) REFERENCES product_model (model_id) ON DELETE CASCADE;
ALTER TABLE discount_condition ADD CONSTRAINT FK_DD0C00BE12469DE2 FOREIGN KEY (category_id) REFERENCES product_category (category_id) ON DELETE CASCADE;
ALTER TABLE discount_condition ADD CONSTRAINT FK_DD0C00BE4584665A FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE;
ALTER TABLE pricelist ADD CONSTRAINT FK_5CCFEA6DDCD6110 FOREIGN KEY (stock_id) REFERENCES stock (stock_id) ON DELETE CASCADE;
ALTER TABLE pricelist ADD CONSTRAINT FK_5CCFEA6D38248176 FOREIGN KEY (currency_id) REFERENCES currency (currency_id);
ALTER TABLE pricelist ADD CONSTRAINT FK_5CCFEA6D2E5F6947 FOREIGN KEY (discount_condition_pricelist_id) REFERENCES pricelist (pricelist_id) ON DELETE CASCADE;
ALTER TABLE product_set ADD CONSTRAINT FK_63B71C3C54C8C93 FOREIGN KEY (type_id) REFERENCES product_type (type_id) ON DELETE CASCADE;
ALTER TABLE product_pricelist_stat ADD CONSTRAINT FK_7A69209338FE3EBD FOREIGN KEY (product_pricelist_stat_id) REFERENCES product_pricelist (product_pricelist_id) ON DELETE CASCADE;
ALTER TABLE product_packaging ADD CONSTRAINT FK_D12BBB08C54C8C93 FOREIGN KEY (type_id) REFERENCES packaging_type (type_id) ON DELETE CASCADE;
ALTER TABLE product_packaging ADD CONSTRAINT FK_D12BBB084584665A FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE;
ALTER TABLE user ADD CONSTRAINT FK_8D93D64931098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE SET NULL;
ALTER TABLE user_role ADD CONSTRAINT FK_2DE8C6A3A76ED395 FOREIGN KEY (user_id) REFERENCES user (user_id);
ALTER TABLE user_role ADD CONSTRAINT FK_2DE8C6A3D60322AC FOREIGN KEY (role_id) REFERENCES role (role_id);
ALTER TABLE product_model_translation ADD CONSTRAINT FK_6EEE4ED07975B7E7 FOREIGN KEY (model_id) REFERENCES product_model (model_id) ON DELETE CASCADE;
ALTER TABLE product_model_translation ADD CONSTRAINT FK_6EEE4ED031098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE product_stub_translation ADD CONSTRAINT FK_89DB144E389B0DBA FOREIGN KEY (product_stub_id) REFERENCES product_stub (product_stub_id) ON DELETE CASCADE;
ALTER TABLE product_stub_translation ADD CONSTRAINT FK_89DB144E31098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE product_media ADD CONSTRAINT FK_CB70DA504584665A FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE;
ALTER TABLE product_media ADD CONSTRAINT FK_CB70DA50EA9FDD75 FOREIGN KEY (media_id) REFERENCES media (media_id) ON DELETE CASCADE;
ALTER TABLE product_media ADD CONSTRAINT FK_CB70DA50C54C8C93 FOREIGN KEY (type_id) REFERENCES product_media_type (type_id) ON DELETE CASCADE;
ALTER TABLE sale_order_line ADD CONSTRAINT FK_61B16AA58D9F6D38 FOREIGN KEY (order_id) REFERENCES sale_order (order_id) ON DELETE CASCADE;
ALTER TABLE sale_order_line ADD CONSTRAINT FK_61B16AA56BF700BD FOREIGN KEY (status_id) REFERENCES sale_order_line_status (status_id) ON DELETE CASCADE;
ALTER TABLE sale_order_line ADD CONSTRAINT FK_61B16AA512136921 FOREIGN KEY (delivery_id) REFERENCES sale_delivery (delivery_id) ON DELETE CASCADE;
ALTER TABLE sale_order_line ADD CONSTRAINT FK_61B16AA52989F1FD FOREIGN KEY (invoice_id) REFERENCES sale_invoice (invoice_id) ON DELETE CASCADE;
ALTER TABLE sale_order_line ADD CONSTRAINT FK_61B16AA54584665A FOREIGN KEY (product_id) REFERENCES product (product_id);
ALTER TABLE product_serie_translation ADD CONSTRAINT FK_7D0456FD94388BD FOREIGN KEY (serie_id) REFERENCES product_serie (serie_id) ON DELETE CASCADE;
ALTER TABLE product_serie_translation ADD CONSTRAINT FK_7D0456F31098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE api_key_service ADD CONSTRAINT FK_E93C346254963938 FOREIGN KEY (api_id) REFERENCES api_key (api_id) ON DELETE CASCADE;
ALTER TABLE api_key_service ADD CONSTRAINT FK_E93C3462ED5CA9E6 FOREIGN KEY (service_id) REFERENCES api_service (service_id) ON DELETE CASCADE;
ALTER TABLE media ADD CONSTRAINT FK_6A2CA10CBC21F742 FOREIGN KEY (container_id) REFERENCES media_container (container_id) ON DELETE CASCADE;
ALTER TABLE product_search ADD CONSTRAINT FK_D68C9A034584665A FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE;
ALTER TABLE product_search ADD CONSTRAINT FK_D68C9A0331098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE api_key_customer ADD CONSTRAINT FK_4A509C2B54963938 FOREIGN KEY (api_id) REFERENCES api_key (api_id) ON DELETE CASCADE;
ALTER TABLE api_key_customer ADD CONSTRAINT FK_4A509C2B9395C3F3 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE;
ALTER TABLE product_translation ADD CONSTRAINT FK_1846DB704584665A FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE;
ALTER TABLE product_translation ADD CONSTRAINT FK_1846DB7031098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE customer ADD CONSTRAINT FK_81398E09FE54D947 FOREIGN KEY (group_id) REFERENCES customer_group (group_id) ON DELETE CASCADE;
ALTER TABLE customer ADD CONSTRAINT FK_81398E09F92F3E70 FOREIGN KEY (country_id) REFERENCES country (country_id);
ALTER TABLE product_stock ADD CONSTRAINT FK_EA6A2D3CDCD6110 FOREIGN KEY (stock_id) REFERENCES stock (stock_id) ON DELETE CASCADE;
ALTER TABLE product_stock ADD CONSTRAINT FK_EA6A2D3C4584665A FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE;
ALTER TABLE role ADD CONSTRAINT FK_57698A6A727ACA70 FOREIGN KEY (parent_id) REFERENCES role (role_id) ON DELETE CASCADE;
ALTER TABLE role_permission ADD CONSTRAINT FK_6F7DF886D60322AC FOREIGN KEY (role_id) REFERENCES role (role_id);
ALTER TABLE role_permission ADD CONSTRAINT FK_6F7DF886FED90CCA FOREIGN KEY (permission_id) REFERENCES permission (permission_id);
ALTER TABLE api_key_log ADD CONSTRAINT FK_B608017254963938 FOREIGN KEY (api_id) REFERENCES api_key (api_id) ON DELETE CASCADE;
ALTER TABLE api_key_log ADD CONSTRAINT FK_B6080172ED5CA9E6 FOREIGN KEY (service_id) REFERENCES api_service (service_id) ON DELETE CASCADE;
ALTER TABLE sale_order_type_translation ADD CONSTRAINT FK_EEA9D8B7C54C8C93 FOREIGN KEY (type_id) REFERENCES sale_order_type (type_id) ON DELETE CASCADE;
ALTER TABLE sale_order_type_translation ADD CONSTRAINT FK_EEA9D8B731098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE product_model ADD CONSTRAINT FK_76C9098544F5D008 FOREIGN KEY (brand_id) REFERENCES product_brand (brand_id) ON DELETE CASCADE;
ALTER TABLE product_category_translation ADD CONSTRAINT FK_1DAAB48712469DE2 FOREIGN KEY (category_id) REFERENCES product_category (category_id) ON DELETE CASCADE;
ALTER TABLE product_category_translation ADD CONSTRAINT FK_1DAAB48731098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE product_brand_translation ADD CONSTRAINT FK_61BD57C944F5D008 FOREIGN KEY (brand_id) REFERENCES product_brand (brand_id) ON DELETE CASCADE;
ALTER TABLE product_brand_translation ADD CONSTRAINT FK_61BD57C931098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE user_pricelist ADD CONSTRAINT FK_5C2F678989045958 FOREIGN KEY (pricelist_id) REFERENCES pricelist (pricelist_id) ON DELETE CASCADE;
ALTER TABLE user_pricelist ADD CONSTRAINT FK_5C2F6789A76ED395 FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE;
ALTER TABLE sale_order ADD CONSTRAINT FK_25F5CB1BC54C8C93 FOREIGN KEY (type_id) REFERENCES sale_order_type (type_id) ON DELETE CASCADE;
ALTER TABLE sale_order ADD CONSTRAINT FK_25F5CB1B6BF700BD FOREIGN KEY (status_id) REFERENCES sale_order_status (status_id) ON DELETE CASCADE;
ALTER TABLE sale_order ADD CONSTRAINT FK_25F5CB1B9395C3F3 FOREIGN KEY (customer_id) REFERENCES customer (customer_id);
ALTER TABLE sale_order ADD CONSTRAINT FK_25F5CB1B54C549EA FOREIGN KEY (rep_id) REFERENCES sale_rep (rep_id);
ALTER TABLE sale_order ADD CONSTRAINT FK_25F5CB1BA76ED395 FOREIGN KEY (user_id) REFERENCES user (user_id);
ALTER TABLE sale_order ADD CONSTRAINT FK_25F5CB1B727ACA70 FOREIGN KEY (parent_id) REFERENCES sale_order (order_id) ON DELETE CASCADE;
ALTER TABLE sale_order ADD CONSTRAINT FK_25F5CB1B89045958 FOREIGN KEY (pricelist_id) REFERENCES pricelist (pricelist_id);
ALTER TABLE product_group_translation ADD CONSTRAINT FK_255468FDFE54D947 FOREIGN KEY (group_id) REFERENCES product_group (group_id) ON DELETE CASCADE;
ALTER TABLE product_group_translation ADD CONSTRAINT FK_255468FD31098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
ALTER TABLE product_set_translation ADD CONSTRAINT FK_114B700710FB0D18 FOREIGN KEY (set_id) REFERENCES product_set (set_id) ON DELETE CASCADE;
ALTER TABLE product_set_translation ADD CONSTRAINT FK_114B700731098462 FOREIGN KEY (lang) REFERENCES language (lang) ON DELETE RESTRICT;
DELIMITER //
DROP FUNCTION IF EXISTS `slugify` //
DELIMITER ;
DELIMITER //
        CREATE FUNCTION `slugify` (dirty_string VARCHAR(255))
        RETURNS VARCHAR(255) CHARSET latin1
        DETERMINISTIC
        BEGIN
            DECLARE x, y , z Int;
            DECLARE temp_string, new_string VarChar(255);
            DECLARE is_allowed Bool;
            DECLARE c, check_char VarChar(1);

            SET temp_string = LOWER(dirty_string);

            SET temp_string = replace(temp_string, '&', ' and ');

            SELECT temp_string REGEXP('[^a-z0-9\-]+') into x;
            IF x = 1 then
                SET z = 1;
                WHILE z <= CHAR_LENGTH(temp_string) Do
                    SET c = SUBSTRING(temp_string, z, 1);
                    SET is_allowed = False;
                    IF !((ascii(c) = 45) or (ascii(c) >= 48 and ascii(c) <= 57) or (ascii(c) >= 97 and ascii(c) <= 122)) THEN
                        SET temp_string = REPLACE(temp_string, c, '-');
                    END IF;
                    SET z = z + 1;
                END WHILE;
            END IF;

            SELECT temp_string REGEXP("^-|-$|'") into x;
            IF x = 1 THEN
                SET temp_string = REPLACE(temp_string, "'", '');
                SET z = CHAR_LENGTH(temp_string);
                SET y = CHAR_LENGTH(temp_string);
                Dash_check: WHILE z > 1 Do
                    IF Strcmp(SUBSTRING(temp_string, -1, 1), '-') = 0 THEN
                        SET temp_string = SUBSTRING(temp_string,1, y-1);
                        SET y = y - 1;
                    ELSE
                        LEAVE Dash_check;
                    END IF;
                    SET z = z - 1;
                END WHILE;
            END IF;

            REPEAT
                SELECT temp_string REGEXP("--") into x;
                IF x = 1 THEN
                    SET temp_string = REPLACE(temp_string, "--", "-");
                END IF;
            UNTIL x <> 1 END REPEAT;

            IF LOCATE('-', temp_string) = 1 THEN
                SET temp_string = SUBSTRING(temp_string, 2);
            END IF;

            RETURN temp_string;
        END         //
DELIMITER ;
DELIMITER //
DROP FUNCTION IF EXISTS `strip_tags` //
DELIMITER ;
DELIMITER //
        CREATE FUNCTION strip_tags( DIRTY VARCHAR(3000) )
        RETURNS VARCHAR(3000) CHARSET utf8 COLLATE utf8_general_ci
        DETERMINISTIC
        BEGIN
          DECLARE iStart, iEnd, iLength int;
            WHILE LOCATE( '<', DIRTY ) > 0 And LOCATE( '>', DIRTY, LOCATE( '<', DIRTY )) > 0 DO
              BEGIN
                SET iStart = LOCATE( '<', DIRTY ), iEnd = LOCATE( '>', DIRTY, LOCATE('<', DIRTY ));
                SET iLength = ( iEnd - iStart) + 1;
                IF iLength > 0 THEN
                  BEGIN
                    SET DIRTY = Insert( DIRTY, iStart, iLength, '');
                  END;
                END IF;
              END;
            END WHILE;
            RETURN DIRTY;
        END//
DELIMITER ;
DELIMITER //
DROP FUNCTION IF EXISTS `delete_double_spaces` //
DELIMITER ;
DELIMITER //
        CREATE FUNCTION delete_double_spaces ( title VARCHAR(3000) )
        RETURNS VARCHAR(3000) CHARSET utf8 COLLATE utf8_unicode_ci DETERMINISTIC
        BEGIN
            DECLARE result VARCHAR(3000);
            SET result = REPLACE( title, '  ', ' ' );
            WHILE (result <> title) DO
                SET title = result;
                SET result = REPLACE( title, '  ', ' ' );
            END WHILE;
            RETURN result;
        END//
DELIMITER ;
DELIMITER //
DROP FUNCTION IF EXISTS `get_searchable_reference` //
DELIMITER ;
DELIMITER //
        CREATE FUNCTION `get_searchable_reference` (`in_str` VARCHAR(2048)) RETURNS VARCHAR(2048) CHARSET utf8
        BEGIN
            /*
              This function escape a string from any non alphanumeric chars (A_Z0_9)
              to get a searchable reference. Also try to remove any first
              non-significative zero.

              FOR example 'BA-0114-22' -> 'BA11422'

            */
            DECLARE out_str VARCHAR(2048) DEFAULT '';
            DECLARE c VARCHAR(1) DEFAULT '';
            DECLARE prev_c VARCHAR(1) DEFAULT '';
            DECLARE pointer INT DEFAULT 1;

            IF ISNULL(in_str) THEN
                RETURN NULL;
            ELSE
                WHILE pointer <= LENGTH(in_str) DO
                    SET c = UPPER(MID(in_str, pointer, 1));

                    -- TAKE ONLY [A-Z0-9] characters
                    IF  ((ASCII(c) > 64 AND ASCII(c) < 92) or (ASCII(c) > 47 AND ASCII(c) < 58))
                    THEN
                        -- IF A NUMBER, try to get rid of non-significave numbers
                        IF (ASCII(c) > 47 AND ASCII(c) < 58)
                        THEN
                            -- IF C is a zero and PREVIOUS CHARACTER IS NUMERIC
                            IF (c = 0 and NOT (ASCII(prev_c) > 47 AND ASCII(prev_c) < 58))
                            THEN
                                -- NOTHING
                                SET c = c;
                            ELSE
                                SET out_str = CONCAT(out_str, c);
                            END IF;
                        ELSE
                            SET out_str = CONCAT(out_str, c);
                        END IF;
                    END IF;
                    SET prev_c = c;
                    SET pointer = pointer + 1;
                END WHILE;
            END IF;

            RETURN UPPER(out_str);
        END//
DELIMITER ;
DELIMITER //
DROP PROCEDURE IF EXISTS `rebuild_catalog_search` //
DELIMITER ;
DELIMITER //
        CREATE PROCEDURE `rebuild_catalog_search` ()
        BEGIN
                SET @updated_at = NOW();
                SET @default_lang := (SELECT lang FROM `language` where flag_default = 1);
                IF (@default_lang is null) THEN
                     SET @default_lang = 'en';
                END IF;
                INSERT INTO product_search (product_id, lang, keywords, updated_at)
                SELECT DISTINCT
                    p.product_id,
                    if (p18.lang is null, @default_lang, p18.lang) as lang,
                    UPPER(
                        delete_double_spaces(
                            REPLACE(
                                strip_tags(
                                        TRIM(
                                                CONCAT_WS(' ',
                                                        COALESCE(p.reference, ''),
                                                        COALESCE(pb.title, ''),
                                                        COALESCE(p18.title, p.title, ''),
                                                        COALESCE(p18.invoice_title, p.invoice_title, ''),
                                                        IF(p2.product_id is not null,
                                                            COALESCE(p18_2.description, p2.description, ''),
                                                            COALESCE(p18.description, p.description, '')
                                                        ),
                                                        COALESCE(p18.characteristic, p.characteristic, ''),
                                                        COALESCE(p18.keywords, p.keywords, ''),
                                                        COALESCE(pc18.breadcrumb, pc.breadcrumb, ''),
                                                        COALESCE(pg18.title, pg.title, '')
                                                )
                                        )
                                )
                            , '
', ' ')
                        )
                    )
                    as keywords,
                    @updated_at as updated_at
                from
                    product p
                        left outer join
                    product_translation p18 ON p18.product_id = p.product_id
                        left outer join
                    product_brand pb ON p.brand_id = pb.brand_id
                        left outer join
                    product p2 ON p2.product_id = p.parent_id
                        left outer join
                    product_translation p18_2 ON p18_2.product_id = p2.product_id
                        and p18_2.lang = p18.lang
                        left outer join
                    product_group pg ON p.group_id = pg.group_id
                        left outer join
                    product_group_translation pg18 ON pg18.group_id = pg.group_id
                        and pg18.lang = p18.lang
                        left outer join
                    product_category pc on pc.category_id = p.category_id
                        left outer join
                    product_category_translation pc18 on pc18.category_id = p.category_id
                        and pc18.lang = p18.lang
                        left outer join
                    product_pricelist ppl on (p.product_id = ppl.product_id and ppl.flag_active=1)
                            left outer join
                    pricelist pl on (pl.pricelist_id = ppl.pricelist_id and pl.flag_active=1)
                where
                    1=1
                    and p.flag_active = 1
                    and pl.flag_active = 1
                order by if (p18.lang is null, @default_lang, p18.lang), p.product_id
            on duplicate key update
                    keywords = UPPER(
                        delete_double_spaces(
                            REPLACE(
                                strip_tags(
                                        TRIM(
                                                CONCAT_WS(' ',
                                                        COALESCE(p.reference, ''),
                                                        COALESCE(pb.title, ''),
                                                        COALESCE(p18.title, p.title, ''),
                                                        COALESCE(p18.invoice_title, p.invoice_title, ''),
                                                        IF(p2.product_id is not null,
                                                            COALESCE(p18_2.description, p2.description, ''),
                                                            COALESCE(p18.description, p.description, '')
                                                        ),
                                                        COALESCE(p18.characteristic, p.characteristic, ''),
                                                        COALESCE(p18.keywords, p.keywords, ''),
                                                        COALESCE(pc18.breadcrumb, pc.breadcrumb, ''),
                                                        COALESCE(pg18.title, pg.title, '')
                                                )
                                        )
                                )
                            , '
', ' ')
                        )
                    )
                    ,
                    updated_at = @updated_at;

                -- REMOVE OLDER DATA
                DELETE FROM product_search where updated_at < @updated_at and updated_at is not null;
        END //
DELIMITER ;
DELIMITER //
DROP PROCEDURE IF EXISTS `rebuild_product_search` //
DELIMITER ;
DELIMITER //
        CREATE PROCEDURE `rebuild_product_search` (IN product_id BIGINT)
        BEGIN
                SET @updated_at = NOW();
                SET @product_id = product_id;
                SET @default_lang := (SELECT lang FROM `language` where flag_default = 1);
                IF (@default_lang is null) THEN
                     SET @default_lang = 'en';
                END IF;
                PREPARE stmt FROM
                "INSERT INTO product_search (product_id, lang, keywords, updated_at)
                SELECT DISTINCT
                    p.product_id,
                    if (p18.lang is null, @default_lang, p18.lang) as lang,
                    UPPER(
                        delete_double_spaces(
                            REPLACE(
                                strip_tags(
                                        TRIM(
                                                CONCAT_WS(' ',
                                                        COALESCE(p.reference, ''),
                                                        COALESCE(pb.title, ''),
                                                        COALESCE(p18.title, p.title, ''),
                                                        COALESCE(p18.invoice_title, p.invoice_title, ''),
                                                        IF(p2.product_id is not null,
                                                            COALESCE(p18_2.description, p2.description, ''),
                                                            COALESCE(p18.description, p.description, '')
                                                        ),
                                                        COALESCE(p18.characteristic, p.characteristic, ''),
                                                        COALESCE(p18.keywords, p.keywords, ''),
                                                        COALESCE(pc18.breadcrumb, pc.breadcrumb, ''),
                                                        COALESCE(pg18.title, pg.title, '')
                                                )
                                        )
                                )
                            , '
', ' ')
                        )
                    )
                    as keywords,
                    @updated_at as updated_at
                from
                    product p
                        left outer join
                    product_translation p18 ON p18.product_id = p.product_id
                        left outer join
                    product_brand pb ON p.brand_id = pb.brand_id
                        left outer join
                    product p2 ON p2.product_id = p.parent_id
                        left outer join
                    product_translation p18_2 ON p18_2.product_id = p2.product_id
                        and p18_2.lang = p18.lang
                        left outer join
                    product_group pg ON p.group_id = pg.group_id
                        left outer join
                    product_group_translation pg18 ON pg18.group_id = pg.group_id
                        and pg18.lang = p18.lang
                        left outer join
                    product_category pc on pc.category_id = p.category_id
                        left outer join
                    product_category_translation pc18 on pc18.category_id = p.category_id
                        and pc18.lang = p18.lang
                        left outer join
                    product_pricelist ppl on (p.product_id = ppl.product_id and ppl.flag_active=1)
                            left outer join
                    pricelist pl on (pl.pricelist_id = ppl.pricelist_id and pl.flag_active=1)
                where
                    1=1
                    and p.flag_active = 1
                    and pl.flag_active = 1
                    and p.product_id = ?
                order by if (p18.lang is null, @default_lang, p18.lang), p.product_id
                on duplicate key update
                    keywords = UPPER(
                        delete_double_spaces(
                            REPLACE(
                                strip_tags(
                                        TRIM(
                                                CONCAT_WS(' ',
                                                        COALESCE(p.reference, ''),
                                                        COALESCE(pb.title, ''),
                                                        COALESCE(p18.title, p.title, ''),
                                                        COALESCE(p18.invoice_title, p.invoice_title, ''),
                                                        IF(p2.product_id is not null,
                                                            COALESCE(p18_2.description, p2.description, ''),
                                                            COALESCE(p18.description, p.description, '')
                                                        ),
                                                        COALESCE(p18.characteristic, p.characteristic, ''),
                                                        COALESCE(p18.keywords, p.keywords, ''),
                                                        COALESCE(pc18.breadcrumb, pc.breadcrumb, ''),
                                                        COALESCE(pg18.title, pg.title, '')
                                                )
                                        )
                                )
                            , '
', ' ')
                        )
                    )
                    ,
                    updated_at = @updated_at";
                EXECUTE stmt USING @product_id;
                DEALLOCATE PREPARE stmt;
        END //
DELIMITER ;
DELIMITER //
DROP PROCEDURE IF EXISTS `rebuild_category_breadcrumbs` //
DELIMITER ;
DELIMITER //
        CREATE PROCEDURE `rebuild_category_breadcrumbs` ()
        BEGIN
            -- 1. Category
            UPDATE product_category
                    INNER JOIN
                (
                            SELECT
                                    pc1.category_id,
                                            GROUP_CONCAT(
                                                    pc2.title
                                                    ORDER BY pc1.lvl , pc2.lvl
                                                    --     could be utf8 - &rarr; →
                                                    SEPARATOR ' | '
                                    ) AS `breadcrumb`
                            FROM
                                    `product_category` AS `pc1`
                            LEFT JOIN `product_category` AS `pc2` ON pc1.lft BETWEEN pc2.lft AND pc2.rgt
                            WHERE
                                    pc2.lvl > 0
                            GROUP BY 1
                            ORDER BY pc1.category_id
                    ) AS tmp
                    ON tmp.category_id = product_category.category_id
            SET product_category.breadcrumb = tmp.breadcrumb;

            -- 2. Category translations
            UPDATE product_category_translation
                    INNER JOIN
                (
                            SELECT
                                    pc1.category_id,
                                    pc18.lang,
                                            GROUP_CONCAT(
                                                    IF(pc18.title is null, pc2.title, pc18.title)
                                                    ORDER BY pc1.lvl , pc2.lvl
                                                    --     could be utf8 - &rarr; →
                                                    SEPARATOR ' | '
                                    ) AS `breadcrumb`
                            FROM
                                    `product_category` AS `pc1`
                            LEFT JOIN `product_category` AS `pc2` ON pc1.lft BETWEEN pc2.lft AND pc2.rgt
                            LEFT JOIN `product_category_translation` AS `pc18` ON pc18.category_id = pc2.category_id
                            WHERE
                                    pc2.lvl > 0
                            GROUP BY 1 , 2
                            ORDER BY pc1.category_id
                    ) AS tmp
                    ON tmp.category_id = product_category_translation.category_id
                    AND tmp.lang = product_category_translation.lang
            SET product_category_translation.breadcrumb = tmp.breadcrumb;
        END//
DELIMITER ;
DELIMITER ;