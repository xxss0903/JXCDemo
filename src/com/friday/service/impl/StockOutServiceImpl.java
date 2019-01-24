package com.friday.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.alibaba.druid.sql.SQLUtils;
import com.friday.inter.*;
import com.friday.model.*;
import org.apache.ibatis.session.SqlSession;

import com.friday.service.StockOutService;
import com.friday.utils.SessionUtils;

public class StockOutServiceImpl implements StockOutService {

    @Override
    public List<Object> getProductByShop(int shopId) throws Exception {
        List<Object> list = new ArrayList<Object>();
        SqlSession sqlSession = null;

        try {
            sqlSession = SessionUtils.getSession();

            StockMapper stockMapper = sqlSession.getMapper(StockMapper.class);
            ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

            List<Stock> stocks = stockMapper.selectByshopId(shopId);

            for (Stock stock : stocks) {
                Map<String, Object> map = new HashMap<String, Object>();
                Product product = productMapper.selectByPrimaryKey(stock.getpId());

                map.put("name", product.getpName());
                map.put("num", stock.getsNum());
                map.put("pid", stock.getpId());
                map.put("price", product.getpPrice());

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
    public List<Shop> getAllShops() throws Exception {
        List<Shop> list = new ArrayList<Shop>();
        SqlSession sqlSession = null;

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
    public int stockOut(Map<Integer, Integer> outStocks, Date date, String bz, String uId, int shopId) throws Exception {
        int ret = 0;
        SqlSession sqlSession = null;

        try {
            sqlSession = SessionUtils.getSession();

            OutStockMapper outStockMapper = sqlSession.getMapper(OutStockMapper.class);
            OutStockDetailMapper outStockDetailMapper = sqlSession.getMapper(OutStockDetailMapper.class);
            StockMapper stockMapper = sqlSession.getMapper(StockMapper.class);

            OutStock outStock = new OutStock();
            outStock.setoBz(bz);
            outStock.setoDate(date);
            outStock.setsId(shopId);
            outStock.setuId(uId);
            outStock.setoSt(2);

            outStockMapper.insert(outStock);

            Iterator<Integer> iterator = outStocks.keySet().iterator();
            List<Stock> stocks = stockMapper.selectAll();

            // 循环出库商品
            while (iterator.hasNext()) {
                OutStockDetail outStockDetail = new OutStockDetail();
                outStockDetail.setOutstockId(outStock.getoId());
                outStockDetail.setpId(iterator.next());
                outStockDetail.setoNum(outStocks.get(outStockDetail.getpId()));
                outStockDetailMapper.insert(outStockDetail);

                for (Stock stock : stocks) {
                    if (stock.getShopId() == shopId && stock.getpId() == outStockDetail.getpId()) {
                        int lastNum = stock.getsNum() - outStockDetail.getoNum();
                        stock.setsNum(lastNum);
                        stockMapper.updateByPrimaryKey(stock);
                        if (lastNum <= 0) {
                            // 全部出库，删除商品的库存信息
                            stockMapper.deleteByPrimaryKey(stock.getsId());
                        }
                        break;
                    }
                }
            }

            sqlSession.commit();
            ret = 1;
        } catch (Exception e) {
            sqlSession.rollback();
            throw e;
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return ret;
    }

    @Override
    public int sell(Map<Integer, Integer> sells, Date date, String bz, String uId, int shopId) throws Exception {
        int ret = 0;
        SqlSession sqlSession = null;

        try {
            sqlSession = SessionUtils.getSession();

            SellMapper sellMapper = sqlSession.getMapper(SellMapper.class);
            SellDetailMapper sellDetailMapper = sqlSession.getMapper(SellDetailMapper.class);
            StockMapper stockMapper = sqlSession.getMapper(StockMapper.class);

            Sell sell = new Sell();
            sell.setsBz(bz);
            sell.setsDate(date);
            sell.setShopId(shopId);
            sell.setuId(uId);


            sellMapper.insert(sell);

            Iterator<Integer> iterator = sells.keySet().iterator();
            List<Stock> stocks = stockMapper.selectAll();

            while (iterator.hasNext()) {
                SellDetail sellDetail = new SellDetail();
                sellDetail.setSellId(sell.getsId());
                sellDetail.setpId(iterator.next());
                sellDetail.setsNum(sells.get(sellDetail.getpId()));
                sellDetailMapper.insert(sellDetail);

                for (Stock stock : stocks) {
                    if (stock.getShopId() == shopId && stock.getpId() == sellDetail.getpId()) {
                        if (stock.getsNum() >= sellDetail.getsNum()) {
                            stock.setsNum(stock.getsNum() - sellDetail.getsNum());
                            stockMapper.updateByPrimaryKey(stock);
                        } else {
                            throw new Exception();
                        }
                    }
                }
            }

            sqlSession.commit();
            ret = 1;
        } catch (Exception e) {
            sqlSession.rollback();
            throw e;
        } finally {
            SessionUtils.closeSession(sqlSession);
        }

        return ret;
    }

    @Override
    public List<Object> queryStockOut(Date start, Date end, int shopId,
                                      int orderId) throws Exception {
        List<Object> list = new ArrayList<Object>();
        SqlSession sqlSession = null;

        try {
            sqlSession = SessionUtils.getSession();

            ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
            OutStockMapper outStockMapper = sqlSession.getMapper(OutStockMapper.class);
            OutStockDetailMapper outStockDetailMapper = sqlSession.getMapper(OutStockDetailMapper.class);
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);

            if (orderId != -1) {
                OutStock outStock = outStockMapper.selectByPrimaryKey(orderId);

                if (outStock != null) {
                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put("oId", outStock.getoId());
                    map.put("date", outStock.getoDate());
                    User user = userMapper.selectByPrimaryKey(outStock.getuId());
                    map.put("user", user.getuName());
                    map.put("oSt", outStock.getoSt());
                    List<OutStockDetail> outStockDetails = outStockDetailMapper.selectByOutStocksId(outStock.getoId());
                    int price = 0;
                    for (OutStockDetail outStockDetail : outStockDetails) {
                        Product product = productMapper.selectByPrimaryKey(outStockDetail.getpId());
                        price += outStockDetail.getoNum() * product.getpPrice();
                    }
                    map.put("price", price);
                    Shop shop = shopMapper.selectByPrimaryKey(outStock.getsId());
                    map.put("shop", shop.getsName());
                    list.add(map);
                }

                return list;
            } else {
                List<OutStock> outStocks = null;
                if (shopId == 0) {
                    outStocks = outStockMapper.selectAll();
                } else {
                    outStocks = outStockMapper.selectByShopId(shopId);
                }

                for (OutStock outStock : outStocks) {
                    if ((end == null ? true : outStock.getoDate().before(end)) && (start == null ? true : outStock.getoDate().after(start))) {
                        Map<String, Object> map = new HashMap<String, Object>();
                        map.put("oId", outStock.getoId());
                        map.put("date", outStock.getoDate());
                        User user = userMapper.selectByPrimaryKey(outStock.getuId());
                        map.put("user", user.getuName());
                        map.put("oSt", outStock.getoSt());
                        List<OutStockDetail> outStockDetails = outStockDetailMapper.selectByOutStocksId(outStock.getoId());
                        int price = 0;
                        for (OutStockDetail outStockDetail : outStockDetails) {
                            Product product = productMapper.selectByPrimaryKey(outStockDetail.getpId());
                            price += outStockDetail.getoNum() * product.getpPrice();
                        }
                        map.put("price", price);
                        Shop shop = shopMapper.selectByPrimaryKey(outStock.getsId());
                        map.put("shop", shop.getsName());
                        list.add(map);
                    }
                }
            }
        } catch (Exception e) {
            throw e;
        } finally {
            SessionUtils.closeSession(sqlSession);
        }

        return list;
    }

    @Override
    public List<Object> querySell(Date start, Date end, int shopId, int orderId)
            throws Exception {

        List<Object> list = new ArrayList<Object>();
        SqlSession sqlSession = null;

        try {
            sqlSession = SessionUtils.getSession();

            ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
            SellMapper sellMapper = sqlSession.getMapper(SellMapper.class);
            SellDetailMapper sellDetailMapper = sqlSession.getMapper(SellDetailMapper.class);
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);

            if (orderId != -1) {
                Sell sell = sellMapper.selectByPrimaryKey(orderId);

                if (sell != null) {
                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put("oId", sell.getsId());
                    map.put("date", sell.getsDate());
                    User user = userMapper.selectByPrimaryKey(sell.getuId());
                    map.put("user", user.getuName());
                    List<SellDetail> sellDetails = sellDetailMapper.selectBySellId(sell.getsId());
                    int price = 0;
                    for (SellDetail sellDetail : sellDetails) {
                        Product product = productMapper.selectByPrimaryKey(sellDetail.getpId());
                        price += sellDetail.getsNum() * product.getpPrice();
                    }
                    map.put("price", price);
                    Shop shop = shopMapper.selectByPrimaryKey(sell.getShopId());
                    map.put("shop", shop.getsName());
                    list.add(map);
                }

                return list;
            } else {
                List<Sell> sells = null;
                if (shopId == 0) {
                    sells = sellMapper.selectAll();
                } else {
                    sells = sellMapper.selectByShopId(shopId);
                }

                for (Sell sell : sells) {
                    if ((end == null ? true : sell.getsDate().before(end)) && (start == null ? true : sell.getsDate().after(start))) {
                        Map<String, Object> map = new HashMap<String, Object>();
                        map.put("oId", sell.getsId());
                        map.put("date", sell.getsDate());
                        User user = userMapper.selectByPrimaryKey(sell.getuId());
                        map.put("user", user.getuName());
                        List<SellDetail> sellDetails = sellDetailMapper.selectBySellId(sell.getShopId());
                        int price = 0;
                        for (SellDetail sellDetail : sellDetails) {
                            Product product = productMapper.selectByPrimaryKey(sellDetail.getpId());
                            price += sellDetail.getsNum() * product.getpPrice();
                        }
                        map.put("price", price);
                        Shop shop = shopMapper.selectByPrimaryKey(sell.getShopId());
                        map.put("shop", shop.getsName());
                        list.add(map);
                    }
                }
            }
        } catch (Exception e) {
            throw e;
        } finally {
            SessionUtils.closeSession(sqlSession);
        }

        return list;
    }


    // 入库了的退货
    @Override
    public int goodsBack(String orderId, Date date, String bz,
                         String uId) throws Exception {
        int ret = 0;
        SqlSession sqlSession = null;

        try {
            sqlSession = SessionUtils.getSession();

            GoodsBackMapper goodsBackMapper = sqlSession.getMapper(GoodsBackMapper.class);
            StockMapper stockMapper = sqlSession.getMapper(StockMapper.class);
            OutStockDetailMapper outStockDetailMapper = sqlSession.getMapper(OutStockDetailMapper.class);
            OutStockMapper outStockMapper = sqlSession.getMapper(OutStockMapper.class);

            OutStock outStock = outStockMapper.selectByPrimaryKey(Integer.parseInt(orderId));
            // 如果已经如果库，则不能再入库
            if (outStock.getoSt() == 1) {
                throw new Exception("不能入库");
            }

            // 插入退回记录
            GoodsBack goodsBack = new GoodsBack();
            goodsBack.setuId(uId);
            goodsBack.setgDate(date);
            goodsBack.setgBz(bz);
            goodsBack.setgType(2);
            goodsBackMapper.insert(goodsBack);

            // 更新出库的状态，如果已经回库，那么状态改为1
            outStock.setoSt(1);

            outStockMapper.updateByPrimaryKeySelective(outStock);

            // 将退回的商品详情放入退回详情里面
            List<OutStockDetail> orderDetails = outStockDetailMapper.selectByOutStocksId(Integer.parseInt(orderId));

            for (OutStockDetail outStockDetail : orderDetails) {
                OutStockDetail goodsBackDetail = new OutStockDetail();
                goodsBackDetail.setOutstockId(goodsBack.getgId());
                goodsBackDetail.setoNum(outStockDetail.getoNum());
                goodsBackDetail.setpId(outStockDetail.getpId());
                outStockDetailMapper.insert(goodsBackDetail);
            }

            // 减数量添加到stock里面
            List<Stock> stocks = stockMapper.selectAll();
            for (OutStockDetail outStockDetail: orderDetails) {

                boolean flag = false;
                for (Stock stock : stocks) {
                    if (stock.getShopId().equals(outStock.getsId()) && stock.getpId().equals(outStockDetail.getpId())) {
                        stock.setsNum(stock.getsNum() + outStockDetail.getoNum());
                        stockMapper.updateByPrimaryKey(stock);
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    Stock stock = new Stock();
                    stock.setShopId(outStock.getsId());
                    stock.setpId(outStockDetail.getpId());
                    stock.setsMaxnum(Integer.MAX_VALUE);
                    stock.setsMinnum(0);
                    stock.setsNum(outStockDetail.getoNum());
                    stockMapper.insert(stock);
                }
            }

            sqlSession.commit();
            ret = 1;
        } catch (Exception e) {
            sqlSession.rollback();
            throw e;
        } finally {
            SessionUtils.closeSession(sqlSession);
        }

        return ret;
    }

}
