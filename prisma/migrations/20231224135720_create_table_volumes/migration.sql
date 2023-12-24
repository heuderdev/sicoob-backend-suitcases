-- CreateTable
CREATE TABLE `volumes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `typesId` INTEGER NOT NULL,
    `suitcasesId` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `volumes_id_idx`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `volumes` ADD CONSTRAINT `volumes_typesId_fkey` FOREIGN KEY (`typesId`) REFERENCES `types`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `volumes` ADD CONSTRAINT `volumes_suitcasesId_fkey` FOREIGN KEY (`suitcasesId`) REFERENCES `suitcases`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
