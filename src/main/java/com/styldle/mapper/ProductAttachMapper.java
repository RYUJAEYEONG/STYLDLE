package com.styldle.mapper;



import com.styldle.vo.ProductAttachVO;

import java.util.List;

public interface ProductAttachMapper {
    public void insert(ProductAttachVO pAttach);
    public boolean delete(String uuid);
    public List<ProductAttachVO> findByProductId(int productId);
    public void deleteAll(int productId);

}
