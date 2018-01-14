package com.we.common.loan;

import com.we.common.OurConstants;

import java.math.BigDecimal;

/**
 * Created by WangGenshen on 1/23/16.
 */
public class LoanUtil {

    public static final int RATE_TYPE_YEAR = 10;
    public static final int RATE_TYPE_MONTH = 11;

    public static final double PERCENT = 0;//百分比
    public static final double RATEDISCOUNT = 1;//比率折扣

    public static BigDecimal totalMoney(double area, BigDecimal price, double discount) {
        return price.multiply(new BigDecimal(area)).multiply(new BigDecimal(discount)).setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    public static BigDecimal totalLoanMoney(BigDecimal totalMoney, double percent) {
        return totalMoney.multiply(new BigDecimal(1 - percent)).setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    public static BigDecimal totalLoanMoney(double area, BigDecimal price, double discount, double percent) {
        return totalLoanMoney(totalMoney(area, price, discount), percent);
    }

    public static double rate(double rate, double discount) {
        return rate * discount;
    }

    public static int totalMonth(int year) {
        return 12 * year;
    }

    public static LoanCalculatorAdapter getCalculator(Integer bz) {
        if (OurConstants.BZ_XXHB.equals(bz)) {
            return  new XXHBLoanCalculator();
        } else if (OurConstants.BZ_ACM.equals(bz)) {
            return  new ACMLoanCalculator();
        } else if (OurConstants.BZ_ACPIM.equals(bz)) {
            return  new ACPIMLoanCalculator();
        } else if (OurConstants.BZ_YCHQ.equals(bz)) {
            return  new YCHQLoanCalculator();
        }
        return null;
    }

}
