package cn.goods.service;

import cn.goods.entity.GoodsDetail;
import cn.goods.entity.GoodsSort;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsService {

    /**
     * 查询所有的商品分类列表的信息（进入页面显示全部）
     * @return
     */
    List<GoodsSort> queryAllGoodsSort();

    /**
     * 按分类编号查询goods_detail表中的总记录数
     * @param sortId 分类编号
     * @return
     */
    Integer queryGoodsDetailCount(long sortId);

    /**
     * 按分类编号查询goods_detail表的分页列表信息
     * @param sorId 分类编号
     * @param startPos 位置偏移量  15条记录  3条 总页数为5页。如果要显示第2页  3 3
     * @param endPos 行数
     * @return 分页后的结果
     */
    List<GoodsDetail> queryGoodsDetailPageList(long sorId,Integer startPos,Integer endPos);

    /**
     * 通过goods_detail表中的id查询商品的详情信息
     * @param id goods_detail表中的id
     */
    GoodsDetail queryGoodsDetailById(@Param("id") long id);

    /**
     * 修改商品详情信息
     */
    Integer updateGoodsDetail(GoodsDetail goodsDetail);

}
