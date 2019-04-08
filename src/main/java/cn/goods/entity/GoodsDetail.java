package cn.goods.entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 根据数据库表goods_detail所需的商品明细表的实体类
 */
public class GoodsDetail {
    private long id;    //编号
    private  long sortId;  //编号
    private GoodsSort goodsSort;   //分类编号  （因为数据库是有关联约束的）多对一
    private String name;    //商品名称
    private String address; //产地
    private BigDecimal price;   //单价
    private Date createDate;    //生产日期
    private int remaining;  //剩余数量

    //封装快捷键  alt + insert
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public GoodsSort getGoodsSort() {
        return goodsSort;
    }

    public void setGoodsSort(GoodsSort goodsSort) {
        this.goodsSort = goodsSort;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getRemaining() {
        return remaining;
    }

    public void setRemaining(int remaining) {
        this.remaining = remaining;
    }

    public long getSortId() {
        return sortId;
    }

    public void setSortId(long sortId) {
        this.sortId = sortId;
    }
}
