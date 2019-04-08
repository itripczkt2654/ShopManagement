package cn.goods.controller;

import cn.goods.entity.GoodsDetail;
import cn.goods.entity.GoodsSort;
import cn.goods.entity.Page;
import cn.goods.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    private GoodsService goodsService;

    /**
     * 通过goods_detail表中的id查询商品的详情信息
     * @param id goods_detail表中的id
     * @return
     */
    @RequestMapping("/queryGoodsDetailById/{id}")
    public String queryGoodsDetailById(@PathVariable long id,Model model){
        GoodsDetail goodsDetail = goodsService.queryGoodsDetailById(id);
        model.addAttribute("goodsDeatil",goodsDetail);
        return "purchaseGoods";
    }

    /**
     * 修改
     * @param goodsDetail
     * @return
     */
    @RequestMapping("/updateGoods")
    public String updateGoods(GoodsDetail goodsDetail){
        int result = goodsService.updateGoodsDetail(goodsDetail);
        if (result > 0){
            return "redirect:/goods/list";
        }else{
            return "redirect:/goods//queryGoodsDetailById/" + goodsDetail.getId();
        }
    }


    /**
     * 进入页面是显示所有数据
     * @param sortId
     * @param currPageNo
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String goodsList(@RequestParam(required = false,defaultValue = "0") long sortId, @RequestParam(required = false) Integer currPageNo, Model model){
        //1、查询所有的商品分分类信息
        List<GoodsSort> sortList = goodsService.queryAllGoodsSort();
        Integer totalCount = goodsService.queryGoodsDetailCount(sortId);
        Page page = new Page();
        currPageNo = currPageNo == null ? 1 : currPageNo;   //当前页码
        page.setCurrPageNo(currPageNo);
        page.setPageSize(5);  //每一页显示的数据行数
        page.setTotalCount(totalCount);
        Integer startPos = (page.getCurrPageNo() - 1) * page.getPageSize();
        List<GoodsDetail> goodsDetailList = goodsService.queryGoodsDetailPageList(sortId,startPos,page.getPageSize());

        model.addAttribute("sortList",sortList);  //将商品分类信息保存到model，因为页面上要进行显示
        model.addAttribute("page",page);
        model.addAttribute("goodsDetailList",goodsDetailList);
        model.addAttribute("sortId",sortId);
        return "goodsList";  //返回逻辑视图名（jsp页面）
    }

}
