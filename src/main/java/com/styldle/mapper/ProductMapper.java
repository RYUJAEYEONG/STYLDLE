package com.styldle.mapper;

import com.styldle.vo.ProductVO;
import com.styldle.vo.StoreCriteria;

import java.util.List;

public interface ProductMapper {
    public List<ProductVO> selectList();
    public ProductVO select(int productId);
    public void insert(ProductVO product);
    public void insertSelectKey(ProductVO product);
    public boolean update(ProductVO product);
    public boolean delete(int productId);

    public List<ProductVO> selectListWithPaging(StoreCriteria cri);
    public List<ProductVO> selectCategory(StoreCriteria cri);
    public int getTotalCount(StoreCriteria cri);
    public int getTypeCount(String type);
}
