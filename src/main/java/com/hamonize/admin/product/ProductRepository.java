package com.hamonize.admin.product;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public interface ProductRepository extends JpaRepository<Product, String> {

    Product findByPdid(Long pdid);
    
    @Modifying
    @Query(
        value = "UPDATE tbl_products SET pd_name = :#{#vo.pdname}, pd_price = :#{#vo.pdprice}, pd_feature = :#{#vo.pdfeature} ,pd_status = :#{#vo.pdstatus} , pd_info = :#{#vo.pdinfo} , updt_date = :#{#vo.updtdate} WHERE pd_id = :#{#vo.pdid} " , nativeQuery = true
    )
    int update(Product vo);

    List<Product> findByPdstatusOrderByPdid(String status);
    
}
