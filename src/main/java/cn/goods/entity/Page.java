package cn.goods.entity;

/**
 * 分页时所需要的实体类
 */
public class Page {
    private Integer currPageNo = 1;  //当前页码
    private Integer totalCount; //总的记录数    15条
    private Integer pageSize = 5;  //每一页显示的记录行数  5条
    private Integer totalPageCount; //总的页数   5

    //封装快捷键  alt + insert
    public Integer getCurrPageNo() {
        return currPageNo;
    }

    public void setCurrPageNo(Integer currPageNo) {
        this.currPageNo = currPageNo;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        if (totalCount > 0){
            this.totalCount = totalCount;
            //根据总记录数和每页显示的数据行数去计算总的页数
            this.totalPageCount = this.totalCount % this.pageSize == 0 ? this.totalCount / this.pageSize : this.totalCount / this.pageSize + 1;
        }
        this.totalCount = totalCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(Integer totalPageCount) {
        this.totalPageCount = totalPageCount;
    }
}
