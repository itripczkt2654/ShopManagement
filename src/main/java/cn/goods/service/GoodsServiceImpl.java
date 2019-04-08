package cn.goods.service;

import cn.goods.dao.GoodsMapper;
import cn.goods.entity.GoodsDetail;
import cn.goods.entity.GoodsSort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    /**
     * 查询所有的商品分类列表的信息（进入页面显示全部）
     * @return
     */
    @Override
    public List<GoodsSort> queryAllGoodsSort() {
        return goodsMapper.queryAllGoodsSort();
    }

    /**
     * 按分类编号查询goods_detail表中的总记录数
     * @param sortId 分类编号
     * @return
     */
    @Override
    public Integer queryGoodsDetailCount(long sortId) {
        return goodsMapper.queryGoodsDetailCount(sortId);
    }

    /**
     * 按分类编号查询goods_detail表的分页列表信息
     * @param sorId 分类编号
     * @param startPos 位置偏移量  15条记录  3条 总页数为5页。如果要显示第2页  3 3
     * @param endPos 行数
     * @return
     */
    @Override
    public List<GoodsDetail> queryGoodsDetailPageList(long sorId, Integer startPos, Integer endPos) {
        return goodsMapper.queryGoodsDetailPageList(sorId,startPos,endPos);
    }

    /**
     * 通过goods_detail表中的id查询商品的详情信息
     * @param id goods_detail表中的id
     * @return
     */
    @Override
    public GoodsDetail queryGoodsDetailById(long id) {
        return goodsMapper.queryGoodsDetailById(id);
    }

    /**
     * 修改商品详情信息
     * @param goodsDetail
     * @return
     */
    @Override
    public Integer updateGoodsDetail(GoodsDetail goodsDetail) {
        return goodsMapper.updateGoodsDetail(goodsDetail);
    }
}
