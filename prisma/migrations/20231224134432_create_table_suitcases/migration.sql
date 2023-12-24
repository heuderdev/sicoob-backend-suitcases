/*
  Warnings:

  - Added the required column `protocol` to the `locations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `locations` ADD COLUMN `protocol` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `suitcases` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `locationsId` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `suitcases_id_idx`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `suitcases` ADD CONSTRAINT `suitcases_locationsId_fkey` FOREIGN KEY (`locationsId`) REFERENCES `locations`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
