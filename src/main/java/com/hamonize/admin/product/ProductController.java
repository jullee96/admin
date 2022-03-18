package com.hamonize.admin.product;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product")
public class ProductController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    ProductRepository pr;

    @RequestMapping("/list")
    public String supportList(@RequestParam(required = false, defaultValue = "0", value = "page") int page, Pageable pageable ,Product vo, Model model) {
        logger.info("--------------- ");
        List<Product> list = pr.findAll();
        List<Product> plist = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm");
            
        for (Product product : list) {
            product.setViewDate(product.getRgstrdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm")));
            plist.add(product);
        }

        model.addAttribute("list", plist);

        return "/product/list";
    }


    @RequestMapping("/view")
    public String supportView(Product vo, Model model) {
    
        return "/product/list";
    }
    

    @RequestMapping("/create")
    public String supportCreate(Product vo, Model model) {
    
        return "/product/edit";
    }
    
    
    @RequestMapping("/save")
    public String supportSave(Product vo, Model model) {
        logger.info("save... {}",vo.getPdname());
        logger.info("feat1... {}",vo.getPdfeature());
        
        vo.setRgstrdate(LocalDateTime.now());
        pr.save(vo);
        return "redirect:/product/list";
    }

    @RequestMapping("/edit")
    public String supportEdit(Product vo, Model model) {
    
        return "redirect:/product/list";
    }

    @RequestMapping("/delete")
    public String supportDelete(Product vo, Model model) {
    
        return "redirect:/product/list";
    }


    @RequestMapping("/pricing")
    public String pricing(Product vo, Model model) {
    
        return "/product/pricing";
    }

}
