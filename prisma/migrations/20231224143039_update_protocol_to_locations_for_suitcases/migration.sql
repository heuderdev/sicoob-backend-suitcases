/*
  Warnings:

  - You are about to drop the column `protocol` on the `locations` table. All the data in the column will be lost.
  - Added the required column `protocol` to the `suitcases` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `locations` DROP COLUMN `protocol`;

-- AlterTable
ALTER TABLE `suitcases` ADD COLUMN `protocol` VARCHAR(191) NOT NULL;
