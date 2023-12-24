-- DropForeignKey
ALTER TABLE `historicalonvolumes` DROP FOREIGN KEY `HistoricalOnVolumes_historicalId_fkey`;

-- DropForeignKey
ALTER TABLE `historicalonvolumes` DROP FOREIGN KEY `HistoricalOnVolumes_volumesId_fkey`;

-- CreateTable
CREATE TABLE `historicalOnUsers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `historicalId` INTEGER NOT NULL,
    `usersId` INTEGER NOT NULL,

    INDEX `historicalOnUsers_id_idx`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `historicalOnVolumes` ADD CONSTRAINT `historicalOnVolumes_historicalId_fkey` FOREIGN KEY (`historicalId`) REFERENCES `historical`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `historicalOnVolumes` ADD CONSTRAINT `historicalOnVolumes_volumesId_fkey` FOREIGN KEY (`volumesId`) REFERENCES `volumes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `historicalOnUsers` ADD CONSTRAINT `historicalOnUsers_historicalId_fkey` FOREIGN KEY (`historicalId`) REFERENCES `historical`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `historicalOnUsers` ADD CONSTRAINT `historicalOnUsers_usersId_fkey` FOREIGN KEY (`usersId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER TABLE `historicalonvolumes` RENAME INDEX `HistoricalOnVolumes_id_idx` TO `historicalOnVolumes_id_idx`;
