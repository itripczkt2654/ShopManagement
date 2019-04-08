
ALTER TABLE `goods_detail`
ADD CONSTRAINT 'fk_sortId' FOREIGN KEY (`sortId`) REFERENCES `goods_sort`(`id`);
#fk_sortId是外键约束的名字
#sortId外键列
#`goods_sort`(`id`)约束的表的列

