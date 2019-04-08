package cn.goods.entity;

/**
 * 根据表`goods_sort`所需的商品分类的实体类
 */
public class GoodsSort {
    private long id;    //分类编号
    private String name;  //分类名称

    //封装set，get     快捷键：alt + insert
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
