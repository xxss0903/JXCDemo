package com.friday.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.friday.inter.ProductMapper;
import com.friday.inter.ShopMapper;
import com.friday.inter.StockMapper;
import com.friday.model.Product;
import com.friday.model.Shop;
import com.friday.model.Stock;
import com.friday.service.StockQueryService;
import com.friday.utils.SessionUtils;

import java.util.List;


public class StockQueryServiceImpl implements StockQueryService {

    public List<Object> stockQuery(int shopId) throws Exception {
        SqlSession sqlSession = null;

        List<Object> list = new ArrayList<Object>();

        try {
            sqlSession = SessionUtils.getSession();

            StockMapper stockMapper = sqlSession.getMapper(StockMapper.class);
            ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

            List<Stock> stocks;
            if (shopId == 0) {
                // 全国的库存
                stocks = stockMapper.selectAll();
                new ArrayList<Stock>();
                Map<Integer, Stock> tempStockMap = new HashMap<Integer, Stock>();
                // 将全国的库存收集到一起而不是分地区
                for (int i = 0; i < stocks.size(); i++) {
                    Stock stock = stocks.get(i);
                    if (tempStockMap.containsKey(stock.getpId())) {
                        Stock existStock = tempStockMap.get(stock.getpId());
                        existStock.setsNum(existStock.getsNum() + stock.getsNum());
                    } else {
                        tempStockMap.put(stock.getpId(), stock);
                    }
                }
                stocks.clear();
                for (Map.Entry<Integer, Stock> entry : tempStockMap.entrySet()) {
                    stocks.add(entry.getValue());
                }
            } else {
                stocks = stockMapper.selectByshopId(shopId);
            }
            for (Stock stock : stocks) {
                Product product = productMapper.selectByPrimaryKey(stock.getpId());

                Map<String, Object> map = new HashMap<String, Object>();
                map.put("num", stock.getsNum());
                map.put("name", product.getpName());
                map.put("guige", product.getpStyle());
                map.put("price", product.getpPrice());
                map.put("pid", product.getpId());
                list.add(map);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            SessionUtils.closeSession(sqlSession);
        }

        return list;
    }

    @Override
    public List<Shop> shopQuery() throws Exception {
        SqlSession sqlSession = null;
        List<Shop> list = null;

        try {
            sqlSession = SessionUtils.getSession();
            ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);

            list = shopMapper.selectAllShops();
        } catch (Exception e) {
            throw e;
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return list;
    }

    @Override
    public String queryShopName(int shopId) throws Exception {
        SqlSession sqlSession = null;
        Shop shop = null;

        try {
            sqlSession = SessionUtils.getSession();
            ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
            shop = shopMapper.selectByPrimaryKey(shopId);
        } catch (Exception e) {
            throw e;
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return shop.getsName();
    }

}
