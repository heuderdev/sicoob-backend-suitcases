-- CreateTable
CREATE TABLE `historical` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `types` ENUM('PROHIBITED', 'EXIT') NOT NULL,
    `seal` VARCHAR(191) NOT NULL,
    `shipping` DATE NOT NULL,
    `back` DATE NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `historical_id_idx`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HistoricalOnVolumes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `historicalId` INTEGER NOT NULL,
    `volumesId` INTEGER NOT NULL,

    INDEX `HistoricalOnVolumes_id_idx`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `HistoricalOnVolumes` ADD CONSTRAINT `HistoricalOnVolumes_historicalId_fkey` FOREIGN KEY (`historicalId`) REFERENCES `historical`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HistoricalOnVolumes` ADD CONSTRAINT `HistoricalOnVolumes_volumesId_fkey` FOREIGN KEY (`volumesId`) REFERENCES `volumes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
