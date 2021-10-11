package kr.co.thenet.fapee.product.web;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.thenet.fapee.home.service.AttachService;
import kr.co.thenet.fapee.home.service.CodeService;
import kr.co.thenet.fapee.product.model.ProductHistoryVO;
import kr.co.thenet.fapee.product.model.ProductLookVO;
import kr.co.thenet.fapee.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.thenet.fapee.product.model.ProductSearchVO;
import kr.co.thenet.fapee.product.model.ProductVO;

@Controller
@RequestMapping("/app/sales")
public class SalesController {

    @Autowired
    private CodeService codeService;

    @Autowired
    private ProductService service;

    @Autowired
    private AttachService attachService;


    @GetMapping("/detailModel.do")
    public String DetailModedel(ProductSearchVO form, Model model) throws Exception {
        return "product/detail.app";
    }

    @GetMapping("/detailModelPreview.do")
    public String DetailModedelPreview(ProductSearchVO form, Model model) throws Exception {
        ProductVO product = service.selectProductInfo(form);
        model.addAttribute("product", product);
        return "product/detailPreview.app";
    }



    @GetMapping("/list.do")
    public String list(ProductSearchVO form, Model model) throws Exception {
        model.addAttribute("salesStatusList", codeService.selectCodeList("ProductSalesStatus"));
        model.addAttribute("form", form);

        Map<String, LocalDate> dateMap = new HashMap<String, LocalDate>();
        dateMap.put("D01", LocalDate.now());
        dateMap.put("W01", LocalDate.now().minusWeeks(1).plusDays(1));
        dateMap.put("M01", LocalDate.now().minusMonths(1).plusDays(1));
        dateMap.put("M03", LocalDate.now().minusMonths(3).plusDays(1));
        dateMap.put("M06", LocalDate.now().minusMonths(6).plusDays(1));
        dateMap.put("M12", LocalDate.now().minusMonths(12).plusDays(1));
        model.addAttribute("dateMap", dateMap);

        List<ProductVO> list = service.selectSalesList(form);
        model.addAttribute("salesRows", 0);
        model.addAttribute("stopRows", 0);
        model.addAttribute("waitRows", 0);
        if (list.size() > 0) {
      //      form.setTotalRows(list.get(0).getTotalRows());
      //      model.addAttribute("salesRows", list.get(0).getSalesRows());
      //      model.addAttribute("stopRows", list.get(0).getStopRows());
      //      model.addAttribute("waitRows", list.get(0).getWaitRows());
        }
        model.addAttribute("list", list);

        return "sales/list.mcp";
    }

    @GetMapping("/view.do")
    public String view(ProductSearchVO form, Model model) throws Exception {
        model.addAttribute("salesStatusList", codeService.selectCodeList("ProductSalesStatus"));
        model.addAttribute("form", form);

        ProductVO data = service.selectProductInfo(form);
        model.addAttribute("data", data);
        model.addAttribute("commentList", service.selectProductCommentList(form));

    //    model.addAttribute("mainImage", attachService.selectAttachInfoByGrp(data.getMainImageId()));
    //    model.addAttribute("productImage1", attachService.selectAttachInfoByGrp(data.getProductImageId1()));
     //   model.addAttribute("productImage2", attachService.selectAttachInfoByGrp(data.getProductImageId2()));
    //    model.addAttribute("productImage3", attachService.selectAttachInfoByGrp(data.getProductImageId3()));
     //   model.addAttribute("productImage4", attachService.selectAttachInfoByGrp(data.getProductImageId4()));

        return "sales/view.mcp";
    }

    @GetMapping("/look.do")
    public String look(ProductSearchVO form, Model model) throws Exception {
        model.addAttribute("salesStatusList", codeService.selectCodeList("ProductSalesStatus"));
        model.addAttribute("form", form);

        ProductVO data = service.selectProductInfo(form);
        model.addAttribute("data", data);

        //게시룩 목록.
        List<ProductLookVO> list = service.selectProductLookList(form);
        if (list.size() > 0) {
            form.setTotalRows(list.get(0).getTotalRows());
        }
        model.addAttribute("list", list);

    //    model.addAttribute("mainImage", attachService.selectAttachInfoByGrp(data.getMainImageId()));
    //    model.addAttribute("productImage1", attachService.selectAttachInfoByGrp(data.getProductImageId1()));
    //    model.addAttribute("productImage2", attachService.selectAttachInfoByGrp(data.getProductImageId2()));
    //    model.addAttribute("productImage3", attachService.selectAttachInfoByGrp(data.getProductImageId3()));
   //     model.addAttribute("productImage4", attachService.selectAttachInfoByGrp(data.getProductImageId4()));

        return "sales/look.mcp";
    }

    @GetMapping("/history.do")
    public String history(ProductSearchVO form, Model model) throws Exception {
        model.addAttribute("salesStatusList", codeService.selectCodeList("ProductSalesStatus"));
        model.addAttribute("form", form);

        ProductVO data = service.selectProductInfo(form);
        model.addAttribute("data", data);

        //변경 목록.
        List<ProductHistoryVO> list = service.selectProductHistoryList(form);
        if (list.size() > 0) {
            form.setTotalRows(list.get(0).getTotalRows());
        }
        model.addAttribute("list", list);

    //    model.addAttribute("mainImage", attachService.selectAttachInfoByGrp(data.getMainImageId()));
    //    model.addAttribute("productImage1", attachService.selectAttachInfoByGrp(data.getProductImageId1()));
    //    model.addAttribute("productImage2", attachService.selectAttachInfoByGrp(data.getProductImageId2()));
     //   model.addAttribute("productImage3", attachService.selectAttachInfoByGrp(data.getProductImageId3()));
     //   model.addAttribute("productImage4", attachService.selectAttachInfoByGrp(data.getProductImageId4()));

        return "sales/history.mcp";
    }

}
