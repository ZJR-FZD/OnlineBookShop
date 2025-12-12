package com.shine.bookshop.dao;

import java.util.List;

import com.shine.bookshop.bean.OrderItem;

/** 
* @version 创建时间：2017年10月28日 上午12:36:56 
*/
public interface OrderItemDao {
	//增加一个订单项记录
	boolean orderAdd(OrderItem orderItem);
	//通过订单编号查找订单项
	List<OrderItem> findItemByOrderId(int orderId);
}
