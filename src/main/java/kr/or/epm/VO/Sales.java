package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 매출에 대한 VO
 */

public class Sales {

	private String month;
	private int profit;
	private int expense;

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getProfit() {
		return profit;
	}

	public void setProfit(int profit) {
		this.profit = profit;
	}

	public int getExpense() {
		return expense;
	}

	public void setExpense(int expense) {
		this.expense = expense;
	}

	@Override
	public String toString() {
		return "Sales [month=" + month + ", profit=" + profit + ", expense=" + expense + "]";
	}
}
