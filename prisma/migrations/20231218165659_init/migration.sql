-- CreateTable
CREATE TABLE `branches` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `situation` BOOLEAN NOT NULL DEFAULT true,
    `cnpj` VARCHAR(50) NOT NULL DEFAULT '000.000.000.000-00',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(120) NOT NULL,
    `state_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `state_id`(`state_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(50) NULL,
    `email` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `email`(`email`),
    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `estado` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `what_the_customer_wants_id` INTEGER NOT NULL,
    `citi_id` INTEGER NOT NULL DEFAULT 1,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_cities_estado`(`citi_id`),
    INDEX `what_the_customer_wants_id`(`what_the_customer_wants_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permissions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permissions_users` (
    `user_id` INTEGER NOT NULL,
    `permission_id` INTEGER NOT NULL,

    INDEX `fk_permissions_users_1`(`user_id`),
    INDEX `fk_permissions_users_2`(`permission_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `photographs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `what_the_customer_has_id` INTEGER NOT NULL,
    `url_path` TEXT NOT NULL,
    `situation` BOOLEAN NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `what_the_customer_has_id`(`what_the_customer_has_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `properties` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(120) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `states` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(75) NOT NULL,
    `uf` VARCHAR(5) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `is_active` ENUM('ACTIVE', 'INACTIVE') NULL DEFAULT 'INACTIVE',
    `is_admin` BOOLEAN NOT NULL DEFAULT false,
    `deleted_at` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `what_the_customer_has` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `branche_id` INTEGER NOT NULL DEFAULT 1,
    `properti_id` INTEGER NOT NULL,
    `citie_id` INTEGER NOT NULL,
    `customers_id` INTEGER NOT NULL,
    `bedrooms` ENUM('UM') NOT NULL,
    `total_area` INTEGER NOT NULL,
    `useful_area` INTEGER NOT NULL,
    `property_initial_value` DECIMAL(10, 2) NOT NULL,
    `final_property_value` DECIMAL(10, 2) NOT NULL,
    `branches_id` INTEGER NOT NULL DEFAULT 1,
    `property_code` VARCHAR(50) NULL,
    `descriptions` TEXT NULL DEFAULT '--',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `is_active` INTEGER NULL DEFAULT 1,

    INDEX `branche_id`(`branche_id`),
    INDEX `citie_id`(`citie_id`),
    INDEX `customers_id`(`customers_id`),
    INDEX `properti_id`(`properti_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `what_the_customer_wants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `branche_id` INTEGER NOT NULL DEFAULT 1,
    `customers_id` INTEGER NOT NULL,
    `properti_id` INTEGER NOT NULL DEFAULT 1,
    `bedrooms` ENUM('UM') NOT NULL,
    `total_area` INTEGER NOT NULL,
    `useful_area` INTEGER NOT NULL,
    `property_initial_value` DECIMAL(10, 2) NOT NULL,
    `final_property_value` DECIMAL(10, 2) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `is_active` INTEGER NULL DEFAULT 1,

    INDEX `branche_id`(`branche_id`),
    INDEX `customers_id`(`customers_id`),
    INDEX `properti_id`(`properti_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `logs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name_json` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `cities` ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `estado` ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`what_the_customer_wants_id`) REFERENCES `what_the_customer_wants`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `estado` ADD CONSTRAINT `fk_cities_estado` FOREIGN KEY (`citi_id`) REFERENCES `cities`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `permissions_users` ADD CONSTRAINT `fk_permissions_users_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `permissions_users` ADD CONSTRAINT `fk_permissions_users_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `photographs` ADD CONSTRAINT `photographs_ibfk_1` FOREIGN KEY (`what_the_customer_has_id`) REFERENCES `what_the_customer_has`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `what_the_customer_has` ADD CONSTRAINT `what_the_customer_has_ibfk_1` FOREIGN KEY (`properti_id`) REFERENCES `properties`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `what_the_customer_has` ADD CONSTRAINT `what_the_customer_has_ibfk_2` FOREIGN KEY (`citie_id`) REFERENCES `cities`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `what_the_customer_has` ADD CONSTRAINT `what_the_customer_has_ibfk_3` FOREIGN KEY (`customers_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `what_the_customer_has` ADD CONSTRAINT `what_the_customer_has_ibfk_4` FOREIGN KEY (`branche_id`) REFERENCES `branches`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `what_the_customer_wants` ADD CONSTRAINT `what_the_customer_wants_ibfk_2` FOREIGN KEY (`customers_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `what_the_customer_wants` ADD CONSTRAINT `what_the_customer_wants_ibfk_3` FOREIGN KEY (`properti_id`) REFERENCES `properties`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `what_the_customer_wants` ADD CONSTRAINT `what_the_customer_wants_ibfk_4` FOREIGN KEY (`branche_id`) REFERENCES `branches`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
